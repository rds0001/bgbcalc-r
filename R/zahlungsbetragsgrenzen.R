kleinbetragsinstrument_betragsgrenze <- function(grenzfall=NULL,massgeblicher_betrag=NULL,ausschliesslich_inland=NULL,einordnungsnachweis=NULL) {
 .auswahl(grenzfall,'grenzfall',c('einzelzahlung','ausgabenobergrenze','speicherobergrenze','egeld_sperrausnahme'))
 betrag <- .geld(massgeblicher_betrag);.text(einordnungsnachweis,'einordnungsnachweis')
 if(grenzfall %in% c('ausgabenobergrenze','speicherobergrenze')) {
  .wahrheitswert(ausschliesslich_inland,'ausschliesslich_inland');grenze <- if(ausschliesslich_inland) 200 else 150
 } else {
  if(!is.null(ausschliesslich_inland)) .fehler('ausschliesslich_inland','Bei Einzelzahlung oder E-Geld-Sperrausnahme keine ungenutzte Inlandsauswahl eingeben.')
  grenze <- if(grenzfall=='einzelzahlung') 30 else 200
 }
 eingaben <- list(grenzfall=grenzfall,massgeblicher_betrag=massgeblicher_betrag,ausschliesslich_inland=ausschliesslich_inland,einordnungsnachweis=einordnungsnachweis)
 wert <- list(betragsgrenze_euro=.bruchteile(.bruch(grenze)),grenze_eingehalten=.vergleichen(betrag,.bruch(grenze))<=0,ueberschreitungsbetrag=.bruchteile(if(.vergleichen(betrag,.bruch(grenze))>0) .subtrahieren(betrag,.bruch(grenze)) else .bruch(0)))
 ergebnis <- .ergebnis(wert,'EUR_und_wahrheitswert','BGB_KLEINBETRAGSINSTRUMENT_BETRAGSGRENZE',eingaben,list(list(operation="Anwendbare Betragsgrenze ausw\u00e4hlen, einschlie\u00dflich Gleichheit vergleichen und positiven \u00dcberschreitungsbetrag bestimmen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7675iI: Einzelzahlungslimit h\u00f6chstens30EUR; Ausgaben-/Speicherobergrenze150EUR, nur bei ausschlie\u00dflich m\u00f6glichen inl\u00e4ndischen Vorg\u00e4ngen200EUR. Ma\u00dfgeblich ist die rechtlich vorgesehene Instrumentengrenze, nicht ein zuf\u00e4llig kleiner Einzelumsatz; Speicherbetrag darf die Grenze zu keiner Zeit \u00fcberschreiten. Drei alternative Instrumentenwege, kein kumulatives Erfordernis aller Grenzen. egeld_sperrausnahme betrifft nur die200EUR-Wertgrenze675iIII; fehlende Sperrm\u00f6glichkeit und \u00fcbrige Voraussetzungen separat. Kein automatischer Ausschluss s\u00e4mtlicher Zahlungsdienste-Schutzregeln aus einem positiven Zahlenvergleich; Vereinbarungen und spezifische Bedingungen675iII/III pr\u00fcfen.")
 ergebnis
}
zahlung_sonstiger_schadenbetrag <- function(begrenzbarer_schaden=NULL,nicht_begrenzbarer_schaden=NULL,vereinbarte_haftungsgrenze=NULL,einordnungsnachweis=NULL) {
 begrenzbar <- .geld(begrenzbarer_schaden);unbegrenzt <- .geld(nicht_begrenzbarer_schaden);.text(einordnungsnachweis,'einordnungsnachweis')
 grenze <- if(is.null(vereinbarte_haftungsgrenze)) NULL else .geld(vereinbarte_haftungsgrenze)
 if(!is.null(grenze)&&.vergleichen(grenze,.bruch(12500))<0) .fehler('vereinbarte_haftungsgrenze','Grenze nach675z darf12500EUR nicht unterschreiten; keine Heilung unwirksamer Vereinbarung durch K\u00fcrzung.')
 wert <- .addieren(if(is.null(grenze)||.vergleichen(begrenzbar,grenze)<=0) begrenzbar else grenze,unbegrenzt)
 eingaben <- list(begrenzbarer_schaden=begrenzbarer_schaden,nicht_begrenzbarer_schaden=nicht_begrenzbarer_schaden,vereinbarte_haftungsgrenze=vereinbarte_haftungsgrenze,einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(wert,'BGB_ZAHLUNG_SONSTIGER_SCHADENBETRAG',eingaben,list(list(operation="Nur begrenzbaren Schaden auf wirksam vereinbarte Grenze begrenzen; nicht begrenzbare Komponenten ungek\u00fcrzt hinzurechnen. Ohne Vereinbarung keine gesetzliche Automatikkappung.")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("\u00a7675z: nur sonstiger Schaden au\u00dferhalb bereits von675y erfasster Anspr\u00fcche. Keine Doppelz\u00e4hlung mit Zahlungsbetrag, Entgelten oder Zinsen nach675y. Vereinbarte Grenze optional; null bedeutet keine Begrenzungsvereinbarung, nicht automatisch12500EUR. Vorsatz, grobe Fahrl\u00e4ssigkeit, Zinsschaden und besonders \u00fcbernommene Gefahren d\u00fcrfen nicht in den begrenzbaren Anteil eingehen. Bei insgesamt vors\u00e4tzlicher/grob fahrl\u00e4ssiger Ausf\u00fchrung gesamten qualifizierten Schaden als nicht begrenzbar zuordnen. Wirksamkeit der Vereinbarung, Haftungszurechnung, fehlerhafte Kundenkennung und Sonderrecht extern bestimmen."))
 ergebnis
}
zahlung_kontoberichtigung <- function(regelfall=NULL,aktueller_kontostand=NULL,fehlerhafte_belastung=NULL,bereits_korrigierter_betrag=NULL,einordnungsnachweis=NULL) {
 .auswahl(regelfall,'regelfall',c('nichtautorisiert_675u','ausfuehrungsfehler_675y'))
 stand <- .zahleneingabe(aktueller_kontostand);belastung <- .geld(fehlerhafte_belastung);korrigiert <- .geld(bereits_korrigierter_betrag);.text(einordnungsnachweis,'einordnungsnachweis')
 if(.vergleichen(korrigiert,belastung)>0) .fehler('bereits_korrigierter_betrag','Bereits korrigierter Teil darf die betrachtete Fehlbelastung nicht \u00fcbersteigen.')
 rest <- .subtrahieren(belastung,korrigiert)
 eingaben <- list(regelfall=regelfall,aktueller_kontostand=aktueller_kontostand,fehlerhafte_belastung=fehlerhafte_belastung,bereits_korrigierter_betrag=bereits_korrigierter_betrag,einordnungsnachweis=einordnungsnachweis)
 wert <- list(noch_zu_korrigierender_betrag=.bruchteile(rest),berichtigter_kontostand=.bruchteile(.addieren(stand,rest)))
 ergebnis <- .ergebnis(wert,'EUR','BGB_ZAHLUNG_KONTOBERICHTIGUNG',eingaben,list(list(operation="Fehlbelastung um bereits im aktuellen Kontostand ber\u00fccksichtigte Korrektur vermindern; verbleibenden Betrag einmal gutschreiben.")),eingaben)
 ergebnis$hinweise <- list("\u00a7675u beziehungsweise675yI/II/IV: isolierte rechnerische R\u00fcckg\u00e4ngigmachung der qualifizierten Fehlbelastung. Aktueller Kontostand darf negativ sein und muss bereits_korrigierter_betrag bereits enthalten; andere Kontobewegungen bleiben unber\u00fchrt. Kein mehrfaches Erstatten derselben Belastung. Anspruchsvoraussetzungen, Haftungsausnahmen und675u-Betrugsverdachtsfall extern kl\u00e4ren. Wertstellung, gesonderte Entgelte/Zinsen675yVI und Folgesch\u00e4den675z separat; diese Rechnung allein bildet noch keine vollst\u00e4ndige r\u00fcckwirkende Kontorekonstruktion.")
 ergebnis
}
