mietspiegel_indexfortschreibung <- function(ausgangswert=NULL,ausgangsindex=NULL,neuer_index=NULL,indexnachweis=NULL) {
 basis <- .geld(ausgangswert);alt <- .geld(ausgangsindex);neu <- .geld(neuer_index)
 if(alt$zaehler==0||neu$zaehler==0) .fehler('index','Positive vergleichbare amtliche Indexst\u00e4nde erforderlich.')
 .text(indexnachweis,'indexnachweis');verhaeltnis <- .dividieren(neu,alt);fortgeschrieben <- .multiplizieren(basis,verhaeltnis)
 wert <- list(indexverhaeltnis=.bruchteile(verhaeltnis),fortgeschriebener_wert=.bruchteile(fortgeschrieben),wertveraenderung=.bruchteile(.subtrahieren(fortgeschrieben,basis)))
 eingaben <- list(ausgangswert=ausgangswert,ausgangsindex=ausgangsindex,neuer_index=neuer_index,indexnachweis=indexnachweis)
 ergebnis <- .ergebnis(wert,'EUR_je_qualifizierter_Bezugseinheit','BGB_MIETSPIEGEL_INDEXFORTSCHREIBUNG',eingaben,list(list(operation='Ausgangswert mit neuem Index geteilt durch Ausgangsindex multiplizieren; Differenz zum Ausgangswert getrennt ausweisen.')),eingaben)
 ergebnis$hinweise <- list('\u00a7558dII2: nur qualifizierte Indexanpassung, keine Stichprobenauswertung. Amtliche Indexreihe, identische Basis und rechtlich ma\u00dfgebliche Bezugszeitpunkte vorgeben; Indexst\u00e4nde nicht selbst beschaffen oder sch\u00e4tzen. Ausgangswert und Ergebnis behalten dieselbe qualifizierte Mietspiegel-Bezugseinheit, beispielsweise EUR je Quadratmeter und Monat. Keine automatische Cent-Rundung, G\u00fcltigkeitsfeststellung oder konkrete Mieterh\u00f6hung; Anerkennung, Erstellungsmethode und einschl\u00e4gige Verordnung gesondert. Indexsenkungen werden ebenfalls gerechnet; keine erneute Anwendung bereits ber\u00fccksichtigter \u00c4nderungen.')
 ergebnis
}
mietspiegel_folgestichtage <- function(datenerhebungsstichtag=NULL,stichtagsnachweis=NULL) {
 .datum(datenerhebungsstichtag,'datenerhebungsstichtag');.text(stichtagsnachweis,'stichtagsnachweis')
 eingaben <- list(datenerhebungsstichtag=datenerhebungsstichtag,stichtagsnachweis=stichtagsnachweis)
 wert <- list(anpassung_stichtag=.iso(.frist(datenerhebungsstichtag,2,'jahre','ereignis')),neuerstellung_stichtag=.iso(.frist(datenerhebungsstichtag,4,'jahre','ereignis')))
 ergebnis <- .ergebnis(wert,'daten','BGB_MIETSPIEGEL_FOLGESTICHTAGE',eingaben,list(list(operation='Vom urspr\u00fcnglichen Datenerhebungsstichtag aus zwei und vier Kalenderjahre mit dem vorhandenen Fristenkern berechnen.')),eingaben)
 ergebnis$hinweise <- list('\u00a7558dII: erste Zweijahresanpassung und Vierjahresneuerstellung eines qualifizierten Mietspiegels, ausgehend vom Datenerhebungsstichtag der urspr\u00fcnglichen Erstellung. Eine zwischenzeitliche Indexanpassung setzt die Vierjahresneuerstellung nicht neu in Gang; nicht deren Ver\u00f6ffentlichungsdatum als neuen Ausgangspunkt einsetzen. Keine automatische Feiertagsverschiebung, G\u00fcltigkeitsvermutung oder Aussage \u00fcber versp\u00e4tete Ver\u00f6ffentlichung. Ver\u00f6ffentlichung und wissenschaftliche/formelle Voraussetzungen gesondert pr\u00fcfen; keine Fristberechnung aus einem beliebig ausgew\u00e4hlten Indexmonat.')
 ergebnis
}
