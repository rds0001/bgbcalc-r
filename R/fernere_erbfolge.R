fernere_erbquoten <- function(ordnungsnummer = NULL, voreltern = NULL, abkoemmlinge = NULL,
    vorrangige_ordnung_vorhanden = NULL, verwandtenanteil_zaehler = NULL,
    verwandtenanteil_nenner = NULL) {
  .ganzzahl(ordnungsnummer, "ordnungsnummer", 4, 10000)
  listen <- list(voreltern = voreltern, abkoemmlinge = abkoemmlinge)
  for (parameter in names(listen)) {
    .vorhanden(listen[[parameter]], parameter)
    if (!is.list(listen[[parameter]]) || !is.null(names(listen[[parameter]])) ||
        length(listen[[parameter]]) > 10000) {
      .fehler(parameter, "Liste mit h\u00f6chstens 10000 Eintr\u00e4gen erforderlich.")
    }
  }
  .wahrheitswert(vorrangige_ordnung_vorhanden, "vorrangige_ordnung_vorhanden")
  .ganzzahl(verwandtenanteil_zaehler, "verwandtenanteil_zaehler", 0, .zahlengrenze)
  .ganzzahl(verwandtenanteil_nenner, "verwandtenanteil_nenner", 1, .zahlengrenze)
  if (verwandtenanteil_zaehler > verwandtenanteil_nenner) {
    .fehler("verwandtenanteil", "Verwandtenanteil darf 1 nicht \u00fcberschreiten.")
  }
  vorfahren <- character()
  for (person in voreltern) {
    .text(person, "person_id")
    if (!person %in% vorfahren) vorfahren <- c(vorfahren, person)
  }
  grade <- list()
  for (person in abkoemmlinge) {
    if (!is.list(person) || !identical(sort(names(person)), sort(c("person_id", "verwandtschaftsgrad")))) {
      .fehler("abkoemmlinge", "Objekte mit genau person_id und verwandtschaftsgrad erforderlich.")
    }
    kennung <- .text(person$person_id, "person_id")
    grad <- .ganzzahl(person$verwandtschaftsgrad, "verwandtschaftsgrad", 1, 10000)
    if (kennung %in% vorfahren) {
      .fehler("person_id", "Person kann hier nicht zugleich Vorelternteil und Abk\u00f6mmling sein.")
    }
    bisher <- grade[[kennung]]
    grade[[kennung]] <- if (is.null(bisher)) grad else min(grad, bisher)
  }
  auswahl <- if (length(vorfahren)) "voreltern" else "naechste_abkoemmlinge"
  grad <- if (length(vorfahren)) ordnungsnummer - 1 else if (length(grade)) min(unlist(grade)) else NULL
  berufene <- if (length(vorfahren)) vorfahren else names(grade)[vapply(grade, function(wert) wert == grad, logical(1))]
  anwendbar <- length(berufene) > 0 && !vorrangige_ordnung_vorhanden
  wert <- NULL
  if (anwendbar) {
    quote <- .multiplizieren(.bruch(verwandtenanteil_zaehler, verwandtenanteil_nenner),
      .bruch(1, length(berufene)))
    wert <- list(auswahl = auswahl, massgeblicher_grad = grad,
      erbquoten = lapply(berufene, function(person) list(person_id = person, quote = .bruchteile(quote))))
  }
  eingaben <- list(ordnungsnummer = ordnungsnummer, voreltern = voreltern, abkoemmlinge = abkoemmlinge,
    vorrangige_ordnung_vorhanden = vorrangige_ordnung_vorhanden,
    verwandtenanteil_zaehler = verwandtenanteil_zaehler, verwandtenanteil_nenner = verwandtenanteil_nenner)
  ergebnis <- .ergebnis(wert, "erbquote", "BGB_FERNERE_ERBQUOTEN", eingaben, list(
    list(operation = "Vorrang fr\u00fcherer Ordnung pr\u00fcfen", anwendbar = anwendbar),
    list(operation = "Voreltern, sonst n\u00e4chste Abk\u00f6mmlinge ausw\u00e4hlen; Personen einmal z\u00e4hlen",
      auswahl = auswahl, ausgewaehlte_personen = length(berufene)),
    list(operation = "Verwandtenanteil gleich unter ausgew\u00e4hlten Personen teilen")), eingaben)
  ergebnis$status <- if (anwendbar) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Ordnung, Berufung, Rollen und Verwandtschaftsgrade sind ausdr\u00fccklich rechtlich vorgegeben.")
  ergebnis$hinweise <- list("Ab vierter Ordnung keine Stammteilung oder Mehrfachanteile nach \u00a7 1927.",
    "Ehegattenvorrang nach \u00a7 1931 Abs. 2 gesondert beachten; keine Rundung.")
  ergebnis
}
