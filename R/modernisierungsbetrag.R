modernisierung_regulaerer_zwischenbetrag <- function(kosten_wohnung = NULL,
    erforderliche_erhaltungskosten = NULL, abzuziehende_kostenbeitraege = NULL,
    jaehrliche_zinsermaessigung = NULL, jaehrliche_laufende_zuschuesse_und_darlehen = NULL,
    grundtatbestand_erfuellt = NULL) {
  eingaben <- list(kosten_wohnung = kosten_wohnung,
    erforderliche_erhaltungskosten = erforderliche_erhaltungskosten,
    abzuziehende_kostenbeitraege = abzuziehende_kostenbeitraege,
    jaehrliche_zinsermaessigung = jaehrliche_zinsermaessigung,
    jaehrliche_laufende_zuschuesse_und_darlehen = jaehrliche_laufende_zuschuesse_und_darlehen,
    grundtatbestand_erfuellt = grundtatbestand_erfuellt)
  kosten <- .geld(kosten_wohnung)
  erhaltung <- .geld(erforderliche_erhaltungskosten)
  beitraege <- .geld(abzuziehende_kostenbeitraege)
  zinsvorteil <- .geld(jaehrliche_zinsermaessigung)
  laufend <- .geld(jaehrliche_laufende_zuschuesse_und_darlehen)
  .wahrheitswert(grundtatbestand_erfuellt, "grundtatbestand_erfuellt")
  ergebnis <- .geld_ergebnis(if (grundtatbestand_erfuellt) .bruch(0) else NULL,
    "BGB_MODERNISIERUNG_REGULAERER_ZWISCHENBETRAG", eingaben,
    list(list(operation = "Ausgew\u00e4hlter Grundtatbestand", anwendbar = grundtatbestand_erfuellt)))
  if (grundtatbestand_erfuellt) {
    basis <- .subtrahieren(.subtrahieren(kosten, erhaltung), beitraege)
    if (basis$zaehler < 0) basis <- .bruch(0)
    jahr_vorher <- .multiplizieren(basis, .bruch(2, 25))
    jahresabzuege <- .addieren(zinsvorteil, laufend)
    jahr <- .subtrahieren(jahr_vorher, jahresabzuege)
    if (jahr$zaehler < 0) jahr <- .bruch(0)
    monat <- .multiplizieren(jahr, .bruch(1, 12))
    ergebnis$wert <- list(kostenbasis = .bruchteile(basis),
      jahresbetrag_vor_laufenden_abzuegen = .bruchteile(jahr_vorher),
      jaehrlicher_zwischenbetrag = .bruchteile(jahr),
      monatlicher_zwischenbetrag = .bruchteile(monat))
    ergebnis$rechenschritte <- c(ergebnis$rechenschritte, list(
      list(operation = "Erhaltungsanteil und Kostenbeitr\u00e4ge abziehen, Kostenbasis mindestens null"),
      list(operation = "Acht Prozent j\u00e4hrlich; Zinsvorteil und laufende Jahresf\u00f6rderung abziehen",
        jahresabzuege = .bruchteile(jahresabzuege)),
      list(operation = "Nichtnegativen Jahresbetrag durch zw\u00f6lf teilen; Kappung nicht angewendet")))
  }
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Rechnerischer Zwischenbetrag ohne Kappung; Reihenfolge gegen\u00fcber \u00a7 559 Abs. 3a fachlich noch offen. Kein endg\u00fcltiger Mieterh\u00f6hungsanspruch."))
  ergebnis
}
