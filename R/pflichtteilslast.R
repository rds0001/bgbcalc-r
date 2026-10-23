.last_ergebnis <- function(wert,regel,eingaben,operation,hinweis) {
 ergebnis <- .ergebnis(wert,'EUR',regel,eingaben,list(list(operation=operation)),eingaben)
 ergebnis$status <- if(!is.null(wert)) 'BERECHNET' else 'NICHT_ANWENDBAR'
 ergebnis$annahmen <- list('Feste lokale BGB-Fassung; Betr\u00e4ge und Anwendungsfall rechtlich qualifiziert; isolierte numerische Lastgrenze.')
 ergebnis$hinweise <- list(hinweis);ergebnis
}
pflichtteil_miterbe_eigenbedarf <- function(erbteilwert_nach_teilung=NULL,eigener_pflichtteilswert=NULL,verlangter_pflichtteilsbetrag=NULL,schutz_nach_2319_qualifiziert=NULL,bewertungsnachweis=NULL) {
 erbteil <- .geld(erbteilwert_nach_teilung);eigen <- .geld(eigener_pflichtteilswert);verlangt <- .geld(verlangter_pflichtteilsbetrag)
 .wahrheitswert(schutz_nach_2319_qualifiziert,'schutz_nach_2319_qualifiziert');.text(bewertungsnachweis,'bewertungsnachweis')
 eingaben <- list(erbteilwert_nach_teilung=erbteilwert_nach_teilung,eigener_pflichtteilswert=eigener_pflichtteilswert,verlangter_pflichtteilsbetrag=verlangter_pflichtteilsbetrag,schutz_nach_2319_qualifiziert=schutz_nach_2319_qualifiziert,bewertungsnachweis=bewertungsnachweis)
 wert <- NULL
 if(schutz_nach_2319_qualifiziert) {
  frei <- .subtrahieren(erbteil,eigen);if(.vergleichen(frei,.bruch(0))<0) frei <- .bruch(0)
  deckung <- if(.vergleichen(verlangt,frei)<0) verlangt else frei
  wert <- list(befriedigungsbetrag=.bruchteile(deckung),ausfall_fuer_uebrige_erben=.bruchteile(.subtrahieren(verlangt,deckung)))
 }
 .last_ergebnis(wert,"BGB_PFLICHTTEIL_MITERBE_EIGENBEDARF",eingaben,"Verlangten Pflichtteil auf positiven Erbteil\u00fcberschuss \u00fcber eigenen Pflichtteil begrenzen; Differenz als Ausfall","Nur pflichtteilsberechtigter Miterbe nach Teilung2319. Erbteilwert und noch zu tragende Pflichtteilslast auf konsistenter Basis, bereits gezahlte Lasten nicht doppelt abziehen. Ausfall trifft \u00fcbrige Erben, hier keine unbelegte interne Quote oder Rangverteilung. Kein Schutz des gesamten urspr\u00fcnglichen Erwerbs vor sonstigen Verbindlichkeiten und keine Erh\u00f6hung des Erbteils auf eigenen Pflichtteil.")
}
pflichtteil_vorteilslast <- function(fallart=NULL,pflichtteilslast=NULL,angenommenes_vermaechtnis=NULL,erlangter_vorteil=NULL,lastzuordnung_qualifiziert=NULL,bewertungsnachweis=NULL) {
 .auswahl(fallart,'fallart',c('ersatzerwerb_2320','vermaechtnisausschlagung_2321'))
 pflicht <- .geld(pflichtteilslast);vermaechtnis <- .geld(angenommenes_vermaechtnis);vorteil <- .geld(erlangter_vorteil)
 if(fallart=='vermaechtnisausschlagung_2321' && .vergleichen(vermaechtnis,.bruch(0))!=0) .fehler('angenommenes_vermaechtnis','Bei ausgeschlagenem Verm\u00e4chtnis2321 ist angenommener Verm\u00e4chtniswert null.')
 .wahrheitswert(lastzuordnung_qualifiziert,'lastzuordnung_qualifiziert');.text(bewertungsnachweis,'bewertungsnachweis')
 eingaben <- list(fallart=fallart,pflichtteilslast=pflichtteilslast,angenommenes_vermaechtnis=angenommenes_vermaechtnis,erlangter_vorteil=erlangter_vorteil,lastzuordnung_qualifiziert=lastzuordnung_qualifiziert,bewertungsnachweis=bewertungsnachweis)
 wert <- NULL
 if(lastzuordnung_qualifiziert) {
  gesamt <- .addieren(pflicht,vermaechtnis);last <- if(.vergleichen(gesamt,vorteil)<0) gesamt else vorteil
  wert <- list(zugeordnete_sonderlast=.bruchteile(last),nicht_durch_vorteil_zugeordnete_restlast=.bruchteile(.subtrahieren(gesamt,last)))
 }
 .last_ergebnis(wert,"BGB_PFLICHTTEIL_VORTEILSLAST",eingaben,"Qualifizierte Pflichtteilslast und gegebenenfalls angenommenen Verm\u00e4chtniswert addieren; interne Sonderlast auf Vorteil begrenzen","2320: gesetzlicher Ersatzerwerb oder rechtlich entsprechend ausgelegte testamentarische Zuwendung;2321: Beg\u00fcnstigter der Verm\u00e4chtnisausschlagung. Erlangten Vorteil rechtlich bewerten, nicht automatisch vollen Erbteil einsetzen. Pflichtteilslast und angenommenes Verm\u00e4chtnis d\u00fcrfen nicht denselben Anspruchsteil doppelt enthalten:2317/2307-Anrechnung vorher ber\u00fccksichtigen. Restlast ist nur nicht durch diese Sonderzuordnung gedeckt, keine Feststellung einer konkreten Haftungsquote anderer Erben. Keine Doppelbelastung bei mehreren Beg\u00fcnstigten oder automatische2324-Testamentsauslegung.")
}
pflichtteil_deckung_beschwerungskuerzung <- function(erwerbswert_vor_beschwerung=NULL,beschwerungswert=NULL,zu_deckende_pflichtteilslast=NULL,kuerzung_nach_2322_qualifiziert=NULL,bewertungsnachweis=NULL) {
 erwerb <- .geld(erwerbswert_vor_beschwerung);beschwerung <- .geld(beschwerungswert);pflicht <- .geld(zu_deckende_pflichtteilslast)
 if(.vergleichen(beschwerung,erwerb)>0) .fehler('beschwerungswert','Beschwerungen oberhalb Erwerbswert ben\u00f6tigen vorgelagerte andere K\u00fcrzungsregeln; au\u00dferhalb dieses isolierten Modells.')
 .wahrheitswert(kuerzung_nach_2322_qualifiziert,'kuerzung_nach_2322_qualifiziert');.text(bewertungsnachweis,'bewertungsnachweis')
 eingaben <- list(erwerbswert_vor_beschwerung=erwerbswert_vor_beschwerung,beschwerungswert=beschwerungswert,zu_deckende_pflichtteilslast=zu_deckende_pflichtteilslast,kuerzung_nach_2322_qualifiziert=kuerzung_nach_2322_qualifiziert,bewertungsnachweis=bewertungsnachweis)
 wert <- NULL
 if(kuerzung_nach_2322_qualifiziert) {
  frei <- .subtrahieren(erwerb,beschwerung);bedarf <- .subtrahieren(pflicht,frei);if(.vergleichen(bedarf,.bruch(0))<0) bedarf <- .bruch(0)
  kuerzung <- if(.vergleichen(beschwerung,bedarf)<0) beschwerung else bedarf
  deckung <- .addieren(frei,kuerzung);offen <- .subtrahieren(pflicht,deckung);if(.vergleichen(offen,.bruch(0))<0) offen <- .bruch(0)
  wert <- list(kuerzungsbetrag=.bruchteile(kuerzung),verbleibende_beschwerung=.bruchteile(.subtrahieren(beschwerung,kuerzung)),nicht_gedeckte_pflichtteilslast=.bruchteile(offen))
 }
 .last_ergebnis(wert,"BGB_PFLICHTTEIL_DECKUNG_BESCHWERUNGSKUERZUNG",eingaben,"Freien Erwerbsrest vor K\u00fcrzung ermitteln; Deckungsl\u00fccke bis zum Beschwerungswert k\u00fcrzen; Restbeschwerung und ungedeckte Pflichtteilslast ausweisen","Nur Beg\u00fcnstigter der Ausschlagung einer beschwerten Erbschaft oder eines beschwerten Verm\u00e4chtnisses2322. Erwerbswert vor gerade dieser Beschwerung und rechtlich zugeordnete Pflichtteilslast qualifizieren. Beschwerungen h\u00f6chstens Erwerbswert, andernfalls vorgelagerte Haftungs-/K\u00fcrzungsregeln kl\u00e4ren. Beschwerungswert kann Gesamtblock sein; keine Verteilung auf mehrere Verm\u00e4chtnisse/Auflagen oder Missachtung eines Vorrangs2189. Keine automatische Geldzahlungspflicht aus Sachverm\u00e4chtnis. Ungedeckte Last nicht als erloschen ansehen.")
}
