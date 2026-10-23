anfechtung_fristpruefung <- function(anfechtungsgrund = NULL, willenserklaerung_abgegeben_am = NULL,
    kenntnis_oder_zwangslageende_am = NULL, massgeblicher_anfechtungstag = NULL,
    unverzueglich_gehandelt = NULL, massgebliches_jahresfristende = NULL,
    anfechtungsregel_anwendbar = NULL, einordnungsnachweis = NULL) {
  .auswahl(anfechtungsgrund, "anfechtungsgrund", c("irrtum", "uebermittlungsfehler", "arglistige_taeuschung", "widerrechtliche_drohung"))
  abgabe <- .datum(willenserklaerung_abgegeben_am, "willenserklaerung_abgegeben_am")
  ausloeser <- .datum(kenntnis_oder_zwangslageende_am, "kenntnis_oder_zwangslageende_am")
  tag <- .datum(massgeblicher_anfechtungstag, "massgeblicher_anfechtungstag")
  if (tag < abgabe || tag < ausloeser) .fehler("massgeblicher_anfechtungstag", "Anfechtungstag darf nicht vor Abgabe oder angegebenem Fristausl\u00f6ser liegen.")
  jahresweg <- anfechtungsgrund %in% c("arglistige_taeuschung", "widerrechtliche_drohung")
  jahresende <- NULL
  if (!is.null(massgebliches_jahresfristende) || jahresweg) jahresende <- .datum(massgebliches_jahresfristende, "massgebliches_jahresfristende")
  .wahrheitswert(unverzueglich_gehandelt, "unverzueglich_gehandelt")
  .wahrheitswert(anfechtungsregel_anwendbar, "anfechtungsregel_anwendbar")
  .text(einordnungsnachweis, "einordnungsnachweis")
  eingaben <- list(anfechtungsgrund = anfechtungsgrund, willenserklaerung_abgegeben_am = willenserklaerung_abgegeben_am,
    kenntnis_oder_zwangslageende_am = kenntnis_oder_zwangslageende_am,
    massgeblicher_anfechtungstag = massgeblicher_anfechtungstag, unverzueglich_gehandelt = unverzueglich_gehandelt,
    massgebliches_jahresfristende = massgebliches_jahresfristende,
    anfechtungsregel_anwendbar = anfechtungsregel_anwendbar, einordnungsnachweis = einordnungsnachweis)
  wert <- NULL
  if (anfechtungsregel_anwendbar) {
    hoechst <- .frist(willenserklaerung_abgegeben_am, 10, "jahre", "ereignis")
    grundjahr <- NULL
    ende <- hoechst
    if (jahresweg) {
      grundjahr <- .frist(kenntnis_oder_zwangslageende_am, 1, "jahre", "ereignis")
      if (jahresende < grundjahr) .fehler("massgebliches_jahresfristende", "Ma\u00dfgebliches Jahresfristende darf die Grundfrist nicht verk\u00fcrzen.")
      ende <- min(hoechst, jahresende)
    }
    rechtzeitig <- tag <= ende && (jahresweg || unverzueglich_gehandelt)
    wert <- list(zehnjahresgrenze = .iso(hoechst),
      rechnerisches_jahresfristende = if (!is.null(grundjahr)) .iso(grundjahr) else NULL,
      massgebliche_kalendergrenze = .iso(ende),
      unverzueglichkeit_erforderlich = !jahresweg, anfechtung_fristgerecht = rechtzeitig)
  }
  ergebnis <- .ergebnis(wert, "daten_und_wahrheitswerte", "BGB_ANFECHTUNG_FRISTPRUEFUNG", eingaben,
    list(list(operation = "Irrtum/\u00dcbermittlung: bewertete Unverz\u00fcglichkeit; T\u00e4uschung/Drohung: ma\u00dfgebliche Jahresfrist; stets zus\u00e4tzliche Zehnjahresgrenze ab Abgabe")), eingaben)
  ergebnis$status <- if (anfechtungsregel_anwendbar) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Konkreter Anfechtungstatbestand und rechtlich ma\u00dfgeblicher Erkl\u00e4rungstag vorgegeben; bei\u00a7124 Jahresfrist einschlie\u00dflich einschl\u00e4giger Frist\u00e4nderungen gepr\u00fcft; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Unverz\u00fcglich bedeutet ohne schuldhaftes Z\u00f6gern und wird nicht durch eine erfundene feste Tageszahl ersetzt. Bei\u00a7121 Absatz1 Satz2 kann unverz\u00fcgliche Absendung gegen\u00fcber Abwesendem ma\u00dfgeblich sein; tats\u00e4chlichen Zugang und Rechtzeitigkeit gegen\u00fcber absoluter Grenze gesondert rechtlich normalisieren, Versand nicht pauschal f\u00fcr alle Fristen einsetzen. Jahresbeginn bei T\u00e4uschung Entdeckung, bei Drohung Ende der Zwangslage. Ma\u00dfgebliches Jahresende ber\u00fccksichtigt gegebenenfalls\u00a7\u00a7206/210/211 und zul\u00e4ssige Kalenderkorrekturen; diese verl\u00e4ngern nicht automatisch die absolute Zehnjahresgrenze. Eine sp\u00e4ter erlangte Kenntnis startet diese H\u00f6chstgrenze nicht neu. Nur Fristpr\u00fcfung, keine automatische Feststellung von Anfechtungsgrund, wirksamer Erkl\u00e4rung, Best\u00e4tigung\u00a7144 oder sonstigen Ausschl\u00fcssen.")
  ergebnis
}
