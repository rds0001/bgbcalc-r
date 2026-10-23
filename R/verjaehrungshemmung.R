verjaehrung_gehemmte_kalendertage <- function(fristlauf_erster_tag = NULL,
    grundfrist_letzter_tag = NULL, hemmungszeitraeume = NULL,
    hemmung_nach_209_anwendbar = NULL) {
  eingaben <- list(fristlauf_erster_tag = fristlauf_erster_tag,
    grundfrist_letzter_tag = grundfrist_letzter_tag, hemmungszeitraeume = hemmungszeitraeume,
    hemmung_nach_209_anwendbar = hemmung_nach_209_anwendbar)
  erster <- .datum(fristlauf_erster_tag, "fristlauf_erster_tag")
  ende <- .datum(grundfrist_letzter_tag, "grundfrist_letzter_tag")
  if (erster > ende) {
    .fehler("grundfrist_letzter_tag", "Grundfrist darf nicht vor ihrem ersten Lauftag enden.")
  }
  .vorhanden(hemmungszeitraeume, "hemmungszeitraeume")
  if (!is.list(hemmungszeitraeume) || !is.null(names(hemmungszeitraeume)) ||
      length(hemmungszeitraeume) > 10000) {
    .fehler("hemmungszeitraeume", "Liste mit h\u00f6chstens 10000 Intervallen erforderlich.")
  }
  intervalle <- list()
  for (zeitraum in hemmungszeitraeume) {
    if (!is.list(zeitraum) || length(zeitraum) != 2L ||
        !setequal(names(zeitraum), c("erster_gehemmter_tag", "letzter_gehemmter_tag"))) {
      .fehler("hemmungszeitraeume", "Intervall mit genau den beiden Tagesgrenzen erforderlich.")
    }
    anfang <- .datum(zeitraum$erster_gehemmter_tag, "erster_gehemmter_tag")
    schluss <- .datum(zeitraum$letzter_gehemmter_tag, "letzter_gehemmter_tag")
    if (anfang > schluss) .fehler("hemmungszeitraeume", "Hemmungsende liegt vor Hemmungsbeginn.")
    if (schluss >= erster) {
      intervalle[[length(intervalle) + 1L]] <- list(anfang = max(anfang, erster), schluss = schluss)
    }
  }
  .wahrheitswert(hemmung_nach_209_anwendbar, "hemmung_nach_209_anwendbar")
  if (length(intervalle)) {
    reihenfolge <- order(vapply(intervalle, function(z) as.numeric(z$anfang), 0),
      vapply(intervalle, function(z) as.numeric(z$schluss), 0))
    intervalle <- intervalle[reihenfolge]
  }
  vereinigt <- list()
  for (zeitraum in intervalle) {
    n <- length(vereinigt)
    if (n > 0 && as.numeric(zeitraum$anfang - vereinigt[[n]]$schluss) <= 1) {
      vereinigt[[n]]$schluss <- max(vereinigt[[n]]$schluss, zeitraum$schluss)
    } else {
      vereinigt[[n + 1L]] <- zeitraum
    }
  }
  schritte <- list(list(operation = "Taggenaue Hemmungswirkung", anwendbar = hemmung_nach_209_anwendbar))
  wert <- NULL
  if (hemmung_nach_209_anwendbar) {
    tage <- 0
    for (zeitraum in vereinigt) {
      if (zeitraum$anfang > ende) break
      dauer <- as.numeric(zeitraum$schluss - zeitraum$anfang) + 1
      ende <- .tage_addieren(ende, dauer)
      tage <- tage + dauer
      schritte[[length(schritte) + 1L]] <- list(
        operation = "Vereinigtes Hemmungsintervall nicht mitz\u00e4hlen",
        erster_gehemmter_tag = .iso(zeitraum$anfang),
        letzter_gehemmter_tag = .iso(zeitraum$schluss),
        hemmungstage = dauer, rechnerischer_letzter_tag = .iso(ende))
    }
    wert <- list(rechnerischer_letzter_tag = .iso(ende), beruecksichtigte_hemmungstage = tage)
  }
  ergebnis <- .ergebnis(wert, "datum", "BGB_VERJAEHRUNG_GEHEMMTE_KALENDERTAGE",
    eingaben, schritte, eingaben)
  ergebnis$status <- if (hemmung_nach_209_anwendbar) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list(
    "Feste lokale BGB-Fassung; Hemmungsgr\u00fcnde und eingeschlossene Kalendertage rechtlich vorgegeben.")
  ergebnis$hinweise <- list(
    "Abgeschlossene, auf ganze Kalendertage normalisierte Intervalle; keine automatische Bestimmung der Hemmungstatbest\u00e4nde.",
    "Ablaufhemmung, Neubeginn, konkurrierende Fristl\u00e4ufe und Werktagsverschiebung bleiben gesondert; kein abschlie\u00dfender Verj\u00e4hrungstag.")
  ergebnis
}
