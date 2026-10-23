gemeinschaft_lastenanteile <- function(gesamtbetrag = NULL, teilhaber = NULL,
    gleiche_anteile_im_zweifel = NULL, gemeinschaft_nach_bruchteilen = NULL) {
  betrag <- .geld(gesamtbetrag)
  .vorhanden(teilhaber, "teilhaber")
  if (!is.list(teilhaber) || !is.null(names(teilhaber)) ||
      length(teilhaber) < 2 || length(teilhaber) > 1000) {
    .fehler("teilhaber", "Liste mit 2 bis 1000 Teilhabern erforderlich.")
  }
  .wahrheitswert(gleiche_anteile_im_zweifel, "gleiche_anteile_im_zweifel")
  .wahrheitswert(gemeinschaft_nach_bruchteilen, "gemeinschaft_nach_bruchteilen")
  namen <- character()
  quoten <- list()
  summe <- .bruch(0)
  for (person in teilhaber) {
    if (!is.list(person) || !identical(sort(names(person)),
        sort(c("person_id", "anteil_zaehler", "anteil_nenner")))) {
      .fehler("teilhaber", "Genau person_id, anteil_zaehler und anteil_nenner erforderlich.")
    }
    kennung <- .text(person$person_id, "person_id")
    if (kennung %in% namen) .fehler("person_id", "Teilhaber d\u00fcrfen nicht doppelt vorkommen.")
    zaehler <- person$anteil_zaehler
    nenner <- person$anteil_nenner
    if (gleiche_anteile_im_zweifel) {
      if (!is.null(zaehler) || !is.null(nenner)) {
        .fehler("gleiche_anteile_im_zweifel", "Zweifelsregel nicht mit ausdr\u00fccklich vorgegebenen Anteilen vermischen.")
      }
      quote <- .bruch(1, length(teilhaber))
    } else {
      .ganzzahl(zaehler, "anteil_zaehler", 1, .zahlengrenze)
      .ganzzahl(nenner, "anteil_nenner", 1, .zahlengrenze)
      quote <- .bruch(zaehler, nenner)
    }
    summe <- .addieren(summe, quote)
    namen <- c(namen, kennung)
    quoten[[length(quoten) + 1L]] <- quote
  }
  if (.vergleichen(summe, .bruch(1)) != 0) {
    .fehler("teilhaber", "Positive Teilhaberanteile m\u00fcssen zusammen 1 ergeben.")
  }
  ergebnis <- .geld_ergebnis(if (gemeinschaft_nach_bruchteilen) .bruch(0) else NULL,
    "BGB_GEMEINSCHAFT_LASTENANTEILE",
    list(gesamtbetrag = gesamtbetrag, teilhaber = teilhaber,
      gleiche_anteile_im_zweifel = gleiche_anteile_im_zweifel,
      gemeinschaft_nach_bruchteilen = gemeinschaft_nach_bruchteilen),
    list(list(operation = "Anwendbarkeit der Bruchteilsgemeinschaft", anwendbar = gemeinschaft_nach_bruchteilen),
      list(operation = "Gesamtbetrag nach Teilhaberanteilen verteilen",
        zweifelsregel_gleiche_anteile = gleiche_anteile_im_zweifel)))
  if (gemeinschaft_nach_bruchteilen) {
    ergebnis$wert <- lapply(seq_along(namen), function(i) list(person_id = namen[[i]],
      anteil = .bruchteile(quoten[[i]]), betrag = .bruchteile(.multiplizieren(betrag, quoten[[i]]))))
  }
  ergebnis
}
