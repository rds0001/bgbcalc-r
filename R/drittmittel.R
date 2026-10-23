modernisierung_drittmittel_aufteilen <- function(gesamtmittel = NULL,
    wohnungskosten = NULL, zuordnung_feststellbar = NULL) {
  mittel <- .geld(gesamtmittel)
  .vorhanden(wohnungskosten, "wohnungskosten")
  if (!is.list(wohnungskosten) || !is.null(names(wohnungskosten)) ||
      length(wohnungskosten) < 1 || length(wohnungskosten) > 1000) {
    .fehler("wohnungskosten", "Liste mit 1 bis 1000 Wohnungen erforderlich.")
  }
  .wahrheitswert(zuordnung_feststellbar, "zuordnung_feststellbar")
  namen <- character()
  kosten <- list()
  gesamtkosten <- .bruch(0)
  for (wohnung in wohnungskosten) {
    if (!is.list(wohnung) || !identical(sort(names(wohnung)),
        sort(c("wohnung_id", "aufgewendete_kosten")))) {
      .fehler("wohnungskosten", "Genau wohnung_id und aufgewendete_kosten erforderlich.")
    }
    kennung <- .text(wohnung$wohnung_id, "wohnung_id")
    if (kennung %in% namen) .fehler("wohnung_id", "Wohnungen d\u00fcrfen nicht doppelt vorkommen.")
    wert <- .geld(wohnung$aufgewendete_kosten)
    namen <- c(namen, kennung)
    kosten[[length(kosten) + 1L]] <- wert
    gesamtkosten <- .addieren(gesamtkosten, wert)
  }
  if (gesamtkosten$zaehler == 0) {
    .fehler("wohnungskosten", "Positive Gesamtkosten f\u00fcr den Verteilungsschl\u00fcssel erforderlich.")
  }
  anwendbar <- !zuordnung_feststellbar
  ergebnis <- .geld_ergebnis(if (anwendbar) .bruch(0) else NULL,
    "BGB_MODERNISIERUNG_DRITTMITTEL_AUFTEILEN",
    list(gesamtmittel = gesamtmittel, wohnungskosten = wohnungskosten,
      zuordnung_feststellbar = zuordnung_feststellbar),
    list(list(operation = "Auffangschl\u00fcssel nur bei nicht feststellbarer Einzelzuordnung", anwendbar = anwendbar),
      list(operation = "Nach Verh\u00e4ltnis aufgewendeter Wohnungskosten aufteilen",
        gesamtkosten = .bruchteile(gesamtkosten))))
  if (anwendbar) {
    ergebnis$wert <- lapply(seq_along(namen), function(i) {
      anteil <- .dividieren(kosten[[i]], gesamtkosten)
      list(wohnung_id = namen[[i]], kostenanteil = .bruchteile(anteil),
        drittmittel = .bruchteile(.multiplizieren(mittel, anteil)))
    })
  }
  ergebnis
}
