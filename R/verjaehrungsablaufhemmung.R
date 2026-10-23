verjaehrung_ablaufhemmung_mindestablauf <- function(schutzfall = NULL,
    schutzbeendende_ereignisse = NULL, fristdauer = NULL, fristeinheit = NULL,
    rechnerischer_letzter_tag = NULL,
    prozessfaehigkeit_bei_beschraenkter_geschaeftsfaehigkeit = NULL,
    ablaufhemmung_anwendbar = NULL) {
  .auswahl(schutzfall, "schutzfall", c("vertretungsmangel", "nachlass"))
  .ganzzahl(fristdauer, "fristdauer", 1)
  .auswahl(fristeinheit, "fristeinheit", c("tage", "wochen", "monate", "jahre"))
  bisher <- .datum(rechnerischer_letzter_tag, "rechnerischer_letzter_tag")
  .wahrheitswert(prozessfaehigkeit_bei_beschraenkter_geschaeftsfaehigkeit,
    "prozessfaehigkeit_bei_beschraenkter_geschaeftsfaehigkeit")
  .wahrheitswert(ablaufhemmung_anwendbar, "ablaufhemmung_anwendbar")
  .vorhanden(schutzbeendende_ereignisse, "schutzbeendende_ereignisse")
  if (!is.list(schutzbeendende_ereignisse) || !is.null(names(schutzbeendende_ereignisse)) ||
      length(schutzbeendende_ereignisse) > 3L) {
    .fehler("schutzbeendende_ereignisse", "Liste mit h\u00f6chstens drei Schutzereignissen erforderlich.")
  }
  erlaubt <- if (schutzfall == "vertretungsmangel") {
    c("unbeschraenkte_geschaeftsfaehigkeit", "vertretungsmangel_behoben")
  } else {
    c("erbschaft_angenommen", "nachlassinsolvenz_eroeffnet",
      "geltendmachung_durch_oder_gegen_vertreter_moeglich")
  }
  termine <- list()
  gesehen <- character()
  for (eintrag in schutzbeendende_ereignisse) {
    if (!is.list(eintrag) || length(eintrag) != 2L ||
        !setequal(names(eintrag), c("ereignis", "datum"))) {
      .fehler("schutzbeendende_ereignisse", "Genau Ereignisart und Datum erforderlich.")
    }
    .auswahl(eintrag$ereignis, "ereignis", erlaubt)
    if (eintrag$ereignis %in% gesehen) {
      .fehler("schutzbeendende_ereignisse", "Ereignisart nicht mehrfach angeben.")
    }
    gesehen <- c(gesehen, eintrag$ereignis)
    termine[[length(termine) + 1L]] <- list(
      ereignis = eintrag$ereignis, datum = .datum(eintrag$datum, "datum"))
  }
  eingaben <- list(schutzfall = schutzfall, schutzbeendende_ereignisse = schutzbeendende_ereignisse,
    fristdauer = fristdauer, fristeinheit = fristeinheit,
    rechnerischer_letzter_tag = rechnerischer_letzter_tag,
    prozessfaehigkeit_bei_beschraenkter_geschaeftsfaehigkeit =
      prozessfaehigkeit_bei_beschraenkter_geschaeftsfaehigkeit,
    ablaufhemmung_anwendbar = ablaufhemmung_anwendbar)
  anwendbar <- ablaufhemmung_anwendbar &&
    !(schutzfall == "vertretungsmangel" && prozessfaehigkeit_bei_beschraenkter_geschaeftsfaehigkeit)
  schritte <- list(list(operation = "Schutzfall und Prozessf\u00e4higkeitsausnahme", anwendbar = anwendbar))
  wert <- NULL
  if (anwendbar) {
    if (!length(termine)) {
      .fehler("schutzbeendende_ereignisse", "Kein Schutzende angegeben.", "EINGABE_FEHLT")
    }
    schutzende <- min(do.call(c, lapply(termine, function(t) t$datum)))
    sechsmonatsende <- .monatsende(schutzende, 6, FALSE)
    if (fristeinheit == "jahre") {
      kurz <- FALSE
    } else if (fristeinheit == "monate") {
      kurz <- fristdauer < 6
    } else {
      tage <- fristdauer * if (fristeinheit == "wochen") 7 else 1
      kurz <- tage < as.numeric(sechsmonatsende - schutzende)
    }
    mindest <- if (kurz) .frist(.iso(schutzende), fristdauer, fristeinheit, "ereignis") else sechsmonatsende
    wert <- list(schutzende_am = .iso(schutzende),
      nachlauf_kuerzer_als_sechs_monate = kurz, mindestablauf = .iso(mindest),
      rechnerischer_letzter_tag = .iso(max(bisher, mindest)))
    schritte <- c(schritte, list(
      list(operation = "Fr\u00fchestes schutzbeendendes Ereignis",
        massgebliche_ereignisse = lapply(Filter(function(t) t$datum == schutzende, termine),
          function(t) t$ereignis), datum = .iso(schutzende)),
      list(operation = "Sechs Monate oder k\u00fcrzere volle Verj\u00e4hrungsfrist; sp\u00e4teren Ablauf ausw\u00e4hlen",
        ergebnis = wert)))
  }
  ergebnis <- .ergebnis(wert, "datum", "BGB_VERJAEHRUNG_ABLAUFHEMMUNG_MINDESTABLAUF",
    eingaben, schritte, eingaben)
  ergebnis$status <- if (anwendbar) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list(
    "Feste lokale BGB-Fassung; Schutzfall, Fristdauer und s\u00e4mtliche ma\u00dfgeblichen Beendigungsereignisse rechtlich vorgegeben.")
  ergebnis$hinweise <- list(
    "Mindestablauf nach \u00a7\u00a7 210/211, keine Addition von Hemmungstagen oder sechs Monaten zum bisherigen Fristende.",
    "Weitere Schutzperioden, Neubeginn, konkurrierende Fristen und gegebenenfalls Werktagsverschiebung bleiben gesondert; kein abschlie\u00dfender Verj\u00e4hrungstag.")
  ergebnis
}
