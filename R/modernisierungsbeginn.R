modernisierung_erhoehungsbeginn <- function(zugang_erklaerung = NULL,
    ankuendigung_ordnungsgemaess = NULL, angekuendigter_erhoehungsbetrag = NULL,
    tatsaechlicher_erhoehungsbetrag = NULL, erklaerung_wirksam = NULL) {
  eingaben <- list(zugang_erklaerung = zugang_erklaerung,
    ankuendigung_ordnungsgemaess = ankuendigung_ordnungsgemaess,
    angekuendigter_erhoehungsbetrag = angekuendigter_erhoehungsbetrag,
    tatsaechlicher_erhoehungsbetrag = tatsaechlicher_erhoehungsbetrag,
    erklaerung_wirksam = erklaerung_wirksam)
  zugang <- .datum(zugang_erklaerung, "zugang_erklaerung")
  .wahrheitswert(ankuendigung_ordnungsgemaess, "ankuendigung_ordnungsgemaess")
  angekuendigt <- .geld(angekuendigter_erhoehungsbetrag)
  tatsaechlich <- .geld(tatsaechlicher_erhoehungsbetrag)
  .wahrheitswert(erklaerung_wirksam, "erklaerung_wirksam")
  ueberschreitung <- .vergleichen(tatsaechlich,
    .multiplizieren(angekuendigt, .bruch(11, 10))) > 0
  verlaengerung <- !ankuendigung_ordnungsgemaess || ueberschreitung
  wert <- NULL
  if (erklaerung_wirksam) {
    erster <- as.Date(paste0(substr(.iso(zugang), 1, 7), "-01"))
    wert <- .iso(.monatsende(erster, if (verlaengerung) 9 else 3, FALSE))
  }
  ergebnis <- .ergebnis(wert, "datum", "BGB_MODERNISIERUNG_ERHOEHUNGSBEGINN",
    eingaben, list(
      list(operation = "Tats\u00e4chlicher Betrag \u00fcber 110 Prozent der Ank\u00fcndigung",
        erfuellt = ueberschreitung),
      list(operation = "Einmalige Verl\u00e4ngerung um sechs Monate",
        erfuellt = verlaengerung),
      list(operation = "Beginn des dritten beziehungsweise neunten Folgemonats",
        ergebnis = wert)), eingaben)
  ergebnis$status <- if (erklaerung_wirksam) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list(
    "Feste lokale BGB-Fassung; Wirksamkeit der Erkl\u00e4rung und Ordnungsm\u00e4\u00dfigkeit der Ank\u00fcndigung ausdr\u00fccklich eingegeben.")
  ergebnis$hinweise <- list(
    "Beginn der erh\u00f6hten Miete, keine Zahlungsf\u00e4lligkeitsberechnung oder Feiertagsverschiebung.",
    "\u00a7 559b Absatz 2; entsprechende Anwendung nach \u00a7 559c Absatz 3 und \u00a7 559e Absatz 4 setzt deren Voraussetzungen voraus.")
  ergebnis
}
