vorfaelligkeitsentschaedigung_betrag <- function(vorzeitig_zurueckgezahlter_betrag = NULL,
    unmittelbarer_schaden = NULL, verbleibende_sollzinsen = NULL, rueckzahlungstag = NULL,
    vereinbarter_rueckzahlungstag = NULL, darlehensart = NULL, gebundener_sollzins = NULL,
    bei_abschluss_gebunden = NULL, versicherung_rueckzahlung = NULL,
    vertragsangaben_ausreichend = NULL) {
  eingaben <- list(vorzeitig_zurueckgezahlter_betrag = vorzeitig_zurueckgezahlter_betrag,
    unmittelbarer_schaden = unmittelbarer_schaden, verbleibende_sollzinsen = verbleibende_sollzinsen,
    rueckzahlungstag = rueckzahlungstag, vereinbarter_rueckzahlungstag = vereinbarter_rueckzahlungstag,
    darlehensart = darlehensart, gebundener_sollzins = gebundener_sollzins,
    bei_abschluss_gebunden = bei_abschluss_gebunden, versicherung_rueckzahlung = versicherung_rueckzahlung,
    vertragsangaben_ausreichend = vertragsangaben_ausreichend)
  kapital <- .geld(vorzeitig_zurueckgezahlter_betrag)
  schaden <- .geld(unmittelbarer_schaden)
  zinsen <- .geld(verbleibende_sollzinsen)
  tag <- .datum(rueckzahlungstag, "rueckzahlungstag")
  termin <- .datum(vereinbarter_rueckzahlungstag, "vereinbarter_rueckzahlungstag")
  if (tag >= termin) .fehler("rueckzahlungstag", "Vorzeitige R\u00fcckzahlung muss vor vereinbartem R\u00fcckzahlungstag liegen.")
  .auswahl(darlehensart, "darlehensart",
    c("allgemein", "immobiliar", "eingeraeumte_ueberziehung", "geduldete_ueberziehung"))
  for (parameter in c("gebundener_sollzins", "bei_abschluss_gebunden",
    "versicherung_rueckzahlung", "vertragsangaben_ausreichend")) {
    .wahrheitswert(eingaben[[parameter]], parameter)
  }
  anwendbar <- darlehensart %in% c("allgemein", "immobiliar") && gebundener_sollzins &&
    (darlehensart != "allgemein" || bei_abschluss_gebunden) &&
    !versicherung_rueckzahlung && vertragsangaben_ausreichend
  wert <- if (anwendbar) schaden else NULL
  schritte <- list(list(operation = "Voraussetzungen und Anspruchsausschl\u00fcsse", anwendbar = anwendbar))
  if (anwendbar && darlehensart == "allgemein") {
    jahresende <- if (as.integer(format(tag, "%Y")) < 9999) {
      fristende(rueckzahlungstag, 1, "jahre", "ereignis")$wert
    } else NULL
    hoechstens_ein_jahr <- is.null(jahresende) || vereinbarter_rueckzahlungstag <= jahresende
    grenze <- .multiplizieren(kapital, .bruch(1, if (hoechstens_ein_jahr) 200 else 100))
    wert <- schaden
    if (.vergleichen(grenze, wert) < 0) wert <- grenze
    if (.vergleichen(zinsen, wert) < 0) wert <- zinsen
    schritte <- c(schritte, list(list(
      operation = "Schaden auf Prozentgrenze und verbleibende Sollzinsen begrenzen",
      hoechstens_ein_jahr = hoechstens_ein_jahr, prozentgrenze = .bruchteile(grenze),
      sollzinsgrenze = .bruchteile(zinsen))))
  }
  .geld_ergebnis(wert, "BGB_VORFAELLIGKEIT_BETRAG", eingaben, schritte,
    list(unmittelbarer_schaden = unmittelbarer_schaden, verbleibende_sollzinsen = verbleibende_sollzinsen))
}
