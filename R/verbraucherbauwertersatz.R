verbraucherbau_widerruf_wertersatz <- function(gesamtverguetung=NULL,leistungsanteil_zaehler=NULL,leistungsanteil_nenner=NULL,verguetung_unverhaeltnismaessig_hoch=NULL,marktwert_erbrachte_leistung=NULL,einordnungsnachweis=NULL) {
 anteilig <- .teilbetrag(gesamtverguetung,leistungsanteil_zaehler,leistungsanteil_nenner)
 .wahrheitswert(verguetung_unverhaeltnismaessig_hoch,'verguetung_unverhaeltnismaessig_hoch')
 if(verguetung_unverhaeltnismaessig_hoch) wert <- .geld(marktwert_erbrachte_leistung) else {
  if(!is.null(marktwert_erbrachte_leistung)) .fehler('marktwert_erbrachte_leistung','Marktwert nur bei qualifiziert unverh\u00e4ltnism\u00e4\u00dfig hoher Verg\u00fctung einsetzen.')
  wert <- anteilig
 }
 .text(einordnungsnachweis,'einordnungsnachweis')
 eingaben <- list(gesamtverguetung=gesamtverguetung,leistungsanteil_zaehler=leistungsanteil_zaehler,leistungsanteil_nenner=leistungsanteil_nenner,verguetung_unverhaeltnismaessig_hoch=verguetung_unverhaeltnismaessig_hoch,marktwert_erbrachte_leistung=marktwert_erbrachte_leistung,einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(wert,'BGB_VERBRAUCHERBAU_WIDERRUF_WERTERSATZ',eingaben,list(list(operation='Vertraglichen Verg\u00fctungsanteil bestimmen oder auf den Marktwert der bereits erbrachten Leistung umstellen.')))
 ergebnis$hinweise <- c(ergebnis$hinweise,list('\u00a7357e: qualifizierter wirksamer Widerruf eines Verbraucherbauvertrags und nach ihrer Natur ausgeschlossene R\u00fcckgew\u00e4hr der bis zum Widerruf erbrachten Leistung. Leistungsanteil nach Wert/Umfang, keine automatische Zeitquote. Bei unverh\u00e4ltnism\u00e4\u00dfig hoher vereinbarter Verg\u00fctung bezeichnet marktwert_erbrachte_leistung bereits den Marktwert der erbrachten Leistung; diesen nicht nochmals mit dem Leistungsanteil multiplizieren. Unverh\u00e4ltnism\u00e4\u00dfigkeit und Bewertung extern bestimmen; keine erfundene feste Prozentschwelle. Keine ungepr\u00fcfte \u00dcbernahme der zus\u00e4tzlichen Voraussetzungen357aII. Vorauszahlungen, sonstige R\u00fcckgew\u00e4hr und Aufrechnung gesondert, keine automatische Saldierung.'))
 ergebnis
}
