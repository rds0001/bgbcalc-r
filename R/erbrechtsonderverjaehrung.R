erbrecht_sonderverjaehrungsfrist <- function(erbfall_am = NULL, anspruchsart = NULL,
    korrigiertes_fristende = NULL, prueftag = NULL, anspruchsgrundlage_qualifiziert = NULL,
    einordnungsnachweis = NULL) {
  erbfall <- .datum(erbfall_am, 'erbfall_am')
  .auswahl(anspruchsart, 'anspruchsart', c('vertragserbe_schenkung', 'pflichtteil_beschenkter'))
  grundende <- .frist(erbfall_am, 3, 'jahre', 'ereignis')
  ende <- .datum(korrigiertes_fristende, 'korrigiertes_fristende')
  tag <- .datum(prueftag, 'prueftag')
  if (ende < grundende) .fehler('korrigiertes_fristende', 'Korrigiertes Ende darf die gesetzliche Dreijahresgrundfrist nicht unterschreiten.')
  if (tag < erbfall) .fehler('prueftag', 'Pr\u00fcftag darf nicht vor dem Erbfall liegen.')
  .wahrheitswert(anspruchsgrundlage_qualifiziert, 'anspruchsgrundlage_qualifiziert')
  .text(einordnungsnachweis, 'einordnungsnachweis')
  eingaben <- list(erbfall_am = erbfall_am, anspruchsart = anspruchsart,
    korrigiertes_fristende = korrigiertes_fristende, prueftag = prueftag,
    anspruchsgrundlage_qualifiziert = anspruchsgrundlage_qualifiziert, einordnungsnachweis = einordnungsnachweis)
  wert <- if (anspruchsgrundlage_qualifiziert) list(grundfristende = .iso(grundende),
    massgebliches_fristende = .iso(ende), frist_am_prueftag_abgelaufen = tag >= ende) else NULL
  ergebnis <- .ergebnis(wert, 'daten_und_wahrheitswerte', 'BGB_ERBRECHT_SONDERVERJAEHRUNGSFRIST', eingaben,
    list(list(operation = 'Drei Jahre ab Erbfall statt Jahresende; rechtlich korrigiertes Fristende zum Ende des Pr\u00fcftags vergleichen')), eingaben)
  ergebnis$status <- if (!is.null(wert)) 'BERECHNET' else 'NICHT_ANWENDBAR'
  ergebnis$annahmen <- list('Feste lokale BGB-Fassung; einschl\u00e4giger Anspruch gegen Beschenkten und Fristkorrekturen qualifiziert; Ergebnis zum Ende des Pr\u00fcftags.')
  ergebnis$hinweise <- list('Anspruchsarten: Herausgabe an Vertragserben nach\u00a72287 oder Pflichtteilsberechtigten gegen Beschenkten nach\u00a72329 mit Sonderbeginn\u00a72332 Absatz1. Keine \u00dcbertragung des Sonderbeginns auf gew\u00f6hnlichen Pflichtteilsanspruch gegen Erben. Kenntnis und Jahreswechsel verschieben diesen gesetzlichen Beginn nicht. Korrigiertes Ende muss einschl\u00e4gige Hemmungen, Ablaufhemmungen und zul\u00e4ssige Kalenderkorrekturen ber\u00fccksichtigen; keine automatische Feiertagsverschiebung. Warten auf notwendige Ausschlagung begr\u00fcndet nach\u00a72332 Absatz2 keine Hemmung; andere Hemmungsgr\u00fcnde bleiben gesondert zu pr\u00fcfen. Neubeginn, Titulierung und abweichende Vereinbarungen au\u00dferhalb dieser urspr\u00fcnglichen Fristberechnung. Kein automatisches Erl\u00f6schen des Anspruchs, keine Aussage zur Erhebung einer Verj\u00e4hrungseinrede.')
  ergebnis
}
