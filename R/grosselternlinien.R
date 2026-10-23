grosselternlinien_erbquoten <- function(grosselternpaare = NULL, vorrangige_ordnung_vorhanden = NULL,
    verwandtenanteil_zaehler = NULL, verwandtenanteil_nenner = NULL) {
  .vorhanden(grosselternpaare, "grosselternpaare")
  linien <- c("vaeterlich", "muetterlich")
  if (!is.list(grosselternpaare) || !identical(sort(names(grosselternpaare)), sort(linien))) {
    .fehler("grosselternpaare", "Genau vaeterliches und muetterliches Gro\u00dfelternpaar erforderlich.")
  }
  if (any(vapply(grosselternpaare, function(paar)
      !is.list(paar) || !is.null(names(paar)) || length(paar) != 2, logical(1)))) {
    .fehler("grosselternpaare", "Je Gro\u00dfelternpaar genau zwei Knoten erforderlich.")
  }
  .wahrheitswert(vorrangige_ordnung_vorhanden, "vorrangige_ordnung_vorhanden")
  .ganzzahl(verwandtenanteil_zaehler, "verwandtenanteil_zaehler", 0, .zahlengrenze)
  .ganzzahl(verwandtenanteil_nenner, "verwandtenanteil_nenner", 1, .zahlengrenze)
  if (verwandtenanteil_zaehler > verwandtenanteil_nenner) {
    .fehler("verwandtenanteil", "Verwandtenanteil darf 1 nicht \u00fcberschreiten.")
  }
  geprueft <- .stammgruppen_pruefen(grosselternpaare[linien])
  gruppen <- geprueft$gruppen
  besetzt <- sum(vapply(gruppen, length, integer(1)) > 0)
  anwendbar <- besetzt > 0 && !vorrangige_ordnung_vorhanden
  verwandtenanteil <- .bruch(verwandtenanteil_zaehler, verwandtenanteil_nenner)
  teile <- list()
  summen <- list()
  grosselternquote <- .bruch(0)
  verteilen <- function(geschwister, anteil, pfad, linie) {
    stammanteil <- .multiplizieren(anteil, .bruch(1, length(geschwister)))
    for (knoten in geschwister) {
      person <- knoten$person_id
      stammpfad <- c(pfad, list(person))
      if (knoten$tritt_ein) {
        teile <<- c(teile, list(list(person_id = person, grosselternlinie = linie,
          stammpfad = stammpfad, quote = .bruchteile(stammanteil))))
        bisher <- summen[[person]]
        if (is.null(bisher)) bisher <- .bruch(0)
        summen[[person]] <<- .addieren(bisher, stammanteil)
        if (length(pfad) == 0) grosselternquote <<- .addieren(grosselternquote, stammanteil)
      } else verteilen(knoten$abkoemmlinge, stammanteil, stammpfad, linie)
    }
  }
  wert <- NULL
  if (anwendbar) {
    paaranteil <- .multiplizieren(verwandtenanteil, .bruch(1, besetzt))
    for (nummer in seq_along(linien)) {
      if (length(gruppen[[nummer]]) > 0) verteilen(gruppen[[nummer]], paaranteil, list(), linien[[nummer]])
    }
    wert <- list(erbteile = teile,
      erbquoten = lapply(names(summen), function(person) list(person_id = person, quote = .bruchteile(summen[[person]]))),
      grosselternquote = .bruchteile(grosselternquote),
      abkoemmlingsquote = .bruchteile(.subtrahieren(verwandtenanteil, grosselternquote)))
  }
  eingaben <- list(grosselternpaare = grosselternpaare,
    vorrangige_ordnung_vorhanden = vorrangige_ordnung_vorhanden,
    verwandtenanteil_zaehler = verwandtenanteil_zaehler, verwandtenanteil_nenner = verwandtenanteil_nenner)
  ergebnis <- .ergebnis(wert, "erbquote", "BGB_GROSSELTERNLINIEN_ERBQUOTEN", eingaben, list(
    list(operation = "Dritte Ordnung und gemeinsame Stammdaten pr\u00fcfen", anwendbar = anwendbar,
      knoten = geprueft$anzahl),
    list(operation = "Besetzte Gro\u00dfelternpaare, dann besetzte St\u00e4mme teilen", besetzte_paare = besetzt),
    list(operation = "Besondere Erbteile und Anteile von Gro\u00dfeltern und Abk\u00f6mmlingen getrennt nachweisen")),
    eingaben)
  ergebnis$status <- if (anwendbar) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Abstammung, Erbenstellungen und Verwandtenanteil sind ausdr\u00fccklich rechtlich vorgegeben.")
  ergebnis$hinweise <- list("Ehegattenregel des \u00a7 1931 ist in dieser Stammverteilung nicht angewandt.",
    "Keine automatische Feststellung von Adoption oder Erbausschl\u00fcssen; keine Rundung.")
  ergebnis
}
