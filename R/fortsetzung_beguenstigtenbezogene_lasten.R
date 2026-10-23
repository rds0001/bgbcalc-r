fortsetzung_beguenstigtenbezogene_lasten <- function(abkoemmlinge=NULL, lasten=NULL, einordnungsnachweis=NULL) {
 .text(einordnungsnachweis,'einordnungsnachweis');.vorhanden(abkoemmlinge,'abkoemmlinge');.vorhanden(lasten,'lasten')
 if(!is.list(abkoemmlinge)||!is.null(names(abkoemmlinge))||length(abkoemmlinge)<1||length(abkoemmlinge)>1000||!is.list(lasten)||!is.null(names(lasten))||length(lasten)>1000) .fehler('listen','Gueltige begrenzte Personen- und Lastenlisten erforderlich.')
 namen <- character();basis <- list();abzug <- list();gesamt <- .bruch(0)
 for(p in abkoemmlinge) {
  if(!is.list(p)||length(p)!=2||!setequal(names(p),c('abkoemmling_id','grundanteilswert'))) .fehler('abkoemmlinge','Genau Kennung und grundanteilswert erforderlich.')
  k <- .text(p$abkoemmling_id,'abkoemmling_id')
  if(k %in% namen) .fehler('abkoemmling_id','Person doppelt.')
  namen <- c(namen,k);v <- .geld(p$grundanteilswert);basis[[length(namen)]] <- v;abzug[[length(namen)]] <- .bruch(0);gesamt <- .addieren(gesamt,v)
 }
 lastkennungen <- character();lastsumme <- .bruch(0)
 for(l in lasten) {
  if(!is.list(l)||length(l)!=3||!setequal(names(l),c('last_id','betrag','beguenstigte'))) .fehler('lasten','Genau last_id, betrag und beguenstigte erforderlich.')
  kennung <- .text(l$last_id,'last_id');betrag <- .geld(l$betrag);gruppe <- l$beguenstigte
  if(kennung %in% lastkennungen) .fehler('last_id','Last doppelt.')
  lastkennungen <- c(lastkennungen,kennung)
  if(!is.list(gruppe)||!is.null(names(gruppe))||length(gruppe)<1||length(gruppe)>1000) .fehler('beguenstigte','Nichtleere begrenzte Liste erforderlich.')
  ids <- character();gewichte <- list();summe <- .bruch(0)
  for(p in gruppe) {
   if(!is.list(p)||length(p)!=2||!setequal(names(p),c('abkoemmling_id','lastgewicht'))) .fehler('beguenstigte','Genau Kennung und Lastgewicht erforderlich.')
   k <- .text(p$abkoemmling_id,'abkoemmling_id');q <- .geld(p$lastgewicht)
   if(!k %in% namen||k %in% ids||.vergleichen(q,.bruch(0))<=0) .fehler('beguenstigte','Bekannte eindeutige Person mit positivem Gewicht erforderlich.')
   ids <- c(ids,k);gewichte[[length(ids)]] <- q;summe <- .addieren(summe,q)
  }
  for(i in seq_along(ids)) {
   j <- match(ids[[i]],namen);abzug[[j]] <- .addieren(abzug[[j]],.multiplizieren(betrag,.dividieren(gewichte[[i]],summe)))
  }
  lastsumme <- .addieren(lastsumme,betrag)
 }
 wert <- list(abkoemmlingssalden=lapply(seq_along(namen),function(i)list(abkoemmling_id=namen[[i]],grundanteilswert=.bruchteile(basis[[i]]),lastensumme=.bruchteile(abzug[[i]]),rechnerischer_saldo=.bruchteile(.subtrahieren(basis[[i]],abzug[[i]])))),grundanteilswertsumme=.bruchteile(gesamt),lastensumme=.bruchteile(lastsumme),rechnerische_saldosumme=.bruchteile(.subtrahieren(gesamt,lastsumme)))
 eingaben <- list(abkoemmlinge=abkoemmlinge, lasten=lasten, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_FORTSETZUNG_BEGUENSTIGTENBEZOGENE_LASTEN",eingaben,list(list(operation="Jede qualifizierte Last nach relativen Beguenstigtengewichten verteilen, personenbezogen addieren und vom ungek\u00fcrzten Ausgangsanteilswert abziehen.")),eingaben)
 ergebnis$hinweise <- list("\u00a71503III/\u00a71511III2: Abfindungs-/Ausschlusslast nur bei den durch Verzicht/Ausschliessung beguenstigten Abkoemmlingen verteilen. Relative Lastgewichte sind rechtlich bestimmte Vorteils-/Belastungsverhaeltnisse, nicht automatisch Erbquoten oder gleiche Kopfanteile. Jede Last wird exakt einmal verteilt; nicht beguenstigte Personen behalten ihren Ausgangswert. Grundanteilswerte muessen vor diesen Lasten und unter zutreffender Gesamtgutsbilanz1501/1498 bestimmt sein. Negative Salden sind ausschliesslich rechnerische Bilanzgroessen, kein ausgegebener Nachschuss-, Rueckzahlungs- oder persoenlicher Ersatzanspruch;1498/1476II2 beachten. Keine eigenstaendige Ermittlung von Berechtigung, Lastgewichten, Abfindungswirksamkeit oder faelliger Barauszahlung.")
 ergebnis
}
