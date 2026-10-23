waermepumpe_kostenansatz <- function(kosten_wohnung = NULL, errichtungsjahr = NULL,
    jahresarbeitszahl = NULL, fachunternehmernachweis_ordnungsgemaess = NULL,
    waermeschutz_ausnahme_erfuellt = NULL, sanierungsstandard_erfuellt = NULL,
    vorlauftemperatur = NULL, beheizbarkeit_bei_normaussentemperatur = NULL,
    bewertungsnachweis = NULL, waermepumpenregel_anwendbar = NULL) {
  eingaben <- list(kosten_wohnung = kosten_wohnung, errichtungsjahr = errichtungsjahr,
    jahresarbeitszahl = jahresarbeitszahl,
    fachunternehmernachweis_ordnungsgemaess = fachunternehmernachweis_ordnungsgemaess,
    waermeschutz_ausnahme_erfuellt = waermeschutz_ausnahme_erfuellt,
    sanierungsstandard_erfuellt = sanierungsstandard_erfuellt,
    vorlauftemperatur = vorlauftemperatur,
    beheizbarkeit_bei_normaussentemperatur = beheizbarkeit_bei_normaussentemperatur,
    bewertungsnachweis = bewertungsnachweis,
    waermepumpenregel_anwendbar = waermepumpenregel_anwendbar)
  kosten <- .geld(kosten_wohnung)
  jahr <- .ganzzahl(errichtungsjahr, "errichtungsjahr", 1, 9999)
  .text(bewertungsnachweis, "bewertungsnachweis")
  for (name in c("fachunternehmernachweis_ordnungsgemaess", "waermeschutz_ausnahme_erfuellt",
      "sanierungsstandard_erfuellt", "beheizbarkeit_bei_normaussentemperatur",
      "waermepumpenregel_anwendbar")) .wahrheitswert(eingaben[[name]], name)
  arbeitszahl <- NULL
  if (!is.null(jahresarbeitszahl) || fachunternehmernachweis_ordnungsgemaess)
    arbeitszahl <- .geld(jahresarbeitszahl)
  temperatur <- NULL
  if (!is.null(vorlauftemperatur) || beheizbarkeit_bei_normaussentemperatur)
    temperatur <- .zahleneingabe(vorlauftemperatur)
  nachweis <- fachunternehmernachweis_ordnungsgemaess && .vergleichen(arbeitszahl, .bruch(5, 2)) >= 0
  ausnahme <- jahr > 1996 || waermeschutz_ausnahme_erfuellt || sanierungsstandard_erfuellt ||
    (beheizbarkeit_bei_normaussentemperatur && .vergleichen(temperatur, .bruch(55)) <= 0)
  faktor <- if (nachweis || ausnahme) .bruch(1) else .bruch(1, 2)
  ergebnis <- .geld_ergebnis(NULL, "BGB_WAERMEPUMPE_KOSTENANSATZ", eingaben,
    list(list(operation = "Jahresarbeitszahlnachweis und vier Geb\u00e4udeausnahmen pr\u00fcfen; vollen oder halben Kostenansatz bilden")))
  if (waermepumpenregel_anwendbar) {
    ergebnis$wert <- list(jahresarbeitszahlnachweis_ausreichend = nachweis,
      gebaeudeausnahme_erfuellt = ausnahme, kostenfaktor = .bruchteile(faktor),
      kostenansatz = .bruchteile(.multiplizieren(kosten, faktor)))
    ergebnis$status <- "BERECHNET"
  }
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Nur \u00a7 559f: Kostenansatz vor weiteren gesetzlichen Abz\u00fcgen und Kappungen; kein endg\u00fcltiger Erh\u00f6hungsbetrag. Keine Berechnung der Jahresarbeitszahl nach VDI."))
  ergebnis
}
