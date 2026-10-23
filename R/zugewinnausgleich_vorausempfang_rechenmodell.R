zugewinnausgleich_vorausempfang_rechenmodell <- function(ehegatten=NULL, vorausempfaenge=NULL, nullbegrenzungsfolge=NULL, haftungsgrenzenfolge=NULL, methodennachweis=NULL) {
 .text(methodennachweis,'methodennachweis');.auswahl(nullbegrenzungsfolge,'nullbegrenzungsfolge',c('zugewinn_vor_korrektur','vermoegenskorrektur_vor_nullgrenze'));.auswahl(haftungsgrenzenfolge,'haftungsgrenzenfolge',c('haftungsgrenze_vor_anrechnung','haftungsgrenze_nach_anrechnung'));.vorhanden(ehegatten,'ehegatten');.vorhanden(vorausempfaenge,'vorausempfaenge')
 if(!is.list(ehegatten)||length(ehegatten)!=2||!setequal(names(ehegatten),c('a','b'))) .fehler('ehegatten','Genau a und b erforderlich.')
 positiv <- function(x) if(.vergleichen(x,.bruch(0))>0)x else .bruch(0)
 kleiner <- function(x,y) if(.vergleichen(x,y)<0)x else y
 basen <- list();grenzen <- list()
 for(k in c('a','b')) {
  p <- ehegatten[[k]]
  if(!is.list(p)||length(p)!=3||!setequal(names(p),c('vermoegensdifferenz','endnettovermoegen','illoyale_hinzurechnung'))) .fehler('ehegatten','Drei Verm\u00f6gensfelder erforderlich.')
  basen[[k]] <- .zahleneingabe(p$vermoegensdifferenz);grenzen[[k]] <- positiv(.addieren(.zahleneingabe(p$endnettovermoegen),.geld(p$illoyale_hinzurechnung)))
 }
 if(!is.list(vorausempfaenge)||!is.null(names(vorausempfaenge))||length(vorausempfaenge)>1000) .fehler('vorausempfaenge','Liste0..1000erforderlich.')
 summen <- list(a_an_b=list(.bruch(0),.bruch(0),.bruch(0)),b_an_a=list(.bruch(0),.bruch(0),.bruch(0)))
 for(p in vorausempfaenge) {
  if(!is.list(p)||length(p)!=4||!setequal(names(p),c('richtung','hinzurechnungswert','herausrechnungswert','anrechnungswert'))) .fehler('vorausempfaenge','Richtung und drei Werte erforderlich.')
  r <- .auswahl(p$richtung,'richtung',c('a_an_b','b_an_a'));felder <- c('hinzurechnungswert','herausrechnungswert','anrechnungswert')
  for(i in seq_along(felder)) summen[[r]][[i]] <- .addieren(summen[[r]][[i]],.geld(p[[felder[[i]]]]))
 }
 wege <- list();reste <- list()
 for(r in c('a_an_b','b_an_a')) {
  geber <- if(r=='a_an_b')'a' else 'b';empfaenger <- if(r=='a_an_b')'b' else 'a';gb <- basen[[geber]];eb <- basen[[empfaenger]];hinzu <- summen[[r]][[1]];heraus <- summen[[r]][[2]];anrechnung <- summen[[r]][[3]]
  if(nullbegrenzungsfolge=='zugewinn_vor_korrektur') {gb <- positiv(gb);eb <- positiv(eb)}
  gb <- positiv(.addieren(gb,hinzu));eb <- positiv(.subtrahieren(eb,heraus));halb <- .multiplizieren(positiv(.subtrahieren(gb,eb)),.bruch(1,2));grenze <- grenzen[[geber]]
  rest <- if(haftungsgrenzenfolge=='haftungsgrenze_vor_anrechnung')positiv(.subtrahieren(kleiner(halb,grenze),anrechnung)) else kleiner(positiv(.subtrahieren(halb,anrechnung)),grenze)
  reste[[r]] <- rest;wege[[r]] <- list(korrigierte_geberbasis=.bruchteile(gb),korrigierte_empfaengerbasis=.bruchteile(eb),halbe_positive_differenz=.bruchteile(halb),haftungsgrenze=.bruchteile(grenze),anrechnungswert=.bruchteile(anrechnung),bedingter_restbetrag=.bruchteile(rest))
 }
 wert <- list(a_an_b=wege$a_an_b,b_an_a=wege$b_an_a,rechnerischer_saldo_a_an_b=.bruchteile(.subtrahieren(reste$a_an_b,reste$b_an_a)))
 eingaben <- list(ehegatten=ehegatten, vorausempfaenge=vorausempfaenge, nullbegrenzungsfolge=nullbegrenzungsfolge, haftungsgrenzenfolge=haftungsgrenzenfolge, methodennachweis=methodennachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_ZUGEWINNAUSGLEICH_VORAUSEMPFANG_RECHENMODELL",eingaben,list(list(operation="Getrennte Richtungsrechnungen mit tats\u00e4chlichen Verm\u00f6gensdifferenzen, bewerteten Vorausempf\u00e4ngen und ausdr\u00fccklich vorgegebener Null-/Haftungsgrenzenfolge ausf\u00fchren.")),eingaben)
 ergebnis$hinweise <- list("Bedingte Erweiterung des vorhandenen einseitigen1380-Grundmodells: je Anspruchsrichtung die zugeh\u00f6rigen Vorausempf\u00e4nge summieren, Geberbasis um Hinzurechnung erh\u00f6hen und Empf\u00e4ngerbasis um Herausrechnung vermindern. Zwingend gew\u00e4hlte Nullbegrenzungsfolge bestimmt, ob urspr\u00fcngliche Verm\u00f6gensdifferenzen schon vor dieser Korrektur bei0begrenzt werden oder erst die korrigierten Differenzen. Positive halbe Differenz berechnen;1378II-Haftungsgrenze=max(Endnettoverm\u00f6gen+illoyaleHinzurechnung,0) selbst berechnen. Haftungsgrenze gem\u00e4\u00df gew\u00e4hlter Folge vor oder nach der auf0begrenzten Anrechnung anwenden. Beide Richtungsrechnungen separat ausweisen, einschlie\u00dflich Gegenrichtung ohne einschl\u00e4gigen Empfang. Gegenseitige Empf\u00e4nge werden in diesem ausdr\u00fccklich qualifizierten Modell getrennt nach Richtung behandelt; kein unbelegtes automatisches Saldieren der Zuwendungswerte. Rechnerischer Saldo der beiden Ergebnisse ist nur Vergleichswert, keine automatische Aufrechnung oder rechtliche Feststellung zweier Anspr\u00fcche. Reihenfolge/reziproke Behandlung/verschiedene Wertans\u00e4tze rechtlich nicht allgemein best\u00e4tigt; keine Standardwahl. Kein negativer R\u00fcckforderungsanspruch allein aus \u00fcberh\u00f6hter Anrechnung.")
 ergebnis
}
