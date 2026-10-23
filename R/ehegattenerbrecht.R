ehegatten_erbquote <- function(konstellation = NULL, gueterstand = NULL, anzahl_kinderstaemme = NULL,
    grosselternabkoemmlingsquote_zaehler = NULL, grosselternabkoemmlingsquote_nenner = NULL,
    ehe_beim_erbfall = NULL, scheidungsvoraussetzungen_erfuellt = NULL,
    erblasser_scheidung_beantragt_oder_zugestimmt = NULL,
    erblasser_aufhebungsberechtigt = NULL, erblasser_aufhebung_beantragt = NULL) {
  eingaben <- list(konstellation = konstellation, gueterstand = gueterstand,
    anzahl_kinderstaemme = anzahl_kinderstaemme,
    grosselternabkoemmlingsquote_zaehler = grosselternabkoemmlingsquote_zaehler,
    grosselternabkoemmlingsquote_nenner = grosselternabkoemmlingsquote_nenner,
    ehe_beim_erbfall = ehe_beim_erbfall, scheidungsvoraussetzungen_erfuellt = scheidungsvoraussetzungen_erfuellt,
    erblasser_scheidung_beantragt_oder_zugestimmt = erblasser_scheidung_beantragt_oder_zugestimmt,
    erblasser_aufhebungsberechtigt = erblasser_aufhebungsberechtigt,
    erblasser_aufhebung_beantragt = erblasser_aufhebung_beantragt)
  .auswahl(konstellation, "konstellation",
    c("erste_ordnung", "zweite_ordnung", "grosseltern", "keine_ersten_zweiten_und_keine_grosseltern"))
  .auswahl(gueterstand, "gueterstand",
    c("zugewinngemeinschaft", "guetertrennung", "ohne_erbquoten_sonderregel"))
  .ganzzahl(anzahl_kinderstaemme, "anzahl_kinderstaemme", 0, 10000)
  if ((konstellation == "erste_ordnung") != (anzahl_kinderstaemme > 0)) {
    .fehler("anzahl_kinderstaemme", "Positive Stammzahl nur und stets bei erster Ordnung erforderlich.")
  }
  .ganzzahl(grosselternabkoemmlingsquote_zaehler, "grosselternabkoemmlingsquote_zaehler", 0, .zahlengrenze)
  .ganzzahl(grosselternabkoemmlingsquote_nenner, "grosselternabkoemmlingsquote_nenner", 1, .zahlengrenze)
  abkoemmlingsquote <- .bruch(grosselternabkoemmlingsquote_zaehler, grosselternabkoemmlingsquote_nenner)
  if (.vergleichen(abkoemmlingsquote, .bruch(1)) >= 0 ||
      (konstellation != "grosseltern" && abkoemmlingsquote$zaehler != 0)) {
    .fehler("grosselternabkoemmlingsquote", "Nur im Gro\u00dfelternfall Quote unter 1, sonst Quote null.")
  }
  for (parameter in c("ehe_beim_erbfall", "scheidungsvoraussetzungen_erfuellt",
    "erblasser_scheidung_beantragt_oder_zugestimmt",
    "erblasser_aufhebungsberechtigt", "erblasser_aufhebung_beantragt")) {
    .wahrheitswert(eingaben[[parameter]], parameter)
  }
  ausgeschlossen <- (scheidungsvoraussetzungen_erfuellt && erblasser_scheidung_beantragt_oder_zugestimmt) ||
    (erblasser_aufhebungsberechtigt && erblasser_aufhebung_beantragt)
  anwendbar <- ehe_beim_erbfall && !ausgeschlossen
  schritte <- list(list(operation = "Ehe und Ausschluss nach \u00a7 1933", anwendbar = anwendbar))
  wert <- NULL
  if (anwendbar) {
    zug <- .bruch(0)
    zusatz <- .bruch(0)
    if (konstellation == "keine_ersten_zweiten_und_keine_grosseltern") {
      grund <- .bruch(1)
    } else {
      grund <- .bruch(1, if (konstellation == "erste_ordnung") 4 else 2)
      if (gueterstand == "guetertrennung" && konstellation == "erste_ordnung" && anzahl_kinderstaemme <= 2) {
        grund <- .bruch(1, anzahl_kinderstaemme + 1)
      }
      if (gueterstand == "zugewinngemeinschaft") zug <- .bruch(1, 4)
      verbleibend <- .subtrahieren(.bruch(1), .addieren(grund, zug))
      if (konstellation == "grosseltern") zusatz <- .multiplizieren(verbleibend, abkoemmlingsquote)
    }
    gesamt <- .addieren(.addieren(grund, zug), zusatz)
    wert <- list(grundquote = .bruchteile(grund), zugewinnzuschlag = .bruchteile(zug),
      grosselternabkoemmlingszuschlag = .bruchteile(zusatz), ehegattenquote = .bruchteile(gesamt),
      verwandtenquote = .bruchteile(.subtrahieren(.bruch(1), gesamt)))
    schritte <- c(schritte, list(
      list(operation = "Grundquote einschlie\u00dflich G\u00fctertrennung bestimmen"),
      list(operation = "Zugewinnviertel vor Gro\u00dfelternabk\u00f6mmlingszuschlag ber\u00fccksichtigen"),
      list(operation = "Zusatz aus verbleibendem Verwandtenanteil; Gesamtquote und Restquote bilden")))
  }
  ergebnis <- .ergebnis(wert, "erbquote", "BGB_EHEGATTEN_ERBQUOTE", eingaben, schritte, eingaben)
  ergebnis$status <- if (anwendbar) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Gesetzliche erbrechtliche L\u00f6sung; deutsches Erb- und G\u00fcterrecht und Fallzuordnung vorgegeben.")
  ergebnis$hinweise <- list(
    "Keine Pflichtteilsberechnung oder g\u00fcterrechtliche L\u00f6sung nach \u00a7 1371 Abs. 2/3.",
    "\u00a7 1934-Verwandtenerbteil und Voraus nach \u00a7 1932 gesondert; keine Rundung.",
    "Gro\u00dfelternabk\u00f6mmlingszuschlag aus dem nach Zugewinnviertel verbleibenden Anteil.")
  ergebnis
}
