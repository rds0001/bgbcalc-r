gesamthypothekenvermaechtnis_befriedigungsbetrag <- function(schuldbetrag = NULL, grundstuecke = NULL,
    vermachtes_grundstueck_id = NULL, schuld_nach_2166_qualifiziert = NULL,
    zweifelsregel_anwendbar = NULL, hoechstbetragshypothek = NULL,
    alle_mithaftenden_grundstuecke_im_nachlass = NULL, drittberichtigung_nach_2166_absatz_2 = NULL,
    bewertungsnachweis = NULL) {
  schuld <- .geld(schuldbetrag)
  ziel <- .text(vermachtes_grundstueck_id, "vermachtes_grundstueck_id")
  .vorhanden(grundstuecke, "grundstuecke")
  if (!is.list(grundstuecke) || !is.null(names(grundstuecke)) || length(grundstuecke) < 2 || length(grundstuecke) > 1000)
    .fehler("grundstuecke", "Liste mit 2 bis 1000 verschiedenen mithaftenden Grundst\u00fccken erforderlich.")
  namen <- character(); werte <- list(); gesamt <- .bruch(0)
  for (g in grundstuecke) {
    if (!is.list(g) || !identical(sort(names(g)), sort(c("grundstueck_id", "grundstueckswert", "vorrangige_belastungen"))))
      .fehler("grundstuecke", "Genau grundstueck_id, grundstueckswert und vorrangige_belastungen erforderlich.")
    name <- .text(g$grundstueck_id, "grundstueck_id")
    if (name %in% namen) .fehler("grundstueck_id", "Grundst\u00fcck nicht doppelt auff\u00fchren.")
    wert <- .subtrahieren(.geld(g$grundstueckswert), .geld(g$vorrangige_belastungen))
    if (.vergleichen(wert, .bruch(0)) < 0) wert <- .bruch(0)
    namen <- c(namen, name); werte <- c(werte, list(wert)); gesamt <- .addieren(gesamt, wert)
  }
  if (!ziel %in% namen) .fehler("vermachtes_grundstueck_id", "Vermachtes Grundst\u00fcck muss in vollst\u00e4ndiger Grundst\u00fccksliste vorkommen.")
  eingaben <- list(schuldbetrag = schuldbetrag, grundstuecke = grundstuecke,
    vermachtes_grundstueck_id = vermachtes_grundstueck_id,
    schuld_nach_2166_qualifiziert = schuld_nach_2166_qualifiziert,
    zweifelsregel_anwendbar = zweifelsregel_anwendbar, hoechstbetragshypothek = hoechstbetragshypothek,
    alle_mithaftenden_grundstuecke_im_nachlass = alle_mithaftenden_grundstuecke_im_nachlass,
    drittberichtigung_nach_2166_absatz_2 = drittberichtigung_nach_2166_absatz_2,
    bewertungsnachweis = bewertungsnachweis)
  for (name in names(eingaben)[4:8]) .wahrheitswert(eingaben[[name]], name)
  .text(bewertungsnachweis, "bewertungsnachweis")
  gilt <- schuld_nach_2166_qualifiziert && zweifelsregel_anwendbar && !hoechstbetragshypothek && alle_mithaftenden_grundstuecke_im_nachlass && !drittberichtigung_nach_2166_absatz_2
  wert <- NULL
  if (gilt) {
    deckung <- werte[[match(ziel, namen)]]
    quote <- if (.vergleichen(gesamt, .bruch(0)) > 0) .dividieren(deckung, gesamt) else NULL
    anteilig <- if (!is.null(quote)) .multiplizieren(schuld, quote) else .bruch(0)
    betrag <- if (.vergleichen(anteilig, deckung) < 0) anteilig else deckung
    wert <- list(bereinigte_grundstueckswerte = lapply(seq_along(namen), function(i) list(grundstueck_id = namen[[i]], bereinigter_wert = .bruchteile(werte[[i]]))),
      bereinigter_gesamtwert = .bruchteile(gesamt), verteilungsquote = if (!is.null(quote)) .bruchteile(quote) else NULL,
      anteilige_schuld = if (!is.null(quote)) .bruchteile(anteilig) else NULL, befriedigungsbetrag = .bruchteile(betrag))
  }
  ergebnis <- .ergebnis(wert, "EUR", "BGB_GESAMTHYPOTHEKENVERMAECHTNIS_BEFRIEDIGUNGSBETRAG", eingaben,
    list(list(operation = "Je Grundst\u00fcck rangvorrangige Lasten abziehen und negative Deckung auf null begrenzen; Zielwert durch Gesamtwert teilen, mit Schuld multiplizieren und auf Zieldeckung begrenzen")), eingaben)
  ergebnis$status <- if (gilt) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Vollst\u00e4ndige Liste aller mit derselben Hypothek belasteten Nachlassgrundst\u00fccke; eigene beziehungsweise qualifizierte Berichtigungsschuld ohne Drittberichtigungsfall\u00a72166 Absatz2; Werte bei Eigentums\u00fcbergang rechtlich vergleichbar bestimmt.")
  ergebnis$hinweise <- list("Nur interne Verpflichtung des Verm\u00e4chtnisnehmers gegen\u00fcber dem Erben; keine K\u00fcrzung dinglicher Gl\u00e4ubigerrechte. Rangvorrangige Belastungen je Grundst\u00fcck ber\u00fccksichtigen, betrachtete Gesamthypothek nicht nochmals abziehen. Kein frei gew\u00e4hlter Erbfall-/Bewertungsstichtag:\u00a72166 Absatz1 Satz2 verlangt Eigentums\u00fcbergang; bei verschiedenen \u00dcbergangszeitpunkten Vergleichsbasis fachlich kl\u00e4ren. Schuldbetrag ungek\u00fcrzt vorgeben; bei Drittberichtigung\u00a72166 Absatz2 NICHT_ANWENDBAR, da keine ungepr\u00fcfte Reihenfolge mit Anteilsverteilung eingef\u00fchrt wird. H\u00f6chstbetragshypotheken, Nichtnachlassgrundst\u00fccke und Gesamtgrund-/Rentenschuld au\u00dferhalb dieses Modells. Bei s\u00e4mtlichen bereinigten Werten null betr\u00e4gt eigene Deckung und Befriedigung null; verteilungsquote ist NULL, weil0/0 nicht definiert ist; Auch anteilige_schuld ist in diesem Sonderfall NULL, da ohne definierte Quote keine anteilige Schuld ausgewiesen wird. Abweichender Erblasserwille schlie\u00dft Zweifelsregel aus; keine automatische Grundst\u00fccksbewertung oder F\u00e4lligkeitsberechnung.")
  ergebnis
}
