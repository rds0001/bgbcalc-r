staffelmiete_aufsteigende_betragsgrenzen <- function(staffeln=NULL, einordnungsnachweis=NULL) {
 .vorhanden(staffeln,'staffeln');.text(einordnungsnachweis,'einordnungsnachweis')
 if(!is.list(staffeln) || !is.null(names(staffeln)) || length(staffeln)<2 || length(staffeln)>1000) .fehler('staffeln','Liste2..1000 erforderlich.')
 vorher_vereinbart <- .geld('0');geschuetzt <- .geld('0');daten <- list();betraege <- list()
 for(s in staffeln) {
  if(!is.list(s) || !identical(sort(names(s)),sort(c('staffelbeginn_am','vereinbarte_monatsmiete','zulaessige_monatsmiete_ohne_vorstaffelschutz')))) .fehler('staffeln','Genau Beginn, vereinbarte Monatsmiete und individuelle Grenze erforderlich.')
  m <- .geld(s$vereinbarte_monatsmiete);g <- .geld(s$zulaessige_monatsmiete_ohne_vorstaffelschutz)
  if(.vergleichen(m,vorher_vereinbart)<0) .fehler('staffeln','Nur nicht sinkende Vereinbarungsbetr\u00e4ge zugelassen.')
  vorher_vereinbart <- m;daten <- c(daten,list(s$staffelbeginn_am));betraege <- c(betraege,list(list(m=m,g=g)))
 }
 zeit <- staffelmiete_mindestabstaende(daten,einordnungsnachweis)
 if(!zeit$wert$alle_jahresabstaende_eingehalten) .fehler('staffeln','G\u00fcltige Jahresabst\u00e4nde erforderlich.')
 wert <- list()
 for(i in seq_along(daten)) {
  m <- betraege[[i]]$m;g <- betraege[[i]]$g
  grenze <- if(.vergleichen(g,geschuetzt)>=0) g else geschuetzt
  geschuetzt <- if(.vergleichen(m,grenze)<=0) m else grenze
  wert <- c(wert,list(list(staffelbeginn_am=daten[[i]],rechnerische_monatsgrenze=.bruchteile(grenze),rechnerische_monatsmiete=.bruchteile(geschuetzt),monatlicher_ueberhoehungsbetrag=.bruchteile(.subtrahieren(m,geschuetzt)))))
 }
 eingaben <- list(staffeln=staffeln, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_STAFFELMIETE_AUFSTEIGENDE_BETRAGSGRENZEN",eingaben,list(list(operation="F\u00fcr eine vollst\u00e4ndige aufsteigende g\u00fcltige Staffelfolge individuelle Mietgrenzen und Schutz der zuvor wirksam begr\u00fcndeten Mieth\u00f6he fortschreiben.")),eingaben)
 ergebnis$hinweise <- list("\u00a7557aIV in Verbindung556gI2: f\u00fcr jede aufsteigende g\u00fcltige Staffel H\u00f6chstbetrag mit der zuvor wirksam begr\u00fcndeten Mieth\u00f6he vergleichen; h\u00f6here gesch\u00fctzte Vormietstaffel erhalten, vereinbarte Monatsmiete auf diesen H\u00f6chstbetrag begrenzen. Nur rechtlich qualifizierte, vollst\u00e4ndig geordnete und nicht sinkende Vereinbarungsbetr\u00e4ge; absteigende/neu verhandelte Folgen ben\u00f6tigen gesonderte Bewertung. Anf\u00e4ngliche \u00dcberh\u00f6hung wird nicht als gesch\u00fctzte Vorstaffelmiete fortgeschrieben. Die H\u00f6chstbetr\u00e4ge m\u00fcssen556d\u2013g einschlie\u00dflich relevanter Vormiete/Modernisierung/Auskunft und bei Folgestaffeln Zeitpunkt der ersten F\u00e4lligkeit bereits korrekt ber\u00fccksichtigen. Keine automatische10%-Bewertung aus unqualifizierter Vergleichsmiete. Fehlende Jahresabst\u00e4nde f\u00fchren zu Eingabefehler f\u00fcr diese vorqualifizierte g\u00fcltige Folge; keine automatische Ersatzvereinbarung. R\u00fcckforderung, R\u00fcge, Verj\u00e4hrung, K\u00fcndigungsausschluss und Rundung gesondert.")
 ergebnis
}
