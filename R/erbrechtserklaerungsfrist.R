.erbrechtsfrist <- function(beginn, ausland) .frist(.iso(beginn), 6, if (ausland) "monate" else "wochen", "ereignis")
.erbrechtsfrist_ergebnis <- function(wert, kennung, eingaben, operation) {
  ergebnis <- .ergebnis(wert, "fristdaten", kennung, eingaben,
    list(list(operation = operation)), eingaben)
  ergebnis$status <- if (!is.null(wert)) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Erbrechtlicher Grundtatbestand und rechtlich ma\u00dfgebliche Ereignisse/Ortsverh\u00e4ltnisse vorgegeben; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Nur Grundfrist und gegebenenfalls absolute Grenze; noch keine abschlie\u00dfende Erkl\u00e4rungsm\u00f6glichkeit. \u00a71944 verweist auf\u00a7\u00a7206/210, \u00a71954 zus\u00e4tzlich auf\u00a7211; einschl\u00e4gige Hemmungen/Ablaufhemmungen und Kalenderkorrekturen gesondert pr\u00fcfen. Gerichtliche Erkl\u00e4rung/Form/Zugang und etwaige fr\u00fchere Annahme oder andere Ausschl\u00fcsse separat. Ausland bedeutet tats\u00e4chlicher rechtlich ma\u00dfgeblicher Wohnsitz/Aufenthalt, nicht blo\u00df Staatsangeh\u00f6rigkeit oder sp\u00e4tere Reise.")
  ergebnis
}
erbausschlagung_grundfrist <- function(erbfall_am = NULL, kenntnis_anfall_berufungsgrund_am = NULL,
    berufung_durch_verfuegung = NULL, gerichtliche_bekanntgabe_am = NULL,
    erblasser_letzter_wohnsitz_nur_ausland = NULL, erbe_bei_fristbeginn_im_ausland = NULL,
    ausschlagungsregel_anwendbar = NULL, einordnungsnachweis = NULL) {
  erbfall <- .datum(erbfall_am, "erbfall_am")
  kenntnis <- .datum(kenntnis_anfall_berufungsgrund_am, "kenntnis_anfall_berufungsgrund_am")
  .wahrheitswert(berufung_durch_verfuegung, "berufung_durch_verfuegung")
  bekanntgabe <- NULL
  if (!is.null(gerichtliche_bekanntgabe_am) || berufung_durch_verfuegung)
    bekanntgabe <- .datum(gerichtliche_bekanntgabe_am, "gerichtliche_bekanntgabe_am")
  if (kenntnis < erbfall) .fehler("kenntnis_anfall_berufungsgrund_am", "Kenntnis vom Erbanfall darf nicht vor dem Erbfall liegen.")
  if (berufung_durch_verfuegung && bekanntgabe < erbfall) .fehler("gerichtliche_bekanntgabe_am", "Ma\u00dfgebliche Bekanntgabe darf nicht vor dem Erbfall liegen.")
  eingaben <- list(erbfall_am = erbfall_am, kenntnis_anfall_berufungsgrund_am = kenntnis_anfall_berufungsgrund_am,
    berufung_durch_verfuegung = berufung_durch_verfuegung, gerichtliche_bekanntgabe_am = gerichtliche_bekanntgabe_am,
    erblasser_letzter_wohnsitz_nur_ausland = erblasser_letzter_wohnsitz_nur_ausland,
    erbe_bei_fristbeginn_im_ausland = erbe_bei_fristbeginn_im_ausland,
    ausschlagungsregel_anwendbar = ausschlagungsregel_anwendbar, einordnungsnachweis = einordnungsnachweis)
  for (name in names(eingaben)[5:7]) .wahrheitswert(eingaben[[name]], name)
  .text(einordnungsnachweis, "einordnungsnachweis")
  wert <- NULL
  if (ausschlagungsregel_anwendbar) {
    beginn <- if (berufung_durch_verfuegung) max(kenntnis, bekanntgabe) else kenntnis
    ausland <- erblasser_letzter_wohnsitz_nur_ausland || erbe_bei_fristbeginn_im_ausland
    wert <- list(fristbeginnereignis_am = .iso(beginn), fristdauer = 6,
      fristeinheit = if (ausland) "monate" else "wochen",
      rechnerischer_letzter_tag = .iso(.erbrechtsfrist(beginn, ausland)))
  }
  .erbrechtsfrist_ergebnis(wert, "BGB_ERBAUSSCHLAGUNG_GRUNDFRIST", eingaben,
    "Kenntnis von Anfall und Berufungsgrund; bei Verf\u00fcgung zus\u00e4tzlich Bekanntgabe abwarten; mindestens eine gesetzliche Auslandsalternative verl\u00e4ngert sechs Wochen auf sechs Monate")
}
erbrecht_anfechtungsgrundfrist <- function(anfechtungsfall = NULL, angefochtenes_ereignis_am = NULL,
    fristbeginn_am = NULL, erblasser_letzter_wohnsitz_nur_ausland = NULL,
    erbe_bei_fristbeginn_im_ausland = NULL, anfechtungsregel_anwendbar = NULL, einordnungsnachweis = NULL) {
  .auswahl(anfechtungsfall, "anfechtungsfall", c("annahme", "ausschlagung", "ausschlagungsfristversaeumung"))
  ereignis <- .datum(angefochtenes_ereignis_am, "angefochtenes_ereignis_am")
  beginn <- .datum(fristbeginn_am, "fristbeginn_am")
  if (beginn < ereignis) .fehler("fristbeginn_am", "Hier ma\u00dfgeblicher Anfechtungsfristbeginn darf nicht vor angefochtenem Ereignis liegen.")
  eingaben <- list(anfechtungsfall = anfechtungsfall, angefochtenes_ereignis_am = angefochtenes_ereignis_am,
    fristbeginn_am = fristbeginn_am, erblasser_letzter_wohnsitz_nur_ausland = erblasser_letzter_wohnsitz_nur_ausland,
    erbe_bei_fristbeginn_im_ausland = erbe_bei_fristbeginn_im_ausland,
    anfechtungsregel_anwendbar = anfechtungsregel_anwendbar, einordnungsnachweis = einordnungsnachweis)
  for (name in names(eingaben)[4:6]) .wahrheitswert(eingaben[[name]], name)
  .text(einordnungsnachweis, "einordnungsnachweis")
  wert <- NULL
  if (anfechtungsregel_anwendbar) {
    ausland <- erblasser_letzter_wohnsitz_nur_ausland || erbe_bei_fristbeginn_im_ausland
    grundende <- .erbrechtsfrist(beginn, ausland)
    hoechst <- .frist(angefochtenes_ereignis_am, 30, "jahre", "ereignis")
    wert <- list(fristdauer = 6, fristeinheit = if (ausland) "monate" else "wochen",
      rechnerisches_grundfristende = .iso(grundende), dreissigjahresgrenze = .iso(hoechst),
      rechnerischer_letzter_tag = .iso(min(grundende, hoechst)))
  }
  .erbrechtsfrist_ergebnis(wert, "BGB_ERBRECHT_ANFECHTUNGSGRUNDFRIST", eingaben,
    "Sechs Wochen oder bei gesetzlicher Auslandsalternative sechs Monate ab einschl\u00e4gigem Anfechtungsfristbeginn; zus\u00e4tzlich drei\u00dfig Jahre ab angefochtener Annahme/Ausschlagung begrenzen")
}
