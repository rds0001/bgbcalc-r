.wahrheitswert <- function(wert, parameter) {
  .vorhanden(wert, parameter)
  if (!identical(wert, TRUE) && !identical(wert, FALSE)) {
    .fehler(parameter, "Expliziter Wahrheitswert erforderlich.")
  }
  wert
}

.geld <- function(wert) {
  betrag <- .zahleneingabe(wert)
  if (betrag$zaehler < 0) .fehler("betrag", "Nichtnegativer Geldbetrag erforderlich.")
  betrag
}

.geld_ergebnis <- function(wert, regel_id, eingaben, schritte, nutzervorgaben = list()) {
  ausgabe <- if (is.null(wert)) NULL else
    list(zaehler = sprintf("%.0f", wert$zaehler), nenner = sprintf("%.0f", wert$nenner))
  vorgaben <- utils::modifyList(eingaben, nutzervorgaben, keep.null = TRUE)
  ergebnis <- .ergebnis(ausgabe, "EUR", regel_id, eingaben, schritte, vorgaben)
  ergebnis$status <- if (is.null(wert)) "NICHT_ANWENDBAR" else "BERECHNET"
  ergebnis$annahmen <- list("Berechnung anhand der festen BGB-Fassung und der ausdr\u00fccklich eingegebenen Tatsachen und rechtlichen Bewertungen.")
  ergebnis$hinweise <- list("Bewertungen stammen vom Nutzer; exaktes Bruchergebnis ohne automatische Cent-Rundung.")
  ergebnis
}

wertpapier_sicherheitswert <- function(kurswert = NULL, papierart = NULL,
    gattung_zulaessig = NULL, scheine_hinterlegt = NULL, gattungsnachweis = NULL) {
  betrag <- .geld(kurswert)
  .auswahl(papierart, "papierart", c("inhaberpapier", "blanko_orderpapier", "sonstiges"))
  .wahrheitswert(gattung_zulaessig, "gattung_zulaessig")
  .wahrheitswert(scheine_hinterlegt, "scheine_hinterlegt")
  .text(gattungsnachweis, "gattungsnachweis")
  geeignet <- papierart != "sonstiges" && gattung_zulaessig && scheine_hinterlegt
  wert <- if (geeignet) .multiplizieren(betrag, .bruch(3, 4)) else NULL
  .geld_ergebnis(wert, "BGB_SICHERHEIT_WERTPAPIER",
    list(kurswert = kurswert, papierart = papierart, gattung_zulaessig = gattung_zulaessig,
         scheine_hinterlegt = scheine_hinterlegt, gattungsnachweis = gattungsnachweis),
    list(list(operation = "Geeignetheit pr\u00fcfen; bei Geeignetheit Kurswert mal 3/4", geeignet = geeignet)),
    list(gattungsnachweis = gattungsnachweis))
}

buchforderung_sicherheitswert <- function(kurswert = NULL, schuldnerart = NULL) {
  betrag <- .geld(kurswert)
  .auswahl(schuldnerart, "schuldnerart", c("bund", "land", "sonstiges"))
  wert <- if (schuldnerart == "sonstiges") NULL else .multiplizieren(betrag, .bruch(3, 4))
  .geld_ergebnis(wert, "BGB_SICHERHEIT_BUCHFORDERUNG",
    list(kurswert = kurswert, schuldnerart = schuldnerart),
    list(list(operation = "Bund/Land pr\u00fcfen; Kurswert mal 3/4")))
}

sach_sicherheitswert <- function(schaetzungswert = NULL, verderb_zu_besorgen = NULL,
    aufbewahrung_schwierig = NULL, zurueckweisung_erklaert = NULL) {
  betrag <- .geld(schaetzungswert)
  .wahrheitswert(verderb_zu_besorgen, "verderb_zu_besorgen")
  .wahrheitswert(aufbewahrung_schwierig, "aufbewahrung_schwierig")
  .wahrheitswert(zurueckweisung_erklaert, "zurueckweisung_erklaert")
  if (zurueckweisung_erklaert && !(verderb_zu_besorgen || aufbewahrung_schwierig)) {
    .fehler("zurueckweisung_erklaert", "Gesetzlicher Zur\u00fcckweisungsgrund fehlt.")
  }
  wert <- if (zurueckweisung_erklaert) NULL else .multiplizieren(betrag, .bruch(2, 3))
  .geld_ergebnis(wert, "BGB_SICHERHEIT_SACHE",
    list(schaetzungswert = schaetzungswert, verderb_zu_besorgen = verderb_zu_besorgen,
         aufbewahrung_schwierig = aufbewahrung_schwierig, zurueckweisung_erklaert = zurueckweisung_erklaert),
    list(list(operation = "Erkl\u00e4rte Zur\u00fcckweisung pr\u00fcfen; sonst Sch\u00e4tzungswert mal 2/3")))
}

sicherheit_ergaenzungsbetrag <- function(erforderliche_sicherheit = NULL,
    vorhandener_sicherheitswert = NULL, verschulden_berechtigter = NULL) {
  erforderlich <- .geld(erforderliche_sicherheit)
  vorhanden <- .geld(vorhandener_sicherheitswert)
  .wahrheitswert(verschulden_berechtigter, "verschulden_berechtigter")
  wert <- NULL
  if (!verschulden_berechtigter) {
    wert <- .subtrahieren(erforderlich, vorhanden)
    if (wert$zaehler < 0) wert <- .bruch(0)
  }
  .geld_ergebnis(wert, "BGB_SICHERHEIT_ERGAENZUNG",
    list(erforderliche_sicherheit = erforderliche_sicherheit,
         vorhandener_sicherheitswert = vorhandener_sicherheitswert,
         verschulden_berechtigter = verschulden_berechtigter),
    list(list(operation = "Ohne Berechtigtenverschulden positive Deckungsl\u00fccke")))
}

sachschaden_ersatzbetrag <- function(erforderlicher_nettobetrag = NULL,
    ersatzfaehige_angefallene_umsatzsteuer = NULL, mitverschuldensquote = NULL) {
  netto <- .geld(erforderlicher_nettobetrag)
  steuer <- .geld(ersatzfaehige_angefallene_umsatzsteuer)
  quote <- .zahleneingabe(mitverschuldensquote)
  if (.vergleichen(quote, .bruch(0)) < 0 || .vergleichen(quote, .bruch(1)) > 0) {
    .fehler("mitverschuldensquote", "Quote muss zwischen null und eins liegen.")
  }
  gesamt <- .addieren(netto, steuer)
  restquote <- .subtrahieren(.bruch(1), quote)
  wert <- .multiplizieren(gesamt, restquote)
  .geld_ergebnis(wert, "BGB_SACHSCHADEN_BETRAG",
    list(erforderlicher_nettobetrag = erforderlicher_nettobetrag,
         ersatzfaehige_angefallene_umsatzsteuer = ersatzfaehige_angefallene_umsatzsteuer,
         mitverschuldensquote = mitverschuldensquote),
    list(list(operation = "Erforderlicher Nettoaufwand plus ersatzf\u00e4hige angefallene Steuer"),
         list(operation = "Mit dem verbleibenden Haftungsanteil multiplizieren")),
    list(mitverschuldensquote = mitverschuldensquote,
         bewertung = "Vorgegeben; keine automatische rechtliche Abw\u00e4gung."))
}
