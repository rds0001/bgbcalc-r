.zeitanteil <- function(zaehler, nenner, nachweis) {
  .ganzzahl(zaehler, "zeitanteil_zaehler", 0, .zahlengrenze)
  .ganzzahl(nenner, "zeitanteil_nenner", 1, .zahlengrenze)
  .text(nachweis, "zeitanteil_nachweis")
  .bruch(zaehler, nenner)
}

.bruchteile <- function(wert) {
  list(zaehler = sprintf("%.0f", wert$zaehler), nenner = sprintf("%.0f", wert$nenner))
}

basiszinssatz_fortschreibung <- function(bisheriger_basiszinssatz_prozent = NULL,
    bisheriger_bezugszinssatz_prozent = NULL, neuer_bezugszinssatz_prozent = NULL,
    anpassungsdatum = NULL, quellenangabe = NULL) {
  basis <- .zahleneingabe(bisheriger_basiszinssatz_prozent)
  alt <- .zahleneingabe(bisheriger_bezugszinssatz_prozent)
  neu <- .zahleneingabe(neuer_bezugszinssatz_prozent)
  tag <- .datum(anpassungsdatum, "anpassungsdatum")
  .text(quellenangabe, "quellenangabe")
  if (format(tag, "%d") != "01" || !format(tag, "%m") %in% c("01", "07")) {
    .fehler("anpassungsdatum", "Anpassung nur zum 1. Januar oder 1. Juli.")
  }
  aenderung <- .subtrahieren(neu, alt)
  wert <- .addieren(basis, aenderung)
  ergebnis <- .geld_ergebnis(wert, "BGB_BASISZINS_FORTSCHREIBUNG",
    list(bisheriger_basiszinssatz_prozent = bisheriger_basiszinssatz_prozent,
         bisheriger_bezugszinssatz_prozent = bisheriger_bezugszinssatz_prozent,
         neuer_bezugszinssatz_prozent = neuer_bezugszinssatz_prozent,
         anpassungsdatum = anpassungsdatum, quellenangabe = quellenangabe),
    list(list(operation = "\u00c4nderung der Bezugsgr\u00f6\u00dfe", prozentpunkte = .bruchteile(aenderung)),
         list(operation = "\u00c4nderung zum bisherigen Basiszins addieren")),
    list(quellenangabe = quellenangabe))
  ergebnis$einheit <- "prozent_pro_jahr"
  ergebnis$hinweise <- list("Fortschreibung vorgegebener Werte; keine amtliche Feststellung oder aktuelle Zeitreihe.")
  ergebnis
}

gesetzliche_zinsen <- function(kapital = NULL, zeitanteil_zaehler = NULL,
    zeitanteil_nenner = NULL, zeitanteil_nachweis = NULL, glaeubigerverzug = NULL,
    abweichender_zinssatz_prozent = NULL) {
  hauptbetrag <- .geld(kapital)
  anteil <- .zeitanteil(zeitanteil_zaehler, zeitanteil_nenner, zeitanteil_nachweis)
  .wahrheitswert(glaeubigerverzug, "glaeubigerverzug")
  zinssatz <- if (is.null(abweichender_zinssatz_prozent)) .bruch(4) else
    .zahleneingabe(abweichender_zinssatz_prozent)
  wert <- if (glaeubigerverzug) NULL else
    .multiplizieren(.multiplizieren(hauptbetrag, .multiplizieren(zinssatz, .bruch(1, 100))), anteil)
  .geld_ergebnis(wert, "BGB_GESETZLICHE_ZINSEN",
    list(kapital = kapital, zeitanteil_zaehler = zeitanteil_zaehler, zeitanteil_nenner = zeitanteil_nenner,
         zeitanteil_nachweis = zeitanteil_nachweis, glaeubigerverzug = glaeubigerverzug,
         abweichender_zinssatz_prozent = abweichender_zinssatz_prozent),
    list(list(operation = "Jahreszinssatz bestimmen", zinssatz_prozent = .bruchteile(zinssatz)),
         list(operation = "Ohne Gl\u00e4ubigerverzug Kapital mal Zinssatz/100 mal Jahresanteil")),
    list(zeitanteil_nachweis = zeitanteil_nachweis,
         abweichender_zinssatz_prozent = abweichender_zinssatz_prozent))
}

