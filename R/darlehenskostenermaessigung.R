verbraucherdarlehen_kostenabschnitte_ermaessigen <- function(kostenabschnitte=NULL,ermaessigung_ab=NULL,ermaessigungsfall=NULL,einordnungsnachweis=NULL) {
 grenze <- .datum(ermaessigung_ab,'ermaessigung_ab'); .auswahl(ermaessigungsfall,'ermaessigungsfall',c('vorzeitige_erfuellung','kuendigung'))
 .text(einordnungsnachweis,'einordnungsnachweis'); .vorhanden(kostenabschnitte,'kostenabschnitte')
 if(!is.list(kostenabschnitte) || !is.null(names(kostenabschnitte)) || length(kostenabschnitte)<1 || length(kostenabschnitte)>1000) .fehler('kostenabschnitte','Liste mit1bis1000 eindeutig abgegrenzten Kostenpositionen erforderlich.')
 namen <- character(); positionen <- list(); gesamt <- .bruch(0); ermaessigung <- .bruch(0)
 for(a in kostenabschnitte) {
  if(!is.list(a) || !identical(sort(names(a)),sort(c('position_id','beginn_am','ende_am','kostenbetrag','kostenart')))) .fehler('kostenabschnitte','Position ben\u00f6tigt Kennung, Beginn, Ende, Kostenbetrag und Kostenart.')
  kennung <- .text(a$position_id,'position_id'); beginn <- .datum(a$beginn_am,'beginn_am'); ende <- .datum(a$ende_am,'ende_am'); betrag <- .geld(a$kostenbetrag)
  .auswahl(a$kostenart,'kostenart',c('zinsen','laufzeitabhaengige_kosten','sonstige_kosten'))
  if(kennung %in% namen || ende<beginn) .fehler('kostenabschnitte','Eindeutige Positionen mit Ende fr\u00fchestens am Beginn erforderlich.')
  namen <- c(namen,kennung); tage <- as.numeric(ende-beginn)+1; resttage <- max(as.numeric(ende-max(beginn,grenze))+1,0)
  anwendbar <- ermaessigungsfall=='vorzeitige_erfuellung' || a$kostenart!='sonstige_kosten'
  abzug <- if(anwendbar) .multiplizieren(betrag,.bruch(resttage,tage)) else .bruch(0)
  gesamt <- .addieren(gesamt,betrag); ermaessigung <- .addieren(ermaessigung,abzug)
  positionen[[length(positionen)+1]] <- list(position_id=kennung,ermaessigungsbetrag=.bruchteile(abzug),verbleibender_kostenbetrag=.bruchteile(.subtrahieren(betrag,abzug)))
 }
 wert <- list(positionen=positionen,urspruengliche_kostensumme=.bruchteile(gesamt),gesamtermaessigung=.bruchteile(ermaessigung),verbleibende_kostensumme=.bruchteile(.subtrahieren(gesamt,ermaessigung)))
 eingaben <- list(kostenabschnitte=kostenabschnitte,ermaessigung_ab=ermaessigung_ab,ermaessigungsfall=ermaessigungsfall,einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,'EUR','BGB_VERBRAUCHERDARLEHEN_KOSTENABSCHNITTE_ERMAESSIGEN',eingaben,list(list(operation='Je homogenem einschlie\u00dflich datiertem Kostenabschnitt Anteil der Kalendertage ab K\u00fcrzungsbeginn ermitteln; bei K\u00fcndigung sonstige nicht laufzeitabh\u00e4ngige Kosten ausnehmen; exakte Erm\u00e4\u00dfigungsbetr\u00e4ge summieren.')),eingaben)
 ergebnis$hinweise <- list("Nur qualifizierte \u00a7501-Abschnitte mit ausdr\u00fccklich gleichm\u00e4\u00dfiger Zuordnung je tats\u00e4chlichem Kalendertag innerhalb jeder Position. Beginn/Ende inklusive; ermaessigung_ab ist der rechtlich bestimmte erste zu k\u00fcrzende Tag, bei Absatz2 nach F\u00e4lligkeit, nicht automatisch der K\u00fcndigungszugangstag. Andere Zins-/Zeitkonventionen und nichtlinear innerhalb einer Position gestaffelte Kosten sind nicht erfasst; rechtlich passende kleinere homogene Positionen bilden. Bei vorzeitiger Teilerf\u00fcllung ausschlie\u00dflich Kosten des rechtlich zugeordneten erf\u00fcllten Teils eingeben, kein pauschaler Schuldquotenabschlag. Absatz1 umfasst qualifiziert zugeordnete Zinsen/Kosten; Absatz2 nur Zinsen und sonstige laufzeitabh\u00e4ngige Kosten. Identische wirtschaftliche Kosten d\u00fcrfen nicht mehrfach vorkommen; parallele unterschiedliche Kostenarten sind zul\u00e4ssig. Keine Berechnung des Effektivzinses, keine Tilgungsplan-Neuberechnung, keine Vorf\u00e4lligkeitsentsch\u00e4digung und keine automatische Einstufung einer Kostenart. \u00a7507 Absatz3 gesetzliche Zinsbasis separat bestimmen.")
 ergebnis
}
