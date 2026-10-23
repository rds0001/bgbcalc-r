unterhaltsaltersstufe <- function(geburtsdatum = NULL, stichtag = NULL) {
  geburt <- .datum(geburtsdatum, "geburtsdatum")
  tag <- .datum(stichtag, "stichtag")
  if (geburt > tag) .fehler("geburtsdatum", "Geburt muss sp\u00e4testens am Stichtag liegen.")
  grenzen <- list()
  for (alter in c(6, 12, 18)) {
    erreicht <- if (as.integer(format(geburt, "%Y")) + alter <= 9999) {
      lebensalter_beginn(geburtsdatum, alter)$wert
    } else NULL
    grenze <- if (alter == 18 || is.null(erreicht)) erreicht else paste0(substr(erreicht, 1, 8), "01")
    grenzen[as.character(alter)] <- list(grenze)
  }
  stufe <- 1
  if (!is.null(grenzen[["6"]]) && stichtag >= grenzen[["6"]]) stufe <- 2
  if (!is.null(grenzen[["12"]]) && stichtag >= grenzen[["12"]]) stufe <- 3
  minderjaehrig <- is.null(grenzen[["18"]]) || stichtag < grenzen[["18"]]
  eingaben <- list(geburtsdatum = geburtsdatum, stichtag = stichtag)
  ergebnis <- .ergebnis(if (minderjaehrig) stufe else NULL, "altersstufe", "BGB_UNTERHALT_ALTERSSTUFE",
    eingaben, list(list(operation = "Altersstufen ab Monatsbeginn; Vollj\u00e4hrigkeit taggenau",
      grenzen = grenzen)), eingaben)
  ergebnis$status <- if (minderjaehrig) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$hinweise <- list("Keine automatische Pr\u00fcfung des Unterhaltsanspruchs oder Feiertagsverschiebung.")
  ergebnis
}

mindestunterhalt_aus_existenzminimum <- function(jaehrliches_existenzminimum = NULL,
    altersstufe = NULL, quellenangabe = NULL) {
  grundlage <- .geld(jaehrliches_existenzminimum)
  if (grundlage$zaehler == 0) .fehler("jaehrliches_existenzminimum", "Positive Jahresgrundlage erforderlich.")
  .ganzzahl(altersstufe, "altersstufe", 1, 3)
  .text(quellenangabe, "quellenangabe")
  faktor <- c(87, 100, 117)[altersstufe]
  ungerundet <- .multiplizieren(grundlage, .bruch(faktor, 1200))
  wert <- .dezimalzahl(.runden(ungerundet, 0, "auf"))
  ergebnis <- .geld_ergebnis(wert, "BGB_UNTERHALT_EXISTENZMINIMUM",
    list(jaehrliches_existenzminimum = jaehrliches_existenzminimum,
      altersstufe = altersstufe, quellenangabe = quellenangabe),
    list(list(operation = "Jahresbetrag durch zw\u00f6lf mal Altersfaktor", altersfaktor_prozent = faktor,
      ungerundeter_monatsbetrag = .bruchteile(ungerundet)),
      list(operation = "Auf volle Euro aufrunden")))
  ergebnis$hinweise <- list("Rechenrelation aus vorgegebenem Existenzminimum; keine amtliche Festsetzung.",
    "Ma\u00dfgebliche Mindestunterhaltsverordnung und Zeitraum gesondert bestimmen.",
    "Gesetzliche Aufrundung auf volle Euro.")
  ergebnis
}

