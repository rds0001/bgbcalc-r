unterhalt_vorausleistung_zeitgrenze <- function(zeitabschnittsfall=NULL, bezugstag_am=NULL, beginnart=NULL, qualifizierte_dauer=NULL, qualifizierte_einheit=NULL, einordnungsnachweis=NULL) {
 .auswahl(zeitabschnittsfall,'zeitabschnittsfall',c('geldrente_760','andere_rente_760','angemessener_selbstbestimmter_zeitabschnitt'))
 .text(einordnungsnachweis,'einordnungsnachweis')
 if(zeitabschnittsfall=='geldrente_760') {
  if(!is.null(qualifizierte_dauer)||!is.null(qualifizierte_einheit)) .fehler('qualifizierte_dauer','Im gesetzlichen Geldrentenfall Sonderdauer und Einheit ausdr\u00fccklich null.')
  anzahl <- 3;einheit <- 'monate'
 } else {
  anzahl <- .ganzzahl(qualifizierte_dauer,'qualifizierte_dauer',1,3652059)
  .auswahl(qualifizierte_einheit,'qualifizierte_einheit',c('tage','wochen','monate','jahre'))
  einheit <- qualifizierte_einheit
 }
 wert <- list(rechnerische_befreiungsgrenze=.iso(.frist(bezugstag_am,anzahl,einheit,beginnart)))
 eingaben <- list(zeitabschnittsfall=zeitabschnittsfall, bezugstag_am=bezugstag_am, beginnart=beginnart, qualifizierte_dauer=qualifizierte_dauer, qualifizierte_einheit=qualifizierte_einheit, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"datum","BGB_UNTERHALT_VORAUSLEISTUNG_ZEITGRENZE",eingaben,list(list(operation="Gesetzliche Dreimonatsdauer oder ausdr\u00fccklich rechtlich qualifizierte Sonderdauer ausw\u00e4hlen und Zeitraum mit vorhandener Kalenderbibliothek berechnen.")),eingaben)
 ergebnis$hinweise <- list("\u00a71614II in Verbindung mit760II: nur zeitliche Grenze der befreienden Wirkung einer Vorausleistung bei erneuter Bed\u00fcrftigkeit, kein wirksamer Verzicht auf k\u00fcnftigen Unterhalt. Im gesetzlichen Geldrentenfall drei Kalendermonate. Bei anderer Rente den nach Beschaffenheit/Zweck bestimmten Zeitabschnitt vorqualifizieren. Die angemessene Sonderdauer gilt nur, wenn der Verpflichtete den Zeitabschnitt rechtlich selbst zu bestimmen hatte, nicht schon bei jeder tats\u00e4chlich von ihm gew\u00e4hlten Vorauszahlung. Ma\u00dfgeblichen Beginn und Beginnart rechtlich bestimmen; keine automatische neue Dreimonatsfrist ab erneuter Bed\u00fcrftigkeit, keine Gleichsetzung von Zahlungstag und Periodenbeginn. Betrag, Bedarfsentwicklung, ausreichende Vorausleistung und weitere Unterhaltsvoraussetzungen separat. Keine eigenst\u00e4ndige Angemessenheitsbewertung oder pauschale90Tage-Annahme.")
 ergebnis
}
