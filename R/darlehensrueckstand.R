verbraucherdarlehen_verzugsschwelle <- function(nennbetrag = NULL,
    massgeblicher_rueckstand = NULL, vertragslaufzeit_jahre = NULL,
    anzahl_aufeinanderfolgender_verzugsraten = NULL,
    immobiliar_verbraucherdarlehen = NULL, teilzahlungsdarlehen = NULL) {
  nennwert <- .geld(nennbetrag)
  if (nennwert$zaehler == 0) .fehler("nennbetrag", "Positiver Nennbetrag erforderlich.")
  rueckstand <- .geld(massgeblicher_rueckstand)
  anzahl <- .ganzzahl(anzahl_aufeinanderfolgender_verzugsraten,
    "anzahl_aufeinanderfolgender_verzugsraten", 0, 9007199254740991)
  .wahrheitswert(immobiliar_verbraucherdarlehen, "immobiliar_verbraucherdarlehen")
  .wahrheitswert(teilzahlungsdarlehen, "teilzahlungsdarlehen")
  dauer <- NULL
  if (!immobiliar_verbraucherdarlehen || !is.null(vertragslaufzeit_jahre)) {
    dauer <- .geld(vertragslaufzeit_jahre)
    if (dauer$zaehler == 0) .fehler("vertragslaufzeit_jahre", "Positive Vertragslaufzeit erforderlich.")
  }
  quote <- if (immobiliar_verbraucherdarlehen) .bruch(1, 40) else {
    if (.vergleichen(dauer, .bruch(3)) > 0) .bruch(1, 20) else .bruch(1, 10)
  }
  eingaben <- list(nennbetrag = nennbetrag, massgeblicher_rueckstand = massgeblicher_rueckstand,
    vertragslaufzeit_jahre = vertragslaufzeit_jahre,
    anzahl_aufeinanderfolgender_verzugsraten = anzahl_aufeinanderfolgender_verzugsraten,
    immobiliar_verbraucherdarlehen = immobiliar_verbraucherdarlehen,
    teilzahlungsdarlehen = teilzahlungsdarlehen)
  wert <- NULL
  if (teilzahlungsdarlehen) {
    mindestbetrag <- .multiplizieren(nennwert, quote)
    erreicht <- .vergleichen(rueckstand, mindestbetrag) >= 0
    wert <- list(rueckstandsquote = .bruchteile(quote),
      mindestrueckstand = .bruchteile(mindestbetrag),
      rueckstandsschwelle_erreicht = erreicht,
      mindestens_zwei_aufeinanderfolgende_raten = anzahl >= 2,
      voraussetzungen_nummer_1_erfuellt = erreicht && anzahl >= 2)
  }
  ergebnis <- .geld_ergebnis(if (teilzahlungsdarlehen) .bruch(0) else NULL,
    "BGB_VERBRAUCHERDARLEHEN_VERZUGSSCHWELLE", eingaben, list(list(
      operation = "Nennbetragsquote und mindestens zwei aufeinanderfolgende Verzugsraten pr\u00fcfen",
      ergebnis = wert)))
  ergebnis["wert"] <- list(wert)
  ergebnis$hinweise <- list(
    "Nur R\u00fcckstandsvoraussetzungen nach \u00a7 498 Absatz 1 Satz 1 Nummer 1 und Absatz 2; kein festgestelltes K\u00fcndigungsrecht.",
    "Erfolglose zweiw\u00f6chige Nachfrist mit Restschuldandrohung nach Nummer 2 und weitere Voraussetzungen gesondert pr\u00fcfen.",
    "Ma\u00dfgeblicher R\u00fcckstand und aufeinanderfolgende ganz oder teilweise im Verzug befindliche Raten sind rechtlich bewertete Nutzervorgaben.",
    "Gesamte vereinbarte Vertragslaufzeit, keine Restlaufzeit und keine pauschale Umrechnung von Kalendertagen in Jahre.",
    "Mindestr\u00fcckstand in EUR, Quote dimensionslos; keine automatische Cent-Rundung.")
  ergebnis
}
