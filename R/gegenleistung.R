gegenleistung_behaltensbetrag <- function(vereinbarte_gegenleistung = NULL,
    ersparte_aufwendungen = NULL, anderweitiger_erwerb = NULL, boeswillig_unterlassener_erwerb = NULL,
    leistungsbefreiung_nach_275 = NULL, glaeubiger_allein_oder_weit_ueberwiegend_verantwortlich = NULL,
    schuldner_hat_umstand_zu_vertreten = NULL, annahmeverzug_bei_eintritt = NULL,
    bewertungsnachweis = NULL) {
  preis <- .geld(vereinbarte_gegenleistung)
  erspart <- .geld(ersparte_aufwendungen)
  erwerb <- .geld(anderweitiger_erwerb)
  unterlassen <- .geld(boeswillig_unterlassener_erwerb)
  eingaben <- list(vereinbarte_gegenleistung = vereinbarte_gegenleistung,
    ersparte_aufwendungen = ersparte_aufwendungen, anderweitiger_erwerb = anderweitiger_erwerb,
    boeswillig_unterlassener_erwerb = boeswillig_unterlassener_erwerb,
    leistungsbefreiung_nach_275 = leistungsbefreiung_nach_275,
    glaeubiger_allein_oder_weit_ueberwiegend_verantwortlich = glaeubiger_allein_oder_weit_ueberwiegend_verantwortlich,
    schuldner_hat_umstand_zu_vertreten = schuldner_hat_umstand_zu_vertreten,
    annahmeverzug_bei_eintritt = annahmeverzug_bei_eintritt, bewertungsnachweis = bewertungsnachweis)
  for (name in names(eingaben)[5:8]) .wahrheitswert(eingaben[[name]], name)
  .text(bewertungsnachweis, "bewertungsnachweis")
  behalten <- leistungsbefreiung_nach_275 && (glaeubiger_allein_oder_weit_ueberwiegend_verantwortlich ||
    (!schuldner_hat_umstand_zu_vertreten && annahmeverzug_bei_eintritt))
  wert <- NULL
  if (behalten) {
    wert <- .subtrahieren(.subtrahieren(.subtrahieren(preis, erspart), erwerb), unterlassen)
    if (wert$zaehler < 0) wert <- .bruch(0)
  }
  ergebnis <- .geld_ergebnis(wert, "BGB_GEGENLEISTUNG_BEHALTENSBETRAG", eingaben,
    list(list(operation = "Behaltensgrund aus Verantwortlichkeit oder Annahmeverzug pr\u00fcfen; Ersparnis, Erwerb und b\u00f6swillig unterlassenen Erwerb abziehen")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Nur\u00a7326 Absatz2. NICHT_ANWENDBAR bedeutet fehlenden Behaltensgrund in diesem Modell, nicht automatisch endg\u00fcltige Gegenleistung0. Teilbefreiung, blo\u00df ausgeschlossene Nacherf\u00fcllung, Ersatzverlangen nach Absatz3 und Sonderregeln gesondert."))
  ergebnis
}

gegenleistung_bei_ersatzverlangen <- function(vereinbarte_gegenleistung = NULL,
    wert_geschuldeter_leistung = NULL, wert_ersatz_oder_ersatzanspruch = NULL,
    ersatz_nach_285_verlangt = NULL, bewertungsnachweis = NULL) {
  preis <- .geld(vereinbarte_gegenleistung)
  leistungswert <- .geld(wert_geschuldeter_leistung)
  ersatz <- .geld(wert_ersatz_oder_ersatzanspruch)
  if (leistungswert$zaehler <= 0) .fehler("wert_geschuldeter_leistung", "Positiver Vergleichswert erforderlich.")
  .wahrheitswert(ersatz_nach_285_verlangt, "ersatz_nach_285_verlangt")
  .text(bewertungsnachweis, "bewertungsnachweis")
  eingaben <- list(vereinbarte_gegenleistung = vereinbarte_gegenleistung,
    wert_geschuldeter_leistung = wert_geschuldeter_leistung,
    wert_ersatz_oder_ersatzanspruch = wert_ersatz_oder_ersatzanspruch,
    ersatz_nach_285_verlangt = ersatz_nach_285_verlangt, bewertungsnachweis = bewertungsnachweis)
  wert <- NULL
  if (ersatz_nach_285_verlangt) {
    vergleich <- if (.vergleichen(ersatz, leistungswert) < 0) ersatz else leistungswert
    wert <- .multiplizieren(preis, .dividieren(vergleich, leistungswert))
  }
  ergebnis <- .geld_ergebnis(wert, "BGB_GEGENLEISTUNG_BEI_ERSATZVERLANGEN", eingaben,
    list(list(operation = "Bei Ersatzverlangen Gegenleistung im Verh\u00e4ltnis des niedrigeren Ersatzwerts zum Wert der geschuldeten Leistung herabsetzen")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Nur\u00a7326 Absatz3 in Verbindung mit\u00a7441 Absatz3. H\u00f6herer Ersatzwert erh\u00f6ht die Gegenleistung nicht. Ersatzanspruch und konsistente Vergleichswerte rechtlich bestimmen; kein automatischer Anspruch auf Versicherungserl\u00f6s oder sonstige Zahlungen."))
  ergebnis
}
