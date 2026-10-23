betriebskostenpauschale_aenderungsbetrag <- function(bisherige_betriebskosten = NULL,
    neue_betriebskosten = NULL, umlageanteil_zaehler = NULL, umlageanteil_nenner = NULL,
    erhoehungsumlage_vertraglich_vereinbart = NULL, erhoehungserklaerung_ordnungsgemaess = NULL,
    pauschalenanpassung_anwendbar = NULL, kostennachweis = NULL) {
  alt <- .geld(bisherige_betriebskosten)
  neu <- .geld(neue_betriebskosten)
  zaehler <- .ganzzahl(umlageanteil_zaehler, "umlageanteil_zaehler", 0, .zahlengrenze)
  nenner <- .ganzzahl(umlageanteil_nenner, "umlageanteil_nenner", 1, .zahlengrenze)
  if (zaehler > nenner) .fehler("umlageanteil_zaehler", "Umlageanteil darf eins nicht \u00fcbersteigen.")
  eingaben <- list(bisherige_betriebskosten = bisherige_betriebskosten, neue_betriebskosten = neue_betriebskosten,
    umlageanteil_zaehler = umlageanteil_zaehler, umlageanteil_nenner = umlageanteil_nenner,
    erhoehungsumlage_vertraglich_vereinbart = erhoehungsumlage_vertraglich_vereinbart,
    erhoehungserklaerung_ordnungsgemaess = erhoehungserklaerung_ordnungsgemaess,
    pauschalenanpassung_anwendbar = pauschalenanpassung_anwendbar, kostennachweis = kostennachweis)
  for (name in names(eingaben)[5:7]) .wahrheitswert(eingaben[[name]], name)
  .text(kostennachweis, "kostennachweis")
  differenz <- .subtrahieren(neu, alt)
  gilt <- pauschalenanpassung_anwendbar && (differenz$zaehler <= 0 ||
    (erhoehungsumlage_vertraglich_vereinbart && erhoehungserklaerung_ordnungsgemaess))
  ergebnis <- .geld_ergebnis(if (gilt) .multiplizieren(differenz, .bruch(zaehler, nenner)) else NULL,
    "BGB_BETRIEBSKOSTENPAUSCHALE_AENDERUNGSBETRAG", eingaben,
    list(list(operation = "Wirtschaftlich und rechtlich bereinigte Betriebskostendifferenz mit ma\u00dfgeblichem Umlageanteil multiplizieren",
      betriebskostendifferenz = .bruchteile(differenz))))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Vorzeichenbehafteter \u00c4nderungsbetrag f\u00fcr denselben Bezugszeitraum wie die Kosten: positiv Erh\u00f6hung, negativ Erm\u00e4\u00dfigung. Keine automatische Umrechnung von Jahres- auf Monatsbetr\u00e4ge. Nur Betriebskostenpauschale, keine Vorauszahlungsanpassung\u00a7560 Absatz4 oder Abrechnung. Wirtschaftlichkeit, Kostenabgrenzung, Umlageschl\u00fcssel und geltende Vereinbarungen vorab pr\u00fcfen. Erh\u00f6hungsbeginn/R\u00fcckwirkung\u00a7560 Absatz2 separat; Erm\u00e4\u00dfigung ab Kostenminderung\u00a7560 Absatz3 und unverz\u00fcgliche Mitteilung bleiben erforderlich."))
  ergebnis
}
