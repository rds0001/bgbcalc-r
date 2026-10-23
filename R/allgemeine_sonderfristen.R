.allgemeine_fristausgabe <- function(wert, regel, eingaben, operation, hinweis) {
  ergebnis <- .ergebnis(wert, "daten_und_wahrheitswerte", regel, eingaben,
    list(list(operation = operation)), eingaben)
  ergebnis$status <- if (!is.null(wert)) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Rechtlich ma\u00dfgebliche Ereignisse und Anwendungsbereich qualifiziert vorgegeben; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list(hinweis)
  ergebnis
}
verein_mitgliederschwund_antragsfrist <- function(unterschreiten_am = NULL, einordnungsnachweis = NULL) {
  .datum(unterschreiten_am, "unterschreiten_am")
  .text(einordnungsnachweis, "einordnungsnachweis")
  ende <- .frist(unterschreiten_am, 3, "monate", "ereignis")
  .allgemeine_fristausgabe(list(rechnerisches_antragsfristende = .iso(ende)),
    "BGB_VEREIN_MITGLIEDERSCHWUND_ANTRAGSFRIST",
    list(unterschreiten_am = unterschreiten_am, einordnungsnachweis = einordnungsnachweis),
    "Qualifiziertes Unterschreiten von drei Vereinsmitgliedern plus drei Kalendermonate", "Nur Grundfrist\u00a773 ab rechtlich ma\u00dfgeblichem Unterschreiten, nicht ab sp\u00e4terer Kenntnis des Vorstands. Schwelle unter drei mit vereins_mitgliederschwellen pr\u00fcfen; genau drei gen\u00fcgt nicht. Rechtlich relevanten Verlauf einschlie\u00dflich Wiederanstieg vorgeben. Keine automatische Entziehung der Rechtsf\u00e4higkeit: Antrag, Anh\u00f6rung und gerichtliche Entscheidung gesondert. Gegebenenfalls einschl\u00e4gige Kalender-/Verfahrenskorrekturen separat, keine pauschale Feiertagsverschiebung.")
}
vollmachtsurkunde_kraftlosigkeitsfrist <- function(letzte_einrueckung_am = NULL, vollmacht_widerruflich = NULL, einordnungsnachweis = NULL) {
  .datum(letzte_einrueckung_am, "letzte_einrueckung_am")
  .wahrheitswert(vollmacht_widerruflich, "vollmacht_widerruflich")
  .text(einordnungsnachweis, "einordnungsnachweis")
  ende <- .frist(letzte_einrueckung_am, 1, "monate", "ereignis")
  .allgemeine_fristausgabe(if (vollmacht_widerruflich) list(kraftlosigkeitsfristende = .iso(ende)) else NULL,
    "BGB_VOLLMACHTSURKUNDE_KRAFTLOSIGKEITSFRIST",
    list(letzte_einrueckung_am = letzte_einrueckung_am, vollmacht_widerruflich = vollmacht_widerruflich, einordnungsnachweis = einordnungsnachweis),
    "Letzte rechtlich ma\u00dfgebliche Einr\u00fcckung plus ein Kalendermonat; Wirkung mit Ablauf des Endtags", "Nur\u00a7176-Kraftloserkl\u00e4rung nach ordnungsgem\u00e4\u00df bewilligter und ver\u00f6ffentlichter Bekanntmachung. Letzte Einr\u00fcckung, nicht erste Ver\u00f6ffentlichung oder blo\u00dfer Vollmachtswiderruf. Bei nicht widerruflicher Vollmacht NICHT_ANWENDBAR wegen Absatz3; kein berechneter Wirksamkeitstag. Gerichtliche Zust\u00e4ndigkeit, ZPO-Ver\u00f6ffentlichungsvoraussetzungen und sonstige Wirksamkeit qualifiziert vorgeben. Wirkung mit Tagesablauf; keine automatische\u00a7193-Verschiebung dieser Wirkungsfrist.")
}
verbrauchsstiftung_mindestdauer <- function(errichtungsbeginn_am = NULL, errichtungsende_am = NULL, beginnart = NULL, einordnungsnachweis = NULL) {
  beginn <- .datum(errichtungsbeginn_am, "errichtungsbeginn_am")
  ende <- .datum(errichtungsende_am, "errichtungsende_am")
  .auswahl(beginnart, "beginnart", c("ereignis", "tagesbeginn"))
  .text(einordnungsnachweis, "einordnungsnachweis")
  if (ende < beginn) .fehler("errichtungsende_am", "Errichtungsende darf nicht vor dem Beginn liegen.")
  mindestende <- .frist(errichtungsbeginn_am, 10, "jahre", beginnart)
  .allgemeine_fristausgabe(list(zehnjahres_mindestende = .iso(mindestende), mindestdauer_erreicht = ende >= mindestende),
    "BGB_VERBRAUCHSSTIFTUNG_MINDESTDAUER",
    list(errichtungsbeginn_am = errichtungsbeginn_am, errichtungsende_am = errichtungsende_am, beginnart = beginnart, einordnungsnachweis = einordnungsnachweis),
    "Zehnjahresende mit qualifizierter Beginnart berechnen und einschlie\u00dfliches Satzungsende damit vergleichen", "Nur numerische Zehnjahresvoraussetzung\u00a782 Satz2 einer Verbrauchsstiftung. Beginnart nach rechtlich bestimmtem Satzungszeitraum; errichtungsende_am ist dessen letzter eingeschlossener Tag mit Ende am Tagesablauf. Kein automatisch gleichm\u00e4\u00dfiger Verm\u00f6gensverbrauch und keine3650-Tage-N\u00e4herung. Nachhaltige Zweckerf\u00fcllung, Satzungsanforderungen und Anerkennung insgesamt bleiben gesondert; FALSE ist keine automatische Ablehnung der Stiftung. Keine Feiertagsverl\u00e4ngerung einer Errichtungsdauer.")
}
