verjaehrung_rechtsverfolgung_nachlauffrist <- function(anknuepfungsereignis = NULL,
    anknuepfungsereignis_am = NULL, hemmung_durch_rechtsverfolgung_anwendbar = NULL) {
  .auswahl(anknuepfungsereignis, "anknuepfungsereignis", c(
    "rechtskraeftige_entscheidung", "anderweitige_beendigung", "stillstand_durch_nichtbetreiben"))
  ereignis <- .datum(anknuepfungsereignis_am, "anknuepfungsereignis_am")
  .wahrheitswert(hemmung_durch_rechtsverfolgung_anwendbar, "hemmung_durch_rechtsverfolgung_anwendbar")
  eingaben <- list(anknuepfungsereignis = anknuepfungsereignis,
    anknuepfungsereignis_am = anknuepfungsereignis_am,
    hemmung_durch_rechtsverfolgung_anwendbar = hemmung_durch_rechtsverfolgung_anwendbar)
  wert <- NULL
  if (hemmung_durch_rechtsverfolgung_anwendbar) {
    wert <- .iso(.monatsende(ereignis, 6, FALSE))
  }
  ergebnis <- .ergebnis(wert, "datum", "BGB_VERJAEHRUNG_RECHTSVERFOLGUNG_NACHLAUFFRIST",
    eingaben, list(list(operation = "Sechsmonatiger Nachlauf ab rechtlich ausgew\u00e4hltem Ereignis",
      anknuepfungsereignis = anknuepfungsereignis, ergebnis = wert)), eingaben)
  ergebnis$status <- if (hemmung_durch_rechtsverfolgung_anwendbar) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list(
    "Feste lokale BGB-Fassung; Hemmungstatbestand und Ankn\u00fcpfungsereignis rechtlich vorgegeben.")
  ergebnis$hinweise <- list(
    "Rechnerisches Ende des ausgew\u00e4hlten Nachlaufs zum Tagesschluss, kein Verj\u00e4hrungsablauf.",
    "Erneutes Weiterbetreiben und sp\u00e4tere Verfahrensereignisse sowie gegebenenfalls Werktagsverschiebung sind gesondert zu ber\u00fccksichtigen.")
  ergebnis
}
