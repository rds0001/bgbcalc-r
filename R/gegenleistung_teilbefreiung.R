gegenleistung_teilbefreiung_betraege <- function(vereinbarte_gegenleistung=NULL, wert_vollstaendiger_leistung=NULL, wert_verbleibender_teilleistung=NULL, darauf_gezahlter_betrag=NULL, einordnungsnachweis=NULL) {
 preis <- .geld(vereinbarte_gegenleistung);voll <- .geld(wert_vollstaendiger_leistung)
 teil <- .geld(wert_verbleibender_teilleistung);bezahlt <- .geld(darauf_gezahlter_betrag)
 if(.vergleichen(voll,.bruch(0))<=0) .fehler('wert_vollstaendiger_leistung','Positiver Vergleichswert erforderlich.')
 if(.vergleichen(teil,voll)>0) .fehler('wert_verbleibender_teilleistung','Teilwert darf Gesamtwert nicht \u00fcbersteigen.')
 if(.vergleichen(bezahlt,preis)>0) .fehler('darauf_gezahlter_betrag','Sonstige \u00fcber den Vertragspreis hinausgehende Zahlung separat behandeln.')
 .text(einordnungsnachweis,'einordnungsnachweis')
 verbleibend <- .multiplizieren(preis,.dividieren(teil,voll))
 rueck <- if(.vergleichen(bezahlt,verbleibend)>0) .subtrahieren(bezahlt,verbleibend) else .bruch(0)
 offen <- if(.vergleichen(verbleibend,bezahlt)>0) .subtrahieren(verbleibend,bezahlt) else .bruch(0)
 wert <- list(verbleibende_gegenleistung=.bruchteile(verbleibend),entfallener_gegenleistungsanteil=.bruchteile(.subtrahieren(preis,verbleibend)),rueckforderungsbetrag=.bruchteile(rueck),rechnerisch_offener_rest=.bruchteile(offen))
 eingaben <- list(vereinbarte_gegenleistung=vereinbarte_gegenleistung, wert_vollstaendiger_leistung=wert_vollstaendiger_leistung, wert_verbleibender_teilleistung=wert_verbleibender_teilleistung, darauf_gezahlter_betrag=darauf_gezahlter_betrag, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_GEGENLEISTUNG_TEILBEFREIUNG_BETRAEGE",eingaben,list(list(operation="Gegenleistung mit Verh\u00e4ltnis verbleibender Teilleistung zur Gesamtleistung multiplizieren; entfallenen Preisanteil, gezahlten Mehrbetrag und offenen Rest getrennt bestimmen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7326I in Verbindung mit441III und326IV: qualifizierte Teilbefreiung, konsistente Vergleichswerte entsprechend441III; keine beliebige Mengen- oder Zeitquote und keine zus\u00e4tzliche Minderungserkl\u00e4rung erforderlich.326I2 bei blo\u00df nicht zu erbringender Nacherf\u00fcllung, Behaltensanspruch326II und Ersatzverlangen326III gesondert. R\u00fcckforderungsbetrag ist ausschlie\u00dflich bereits auf den hier entfallenen Gegenleistungsanteil Gezahltes; weitere R\u00fcckgew\u00e4hrvoraussetzungen346\u2013348 und gegenseitige Anspr\u00fcche gesondert. Keine automatische Aufrechnung oder zus\u00e4tzliche Schadensberechnung. Bezugswert muss positiv sein; anderer Fall mit nicht bestimmbarem Wert nicht durch fiktive1 ersetzen.")
 ergebnis
}
