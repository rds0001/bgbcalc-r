gesamtschuld_gleichanteile_mit_ausfall <- function(gesamtbetrag = NULL,
    anzahl_gesamtschuldner = NULL, anzahl_vollstaendig_ausfallender_beitraege = NULL,
    gleichanteiliger_ausgleich_anwendbar = NULL) {
  betrag <- .geld(gesamtbetrag)
  anzahl <- .ganzzahl(anzahl_gesamtschuldner, "anzahl_gesamtschuldner", 2, 9007199254740991)
  ausfaelle <- .ganzzahl(anzahl_vollstaendig_ausfallender_beitraege,
    "anzahl_vollstaendig_ausfallender_beitraege", 0, anzahl - 1)
  .wahrheitswert(gleichanteiliger_ausgleich_anwendbar, "gleichanteiliger_ausgleich_anwendbar")
  eingaben <- list(gesamtbetrag = gesamtbetrag, anzahl_gesamtschuldner = anzahl_gesamtschuldner,
    anzahl_vollstaendig_ausfallender_beitraege = anzahl_vollstaendig_ausfallender_beitraege,
    gleichanteiliger_ausgleich_anwendbar = gleichanteiliger_ausgleich_anwendbar)
  wert <- NULL
  if (gleichanteiliger_ausgleich_anwendbar) {
    quote <- .bruch(1, anzahl)
    grundbeitrag <- .multiplizieren(betrag, quote)
    ausfallbetrag <- .multiplizieren(grundbeitrag, .bruch(ausfaelle))
    zusatz <- .dividieren(ausfallbetrag, .bruch(anzahl - ausfaelle))
    wert <- list(urspruenglicher_innenanteil = .bruchteile(quote),
      urspruenglicher_beitrag = .bruchteile(grundbeitrag),
      gesamter_ausfallbetrag = .bruchteile(ausfallbetrag),
      zusaetzlicher_beitrag_je_uebrigem = .bruchteile(zusatz),
      gesamtbelastung_je_uebrigem = .bruchteile(.addieren(grundbeitrag, zusatz)),
      anzahl_uebrige = anzahl - ausfaelle)
  }
  ergebnis <- .geld_ergebnis(if (gleichanteiliger_ausgleich_anwendbar) .bruch(0) else NULL,
    "BGB_GESAMTSCHULD_GLEICHANTEILE_MIT_AUSFALL", eingaben, list(list(
      operation = "Gleichen Grundbeitrag berechnen und vollst\u00e4ndige Ausf\u00e4lle auf die \u00dcbrigen verteilen",
      ergebnis = wert)))
  ergebnis["wert"] <- list(wert)
  ergebnis$hinweise <- list(
    "Nur gleiche interne Grundanteile und vollst\u00e4ndig nicht erlangbare Beitr\u00e4ge; teilweise Ausf\u00e4lle und abweichende Innenquoten sind gesondert.",
    "Die urspr\u00fcngliche Verpflichtung eines ausfallenden Schuldners wird durch diese Rechnung nicht aufgehoben.",
    "Zus\u00e4tzliche Ausfalltragung der \u00fcbrigen Schuldner, keine Begrenzung ihrer Au\u00dfenhaftung gegen\u00fcber dem Gl\u00e4ubiger.",
    "Bereits geleistete Beitr\u00e4ge, F\u00e4lligkeit des Ausgleichs und Forderungs\u00fcbergang nach \u00a7 426 Absatz 2 sind nicht abgerechnet.",
    "Alle Geldbetr\u00e4ge in EUR und exakt ohne automatische Cent-Rundung; Innenanteil dimensionslos.")
  ergebnis
}
