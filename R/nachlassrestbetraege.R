.nachlassrest_ergebnis <- function(wert,regel,eingaben,operation,hinweis) {
 ergebnis <- .ergebnis(wert,'EUR',regel,eingaben,list(list(operation=operation)),eingaben);ergebnis$status <- if(!is.null(wert)) 'BERECHNET' else 'NICHT_ANWENDBAR'
 ergebnis$annahmen <- list('Feste lokale BGB-Fassung; qualifizierte \u00fcberschneidungsfreie Betragsgrundlagen.');ergebnis$hinweise <- list(hinweis);ergebnis
}
nachlass_zulaenglichkeitsbetrag <- function(nachlassaktiva=NULL,gesamte_nachlassverbindlichkeiten=NULL,enthaltene_vermaechtnisverbindlichkeiten=NULL,enthaltene_auflagenverbindlichkeiten=NULL,bewertungsnachweis=NULL) {
 aktiva <- .geld(nachlassaktiva);gesamt <- .geld(gesamte_nachlassverbindlichkeiten);vermaechtnisse <- .geld(enthaltene_vermaechtnisverbindlichkeiten);auflagen <- .geld(enthaltene_auflagenverbindlichkeiten)
 ausgeschlossen <- .addieren(vermaechtnisse,auflagen)
 if(.vergleichen(ausgeschlossen,gesamt)>0) .fehler('gesamte_nachlassverbindlichkeiten','Enthaltene \u00fcberschneidungsfreie Verm\u00e4chtnis-/Auflagenlasten d\u00fcrfen Gesamtverbindlichkeiten nicht \u00fcbersteigen.')
 .text(bewertungsnachweis,'bewertungsnachweis');schulden <- .subtrahieren(gesamt,ausgeschlossen)
 eingaben <- list(nachlassaktiva=nachlassaktiva,gesamte_nachlassverbindlichkeiten=gesamte_nachlassverbindlichkeiten,enthaltene_vermaechtnisverbindlichkeiten=enthaltene_vermaechtnisverbindlichkeiten,enthaltene_auflagenverbindlichkeiten=enthaltene_auflagenverbindlichkeiten,bewertungsnachweis=bewertungsnachweis)
 wert <- list(beruecksichtigte_verbindlichkeiten=.bruchteile(schulden),zulaenglichkeitsdifferenz=.bruchteile(.subtrahieren(aktiva,schulden)))
 .nachlassrest_ergebnis(wert,"BGB_NACHLASS_ZULAENGLICHKEITSBETRAG",eingaben,"Gesamtschulden um darin enthaltene Verm\u00e4chtnis-/Auflagenverbindlichkeiten bereinigen; bereinigte Schulden von Aktiva abziehen","Nur numerische Bereinigung1980I3. Positive oder negative Differenz ist keine automatische Feststellung von Zahlungsf\u00e4higkeit, insolvenzrechtlicher \u00dcberschuldung oder Antragspflicht. Aktiva/Schulden nach rechtlich einschl\u00e4gigen Bewertungsma\u00dfst\u00e4ben qualifizieren; Pflichtteilslasten nicht allein wegen letztwilliger Verf\u00fcgung als Verm\u00e4chtnisse ausnehmen. Ausgenommene Lasten m\u00fcssen bereits in Gesamtschulden enthalten sein und d\u00fcrfen einander nicht \u00fcberlappen.")
}
erbteil_individuelle_schuldendeckung <- function(zugeteilter_erbteilwert=NULL,individuell_zugeordnete_nachlassschuld=NULL,last_nach_2046_abs2_qualifiziert=NULL,bewertungsnachweis=NULL) {
 anteil <- .geld(zugeteilter_erbteilwert);schuld <- .geld(individuell_zugeordnete_nachlassschuld)
 .wahrheitswert(last_nach_2046_abs2_qualifiziert,'last_nach_2046_abs2_qualifiziert');.text(bewertungsnachweis,'bewertungsnachweis')
 eingaben <- list(zugeteilter_erbteilwert=zugeteilter_erbteilwert,individuell_zugeordnete_nachlassschuld=individuell_zugeordnete_nachlassschuld,last_nach_2046_abs2_qualifiziert=last_nach_2046_abs2_qualifiziert,bewertungsnachweis=bewertungsnachweis)
 wert <- NULL
 if(last_nach_2046_abs2_qualifiziert) {
  deckung <- if(.vergleichen(anteil,schuld)<0) anteil else schuld
  wert <- list(berichtigung_aus_eigenem_anteil=.bruchteile(deckung),verbleibender_erbteilwert=.bruchteile(.subtrahieren(anteil,deckung)),nicht_aus_anteil_berichtigter_schuldteil=.bruchteile(.subtrahieren(schuld,deckung)))
 }
 .nachlassrest_ergebnis(wert,"BGB_ERBTEIL_INDIVIDUELLE_SCHULDENDECKUNG",eingaben,"Individuelle Nachlassschuld bis eigenem Teilungsanteil decken; verbleibenden Anteil und nicht gedeckte Schuld getrennt ausweisen","Nur einigen Miterben obliegende Nachlassverbindlichkeit2046II; hier bereits individuell zugeordneter Anteil der Schuld. Nicht von der gemeinsamen Masse2046I erneut abziehen. Teilungsanteil nach rechtlich zutreffender vorgelagerter Teilung/Ausgleichung bestimmen. Bei mehreren belasteten Erben zun\u00e4chst deren rechtliche Lastanteile qualifizieren, keine automatische Gleichverteilung. Ungedeckte Schuld erlischt nicht und wird nicht pauschal auf unbelastete Erben umgelegt; sonstige Haftung gesondert.")
}
vertragsvermaechtnis_subsidiaerer_fehlbetrag <- function(geschuldeter_ersatzwert=NULL,vom_erben_erlangbarer_ersatz=NULL,subsidiaerfall_nach_2288_qualifiziert=NULL,bewertungsnachweis=NULL) {
 ersatz <- .geld(geschuldeter_ersatzwert);erlangbar <- .geld(vom_erben_erlangbarer_ersatz)
 if(.vergleichen(erlangbar,ersatz)>0) .fehler('vom_erben_erlangbarer_ersatz','Erlangbarer Ersatzanteil darf gesamten geschuldeten Ersatzwert nicht \u00fcbersteigen.')
 .wahrheitswert(subsidiaerfall_nach_2288_qualifiziert,'subsidiaerfall_nach_2288_qualifiziert');.text(bewertungsnachweis,'bewertungsnachweis')
 eingaben <- list(geschuldeter_ersatzwert=geschuldeter_ersatzwert,vom_erben_erlangbarer_ersatz=vom_erben_erlangbarer_ersatz,subsidiaerfall_nach_2288_qualifiziert=subsidiaerfall_nach_2288_qualifiziert,bewertungsnachweis=bewertungsnachweis)
 wert <- if(subsidiaerfall_nach_2288_qualifiziert) .bruchteile(.subtrahieren(ersatz,erlangbar)) else NULL
 .nachlassrest_ergebnis(wert,"BGB_VERTRAGSVERMAECHTNIS_SUBSIDIAERER_FEHLBETRAG",eingaben,"Geschuldeten Ersatzwert um rechtlich vom Erben erlangbaren Ersatzanteil vermindern","Nur beeintr\u00e4chtigende schenkweise Ver\u00e4u\u00dferung/Belastung eines vertragsm\u00e4\u00dfig vermachten Gegenstands2288II2; nicht jeder normale Erbvertrags- oder Pflichtteilserg\u00e4nzungsfall. Erlangbarkeit rechtlich qualifizieren, nicht blo\u00df bisher tats\u00e4chlich gezahlten Betrag abziehen. Ergebnis ist subsidi\u00e4rer Fehlbetrag vor weiteren2287-Bereicherungsgrenzen, kein automatisch endg\u00fcltiger Zahlungsanspruch gegen Beschenkten. Kein2329-Rangmodell importiert.")
}
