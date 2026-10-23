hypothek_widerspruchs_und_meldungsfrist <- function(fristfall=NULL, ausloeser_am=NULL, erklaerung_am=NULL, werktagskorrektur_anwendbar=NULL, feiertagskalender=NULL, einordnungsnachweis=NULL) {
 .auswahl(fristfall,'fristfall',c('versicherung_anzeige_1128','versicherung_untunlich_1128','hinterlegung_meldung_1171'))
 eingang <- .datum(erklaerung_am,'erklaerung_am');.wahrheitswert(werktagskorrektur_anwendbar,'werktagskorrektur_anwendbar');.text(einordnungsnachweis,'einordnungsnachweis')
 grund <- .frist(ausloeser_am,if(fristfall=='hinterlegung_meldung_1171') 30 else 1,if(fristfall=='hinterlegung_meldung_1171') 'jahre' else 'monate','ereignis');ende <- grund
 if(werktagskorrektur_anwendbar) {
  .vorhanden(feiertagskalender,'feiertagskalender')
  if(!is.list(feiertagskalender) || length(feiertagskalender)!=5 || !setequal(names(feiertagskalender),c('feiertage','ort','kalenderquelle','kalender_von','kalender_bis'))) .fehler('feiertagskalender','Vollst\u00e4ndiges Kalenderobjekt erforderlich.')
  ende <- .datum(do.call(werktagsverschiebung,c(list(datum=.iso(grund),anwendungsfall='willenserklaerung'),feiertagskalender))$wert,'fristende')
 } else if(!is.null(feiertagskalender)) .fehler('feiertagskalender','Ohne Korrektur ausdr\u00fccklich None verwenden.')
 wert <- list(grundfrist_letzter_tag=.iso(grund),frist_letzter_tag=.iso(ende),erklaerung_bis_fristende=eingang<=ende,kalendertage_vom_eingang_bis_fristende=as.integer(ende-eingang))
 eingaben <- list(fristfall=fristfall, ausloeser_am=ausloeser_am, erklaerung_am=erklaerung_am, werktagskorrektur_anwendbar=werktagskorrektur_anwendbar, feiertagskalender=feiertagskalender, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"daten_anzahl_und_wahrheitswert","BGB_HYPOTHEK_WIDERSPRUCHS_UND_MELDUNGSFRIST",eingaben,list(list(operation="Hypothekenbezogene Erkl\u00e4rungs-/Meldungsgrundfrist berechnen und tats\u00e4chlichen Eingang vergleichen.")),eingaben)
 ergebnis$hinweise <- list("\u00a71128I ein Monat ab qualifiziertem Ausl\u00f6ser;\u00a71171III drei\u00dfig Jahre ab Rechtskraft. Grundfrist und gegebenenfalls rechtlich qualifizierte193-Korrektur \u00fcber vorhandene Kalenderkerne berechnen; tats\u00e4chlichen Erkl\u00e4rungseingang bis einschlie\u00dflich letztem Tag und verbleibenden Tagesabstand vergleichen. Keine automatische Auszahlung, Zustimmungsfiktion oder Erl\u00f6schensentscheidung; keine pauschale Gleichbehandlung von1128I und1128II.193-Anwendbarkeit ist rechtliche Voraussetzung, keine zus\u00e4tzliche Zahlensch\u00e4tzung. Keine untert\u00e4gige Reihenfolge aus identischen Kalendertagen erfinden.")
 ergebnis
}
