verjaehrung_neubeginn_grundfrist <- function(neubeginnereignis_am = NULL,
    fristdauer = NULL, fristeinheit = NULL, wirksamer_neubeginn = NULL) {
  .datum(neubeginnereignis_am, "neubeginnereignis_am")
  .ganzzahl(fristdauer, "fristdauer", 1)
  .auswahl(fristeinheit, "fristeinheit", c("tage", "wochen", "monate", "jahre"))
  .wahrheitswert(wirksamer_neubeginn, "wirksamer_neubeginn")
  eingaben <- list(neubeginnereignis_am = neubeginnereignis_am,
    fristdauer = fristdauer, fristeinheit = fristeinheit, wirksamer_neubeginn = wirksamer_neubeginn)
  wert <- NULL
  if (wirksamer_neubeginn) {
    wert <- .iso(.frist(neubeginnereignis_am, fristdauer, fristeinheit, "ereignis"))
  }
  ergebnis <- .ergebnis(wert, "datum", "BGB_VERJAEHRUNG_NEUBEGINN_GRUNDFRIST",
    eingaben, list(list(operation = "Volle ma\u00dfgebliche Ereignisfrist ab wirksamem Neubeginn",
      ergebnis = wert)), eingaben)
  ergebnis$status <- if (wirksamer_neubeginn) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list(
    "Feste lokale BGB-Fassung; Wirksamkeit des Neubeginns, Ereignis und volle Fristdauer rechtlich vorgegeben.")
  ergebnis$hinweise <- list(
    "Rechnerischer letzter Tag zum Tagesschluss; kein automatischer Jahresschlussbeginn oder Abzug zuvor verstrichener Zeit.",
    "Sp\u00e4tere Frist\u00e4nderungen, konkurrierende Fristl\u00e4ufe und gegebenenfalls Werktagsverschiebung bleiben gesondert; kein abschlie\u00dfender Verj\u00e4hrungstag.")
  ergebnis
}
