faellige_geldschulden_gesetzlich_tilgen <- function(zahlung = NULL, schulden = NULL,
    tilgungsbestimmung_getroffen = NULL, gesetzliche_reihenfolge_anwendbar = NULL) {
  betrag <- .geld(zahlung)
  .vorhanden(schulden, "schulden")
  if (!is.list(schulden) || !is.null(names(schulden)) ||
      length(schulden) < 2 || length(schulden) > 1000) {
    .fehler("schulden", "Liste mit 2 bis 1000 f\u00e4lligen Geldschulden erforderlich.")
  }
  .wahrheitswert(tilgungsbestimmung_getroffen, "tilgungsbestimmung_getroffen")
  .wahrheitswert(gesetzliche_reihenfolge_anwendbar, "gesetzliche_reihenfolge_anwendbar")
  namen <- character()
  forderungen <- list()
  raenge <- matrix(numeric(), nrow = 0, ncol = 3)
  gesamt <- .bruch(0)
  for (schuld in schulden) {
    if (!is.list(schuld) || !identical(sort(names(schuld)),
        sort(c("schuld_id", "offener_betrag", "sicherheitsrang", "laestigkeitsrang", "altersrang")))) {
      .fehler("schulden", "Genau schuld_id, offener_betrag und die drei Rangfelder erforderlich.")
    }
    kennung <- .text(schuld$schuld_id, "schuld_id")
    if (kennung %in% namen) .fehler("schuld_id", "Schulden d\u00fcrfen nicht doppelt vorkommen.")
    offen <- .geld(schuld$offener_betrag)
    if (offen$zaehler == 0) .fehler("offener_betrag", "Nur positive offene Schulden aufnehmen.")
    rang <- vapply(c("sicherheitsrang", "laestigkeitsrang", "altersrang"),
      function(name) .ganzzahl(schuld[[name]], name, 1, 9007199254740991), numeric(1))
    namen <- c(namen, kennung)
    forderungen[[length(forderungen) + 1L]] <- offen
    raenge <- rbind(raenge, unname(rang))
    gesamt <- .addieren(gesamt, offen)
  }
  anwendbar <- gesetzliche_reihenfolge_anwendbar && !tilgungsbestimmung_getroffen
  eingaben <- list(zahlung = zahlung, schulden = schulden,
    tilgungsbestimmung_getroffen = tilgungsbestimmung_getroffen,
    gesetzliche_reihenfolge_anwendbar = gesetzliche_reihenfolge_anwendbar)
  schritte <- list(
    list(operation = "Gesetzliche Auffangreihenfolge ohne Tilgungsbestimmung", anwendbar = anwendbar),
    list(operation = "Offene f\u00e4llige Geldschulden summieren", gesamtbetrag = .bruchteile(gesamt)))
  wert <- NULL
  if (anwendbar) {
    rest <- betrag
    zugeteilt <- lapply(namen, function(x) .bruch(0))
    gruppen <- unique(raenge)
    gruppen <- gruppen[order(gruppen[, 1], gruppen[, 2], gruppen[, 3]), , drop = FALSE]
    for (g in seq_len(nrow(gruppen))) {
      rang <- gruppen[g, ]
      gruppe <- which(raenge[, 1] == rang[1] & raenge[, 2] == rang[2] & raenge[, 3] == rang[3])
      gruppenbetrag <- .bruch(0)
      for (i in gruppe) gruppenbetrag <- .addieren(gruppenbetrag, forderungen[[i]])
      gruppenzahlung <- if (.vergleichen(rest, gruppenbetrag) < 0) rest else gruppenbetrag
      for (i in gruppe) {
        zugeteilt[[i]] <- .multiplizieren(gruppenzahlung, .dividieren(forderungen[[i]], gruppenbetrag))
      }
      rest <- .subtrahieren(rest, gruppenzahlung)
      schritte <- c(schritte, list(list(
        operation = "Ranggruppe bedienen, innerhalb der Gruppe verh\u00e4ltnism\u00e4\u00dfig",
        sicherheitsrang = unname(rang[1]), laestigkeitsrang = unname(rang[2]),
        altersrang = unname(rang[3]), schuld_ids = unname(as.list(namen[gruppe])),
        gruppenbetrag = .bruchteile(gruppenbetrag), gruppenzahlung = .bruchteile(gruppenzahlung))))
    }
    wert <- list(zuordnungen = lapply(seq_along(namen), function(i)
      list(schuld_id = namen[[i]], tilgungsbetrag = .bruchteile(zugeteilt[[i]]),
        restschuld = .bruchteile(.subtrahieren(forderungen[[i]], zugeteilt[[i]])))),
      nicht_zugeordnet = .bruchteile(rest))
  }
  ergebnis <- .geld_ergebnis(if (anwendbar) .bruch(0) else NULL,
    "BGB_FAELLIGE_GELDSCHULDEN_GESETZLICH_TILGEN", eingaben, schritte)
  ergebnis["wert"] <- list(wert)
  ergebnis$hinweise <- list(
    "Nur bereits f\u00e4llige Geldschulden desselben Schuldners beim selben Gl\u00e4ubiger in EUR.",
    "Rang 1 bedeutet geringste Sicherheit, gr\u00f6\u00dfte L\u00e4stigkeit beziehungsweise h\u00f6chstes Alter; R\u00e4nge sind bewertete Nutzervorgaben.",
    "Tilgungsbestimmungen, nicht f\u00e4llige Schulden und vorrangige Spezialregeln sind gesondert zu behandeln.",
    "Innerhalb jeder ausgew\u00e4hlten Schuld ist die Anrechnung auf Kosten, Zinsen und Hauptforderung gesondert zu pr\u00fcfen.",
    "Keine Cent-Rundung; nicht zugeordnete Zahlung ist kein festgestellter Erstattungsanspruch.")
  ergebnis
}
