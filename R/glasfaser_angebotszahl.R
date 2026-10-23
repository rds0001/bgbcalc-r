glasfaserbereitstellung_angebotszahl <- function(anzahl_qualifizierter_angebote=NULL, einordnungsnachweis=NULL) {
 anzahl <- .ganzzahl(anzahl_qualifizierter_angebote,'anzahl_qualifizierter_angebote',0,9007199254740991)
 .text(einordnungsnachweis,'einordnungsnachweis')
 wert <- list(mindestens_drei_angebote=anzahl>=3,fehlende_angebote_bis_drei=max(3-anzahl,0))
 eingaben <- list(anzahl_qualifizierter_angebote=anzahl_qualifizierter_angebote, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"anzahl_und_wahrheitswert","BGB_GLASFASERBEREITSTELLUNG_ANGEBOTSZAHL",eingaben,list(list(operation="Qualifizierte Angebotsanzahl mit gesetzlicher Zahl drei vergleichen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7556IIIa: Anzahl qualifizierter rechtzeitig eingeholter Angebote mit drei vergleichen und fehlende Zahl bis drei berechnen. Der Gesetzesvorbehalt soweit m\u00f6glich und die Auswahl des wirtschaftlichsten Angebots werden nicht automatisch entschieden. Weniger als drei bedeutet daher kein automatisch unwirksames Bereitstellungsentgelt; drei oder mehr beweist keine Wirtschaftlichkeit. Keine TKG-Entgelth\u00f6hen oder erfundenen Kostenkennzahlen.")
 ergebnis
}
