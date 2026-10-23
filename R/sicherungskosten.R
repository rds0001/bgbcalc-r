bau_sicherungskosten_erstattung <- function(sicherheitsbetrag = NULL,
    tatsaechliche_kosten = NULL, uebliche_kosten = NULL,
    zeitanteil_zaehler = NULL, zeitanteil_nenner = NULL, zeitanteil_nachweis = NULL,
    sicherheit_nach_650f = NULL,
    aufrechterhaltung_wegen_unbegruendeter_einwendungen = NULL,
    bestellerart = NULL, baubetreuer_bevollmaechtigt = NULL) {
  eingaben <- list(sicherheitsbetrag = sicherheitsbetrag,
    tatsaechliche_kosten = tatsaechliche_kosten, uebliche_kosten = uebliche_kosten,
    zeitanteil_zaehler = zeitanteil_zaehler, zeitanteil_nenner = zeitanteil_nenner,
    zeitanteil_nachweis = zeitanteil_nachweis, sicherheit_nach_650f = sicherheit_nach_650f,
    aufrechterhaltung_wegen_unbegruendeter_einwendungen = aufrechterhaltung_wegen_unbegruendeter_einwendungen,
    bestellerart = bestellerart, baubetreuer_bevollmaechtigt = baubetreuer_bevollmaechtigt)
  betrag <- .geld(sicherheitsbetrag)
  kosten <- .geld(tatsaechliche_kosten)
  ueblich <- .geld(uebliche_kosten)
  zeit <- .zeitanteil(zeitanteil_zaehler, zeitanteil_nenner, zeitanteil_nachweis)
  for (parameter in c("sicherheit_nach_650f", "aufrechterhaltung_wegen_unbegruendeter_einwendungen",
      "baubetreuer_bevollmaechtigt")) {
    .wahrheitswert(eingaben[[parameter]], parameter)
  }
  .auswahl(bestellerart, "bestellerart",
    c("sonstiger", "oeffentlich_insolvenzunfaehig", "verbraucherbau", "bautraeger_verbraucher"))
  anwendbar <- sicherheit_nach_650f && !aufrechterhaltung_wegen_unbegruendeter_einwendungen &&
    bestellerart != "oeffentlich_insolvenzunfaehig" &&
    (bestellerart == "sonstiger" || baubetreuer_bevollmaechtigt)
  wert <- NULL
  schritte <- list(list(operation = "Sicherheit, unbegr\u00fcndete Einwendungen und Bestellerausnahmen",
    anwendbar = anwendbar))
  if (anwendbar) {
    hoechstbetrag <- .multiplizieren(.multiplizieren(betrag, .bruch(1, 50)), zeit)
    wert <- kosten
    for (grenze in list(ueblich, hoechstbetrag)) {
      if (.vergleichen(grenze, wert) < 0) wert <- grenze
    }
    schritte <- c(schritte, list(list(
      operation = "Minimum aus tats\u00e4chlichen Kosten, \u00fcblichen Kosten und jahresanteiliger Zweiprozentgrenze",
      hoechstbetrag = .bruchteile(hoechstbetrag))))
  }
  .geld_ergebnis(wert, "BGB_BAU_SICHERUNGSKOSTEN_ERSTATTUNG", eingaben, schritte)
}
