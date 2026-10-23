verjaehrung_verhandlungen_mindestablauf <- function(hemmungsende_am = NULL,
    rechnerischer_letzter_tag = NULL, hemmung_durch_verhandlungen_anwendbar = NULL) {
  eingaben <- list(hemmungsende_am = hemmungsende_am,
    rechnerischer_letzter_tag = rechnerischer_letzter_tag,
    hemmung_durch_verhandlungen_anwendbar = hemmung_durch_verhandlungen_anwendbar)
  hemmungsende <- .datum(hemmungsende_am, "hemmungsende_am")
  bisher <- .datum(rechnerischer_letzter_tag, "rechnerischer_letzter_tag")
  .wahrheitswert(hemmung_durch_verhandlungen_anwendbar, "hemmung_durch_verhandlungen_anwendbar")
  wert <- NULL
  if (hemmung_durch_verhandlungen_anwendbar) {
    if (bisher < hemmungsende) {
      .fehler("rechnerischer_letzter_tag", "Bereinigte Frist endet vor dem Hemmungsende.")
    }
    mindestablauf <- .monatsende(hemmungsende, 3, FALSE)
    wert <- list(mindestablauf_nach_verhandlungen = .iso(mindestablauf),
      rechnerischer_letzter_tag = .iso(max(bisher, mindestablauf)))
  }
  ergebnis <- .ergebnis(wert, "datum", "BGB_VERJAEHRUNG_VERHANDLUNGEN_MINDESTABLAUF",
    eingaben, list(list(
      operation = "Drei Monate nach Ende der Verhandlungshemmung; sp\u00e4teren Ablauf ausw\u00e4hlen",
      ergebnis = wert)), eingaben)
  ergebnis$status <- if (hemmung_durch_verhandlungen_anwendbar) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list(
    "Feste lokale BGB-Fassung; Verhandlungshemmung rechtlich bestimmt und Hemmungswirkung bereits eingerechnet.")
  ergebnis$hinweise <- list(
    "Enddaten bezeichnen den Tagesschluss; Mindestnachlauf statt pauschaler Addition weiterer drei Monate.",
    "Andere Frist\u00e4nderungen und gegebenenfalls Werktagsverschiebung bleiben gesondert; kein abschlie\u00dfender Verj\u00e4hrungstag.")
  ergebnis
}
