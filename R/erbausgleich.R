erb_zuwendungen_ausgleichen <- function(gruppennachlass = NULL, miterben = NULL,
    ausgleichung_anwendbar = NULL, bewertungsnachweis = NULL) {
  nachlass <- .geld(gruppennachlass)
  .vorhanden(miterben, "miterben")
  if (!is.list(miterben) || !is.null(names(miterben)) ||
      length(miterben) < 1 || length(miterben) > 1000) {
    .fehler("miterben", "Liste mit 1 bis 1000 Miterben erforderlich.")
  }
  .wahrheitswert(ausgleichung_anwendbar, "ausgleichung_anwendbar")
  .text(bewertungsnachweis, "bewertungsnachweis")
  namen <- character()
  quoten <- list()
  zuwendungen <- list()
  gesamtquote <- .bruch(0)
  for (person in miterben) {
    if (!is.list(person) || !identical(sort(names(person)),
        sort(c("person_id", "erbquote_zaehler", "erbquote_nenner", "ausgleichungswert")))) {
      .fehler("miterben", "Objekte mit genau person_id, erbquote_zaehler, erbquote_nenner und ausgleichungswert erforderlich.")
    }
    kennung <- .text(person$person_id, "person_id")
    if (kennung %in% namen) {
      .fehler("person_id", "Jede Person darf nur einmal zur Ausgleichungsgruppe geh\u00f6ren.")
    }
    zaehler <- .ganzzahl(person$erbquote_zaehler, "erbquote_zaehler", 1, .zahlengrenze)
    nenner <- .ganzzahl(person$erbquote_nenner, "erbquote_nenner", 1, .zahlengrenze)
    quote <- .bruch(zaehler, nenner)
    gesamtquote <- .addieren(gesamtquote, quote)
    namen <- c(namen, kennung)
    quoten[[length(quoten) + 1L]] <- quote
    zuwendungen[[length(zuwendungen) + 1L]] <- .geld(person$ausgleichungswert)
  }
  if (.vergleichen(gesamtquote, .bruch(1)) != 0) {
    .fehler("miterben", "Positive Quoten innerhalb der Ausgleichungsgruppe m\u00fcssen zusammen 1 ergeben.")
  }
  ergebnis <- .geld_ergebnis(if (ausgleichung_anwendbar) .bruch(0) else NULL,
    "BGB_ERB_ZUWENDUNGEN_AUSGLEICHEN",
    list(gruppennachlass = gruppennachlass, miterben = miterben,
      ausgleichung_anwendbar = ausgleichung_anwendbar, bewertungsnachweis = bewertungsnachweis),
    list(list(operation = "Vorgegebene Ausgleichungsgruppe pr\u00fcfen", anwendbar = ausgleichung_anwendbar)))
  if (!ausgleichung_anwendbar) return(ergebnis)
  aktiv <- seq_along(namen)
  ausgeschlossen <- integer()
  betraege <- lapply(namen, function(x) .bruch(0))
  repeat {
    masse <- nachlass
    quotensumme <- .bruch(0)
    for (i in aktiv) {
      masse <- .addieren(masse, zuwendungen[[i]])
      quotensumme <- .addieren(quotensumme, quoten[[i]])
    }
    anteile <- lapply(aktiv, function(i) .multiplizieren(masse, .dividieren(quoten[[i]], quotensumme)))
    ueberempfaenger <- aktiv[vapply(seq_along(aktiv), function(j)
      .vergleichen(zuwendungen[[aktiv[[j]]]], anteile[[j]]) > 0, logical(1))]
    ergebnis$rechenschritte <- c(ergebnis$rechenschritte, list(list(
      operation = "Zuwendungen hinzurechnen; \u00dcberempf\u00e4nger mit Zuwendung und Quote herausnehmen",
      rechenmasse = .bruchteile(masse), verbleibende_quotensumme = .bruchteile(quotensumme),
      ausgeschlossene_personen = unname(as.list(namen[ueberempfaenger])))))
    if (!length(ueberempfaenger)) {
      for (j in seq_along(aktiv)) {
        i <- aktiv[[j]]
        betraege[[i]] <- .subtrahieren(anteile[[j]], zuwendungen[[i]])
      }
      break
    }
    ausgeschlossen <- c(ausgeschlossen, ueberempfaenger)
    aktiv <- aktiv[!aktiv %in% ueberempfaenger]
  }
  ergebnis$wert <- list(verteilung = lapply(seq_along(namen), function(i)
    list(person_id = namen[[i]], betrag = .bruchteile(betraege[[i]]),
      ausser_ansatz = i %in% ausgeschlossen)),
    ausser_ansatz = unname(as.list(namen[seq_along(namen) %in% ausgeschlossen])))
  ergebnis
}
