mietpreisbegrenzung_ausnahmen <- function(erstmalige_nutzung = NULL,
    erstmalige_vermietung = NULL, erste_vermietung_nach_umfassender_modernisierung = NULL,
    bewertungsnachweis = NULL) {
  nutzung <- .datum(erstmalige_nutzung, "erstmalige_nutzung")
  vermietung <- .datum(erstmalige_vermietung, "erstmalige_vermietung")
  .wahrheitswert(erste_vermietung_nach_umfassender_modernisierung,
    "erste_vermietung_nach_umfassender_modernisierung")
  .text(bewertungsnachweis, "bewertungsnachweis")
  eingaben <- list(erstmalige_nutzung = erstmalige_nutzung,
    erstmalige_vermietung = erstmalige_vermietung,
    erste_vermietung_nach_umfassender_modernisierung = erste_vermietung_nach_umfassender_modernisierung,
    bewertungsnachweis = bewertungsnachweis)
  grenze <- .datum("2014-10-01", "grenze")
  neufall <- nutzung > grenze && vermietung > grenze
  wert <- list(ausnahme_nach_satz_1 = neufall,
    ausnahme_von_556d = neufall || erste_vermietung_nach_umfassender_modernisierung,
    ausnahme_von_556e_nach_satz_2 = erste_vermietung_nach_umfassender_modernisierung)
  ergebnis <- .ergebnis(wert, "wahrheitswerte", "BGB_MIETPREISBEGRENZUNG_AUSNAHMEN",
    eingaben, list(list(operation = "Erstnutzung und Erstvermietung jeweils nach 01.10.2014 pr\u00fcfen; Ausnahme der ersten Vermietung nach umfassender Modernisierung erg\u00e4nzen")), eingaben)
  ergebnis$annahmen <- list("Feste lokale BGB-Fassung; rechtlich ma\u00dfgebliche Erstnutzung und Erstvermietung sowie umfassende Modernisierung extern eingeordnet.")
  ergebnis$hinweise <- list("Nur \u00a7556f, keine automatische Pr\u00fcfung von \u00dcbergangsrecht, \u00f6rtlicher Verordnung oder vorvertraglichen Auskunftspflichten nach \u00a7556g.",
    "Satz1 nennt ausdr\u00fccklich \u00a7556d; ein FALSE f\u00fcr die Ausnahme von \u00a7556e nach Satz2 bedeutet nicht, dass \u00a7556e ohne seine Voraussetzungen angewendet wird.")
  ergebnis
}

mietpreisbegrenzung_grundbetrag <- function(ortsuebliche_vergleichsmiete = NULL,
    gebiet_rechtswirksam_bestimmt = NULL, ausnahme_von_556d = NULL, anwendungsnachweis = NULL) {
  vergleich <- .geld(ortsuebliche_vergleichsmiete)
  .wahrheitswert(gebiet_rechtswirksam_bestimmt, "gebiet_rechtswirksam_bestimmt")
  .wahrheitswert(ausnahme_von_556d, "ausnahme_von_556d")
  .text(anwendungsnachweis, "anwendungsnachweis")
  eingaben <- list(ortsuebliche_vergleichsmiete = ortsuebliche_vergleichsmiete,
    gebiet_rechtswirksam_bestimmt = gebiet_rechtswirksam_bestimmt,
    ausnahme_von_556d = ausnahme_von_556d, anwendungsnachweis = anwendungsnachweis)
  wert <- NULL
  if (gebiet_rechtswirksam_bestimmt && !ausnahme_von_556d)
    wert <- .multiplizieren(vergleich, .bruch(11, 10))
  ergebnis <- .geld_ergebnis(wert, "BGB_MIETPREISBEGRENZUNG_GRUNDBETRAG", eingaben,
    list(list(operation = "Orts\u00fcbliche Vergleichsmiete bei Anwendbarkeit mit 110 Prozent multiplizieren")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Grundbetrag nach \u00a7556d Absatz1; h\u00f6here Grenzen nach \u00a7556e, Auskunftspflichten und Rechtsfolgen nach \u00a7556g gesondert. Kein automatisch abschlie\u00dfend zul\u00e4ssiger Mietpreis."))
  ergebnis
}

mietpreisbegrenzung_vormietgrenze <- function(grundbetrag_556d = NULL,
    beruecksichtigungsfaehige_vormiete = NULL, vormietprivileg_nutzbar = NULL,
    vormietnachweis = NULL) {
  grundbetrag <- .geld(grundbetrag_556d)
  vormiete <- .geld(beruecksichtigungsfaehige_vormiete)
  .wahrheitswert(vormietprivileg_nutzbar, "vormietprivileg_nutzbar")
  .text(vormietnachweis, "vormietnachweis")
  eingaben <- list(grundbetrag_556d = grundbetrag_556d,
    beruecksichtigungsfaehige_vormiete = beruecksichtigungsfaehige_vormiete,
    vormietprivileg_nutzbar = vormietprivileg_nutzbar, vormietnachweis = vormietnachweis)
  wert <- grundbetrag
  if (vormietprivileg_nutzbar && .vergleichen(vormiete, grundbetrag) > 0) wert <- vormiete
  ergebnis <- .geld_ergebnis(wert, "BGB_MIETPREISBEGRENZUNG_VORMIETGRENZE", eingaben,
    list(list(operation = "Grundbetrag und ber\u00fccksichtigungsf\u00e4hige Vormiete vergleichen; ohne nutzbares Privileg beim Grundbetrag bleiben")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Nur Vormietweg nach \u00a7556e Absatz1. Vormiete muss Mietminderungen und im letzten Jahr vor Beendigung vereinbarte Mieterh\u00f6hungen bereits gesetzeskonform bereinigen. Kein zus\u00e4tzlicher Modernisierungsaufschlag auf diese Vormietgrenze."))
  ergebnis
}
