erbvertrag_anfechtungsfrist <- function(
    erbvertrag_geschlossen_am = NULL, anfechtungsgrund = NULL, kenntnis_oder_zwangslageende_am = NULL,
    massgebliches_jahresfristende = NULL, massgeblicher_anfechtungstag = NULL,
    sonderfall_2283_absatz_3 = NULL, sechsmonatsnachlauf_beginn_am = NULL,
    anfechtung_durch_erblasser_anwendbar = NULL, einordnungsnachweis = NULL) {
  vertrag <- .datum(erbvertrag_geschlossen_am, "erbvertrag_geschlossen_am")
  .auswahl(anfechtungsgrund, "anfechtungsgrund", c("drohung", "sonstiger_grund"))
  beginn <- .datum(kenntnis_oder_zwangslageende_am, "kenntnis_oder_zwangslageende_am")
  ende <- .datum(massgebliches_jahresfristende, "massgebliches_jahresfristende")
  tag <- .datum(massgeblicher_anfechtungstag, "massgeblicher_anfechtungstag")
  if (beginn < vertrag) .fehler("kenntnis_oder_zwangslageende_am", "Ma\u00dfgeblicher Fristbeginn darf nicht vor Vertragsschluss liegen.")
  if (tag < beginn) .fehler("massgeblicher_anfechtungstag", "Anfechtungstag darf nicht vor dem ma\u00dfgeblichen Fristbeginn liegen.")
  .wahrheitswert(sonderfall_2283_absatz_3, "sonderfall_2283_absatz_3")
  .wahrheitswert(anfechtung_durch_erblasser_anwendbar, "anfechtung_durch_erblasser_anwendbar")
  .text(einordnungsnachweis, "einordnungsnachweis")
  nachlaufbeginn <- if (!is.null(sechsmonatsnachlauf_beginn_am) || sonderfall_2283_absatz_3) .datum(sechsmonatsnachlauf_beginn_am, "sechsmonatsnachlauf_beginn_am") else NULL
  if (!is.null(nachlaufbeginn) && !(vertrag <= nachlaufbeginn && nachlaufbeginn <= tag)) .fehler("sechsmonatsnachlauf_beginn_am", "Tats\u00e4chlicher Nachlaufbeginn muss zwischen Vertragsschluss und Anfechtungstag liegen.")
  rohende <- .frist(kenntnis_oder_zwangslageende_am, 1, "jahre", "ereignis")
  if (ende < rohende) .fehler("massgebliches_jahresfristende", "Ma\u00dfgebliches Jahresfristende darf die kalendarische Grundfrist nicht verk\u00fcrzen.")
  nachlaufende <- if (sonderfall_2283_absatz_3) .frist(sechsmonatsnachlauf_beginn_am, 6, "monate", "ereignis") else NULL
  grenze <- if (!is.null(nachlaufende)) max(ende, nachlaufende) else ende
  eingaben <- list(erbvertrag_geschlossen_am = erbvertrag_geschlossen_am, anfechtungsgrund = anfechtungsgrund,
    kenntnis_oder_zwangslageende_am = kenntnis_oder_zwangslageende_am,
    massgebliches_jahresfristende = massgebliches_jahresfristende,
    massgeblicher_anfechtungstag = massgeblicher_anfechtungstag,
    sonderfall_2283_absatz_3 = sonderfall_2283_absatz_3,
    sechsmonatsnachlauf_beginn_am = sechsmonatsnachlauf_beginn_am,
    anfechtung_durch_erblasser_anwendbar = anfechtung_durch_erblasser_anwendbar,
    einordnungsnachweis = einordnungsnachweis)
  wert <- if (!anfechtung_durch_erblasser_anwendbar) NULL else list(
    fristausloeser = if (anfechtungsgrund == "drohung") "ende_der_zwangslage" else "kenntnis_des_anfechtungsgrundes",
    rechnerisches_jahresfristende = .iso(rohende),
    sechsmonatsnachlauf_ende = if (!is.null(nachlaufende)) .iso(nachlaufende) else NULL,
    massgebliche_kalendergrenze = .iso(grenze), anfechtung_fristgerecht = tag <= grenze)
  ergebnis <- .ergebnis(wert, "daten_und_wahrheitswerte", "BGB_ERBVERTRAG_ANFECHTUNGSFRIST", eingaben,
    list(list(operation = "Drohung: Jahresfrist ab Zwangslageende; sonst ab Kenntnis; qualifizierter Sonderfall\u00a72283 Absatz3 mit Sechsmonatsuntergrenze entsprechend\u00a7210")), eingaben)
  ergebnis$status <- if (anfechtung_durch_erblasser_anwendbar) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Fristgrund und fristausl\u00f6sender Zeitpunkt, korrigiertes Jahresende sowie gegebenenfalls Sonderfall\u00a72283 Absatz3 und Beginn des Sechsmonatsnachlaufs rechtlich qualifiziert; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Nur Anfechtung durch den Erblasser nach\u00a72283, nicht durch Dritte nach\u00a7\u00a72080/2285. Jahresende ber\u00fccksichtigt gegebenenfalls\u00a7\u00a7206/210 und zul\u00e4ssige Kalenderkorrekturen, nicht automatisch\u00a7211. Sonderfall Absatz3 setzt voraus, dass der gesetzliche Vertreter nach\u00a72282 Absatz2 nicht rechtzeitig angefochten hat und der Erblasser nach Wegfall der Gesch\u00e4ftsunf\u00e4higkeit selbst anfechten kann wie ohne gesetzlichen Vertreter. Nachlaufbeginn ist der rechtlich ma\u00dfgebliche Zeitpunkt f\u00fcr die Sechsmonatsuntergrenze des\u00a7210; blo\u00dfer Betreuerwechsel oder ungepr\u00fcfte gesundheitliche Besserung gen\u00fcgt nicht. Im Sonderfall sp\u00e4teres Ende aus Jahresende und Sechsmonatsuntergrenze, kein pauschales neues volles Jahr. Ein gegebenenfalls bereits im korrigierten Jahresende enthaltener Nachlauf wird nicht nochmals addiert. Keine automatische Drei\u00dfigjahresgrenze aus\u00a72082 und kein Neubeginn ab Erbfall. Anfechtungsgrund\u00a7\u00a72078/2079/2281, pers\u00f6nliche Berechtigung, Vertretung, notarielle Beurkundung\u00a72282, Empf\u00e4nger und Best\u00e4tigung\u00a72284 gesondert pr\u00fcfen. Keine automatische R\u00fcckwirkung oder Unwirksamkeit.")
  ergebnis
}