verzugszinsen <- function(kapital = NULL, basiszinssatz_prozent = NULL,
    zeitanteil_zaehler = NULL, zeitanteil_nenner = NULL, zeitanteil_nachweis = NULL,
    entgeltforderung = NULL, verbraucher_beteiligt = NULL, zinsschuld = NULL,
    glaeubigerverzug = NULL, verzugsart = NULL, hoeherer_zinssatz_prozent = NULL,
    basiszinsnachweis = NULL) {
  eingaben <- list(kapital = kapital, basiszinssatz_prozent = basiszinssatz_prozent,
    zeitanteil_zaehler = zeitanteil_zaehler, zeitanteil_nenner = zeitanteil_nenner,
    zeitanteil_nachweis = zeitanteil_nachweis, entgeltforderung = entgeltforderung,
    verbraucher_beteiligt = verbraucher_beteiligt, zinsschuld = zinsschuld,
    glaeubigerverzug = glaeubigerverzug, verzugsart = verzugsart,
    hoeherer_zinssatz_prozent = hoeherer_zinssatz_prozent, basiszinsnachweis = basiszinsnachweis)
  hauptbetrag <- .geld(kapital)
  basis <- .zahleneingabe(basiszinssatz_prozent)
  anteil <- .zeitanteil(zeitanteil_zaehler, zeitanteil_nenner, zeitanteil_nachweis)
  .text(basiszinsnachweis, "basiszinsnachweis")
  for (parameter in c("entgeltforderung", "verbraucher_beteiligt", "zinsschuld", "glaeubigerverzug")) {
    .wahrheitswert(eingaben[[parameter]], parameter)
  }
  .auswahl(verzugsart, "verzugsart", c("allgemein", "verbraucherdarlehen", "immobiliar_verbraucherdarlehen"))
  aufschlag <- if (verzugsart == "immobiliar_verbraucherdarlehen") {
    .bruch(5, 2)
  } else if (verzugsart == "verbraucherdarlehen") {
    .bruch(5)
  } else .bruch(if (entgeltforderung && !verbraucher_beteiligt) 9 else 5)
  zinssatz <- .addieren(basis, aufschlag)
  if (!is.null(hoeherer_zinssatz_prozent)) {
    if (verzugsart != "allgemein") {
      .fehler("hoeherer_zinssatz_prozent", "Abweichender Schaden nach \u00a7 497 gesondert zu pr\u00fcfen.")
    }
    anderer_satz <- .zahleneingabe(hoeherer_zinssatz_prozent)
    if (.vergleichen(anderer_satz, zinssatz) > 0) zinssatz <- anderer_satz
  }
  wert <- if (zinsschuld || glaeubigerverzug) NULL else
    .multiplizieren(.multiplizieren(hauptbetrag, .multiplizieren(zinssatz, .bruch(1, 100))), anteil)
  .geld_ergebnis(wert, "BGB_VERZUGSZINSEN", eingaben,
    list(list(operation = "Gesetzlichen Aufschlag ausw\u00e4hlen", prozentpunkte = .bruchteile(aufschlag)),
         list(operation = "Basiszins und gegebenenfalls h\u00f6heren anderen Satz ber\u00fccksichtigen",
              zinssatz_prozent = .bruchteile(zinssatz)),
         list(operation = "Zinsschuld/Gl\u00e4ubigerverzug ausschlie\u00dfen; Kapital mal Zinssatz/100 mal Jahresanteil")),
    list(basiszinsnachweis = basiszinsnachweis, zeitanteil_nachweis = zeitanteil_nachweis))
}

verzug_nebenkosten <- function(rechtsverfolgungsschaden = NULL, entgeltforderung = NULL,
    schuldner_verbraucher = NULL, schuldnerverzug = NULL) {
  kosten <- .geld(rechtsverfolgungsschaden)
  .wahrheitswert(entgeltforderung, "entgeltforderung")
  .wahrheitswert(schuldner_verbraucher, "schuldner_verbraucher")
  .wahrheitswert(schuldnerverzug, "schuldnerverzug")
  anwendbar <- entgeltforderung && !schuldner_verbraucher && schuldnerverzug
  wert <- NULL
  schritte <- list(list(operation = "Pauschalenvoraussetzungen", anwendbar = anwendbar))
  if (anwendbar) {
    wert <- if (.vergleichen(kosten, .bruch(40)) > 0) kosten else .bruch(40)
    anrechnung <- if (.vergleichen(kosten, .bruch(40)) < 0) kosten else .bruch(40)
    schritte <- c(schritte, list(list(
      operation = "40 EUR Pauschale auf Rechtsverfolgungsschaden anrechnen",
      anrechnung = .bruchteile(anrechnung))))
  }
  .geld_ergebnis(wert, "BGB_VERZUG_NEBENKOSTEN",
    list(rechtsverfolgungsschaden = rechtsverfolgungsschaden, entgeltforderung = entgeltforderung,
         schuldner_verbraucher = schuldner_verbraucher, schuldnerverzug = schuldnerverzug),
    schritte)
}
