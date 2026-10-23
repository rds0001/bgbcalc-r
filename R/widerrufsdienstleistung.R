widerruf_dienstleistungswertersatz <- function(gesamtpreis = NULL,
    leistungsanteil_zaehler = NULL, leistungsanteil_nenner = NULL,
    gesamtpreis_unverhaeltnismaessig_hoch = NULL, marktwert_erbrachte_leistung = NULL,
    vorzeitiger_leistungsbeginn_verlangt = NULL, ausserhalb_geschaeftsraeumen = NULL,
    verlangen_auf_dauerhaftem_datentraeger = NULL, ordnungsgemaess_informiert = NULL,
    anwendungsfall_357a_absatz_2 = NULL, bewertungsnachweis = NULL) {
  preis <- .geld(gesamtpreis)
  zaehler <- .ganzzahl(leistungsanteil_zaehler, "leistungsanteil_zaehler", 0, .zahlengrenze)
  nenner <- .ganzzahl(leistungsanteil_nenner, "leistungsanteil_nenner", 1, .zahlengrenze)
  if (zaehler > nenner) .fehler("leistungsanteil_zaehler", "Leistungsanteil darf eins nicht \u00fcbersteigen.")
  eingaben <- list(gesamtpreis = gesamtpreis, leistungsanteil_zaehler = leistungsanteil_zaehler,
    leistungsanteil_nenner = leistungsanteil_nenner,
    gesamtpreis_unverhaeltnismaessig_hoch = gesamtpreis_unverhaeltnismaessig_hoch,
    marktwert_erbrachte_leistung = marktwert_erbrachte_leistung,
    vorzeitiger_leistungsbeginn_verlangt = vorzeitiger_leistungsbeginn_verlangt,
    ausserhalb_geschaeftsraeumen = ausserhalb_geschaeftsraeumen,
    verlangen_auf_dauerhaftem_datentraeger = verlangen_auf_dauerhaftem_datentraeger,
    ordnungsgemaess_informiert = ordnungsgemaess_informiert,
    anwendungsfall_357a_absatz_2 = anwendungsfall_357a_absatz_2, bewertungsnachweis = bewertungsnachweis)
  for (name in names(eingaben)[c(4, 6:10)]) .wahrheitswert(eingaben[[name]], name)
  marktwert <- NULL
  if (!is.null(marktwert_erbrachte_leistung) || gesamtpreis_unverhaeltnismaessig_hoch) {
    marktwert <- .geld(marktwert_erbrachte_leistung)
  }
  .text(bewertungsnachweis, "bewertungsnachweis")
  voraussetzungen <- vorzeitiger_leistungsbeginn_verlangt && ordnungsgemaess_informiert &&
    (!ausserhalb_geschaeftsraeumen || verlangen_auf_dauerhaftem_datentraeger)
  wert <- NULL
  if (anwendungsfall_357a_absatz_2) {
    wert <- .bruch(0)
    if (voraussetzungen) {
      wert <- if (gesamtpreis_unverhaeltnismaessig_hoch) marktwert else .multiplizieren(preis, .bruch(zaehler, nenner))
    }
  }
  ergebnis <- .geld_ergebnis(wert, "BGB_WIDERRUF_DIENSTLEISTUNGSWERTERSATZ", eingaben,
    list(list(operation = "Verlangen, Datentr\u00e4geranforderung und Unterrichtung pr\u00fcfen; Vertragspreisanteil oder Marktwert der erbrachten Leistung")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Nur\u00a7357a Absatz2 bei wirksamem Widerruf und zutreffender Leistungsart. Leistungsanteil rechtlich und wirtschaftlich bestimmt, nicht ungepr\u00fcft Zeitanteil. Marktwert bezeichnet bereits die erbrachte Leistung und wird nicht nochmals anteilig gek\u00fcrzt. Finanzdienstleistungen/Finanzierungshilfen\u00a7357b gesondert. Keine automatische Feststellung der Unverh\u00e4ltnism\u00e4\u00dfigkeit oder der Informationspflichten."))
  ergebnis
}
