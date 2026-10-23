.staemme_pruefen <- function(kinderstaemme) {
  .vorhanden(kinderstaemme, "kinderstaemme")
  geprueft <- .stammgruppen_pruefen(list(kinderstaemme))
  list(staemme = geprueft$gruppen[[1]], anzahl = geprueft$anzahl)
}

.stammgruppen_pruefen <- function(gruppen) {
  stellungen <- new.env(parent = emptyenv())
  anzahl <- 0
  pruefen <- function(geschwister, vorfahren, tiefe) {
    if (!is.list(geschwister) || !is.null(names(geschwister)) || tiefe > 64) {
      .fehler("kinderstaemme", "Listenstruktur mit h\u00f6chstens 64 Ebenen erforderlich.")
    }
    ergebnis <- list()
    personen <- character()
    for (knoten in geschwister) {
      anzahl <<- anzahl + 1
      if (anzahl > 10000) .fehler("kinderstaemme", "H\u00f6chstens 10000 Knoten erlaubt.")
      if (!is.list(knoten) || !identical(sort(names(knoten)), sort(c("person_id", "tritt_ein", "abkoemmlinge")))) {
        .fehler("kinderstaemme", "Knoten ben\u00f6tigt genau person_id, tritt_ein und abkoemmlinge.")
      }
      person <- .text(knoten$person_id, "person_id")
      tritt_ein <- .wahrheitswert(knoten$tritt_ein, "tritt_ein")
      if (person %in% personen || person %in% vorfahren) {
        .fehler("person_id", "Doppelte Geschwister oder Selbstabstammung unzul\u00e4ssig.")
      }
      personen <- c(personen, person)
      if (exists(person, envir = stellungen, inherits = FALSE) &&
          !identical(get(person, envir = stellungen, inherits = FALSE), tritt_ein)) {
        .fehler("tritt_ein", "Erbenstellung derselben Person muss in allen St\u00e4mmen \u00fcbereinstimmen.")
      }
      assign(person, tritt_ein, envir = stellungen)
      if (!is.list(knoten$abkoemmlinge) || !is.null(names(knoten$abkoemmlinge))) {
        .fehler("abkoemmlinge", "Unbenannte Liste erforderlich.")
      }
      nachkommen <- if (length(knoten$abkoemmlinge)) {
        pruefen(knoten$abkoemmlinge, c(vorfahren, person), tiefe + 1)
      } else list()
      if (tritt_ein || length(nachkommen) > 0) {
        ergebnis <- c(ergebnis, list(list(person_id = person, tritt_ein = tritt_ein, abkoemmlinge = nachkommen)))
      }
    }
    ergebnis
  }
  geprueft <- lapply(gruppen, function(gruppe) pruefen(gruppe, character(), 1))
  list(gruppen = geprueft, anzahl = anzahl)
}

abkoemmlings_erbquoten <- function(kinderstaemme = NULL,
    verwandtenanteil_zaehler = NULL, verwandtenanteil_nenner = NULL) {
  .ganzzahl(verwandtenanteil_zaehler, "verwandtenanteil_zaehler", 0, .zahlengrenze)
  .ganzzahl(verwandtenanteil_nenner, "verwandtenanteil_nenner", 1, .zahlengrenze)
  if (verwandtenanteil_zaehler > verwandtenanteil_nenner) {
    .fehler("verwandtenanteil", "Verwandtenanteil darf 1 nicht \u00fcberschreiten.")
  }
  geprueft <- .staemme_pruefen(kinderstaemme)
  staemme <- geprueft$staemme
  teile <- list()
  summen <- list()
  verteilen <- function(geschwister, anteil, pfad) {
    stammanteil <- .multiplizieren(anteil, .bruch(1, length(geschwister)))
    for (knoten in geschwister) {
      person <- knoten$person_id
      stammpfad <- c(pfad, list(person))
      if (knoten$tritt_ein) {
        teile <<- c(teile, list(list(person_id = person, stammpfad = stammpfad, quote = .bruchteile(stammanteil))))
        bisher <- summen[[person]]
        if (is.null(bisher)) bisher <- .bruch(0)
        summen[[person]] <<- .addieren(bisher, stammanteil)
      } else {
        verteilen(knoten$abkoemmlinge, stammanteil, stammpfad)
      }
    }
  }
  anwendbar <- length(staemme) > 0
  if (anwendbar) verteilen(staemme, .bruch(verwandtenanteil_zaehler, verwandtenanteil_nenner), list())
  wert <- if (anwendbar) list(erbteile = teile,
    erbquoten = lapply(names(summen), function(person) list(person_id = person, quote = .bruchteile(summen[[person]])))) else NULL
  eingaben <- list(kinderstaemme = kinderstaemme, verwandtenanteil_zaehler = verwandtenanteil_zaehler,
    verwandtenanteil_nenner = verwandtenanteil_nenner)
  ergebnis <- .ergebnis(wert, "erbquote", "BGB_ABKOEMMLINGS_ERBQUOTEN", eingaben, list(
    list(operation = "Stammdaten und konsistente Erbenstellungen pr\u00fcfen", knoten = geprueft$anzahl),
    list(operation = "Leere St\u00e4mme entfernen; besetzte St\u00e4mme rekursiv gleich teilen",
      besetzte_kinderstaemme = length(staemme)),
    list(operation = "Besondere Erbteile erhalten und je Person summieren")), eingaben)
  ergebnis$status <- if (anwendbar) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Abstammung, Erbenstellungen und Verwandtenanteil sind ausdr\u00fccklich rechtlich vorgegeben.")
  ergebnis$hinweise <- list("Keine automatische Ehegattenquote, Ausgleichung oder Pr\u00fcfung anderer Erbordnungen.",
    "Mehrfachzugeh\u00f6rigkeit bleibt als besondere Erbteile sichtbar; keine Rundung.")
  ergebnis
}
