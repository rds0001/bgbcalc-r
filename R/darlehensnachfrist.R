verbraucherdarlehen_kuendigungsnachfrist <- function(zugang_fristsetzung = NULL,
    massgebliches_nachfristende = NULL, prueftag = NULL, nachfristende_nachweis = NULL,
    fristsetzung_erfolglos = NULL, restschuldandrohung_erklaert = NULL,
    teilzahlungsdarlehen = NULL) {
  zugang <- .datum(zugang_fristsetzung, "zugang_fristsetzung")
  ende <- .datum(massgebliches_nachfristende, "massgebliches_nachfristende")
  tag <- .datum(prueftag, "prueftag")
  if (ende < zugang || tag < zugang) {
    .fehler("nachfrist", "Fristende und Pr\u00fcftag d\u00fcrfen nicht vor Zugang liegen.")
  }
  .text(nachfristende_nachweis, "nachfristende_nachweis")
  .wahrheitswert(fristsetzung_erfolglos, "fristsetzung_erfolglos")
  .wahrheitswert(restschuldandrohung_erklaert, "restschuldandrohung_erklaert")
  .wahrheitswert(teilzahlungsdarlehen, "teilzahlungsdarlehen")
  eingaben <- list(zugang_fristsetzung = zugang_fristsetzung,
    massgebliches_nachfristende = massgebliches_nachfristende,
    prueftag = prueftag, nachfristende_nachweis = nachfristende_nachweis,
    fristsetzung_erfolglos = fristsetzung_erfolglos,
    restschuldandrohung_erklaert = restschuldandrohung_erklaert,
    teilzahlungsdarlehen = teilzahlungsdarlehen)
  wert <- NULL
  if (teilzahlungsdarlehen) {
    mindestende <- .frist(zugang_fristsetzung, 2, "wochen", "ereignis")
    dauer <- ende >= mindestende
    abgelaufen <- tag > ende
    wert <- list(rechnerisches_mindestende = .iso(mindestende),
      nachfrist_mindestdauer_eingehalten = dauer,
      nachfrist_am_prueftag_abgelaufen = abgelaufen,
      voraussetzungen_nummer_2_erfuellt =
        dauer && abgelaufen && fristsetzung_erfolglos && restschuldandrohung_erklaert)
  }
  ergebnis <- .ergebnis(wert, "datum_und_wahrheitswerte",
    "BGB_VERBRAUCHERDARLEHEN_KUENDIGUNGSNACHFRIST", eingaben, list(list(
      operation = "Zweiw\u00f6chige Mindestdauer, tats\u00e4chlichen Ablauf, Erfolglosigkeit und Androhung pr\u00fcfen",
      ergebnis = wert)), eingaben)
  ergebnis$status <- if (teilzahlungsdarlehen) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list(
    "Feste lokale BGB-Fassung; Verbraucherdarlehensfall und rechtlich ma\u00dfgeblicher Fristablauf einschlie\u00dflich erforderlicher Kalenderkorrekturen vorgegeben.")
  ergebnis$hinweise <- list(
    "Nur Nummer 2 des \u00a7 498 Absatz 1 Satz 1; R\u00fcckstandsvoraussetzungen nach Nummer 1 und weitere Voraussetzungen gesondert pr\u00fcfen.",
    "Ma\u00dfgebliches Fristende muss erforderliche Feiertags-/Ortskorrekturen bereits enthalten; rechnerisches_mindestende allein best\u00e4tigt keinen Ablauf.",
    "Erfolglosigkeit ist eine bewertete Nutzervorgabe zur konkreten Fristsetzung; Zahlungsledger und Rechtsfolgen versp\u00e4teter Zahlungen werden nicht ausgewertet.",
    "Am Fristendtag ist die Frist in dieser taggenauen Pr\u00fcfung noch nicht abgelaufen; kein untert\u00e4giger K\u00fcndigungszeitpunkt.",
    "Gespr\u00e4chsangebot nach \u00a7 498 Absatz 1 Satz 2, K\u00fcndigungserkl\u00e4rung und Restschuldabrechnung bleiben gesondert.")
  ergebnis
}
