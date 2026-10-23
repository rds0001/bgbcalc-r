landpacht_dreijahres_restlaufzeit <- function(beurteilungsbeginn_am=NULL, beginnart=NULL, pachtende_am=NULL, einordnungsnachweis=NULL) {
 beginn <- .datum(beurteilungsbeginn_am,'beurteilungsbeginn_am');ende <- .datum(pachtende_am,'pachtende_am');.text(einordnungsnachweis,'einordnungsnachweis')
 if(ende<beginn) .fehler('pachtende_am','Vertragsende darf nicht vor dem Beurteilungsbeginn liegen.')
 grenze <- .frist(beurteilungsbeginn_am,3,'jahre',beginnart)
 wert <- list(dreijahreszeitraum_letzter_tag=.iso(grenze),restlaufzeit_weniger_als_drei_jahre=ende<grenze)
 eingaben <- list(beurteilungsbeginn_am=beurteilungsbeginn_am, beginnart=beginnart, pachtende_am=pachtende_am, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"datum_und_wahrheitswert","BGB_LANDPACHT_DREIJAHRES_RESTLAUFZEIT",eingaben,list(list(operation="Dreij\u00e4hrige Restlaufzeit streng unterschreiten.")),eingaben)
 ergebnis$hinweise <- list("\u00a7\u00a7590II/591II: Ende eines Dreijahreszeitraums ab qualifiziertem Bezugstag mit dem letzten Vertragstag vergleichen. Strikt fr\u00fcheres Pachtende bedeutet weniger als drei Jahre; Gleichheit gen\u00fcgt nicht. Keine automatische gerichtliche Erlaubnis, keine Festlegung des juristischen Beurteilungszeitpunkts. Nur kalendert\u00e4glich eindeutig normalisierte Zeitpunkte, keine ungekl\u00e4rten untert\u00e4gigen Grenzf\u00e4lle.")
 ergebnis
}
