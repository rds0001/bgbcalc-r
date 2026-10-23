.gleichanteils_ergebnis <- function(gesamtleistung, anzahl, anzahl_parameter,
    leistungseinheit, anwendbar, regel_id, eingaben) {
  menge <- .zahleneingabe(gesamtleistung)
  if (menge$zaehler < 0) .fehler("gesamtleistung", "Nichtnegative Gesamtleistung erforderlich.")
  .ganzzahl(anzahl, anzahl_parameter, 2, 9007199254740991)
  .text(leistungseinheit, "leistungseinheit")
  wert <- NULL
  if (anwendbar) {
    quote <- .bruch(1, anzahl)
    wert <- list(anteilsquote = .bruchteile(quote),
      leistungsanteil = .bruchteile(.multiplizieren(menge, quote)))
  }
  ergebnis <- .ergebnis(wert, leistungseinheit, regel_id, eingaben, list(list(
    operation = "Gleiche Anteilsquote und Gesamtleistung geteilt durch Personenzahl",
    anwendbar = anwendbar, anzahl = anzahl, ergebnis = wert)), eingaben)
  ergebnis$status <- if (anwendbar) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list(
    "Feste lokale BGB-Fassung; Rechtsform, Gleichanteilsregel und gemeinsame Leistungseinheit ausdr\u00fccklich vorgegeben.")
  ergebnis$hinweise <- list(
    "Keine automatische Bewertung, Einheitenumrechnung oder Rundung.",
    "Rechnerischer Anteil ohne Abrechnung bereits erbrachter oder vereinnahmter Leistungen.")
  ergebnis
}

teilbare_leistung_gleichanteil <- function(gesamtleistung = NULL, anzahl_beteiligte = NULL,
    leistungseinheit = NULL, rollenart = NULL, leistung_teilbar = NULL,
    gleichanteilsvermutung_anwendbar = NULL) {
  .auswahl(rollenart, "rollenart", c("teilschuld", "teilforderung"))
  .wahrheitswert(leistung_teilbar, "leistung_teilbar")
  .wahrheitswert(gleichanteilsvermutung_anwendbar, "gleichanteilsvermutung_anwendbar")
  eingaben <- list(gesamtleistung = gesamtleistung, anzahl_beteiligte = anzahl_beteiligte,
    leistungseinheit = leistungseinheit, rollenart = rollenart, leistung_teilbar = leistung_teilbar,
    gleichanteilsvermutung_anwendbar = gleichanteilsvermutung_anwendbar)
  .gleichanteils_ergebnis(gesamtleistung, anzahl_beteiligte, "anzahl_beteiligte",
    leistungseinheit, leistung_teilbar && gleichanteilsvermutung_anwendbar,
    "BGB_TEILBARE_LEISTUNG_GLEICHANTEIL", eingaben)
}

gesamtglaeubiger_innenanteil <- function(gesamtleistung = NULL, anzahl_gesamtglaeubiger = NULL,
    leistungseinheit = NULL, gleichanteilige_innenberechtigung_anwendbar = NULL) {
  .wahrheitswert(gleichanteilige_innenberechtigung_anwendbar,
    "gleichanteilige_innenberechtigung_anwendbar")
  eingaben <- list(gesamtleistung = gesamtleistung, anzahl_gesamtglaeubiger = anzahl_gesamtglaeubiger,
    leistungseinheit = leistungseinheit,
    gleichanteilige_innenberechtigung_anwendbar = gleichanteilige_innenberechtigung_anwendbar)
  ergebnis <- .gleichanteils_ergebnis(gesamtleistung, anzahl_gesamtglaeubiger,
    "anzahl_gesamtglaeubiger", leistungseinheit, gleichanteilige_innenberechtigung_anwendbar,
    "BGB_GESAMTGLAEUBIGER_INNENANTEIL", eingaben)
  ergebnis$hinweise <- c(ergebnis$hinweise, list(
    "Nur Innenberechtigung der Gesamtgl\u00e4ubiger; Au\u00dfenberechtigung gegen\u00fcber dem Schuldner nicht reduziert."))
  ergebnis
}
