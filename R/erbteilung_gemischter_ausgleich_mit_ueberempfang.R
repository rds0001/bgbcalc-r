erbteilung_gemischter_ausgleich_mit_ueberempfang <- function(gruppennachlass=NULL, miterben=NULL, ausgleichungsmodell=NULL, methodennachweis=NULL) {
 .auswahl(ausgleichungsmodell,'ausgleichungsmodell',c('leistungsvorwegabzug_mit_fortgeltung','gemeinsame_neuberechnung_ohne_ausgeschiedene'))
 erbteilung_gemischter_ausgleich(gruppennachlass,miterben,TRUE,methodennachweis)
 n <- .geld(gruppennachlass);quoten <- lapply(miterben,function(p).zahleneingabe(p$relative_erbquote));z <- lapply(miterben,function(p).geld(p$ausgleichungswert_zuwendungen));l <- lapply(miterben,function(p).geld(p$leistungs_ausgleichsbetrag))
 summieren <- function(werte) {s <- .bruch(0);for(x in werte)s <- .addieren(s,x);s}
 if(ausgleichungsmodell=='leistungsvorwegabzug_mit_fortgeltung') {
  liste <- lapply(seq_along(miterben),function(i)list(person_id=miterben[[i]]$person_id,erbquote_zaehler=quoten[[i]]$zaehler,erbquote_nenner=quoten[[i]]$nenner,ausgleichungswert=miterben[[i]]$ausgleichungswert_zuwendungen))
  kern <- erb_zuwendungen_ausgleichen(.bruchteile(.subtrahieren(n,summieren(l))),liste,TRUE,methodennachweis)$wert;aus <- kern$ausser_ansatz
  betraege <- lapply(seq_along(miterben),function(i).addieren(.geld(kern$verteilung[[i]]$betrag),l[[i]]))
 } else {
  aktiv <- seq_along(miterben);aus_indices <- integer();betraege <- rep(list(.bruch(0)),length(miterben))
  while(length(aktiv)) {
   masse <- .addieren(.subtrahieren(n,summieren(l[aktiv])),summieren(z[aktiv]));qsum <- summieren(quoten[aktiv])
   pruefung <- lapply(aktiv,function(i).addieren(.subtrahieren(.multiplizieren(masse,.dividieren(quoten[[i]],qsum)),z[[i]]),l[[i]]))
   negativ <- aktiv[vapply(pruefung,function(x).vergleichen(x,.bruch(0))<0,logical(1))]
   if(!length(negativ)) {for(j in seq_along(aktiv))betraege[[aktiv[[j]]]] <- pruefung[[j]];break}
   aus_indices <- c(aus_indices,negativ);aktiv <- setdiff(aktiv,negativ)
  }
  aus <- lapply(which(seq_along(miterben) %in% aus_indices),function(i)miterben[[i]]$person_id)
 }
 wert <- list(ausgleichungsmodell=ausgleichungsmodell,ausser_ansatz=aus,zuteilungen=lapply(seq_along(miterben),function(i)list(person_id=miterben[[i]]$person_id,erbteil_nach_gemischtem_ausgleich=.bruchteile(betraege[[i]]))))
 eingaben <- list(gruppennachlass=gruppennachlass, miterben=miterben, ausgleichungsmodell=ausgleichungsmodell, methodennachweis=methodennachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_ERBTEILUNG_GEMISCHTER_AUSGLEICH_MIT_UEBEREMPFANG",eingaben,list(list(operation="Zwingend gew\u00e4hltes kombiniertes Ausgleichungsmodell unter Wiederverwendung vorhandener Validierung/2056-Rechnung berechnen; keine automatische Auslegung.")),eingaben)
 ergebnis$hinweise <- list("2055/2056/2057a-Rechenkonkurrenz bei zugleich Leistenden und \u00dcberempf\u00e4ngern: keine allgemeine juristische L\u00f6sung aus ungepr\u00fcfter Iteration behaupten. Bedingtes Vorwegmodell zieht s\u00e4mtliche qualifizierten Leistungen ab, verwendet vorhandene2056-Zuwendungsausscheidung und f\u00fcgt individuelle Leistungen auch ausgeschiedenen Zuwendungsempf\u00e4ngern wieder hinzu. Bedingtes gemeinsames Modell berechnet je aktiver Gruppe q_i/Summeq*(N-SummeL+SummeZ)-Z_i+L_i; negative Endbetr\u00e4ge scheiden mit Quote,Zuwendung und Leistungsposition aus, Gruppe wird neu berechnet. Diese Behandlung muss im konkreten Fall rechtlich vorgegeben sein, nicht aus einem blo\u00dfen negativen Zwischenergebnis als Rechtsfolge erfunden werden. Beide Modelle erhalten die SummeN und erzeugen keine R\u00fcckzahlung aus negativem Erbteil. Leistungen sind billig bemessene Eingaben, keine erfundene Pflegeverg\u00fctung. Keine2315-Anrechnung, Pflichtteilserg\u00e4nzung oder automatische rechtliche Auswahl.")
 ergebnis
}
