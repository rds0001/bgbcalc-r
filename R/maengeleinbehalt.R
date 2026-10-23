werk_maengeleinbehalt <- function(faellige_verguetung = NULL,
    mangelbeseitigungskosten = NULL, mangelbeseitigungsanspruch = NULL,
    abweichender_angemessener_betrag = NULL, abweichungsbegruendung = NULL) {
  verguetung <- .geld(faellige_verguetung)
  kosten <- .geld(mangelbeseitigungskosten)
  .wahrheitswert(mangelbeseitigungsanspruch, "mangelbeseitigungsanspruch")
  regelfall <- is.null(abweichender_angemessener_betrag)
  if (regelfall) {
    if (!is.null(abweichungsbegruendung)) {
      .fehler("abweichungsbegruendung", "Begr\u00fcndung ohne abweichenden Betrag.")
    }
    angemessen <- .multiplizieren(kosten, .bruch(2))
  } else {
    angemessen <- .geld(abweichender_angemessener_betrag)
    .text(abweichungsbegruendung, "abweichungsbegruendung")
  }
  wert <- if (!mangelbeseitigungsanspruch) NULL else
    if (.vergleichen(verguetung, angemessen) <= 0) verguetung else angemessen
  .geld_ergebnis(wert, "BGB_WERK_MAENGELEINBEHALT",
    list(faellige_verguetung = faellige_verguetung,
      mangelbeseitigungskosten = mangelbeseitigungskosten,
      mangelbeseitigungsanspruch = mangelbeseitigungsanspruch,
      abweichender_angemessener_betrag = abweichender_angemessener_betrag,
      abweichungsbegruendung = abweichungsbegruendung),
    list(list(operation = "Mangelbeseitigungsanspruch pr\u00fcfen", anwendbar = mangelbeseitigungsanspruch),
      list(operation = "Doppelte Kosten oder ausdr\u00fccklich begr\u00fcndete Einzelfallbewertung",
        regelfall = regelfall, angemessener_betrag = .bruchteile(angemessen)),
      list(operation = "Zahlungseinbehalt auf f\u00e4llige Verg\u00fctung begrenzen")))
}
