vorerbe_fruchtwertgrenze <- function(fruchtwert=NULL,beeintraechtigte_eigene_nutzungen=NULL,wiederherstellungsgebundener_fruchtwert=NULL,fruchtziehung_nach_2133_qualifiziert=NULL,bewertungsnachweis=NULL) {
 fruechte <- .geld(fruchtwert);nutzungen <- .geld(beeintraechtigte_eigene_nutzungen);gebunden <- .geld(wiederherstellungsgebundener_fruchtwert)
 if(.vergleichen(gebunden,fruechte)>0) .fehler('wiederherstellungsgebundener_fruchtwert','Gebundener Anteil des Fruchtwerts darf gesamten Fruchtwert nicht \u00fcbersteigen; nicht ungepr\u00fcft gesamte Wiederherstellungskosten einsetzen.')
 .wahrheitswert(fruchtziehung_nach_2133_qualifiziert,'fruchtziehung_nach_2133_qualifiziert');.text(bewertungsnachweis,'bewertungsnachweis')
 eingaben <- list(fruchtwert=fruchtwert,beeintraechtigte_eigene_nutzungen=beeintraechtigte_eigene_nutzungen,wiederherstellungsgebundener_fruchtwert=wiederherstellungsgebundener_fruchtwert,fruchtziehung_nach_2133_qualifiziert=fruchtziehung_nach_2133_qualifiziert,bewertungsnachweis=bewertungsnachweis)
 wert <- NULL
 if(fruchtziehung_nach_2133_qualifiziert) {
  frei <- .subtrahieren(fruechte,gebunden);eigen <- if(.vergleichen(frei,nutzungen)<0) frei else nutzungen
  wert <- list(nicht_wiederherstellungsgebundener_fruchtwert=.bruchteile(frei),dem_vorerben_gebuehrender_fruchtwert=.bruchteile(eigen),dem_vorerben_nicht_gebuehrender_fruchtwert=.bruchteile(.subtrahieren(fruechte,eigen)))
 }
 ergebnis <- .ergebnis(wert,'EUR','BGB_VORERBE_FRUCHTWERTGRENZE',eingaben,list(list(operation='Wiederherstellungsgebundenen Anteil vom Fruchtwert abziehen; freien Rest auf Wert beeintr\u00e4chtigter eigener Nutzungen begrenzen')),eingaben)
 ergebnis$status <- if(!is.null(wert)) 'BERECHNET' else 'NICHT_ANWENDBAR'
 ergebnis$annahmen <- list("Ordnungswidrige Fruchtziehung oder infolge besonderen Ereignisses notwendiger \u00dcberma\u00dfbezug rechtlich qualifiziert; vergleichbare getrennte Wertans\u00e4tze.")
 ergebnis$hinweise <- list("Beeintr\u00e4chtigte eigene Nutzungen sind nur dem Vorerben zustehende Nutzungen, deren Wert gerade durch diesen Fruchtbezug beeintr\u00e4chtigt wird; kein beliebiger Gesamtschaden. Wiederherstellungsgebundener Fruchtwert ist der nach ordnungsm\u00e4\u00dfiger Wirtschaft daf\u00fcr einzusetzende Anteil dieses Fruchtwerts, nicht ungepr\u00fcft volle Reparaturkosten. Zwei Grenzen: keine Zuteilung gebundenen Fruchtwerts; \u00fcbrige Zuteilung h\u00f6chstens eigene Nutzungsbeeintr\u00e4chtigung. Nutzungsbeeintr\u00e4chtigung nicht vorab um denselben gebundenen Betrag k\u00fcrzen. Nicht dem Vorerben geb\u00fchrender Wert ist nicht automatisch sofortiger Geldzahlungsanspruch des Nacherben. Keine automatische Bewertung von Bewirtschaftung, Sch\u00e4den oder Wiederherstellungsbedarf.")
 ergebnis
}
