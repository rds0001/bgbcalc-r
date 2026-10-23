verjaehrung_kenntnisunabhaengige_grundfrist <- function(anspruchsart = NULL,
    entstehung_oder_zuwiderhandlung_am = NULL, schadensausloesendes_ereignis_am = NULL,
    kenntnisunabhaengige_frist_anwendbar = NULL) {
  .auswahl(anspruchsart, "anspruchsart", c("leben_koerper_gesundheit_freiheit",
    "sonstiger_schadensersatz", "erbfall", "sonstiger_anspruch"))
  eingaben <- list(anspruchsart = anspruchsart,
    entstehung_oder_zuwiderhandlung_am = entstehung_oder_zuwiderhandlung_am,
    schadensausloesendes_ereignis_am = schadensausloesendes_ereignis_am,
    kenntnisunabhaengige_frist_anwendbar = kenntnisunabhaengige_frist_anwendbar)
  anknuepfungen <- list()
  entstehung <- NULL
  if (anspruchsart == "leben_koerper_gesundheit_freiheit") {
    if (!is.null(entstehung_oder_zuwiderhandlung_am)) {
      .fehler("entstehung_oder_zuwiderhandlung_am", "F\u00fcr diese Fallgruppe nicht anzugeben.")
    }
  } else {
    entstehung <- .datum(entstehung_oder_zuwiderhandlung_am, "entstehung_oder_zuwiderhandlung_am")
    anknuepfungen[[1]] <- list(art = "entstehung", datum = entstehung,
      jahre = if (anspruchsart == "erbfall") 30 else 10)
  }
  if (anspruchsart %in% c("leben_koerper_gesundheit_freiheit", "sonstiger_schadensersatz")) {
    ereignis <- .datum(schadensausloesendes_ereignis_am, "schadensausloesendes_ereignis_am")
    if (!is.null(entstehung) && ereignis > entstehung) {
      .fehler("schadensausloesendes_ereignis_am", "Ereignis darf nicht nach Entstehung liegen.")
    }
    anknuepfungen[[length(anknuepfungen) + 1L]] <- list(
      art = "ereignis", datum = ereignis, jahre = 30)
  } else if (!is.null(schadensausloesendes_ereignis_am)) {
    .fehler("schadensausloesendes_ereignis_am", "F\u00fcr diese Fallgruppe nicht anzugeben.")
  }
  .wahrheitswert(kenntnisunabhaengige_frist_anwendbar, "kenntnisunabhaengige_frist_anwendbar")
  wert <- NULL
  if (kenntnisunabhaengige_frist_anwendbar) {
    fristen <- lapply(anknuepfungen, function(a) list(
      anknuepfung = a$art, beginnereignis = .iso(a$datum), jahre = a$jahre,
      rechnerischer_letzter_tag = .iso(.monatsende(a$datum, a$jahre * 12, FALSE))))
    wert <- list(fristen = fristen, rechnerischer_letzter_tag = min(vapply(
      fristen, function(f) f$rechnerischer_letzter_tag, "")))
  }
  ergebnis <- .ergebnis(wert, "datum", "BGB_VERJAEHRUNG_KENNTNISUNABHAENGIGE_GRUNDFRIST",
    eingaben, list(list(
      operation = "Kenntnisunabh\u00e4ngige Jahresfristen ohne Jahresschlussverschiebung",
      ergebnis = wert)), eingaben)
  ergebnis$status <- if (kenntnisunabhaengige_frist_anwendbar) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list(
    "Feste lokale BGB-Fassung; Anspruchsgruppe und rechtlich ma\u00dfgebliche Ereignisse ausdr\u00fccklich vorgegeben.")
  ergebnis$hinweise <- list(
    "Enddaten bezeichnen den Tagesschluss; kein abschlie\u00dfender Verj\u00e4hrungstag.",
    "Fr\u00fchere kenntnisabh\u00e4ngige Frist, Hemmung, Ablaufhemmung, Neubeginn, Sonderregeln und gegebenenfalls Werktagsverschiebung bleiben gesondert.")
  ergebnis
}
