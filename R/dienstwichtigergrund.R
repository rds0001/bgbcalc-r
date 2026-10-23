dienst_ausserordentliche_kuendigungsfrist <- function(kenntnis_massgeblicher_tatsachen_am = NULL,
    massgebliches_zweiwochenfristende = NULL, zugang_kuendigung = NULL,
    wichtiger_grund_nach_interessenabwaegung = NULL, kuendigungsregel_626_anwendbar = NULL,
    einordnungsnachweis = NULL) {
  kenntnis <- .datum(kenntnis_massgeblicher_tatsachen_am, "kenntnis_massgeblicher_tatsachen_am")
  ende <- .datum(massgebliches_zweiwochenfristende, "massgebliches_zweiwochenfristende")
  zugang <- .datum(zugang_kuendigung, "zugang_kuendigung")
  grundende <- .frist(kenntnis_massgeblicher_tatsachen_am, 2, "wochen", "ereignis")
  if (ende < grundende) .fehler("massgebliches_zweiwochenfristende", "Ma\u00dfgebliches Fristende darf die gesetzliche Zweiwochengrundfrist nicht verk\u00fcrzen.")
  if (zugang < kenntnis) .fehler("zugang_kuendigung", "K\u00fcndigungszugang darf in diesem Kenntnisfall nicht vor der ma\u00dfgeblichen Kenntnis liegen.")
  .wahrheitswert(wichtiger_grund_nach_interessenabwaegung, "wichtiger_grund_nach_interessenabwaegung")
  .wahrheitswert(kuendigungsregel_626_anwendbar, "kuendigungsregel_626_anwendbar")
  .text(einordnungsnachweis, "einordnungsnachweis")
  eingaben <- list(kenntnis_massgeblicher_tatsachen_am = kenntnis_massgeblicher_tatsachen_am,
    massgebliches_zweiwochenfristende = massgebliches_zweiwochenfristende, zugang_kuendigung = zugang_kuendigung,
    wichtiger_grund_nach_interessenabwaegung = wichtiger_grund_nach_interessenabwaegung,
    kuendigungsregel_626_anwendbar = kuendigungsregel_626_anwendbar, einordnungsnachweis = einordnungsnachweis)
  wert <- if (kuendigungsregel_626_anwendbar) list(rechnerisches_zweiwochenfristende = .iso(grundende),
    zweiwochenfrist_eingehalten = zugang <= ende,
    grund_und_frist_626_erfuellt = wichtiger_grund_nach_interessenabwaegung && zugang <= ende) else NULL
  ergebnis <- .ergebnis(wert, "datum_und_wahrheitswerte", "BGB_DIENST_AUSSERORDENTLICHE_KUENDIGUNGSFRIST", eingaben,
    list(list(operation = "Zwei Wochen ab Kenntnis der ma\u00dfgebenden Tatsachen; rechtliches Fristende mit Zugang vergleichen und wichtigen Grund nach Interessenabw\u00e4gung einbeziehen")), eingaben)
  ergebnis$status <- if (!is.null(wert)) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Kenntnis des K\u00fcndigungsberechtigten, ma\u00dfgeblicher Zugang, zul\u00e4ssige Fristkorrekturen und wichtiger Grund rechtlich bestimmt; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Kenntnis betrifft die f\u00fcr die K\u00fcndigung ma\u00dfgebenden Tatsachen, nicht automatisch ersten Verdacht oder Eingang einer ungepr\u00fcften Meldung. Aufkl\u00e4rung/Zurechnung und etwaiger Dauer- oder Wiederholungssachverhalt vorab rechtlich bestimmen; kein automatischer Neubeginn durch sp\u00e4tere Kenntnis derselben Tatsachen. Wichtiger Grund erfordert Einzelfallumst\u00e4nde und Interessenabw\u00e4gung einschlie\u00dflich Unzumutbarkeit bis ordentlichem Fristende oder vereinbartem Vertragsende; kein pauschaler Punktwert. Ma\u00dfgebliches Ende einschlie\u00dflich rechtlich zul\u00e4ssiger Kalenderkorrekturen belegen, keine frei w\u00e4hlbare Verl\u00e4ngerung. TRUE best\u00e4tigt nur die beiden gepr\u00fcften Anforderungen\u00a7626, nicht s\u00e4mtliche Wirksamkeitsvoraussetzungen: Form, Vertretungsmacht, Anh\u00f6rung und besondere Schutzregeln separat. Pflicht zur unverz\u00fcglichen schriftlichen Mitteilung des Grunds auf Verlangen nach Absatz2 Satz3 bleibt gesondert. Keine K\u00fcndigungserkl\u00e4rung wird durch diese Funktion abgegeben.")
  ergebnis
}
