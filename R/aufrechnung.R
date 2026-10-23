aufrechnung_betragswirkung <- function(eigene_forderung = NULL, gegenforderung = NULL,
    aufrechnungslage_am = NULL, erklaerung_am = NULL,
    aufrechnung_zulaessig_und_erklaert = NULL, forderungsnachweis = NULL) {
  eigene <- .geld(eigene_forderung)
  gegen <- .geld(gegenforderung)
  lage <- .datum(aufrechnungslage_am, "aufrechnungslage_am")
  erklaerung <- .datum(erklaerung_am, "erklaerung_am")
  if (lage > erklaerung) .fehler("aufrechnungslage_am", "Aufrechnungslage darf nicht erst nach der Erkl\u00e4rung eintreten.")
  .wahrheitswert(aufrechnung_zulaessig_und_erklaert, "aufrechnung_zulaessig_und_erklaert")
  .text(forderungsnachweis, "forderungsnachweis")
  eingaben <- list(eigene_forderung = eigene_forderung, gegenforderung = gegenforderung,
    aufrechnungslage_am = aufrechnungslage_am, erklaerung_am = erklaerung_am,
    aufrechnung_zulaessig_und_erklaert = aufrechnung_zulaessig_und_erklaert,
    forderungsnachweis = forderungsnachweis)
  ergebnis <- .geld_ergebnis(NULL, "BGB_AUFRECHNUNG_BETRAGSWIRKUNG", eingaben,
    list(list(operation = "Deckung als Minimum beider Forderungen; beide Restbetr\u00e4ge und gesetzlichen r\u00fcckwirkenden Erl\u00f6schenszeitpunkt ausweisen")))
  if (aufrechnung_zulaessig_und_erklaert) {
    deckung <- if (.vergleichen(eigene, gegen) < 0) eigene else gegen
    ergebnis$wert <- list(erloschener_betrag_je_forderung = .bruchteile(deckung),
      rest_eigene_forderung = .bruchteile(.subtrahieren(eigene, deckung)),
      rest_gegenforderung = .bruchteile(.subtrahieren(gegen, deckung)), erloeschenszeitpunkt_am = .iso(lage))
    ergebnis$status <- "BERECHNET"
  }
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Eine rechtlich bestimmte Paarung gleichartiger Geldforderungen in EUR; Betr\u00e4ge zur ma\u00dfgeblichen Aufrechnungslage, nicht ungepr\u00fcft inklusive sp\u00e4terer Zinsen. Mehrere Forderungen und Zins-/Kostenreihenfolge\u00a7396 in Verbindung mit\u00a7\u00a7366/367 separat. Nur taggenau rechtlich normalisierte Ereignisdaten; untert\u00e4gige Reihenfolge nicht aus gleichem Datum folgern. Voraussetzungen, Einreden und Verbote vorab pr\u00fcfen."))
  ergebnis
}
