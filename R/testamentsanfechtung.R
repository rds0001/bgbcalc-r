testament_anfechtungsfrist <- function(
    erbfall_am = NULL, massgebliche_kenntnis_am = NULL, massgebliches_jahresfristende = NULL,
    massgeblicher_anfechtungstag = NULL, anfechtungsregel_2082_anwendbar = NULL,
    einordnungsnachweis = NULL) {
  erbfall <- .datum(erbfall_am, "erbfall_am")
  kenntnis <- .datum(massgebliche_kenntnis_am, "massgebliche_kenntnis_am")
  ende <- .datum(massgebliches_jahresfristende, "massgebliches_jahresfristende")
  tag <- .datum(massgeblicher_anfechtungstag, "massgeblicher_anfechtungstag")
  if (kenntnis < erbfall) .fehler("massgebliche_kenntnis_am", "Rechtlich ma\u00dfgeblicher Kenntnisbeginn des Anfechtungsberechtigten darf nicht vor dem Erbfall liegen.")
  if (tag < kenntnis) .fehler("massgeblicher_anfechtungstag", "Anfechtungstag darf nicht vor dem ma\u00dfgeblichen Kenntnisbeginn liegen.")
  .wahrheitswert(anfechtungsregel_2082_anwendbar, "anfechtungsregel_2082_anwendbar")
  .text(einordnungsnachweis, "einordnungsnachweis")
  rohende <- .frist(massgebliche_kenntnis_am, 1, "jahre", "ereignis")
  if (ende < rohende) .fehler("massgebliches_jahresfristende", "Ma\u00dfgebliches Jahresfristende darf die kalendarische Grundfrist nicht verk\u00fcrzen.")
  hoechst <- .frist(erbfall_am, 30, "jahre", "ereignis")
  grenze <- min(ende, hoechst)
  eingaben <- list(erbfall_am = erbfall_am, massgebliche_kenntnis_am = massgebliche_kenntnis_am,
    massgebliches_jahresfristende = massgebliches_jahresfristende,
    massgeblicher_anfechtungstag = massgeblicher_anfechtungstag,
    anfechtungsregel_2082_anwendbar = anfechtungsregel_2082_anwendbar, einordnungsnachweis = einordnungsnachweis)
  wert <- if (!anfechtungsregel_2082_anwendbar) NULL else list(
    rechnerisches_jahresfristende = .iso(rohende), dreissigjahresgrenze = .iso(hoechst),
    massgebliche_kalendergrenze = .iso(grenze), anfechtung_fristgerecht = tag <= grenze)
  ergebnis <- .ergebnis(wert, "daten_und_wahrheitswerte", "BGB_TESTAMENT_ANFECHTUNGSFRIST", eingaben,
    list(list(operation = "Jahresfrist ab ma\u00dfgeblicher Kenntnis; qualifiziert korrigiertes Jahresende auf 30 Jahre ab Erbfall begrenzen")), eingaben)
  ergebnis$status <- if (anfechtungsregel_2082_anwendbar) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Ma\u00dfgeblicher Kenntnisbeginn des Anfechtungsberechtigten, rechtlich ma\u00dfgeblicher Anfechtungstag und einschl\u00e4gige Jahresfristkorrekturen qualifiziert vorgegeben; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Nur Fristpr\u00fcfung nach\u00a72082: Anfechtungsgrund\u00a7\u00a72078/2079, Berechtigung\u00a72080 und Erkl\u00e4rungsempf\u00e4nger/Form insbesondere\u00a72081 separat pr\u00fcfen. Kenntnisbeginn meint die rechtlich fristausl\u00f6sende Kenntnis des Berechtigten; vorheriges Wissen vor Erbfall ist nicht ungepr\u00fcft als fr\u00fcherer Fristbeginn einzusetzen. Drohungsende ist hier kein selbst\u00e4ndig gesetzlich genannter Fristausl\u00f6ser wie bei\u00a72283. Ma\u00dfgebliches Jahresende ber\u00fccksichtigt fachlich gepr\u00fcfte\u00a7\u00a7206/210/211 und zul\u00e4ssige Kalenderkorrekturen; keine pauschale Hemmung oder Feiertagsverschiebung. Diese Korrekturen verl\u00e4ngern nicht automatisch die Drei\u00dfigjahresgrenze. Fristwahrung am ma\u00dfgeblichen Endtag einschlie\u00dflich; Versanddatum nicht pauschal als Erkl\u00e4rungstag einsetzen. Keine R\u00fcckwirkung, Verj\u00e4hrungsentscheidung oder automatische Unwirksamkeit der Verf\u00fcgung. Erbvertragsanfechtung durch Erblasser\u00a72283 sowie Ausschlagungs-/Annahme-Anfechtung\u00a71954 sind eigene Regeln.")
  ergebnis
}
