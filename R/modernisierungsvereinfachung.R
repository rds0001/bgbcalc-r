modernisierung_vereinfachte_kostenbasis <- function(geltend_gemachte_kosten = NULL,
    frueher_geltend_gemachte_kosten = NULL, vereinfachtes_verfahren_gewaehlt = NULL) {
  eingaben <- list(geltend_gemachte_kosten = geltend_gemachte_kosten,
    frueher_geltend_gemachte_kosten = frueher_geltend_gemachte_kosten,
    vereinfachtes_verfahren_gewaehlt = vereinfachtes_verfahren_gewaehlt)
  kosten <- .geld(geltend_gemachte_kosten)
  frueher <- .geld(frueher_geltend_gemachte_kosten)
  .wahrheitswert(vereinfachtes_verfahren_gewaehlt, "vereinfachtes_verfahren_gewaehlt")
  grenze <- .subtrahieren(.bruch(10000), frueher)
  if (grenze$zaehler < 0) grenze <- .bruch(0)
  anwendbar <- vereinfachtes_verfahren_gewaehlt && .vergleichen(kosten, grenze) <= 0
  ergebnis <- .geld_ergebnis(if (anwendbar) .bruch(0) else NULL,
    "BGB_MODERNISIERUNG_VEREINFACHTE_KOSTENBASIS", eingaben, list(
      list(operation = "Verbleibender Kostenh\u00f6chstbetrag vor Erhaltungspauschale",
        kostenhoechstbetrag = .bruchteile(grenze)),
      list(operation = "Gew\u00e4hltes Verfahren und Einhaltung der Kostengrenze",
        anwendbar = anwendbar)))
  if (anwendbar) {
    pauschale <- .multiplizieren(kosten, .bruch(3, 10))
    basis <- .subtrahieren(kosten, pauschale)
    ergebnis$wert <- list(kostenhoechstbetrag = .bruchteile(grenze),
      erhaltungspauschale = .bruchteile(pauschale),
      kostenbasis = .bruchteile(basis))
    ergebnis$rechenschritte <- c(ergebnis$rechenschritte, list(
      list(operation = "Drei\u00dfig Prozent Erhaltungspauschale abziehen",
        erhaltungspauschale = .bruchteile(pauschale))))
  }
  ergebnis$hinweise <- c(ergebnis$hinweise, list(
    "Nur Kostenbasis des vereinfachten Verfahrens; kein endg\u00fcltiger Mieterh\u00f6hungsbetrag."))
  ergebnis
}