dynamischer_kindesunterhalt <- function(mindestunterhalt = NULL, prozentsatz = NULL,
    mindestunterhaltsnachweis = NULL) {
  minimum <- .geld(mindestunterhalt)
  satz <- .geld(prozentsatz)
  if (minimum$zaehler <= 0 || minimum$nenner != 1) {
    .fehler("mindestunterhalt", "Positiver Mindestunterhalt in vollen Euro erforderlich.")
  }
  .text(mindestunterhaltsnachweis, "mindestunterhaltsnachweis")
  begrenzt <- .dezimalzahl(.runden(satz, 1, "gegen_null"))
  ungerundet <- .multiplizieren(minimum, .multiplizieren(begrenzt, .bruch(1, 100)))
  wert <- .dezimalzahl(.runden(ungerundet, 0, "auf"))
  ergebnis <- .geld_ergebnis(wert, "BGB_UNTERHALT_DYNAMISCH",
    list(mindestunterhalt = mindestunterhalt, prozentsatz = prozentsatz,
      mindestunterhaltsnachweis = mindestunterhaltsnachweis),
    list(list(operation = "Prozentsatz nach einer Dezimalstelle abschneiden",
      begrenzter_prozentsatz = .bruchteile(begrenzt)),
      list(operation = "Mindestunterhalt mal Prozentsatz/100", ungerundeter_betrag = .bruchteile(ungerundet)),
      list(operation = "Auf volle Euro aufrunden")))
  ergebnis$hinweise <- list("Mindestunterhalt, Altersstufe, Zeitraum und Prozentsatz rechtlich vorgegeben.",
    "Prozentsatz abgeschnitten; Unterhaltsbetrag gesetzlich auf volle Euro aufgerundet.",
    "Kindergeldanrechnung und Leistungsf\u00e4higkeit gesondert.")
  ergebnis
}

kindbezogene_leistung_anrechnen <- function(barbedarf = NULL, leistungsbetrag = NULL,
    erhoehung_nichtgemeinschaftliches_kind = NULL, betreuung_durch_elternteil = NULL,
    leistungsart = NULL, regelmaessig_wiederkehrend = NULL, kindergeld_ausgeschlossen = NULL) {
  eingaben <- list(barbedarf = barbedarf, leistungsbetrag = leistungsbetrag,
    erhoehung_nichtgemeinschaftliches_kind = erhoehung_nichtgemeinschaftliches_kind,
    betreuung_durch_elternteil = betreuung_durch_elternteil, leistungsart = leistungsart,
    regelmaessig_wiederkehrend = regelmaessig_wiederkehrend,
    kindergeld_ausgeschlossen = kindergeld_ausgeschlossen)
  bedarf <- .geld(barbedarf)
  leistung <- .geld(leistungsbetrag)
  erhoehung <- .geld(erhoehung_nichtgemeinschaftliches_kind)
  if (.vergleichen(erhoehung, leistung) > 0) {
    .fehler("erhoehung_nichtgemeinschaftliches_kind", "Erh\u00f6hung darf Leistungsbetrag nicht \u00fcbersteigen.")
  }
  for (parameter in c("betreuung_durch_elternteil", "regelmaessig_wiederkehrend", "kindergeld_ausgeschlossen")) {
    .wahrheitswert(eingaben[[parameter]], parameter)
  }
  .auswahl(leistungsart, "leistungsart", c("kindergeld", "ersatzleistung"))
  if (leistungsart == "kindergeld" && kindergeld_ausgeschlossen) {
    .fehler("kindergeld_ausgeschlossen", "Kindergeld und dessen Ausschluss widersprechen sich.")
  }
  anwendbar <- leistungsart == "kindergeld" || (regelmaessig_wiederkehrend && kindergeld_ausgeschlossen)
  ergebnis <- .geld_ergebnis(if (anwendbar) .bruch(0) else NULL, "BGB_KINDLEISTUNG_ANRECHNUNG",
    eingaben, list(list(operation = "Kindergeld oder einschl\u00e4gige Ersatzleistung", anwendbar = anwendbar)))
  if (anwendbar) {
    relevant <- .multiplizieren(.subtrahieren(leistung, erhoehung),
      if (betreuung_durch_elternteil) .bruch(1, 2) else .bruch(1))
    deckung <- if (.vergleichen(bedarf, relevant) < 0) bedarf else relevant
    rest <- .subtrahieren(bedarf, deckung)
    ergebnis$wert <- list(bedarfsrelevante_leistung = .bruchteile(relevant),
      bedarfsdeckung = .bruchteile(deckung), verbleibender_barbedarf = .bruchteile(rest))
    ergebnis$rechenschritte <- c(ergebnis$rechenschritte, list(list(
      operation = "Nicht relevante Erh\u00f6hung abziehen; Leistung h\u00e4lftig oder voll bis Bedarf anrechnen",
      haelftige_anrechnung = betreuung_durch_elternteil)))
  }
  ergebnis
}
