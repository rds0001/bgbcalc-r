finanzwiderruf_leistungswertersatz <- function(gesamtverguetung=NULL,leistungsanteil_zaehler=NULL,leistungsanteil_nenner=NULL,verguetung_unverhaeltnismaessig_hoch=NULL,marktwert_erbrachte_leistung=NULL,einordnungsnachweis=NULL) {
 anteilig <- .teilbetrag(gesamtverguetung,leistungsanteil_zaehler,leistungsanteil_nenner)
 .wahrheitswert(verguetung_unverhaeltnismaessig_hoch,'verguetung_unverhaeltnismaessig_hoch')
 if(verguetung_unverhaeltnismaessig_hoch) wert <- .geld(marktwert_erbrachte_leistung) else {
  if(!is.null(marktwert_erbrachte_leistung)) .fehler('marktwert_erbrachte_leistung','Marktwert nur bei qualifiziert unverh\u00e4ltnism\u00e4\u00dfig hoher Verg\u00fctung einsetzen.')
  wert <- anteilig
 }
 .text(einordnungsnachweis,'einordnungsnachweis')
 eingaben <- list(gesamtverguetung=gesamtverguetung,leistungsanteil_zaehler=leistungsanteil_zaehler,leistungsanteil_nenner=leistungsanteil_nenner,verguetung_unverhaeltnismaessig_hoch=verguetung_unverhaeltnismaessig_hoch,marktwert_erbrachte_leistung=marktwert_erbrachte_leistung,einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(wert,'BGB_FINANZWIDERRUF_LEISTUNGSWERTERSATZ',eingaben,list(list(operation='Vertraglichen Verg\u00fctungsanteil bestimmen oder auf den Marktwert der bereits erbrachten Leistung umstellen.')))
 ergebnis$hinweise <- c(ergebnis$hinweise,list('\u00a7357bII undIII4: Wertersatz f\u00fcr bis zum Widerruf erbrachte Finanzdienstleistung beziehungsweise qualifizierte Finanzierungshilfe. Je nach Anwendungsfall erforderliche vorherige Unterrichtung, ausdr\u00fcckliche Zustimmung zum vorzeitigen Beginn und Sonderverweise auf357a/506IV rechtlich vorqualifizieren. Bei digitalen Inhalten die besonderen Voraussetzungen357bII3 beachten. Keine ungepr\u00fcfte \u00dcbertragung auf gew\u00f6hnliche Darlehensnutzungszinsen357bIII; diese separat berechnen. Vereinbarte Verg\u00fctung entsprechend rechtlich bewertetem Leistungsanteil, keine automatische Zeitquote. Bei unverh\u00e4ltnism\u00e4\u00dfig hohem Gesamtpreis ist der eingegebene Marktwert bereits derjenige der erbrachten Leistung und wird nicht nochmals mit der Quote multipliziert. Keine feste Prozentgrenze f\u00fcr Unverh\u00e4ltnism\u00e4\u00dfigkeit erfinden; R\u00fcckzahlungen und weitere Aufwendungen getrennt, keine automatische Aufrechnung.'))
 ergebnis
}
