elternlinien_erbquoten <- function(elternlinien = NULL, erste_ordnung_vorhanden = NULL,
    verwandtenanteil_zaehler = NULL, verwandtenanteil_nenner = NULL) {
  .vorhanden(elternlinien, "elternlinien")
  if (!is.list(elternlinien) || !is.null(names(elternlinien)) || length(elternlinien) != 2) {
    .fehler("elternlinien", "Genau zwei Elternlinien erforderlich.")
  }
  .wahrheitswert(erste_ordnung_vorhanden, "erste_ordnung_vorhanden")
  ergebnis <- abkoemmlings_erbquoten(elternlinien, verwandtenanteil_zaehler, verwandtenanteil_nenner)
  eingaben <- list(elternlinien = elternlinien, erste_ordnung_vorhanden = erste_ordnung_vorhanden,
    verwandtenanteil_zaehler = verwandtenanteil_zaehler, verwandtenanteil_nenner = verwandtenanteil_nenner)
  ergebnis$regel_id <- "BGB_ELTERNLINIEN_ERBQUOTEN"
  ergebnis$eingaben <- eingaben
  ergebnis$nutzervorgaben <- eingaben
  schritt <- ergebnis$rechenschritte[[2]]
  schritt$besetzte_elternlinien <- schritt$besetzte_kinderstaemme
  schritt$besetzte_kinderstaemme <- NULL
  ergebnis$rechenschritte[[2]] <- schritt
  ergebnis$rechenschritte <- c(list(list(
    operation = "Vorrang der ersten Ordnung pr\u00fcfen", erste_ordnung_vorhanden = erste_ordnung_vorhanden)),
    ergebnis$rechenschritte)
  if (erste_ordnung_vorhanden) {
    ergebnis["wert"] <- list(NULL)
    ergebnis$status <- "NICHT_ANWENDBAR"
  }
  ergebnis$hinweise <- list(
    "Elternschaft und Abk\u00f6mmlingsbeziehungen einschlie\u00dflich Adoptionsausschl\u00fcssen sind rechtlich vorgegeben.",
    "Keine automatische Ehegattenquote oder Pr\u00fcfung weiterer Erbordnungen.",
    "Mehrfachzugeh\u00f6rigkeit bleibt als besondere Erbteile sichtbar; keine Rundung.")
  ergebnis
}
