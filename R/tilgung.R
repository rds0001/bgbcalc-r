.anrechnen <- function(zahlung, forderungen, reihenfolge) {
  restzahlung <- zahlung
  zuordnungen <- list()
  for (position in reihenfolge) {
    forderung <- forderungen[[position]]
    betrag <- if (.vergleichen(restzahlung, forderung) < 0) restzahlung else forderung
    restzahlung <- .subtrahieren(restzahlung, betrag)
    zuordnungen <- c(zuordnungen, list(list(position = position, betrag = .bruchteile(betrag),
      restforderung = .bruchteile(.subtrahieren(forderung, betrag)))))
  }
  list(zuordnungen = zuordnungen, nicht_zugeordnet = .bruchteile(restzahlung))
}

.tilgungsergebnis <- function(zahlung, forderungen, reihenfolge, anwendbar, regel_id, eingaben) {
  ergebnis <- .geld_ergebnis(if (anwendbar) .bruch(0) else NULL, regel_id, eingaben,
    list(list(operation = "Tilgungsregel anwendbar", anwendbar = anwendbar),
      list(operation = "Zahlung in Reihenfolge bis zur Forderungsh\u00f6he zuordnen",
        reihenfolge = as.list(reihenfolge))))
  ergebnis["wert"] <- list(if (anwendbar) .anrechnen(zahlung, forderungen, reihenfolge) else NULL)
  ergebnis$hinweise <- list(
    "Schuld und ersatzf\u00e4hige Bestandteile sind vorab bestimmt; keine automatische Bewertung.",
    "Nicht zugeordnete Zahlung ist rechnerischer \u00dcberschuss, keine Entscheidung \u00fcber Erstattungsanspr\u00fcche.",
    "Alle Teilbetr\u00e4ge exakt ohne automatische Cent-Rundung.")
  ergebnis
}

zahlung_anrechnen <- function(zahlung = NULL, kosten = NULL, zinsen = NULL,
    hauptforderung = NULL, abweichende_reihenfolge = NULL, annahme_abgelehnt = NULL) {
  eingaben <- list(zahlung = zahlung, kosten = kosten, zinsen = zinsen, hauptforderung = hauptforderung,
    abweichende_reihenfolge = abweichende_reihenfolge, annahme_abgelehnt = annahme_abgelehnt)
  betrag <- .geld(zahlung)
  reihenfolge <- c("kosten", "zinsen", "hauptforderung")
  forderungen <- lapply(eingaben[reihenfolge], .geld)
  .wahrheitswert(annahme_abgelehnt, "annahme_abgelehnt")
  abweichend <- FALSE
  if (!is.null(abweichende_reihenfolge)) {
    gueltig <- (is.list(abweichende_reihenfolge) || is.character(abweichende_reihenfolge)) &&
      is.null(names(abweichende_reihenfolge)) &&
      length(abweichende_reihenfolge) == 3 &&
      all(vapply(abweichende_reihenfolge, function(x) is.character(x) && length(x) == 1 &&
        !is.na(x), logical(1)))
    if (!gueltig || !identical(sort(unname(unlist(abweichende_reihenfolge))), sort(reihenfolge))) {
      .fehler("abweichende_reihenfolge", "Jede der drei Positionen genau einmal als Liste erforderlich.")
    }
    neu <- unname(unlist(abweichende_reihenfolge))
    abweichend <- !identical(neu, reihenfolge)
    reihenfolge <- neu
    eingaben$abweichende_reihenfolge <- as.list(neu)
  }
  if (annahme_abgelehnt && !abweichend) {
    .fehler("annahme_abgelehnt", "Ablehnung nach \u00a7 367 Abs. 2 setzt abweichende Bestimmung voraus.")
  }
  .tilgungsergebnis(betrag, forderungen, reihenfolge, !annahme_abgelehnt,
    "BGB_ZAHLUNG_ANRECHNUNG", eingaben)
}

verbraucherdarlehen_zahlung_anrechnen <- function(zahlung = NULL,
    rechtsverfolgungskosten = NULL, uebriger_geschuldeter_betrag = NULL,
    verzugszinsen = NULL, immobiliar_verbraucherdarlehen = NULL,
    titel_hauptforderung_zinsen = NULL, schuldnerverzug = NULL) {
  eingaben <- list(zahlung = zahlung, rechtsverfolgungskosten = rechtsverfolgungskosten,
    uebriger_geschuldeter_betrag = uebriger_geschuldeter_betrag, verzugszinsen = verzugszinsen,
    immobiliar_verbraucherdarlehen = immobiliar_verbraucherdarlehen,
    titel_hauptforderung_zinsen = titel_hauptforderung_zinsen, schuldnerverzug = schuldnerverzug)
  betrag <- .geld(zahlung)
  reihenfolge <- c("rechtsverfolgungskosten", "uebriger_geschuldeter_betrag", "verzugszinsen")
  forderungen <- lapply(eingaben[reihenfolge], .geld)
  for (parameter in c("immobiliar_verbraucherdarlehen", "titel_hauptforderung_zinsen", "schuldnerverzug")) {
    .wahrheitswert(eingaben[[parameter]], parameter)
  }
  anwendbar <- schuldnerverzug && !immobiliar_verbraucherdarlehen && !titel_hauptforderung_zinsen
  .tilgungsergebnis(betrag, forderungen, reihenfolge, anwendbar,
    "BGB_DARLEHEN_ZAHLUNG_ANRECHNUNG", eingaben)
}
