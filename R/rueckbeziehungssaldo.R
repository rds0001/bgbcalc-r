rueckbeziehung_leistungssaldo <- function(sollwert_bei_rueckbeziehung=NULL,bereits_erlangter_istwert=NULL,regelfall=NULL,bewertungsnachweis=NULL) {
  soll <- .geld(sollwert_bei_rueckbeziehung);ist <- .geld(bereits_erlangter_istwert)
  .auswahl(regelfall,'regelfall',c('vertragsbestaetigung_141','bedingungsrueckbeziehung_159'));.text(bewertungsnachweis,'bewertungsnachweis')
  saldo <- .subtrahieren(soll,ist)
  eingaben <- list(sollwert_bei_rueckbeziehung=sollwert_bei_rueckbeziehung,bereits_erlangter_istwert=bereits_erlangter_istwert,regelfall=regelfall,bewertungsnachweis=bewertungsnachweis)
  fehl <- if (saldo$zaehler>0) saldo else .bruch(0)
  mehr <- if (saldo$zaehler<0) .subtrahieren(ist,soll) else .bruch(0)
  wert <- list(rechnerischer_leistungssaldo=.bruchteile(saldo),fehlender_leistungswert=.bruchteile(fehl),uebersteigender_istwert=.bruchteile(mehr))
  ergebnis <- .ergebnis(wert,'EUR','BGB_RUECKBEZIEHUNG_LEISTUNGSSALDO',eingaben,list(list(operation='Bewerteten kontrafaktischen Sollwert minus schon erlangten Istwert je Beteiligtem und identischem Leistungskreis berechnen.')),eingaben)
  ergebnis$hinweise <- list('Nur qualifizierte Zweifelsregel bei Vertragsbest\u00e4tigung141Absatz2 oder wirksam vereinbarte R\u00fcckbeziehung nach eingetretener Bedingung159. Beide Werte betreffen denselben Beteiligten, Leistungskreis, Zeitraum und Bewertungsma\u00dfstab. Tats\u00e4chlich erfolgte Leistungen und R\u00fcckabwicklungen nur einmal erfassen. Keine automatische Bewertung hypothetischer Vorteile, Wirksamkeitsentscheidung, Aufrechnung verschiedener Beteiligter oder R\u00fcckgew\u00e4hrpflicht aus einem blo\u00dfen rechnerischen Mehrerhalt. Negative Differenz zeigt allein, dass Ist den vorgegebenen Sollwert \u00fcbersteigt.')
  ergebnis
}
