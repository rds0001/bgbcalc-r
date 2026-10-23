modernisierung_kappungsgrenze <- function(wohnflaeche = NULL,
    monatliche_miete_je_quadratmeter = NULL,
    bisherige_monatliche_erhoehung_gesamt = NULL,
    bisherige_monatliche_heizungserhoehung = NULL,
    erhoehungsart = NULL, kappungsregel_anwendbar = NULL) {
  flaeche <- .geld(wohnflaeche)
  qm_miete <- .geld(monatliche_miete_je_quadratmeter)
  bisher <- .geld(bisherige_monatliche_erhoehung_gesamt)
  heizung_bisher <- .geld(bisherige_monatliche_heizungserhoehung)
  if (flaeche$zaehler == 0) .fehler("wohnflaeche", "Positive Wohnfl\u00e4che erforderlich.")
  if (.vergleichen(heizung_bisher, bisher) > 0) {
    .fehler("bisherige_monatliche_heizungserhoehung",
      "Heizungsanteil darf die gesamte ber\u00fccksichtigte Erh\u00f6hung nicht \u00fcbersteigen.")
  }
  .auswahl(erhoehungsart, "erhoehungsart", c("allgemein", "heizung_559", "heizung_559e"))
  .wahrheitswert(kappungsregel_anwendbar, "kappungsregel_anwendbar")
  ergebnis <- .geld_ergebnis(if (kappungsregel_anwendbar) .bruch(0) else NULL,
    "BGB_MODERNISIERUNG_KAPPUNGSGRENZE",
    list(wohnflaeche = wohnflaeche, monatliche_miete_je_quadratmeter = monatliche_miete_je_quadratmeter,
      bisherige_monatliche_erhoehung_gesamt = bisherige_monatliche_erhoehung_gesamt,
      bisherige_monatliche_heizungserhoehung = bisherige_monatliche_heizungserhoehung,
      erhoehungsart = erhoehungsart, kappungsregel_anwendbar = kappungsregel_anwendbar),
    list(list(operation = "Kappungsregel im ausgew\u00e4hlten Fall", anwendbar = kappungsregel_anwendbar)))
  if (kappungsregel_anwendbar) {
    grenze_je_qm <- .bruch(if (.vergleichen(qm_miete, .bruch(7)) < 0) 2 else 3)
    allgemein <- .subtrahieren(.multiplizieren(flaeche, grenze_je_qm), bisher)
    if (allgemein$zaehler < 0) allgemein <- .bruch(0)
    heizung <- NULL
    massgeblich <- allgemein
    if (erhoehungsart != "allgemein") {
      heizung <- .subtrahieren(.multiplizieren(flaeche, .bruch(1, 2)), heizung_bisher)
      if (heizung$zaehler < 0) heizung <- .bruch(0)
      if (.vergleichen(heizung, allgemein) < 0) massgeblich <- heizung
    }
    ergebnis$wert <- list(allgemeine_restgrenze = .bruchteile(allgemein),
      heizungs_restgrenze = if (is.null(heizung)) NULL else .bruchteile(heizung),
      massgebliche_restgrenze = .bruchteile(massgeblich))
    ergebnis$rechenschritte <- c(ergebnis$rechenschritte, list(list(
      operation = "Zwei oder drei Euro je Quadratmeter, bei Heizungsfall zus\u00e4tzlich f\u00fcnfzig Cent; bisherige Erh\u00f6hungen abziehen",
      allgemeine_grenze_je_quadratmeter = .bruchteile(grenze_je_qm))))
  }
  ergebnis
}
