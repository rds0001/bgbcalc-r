pflichtteilsergaenzung_getrennte_bewertungen <- function(gruppennachlass=NULL, gruppenquote_am_gesamtnachlass=NULL, berechtigter_id=NULL, ordentliche_bewertung=NULL, fiktive_bewertung=NULL, ergaenzungsposten=NULL, hinterlassener_erbteilwert=NULL, ausgleichungsmodell=NULL, methodennachweis=NULL) {
 masse <- .geld(gruppennachlass);q <- .geld(gruppenquote_am_gesamtnachlass);hinter <- .geld(hinterlassener_erbteilwert);name <- .text(berechtigter_id,'berechtigter_id');.text(methodennachweis,'methodennachweis')
 if(.vergleichen(q,.bruch(0))<=0||.vergleichen(q,.bruch(1))>0) .fehler('gruppenquote_am_gesamtnachlass','Positive Quote h\u00f6chstens1erforderlich.')
 positiv <- function(x) if(.vergleichen(x,.bruch(0))>0)x else .bruch(0)
 bewertung <- function(d,n) {
  .vorhanden(d,'bewertung')
  if(!is.list(d)||length(d)!=3||!setequal(names(d),c('miterben','reiner_anrechnungswert_2315','doppelanrechnungswert_2316'))) .fehler('bewertung','Miterben und beide Anrechnungswerte erforderlich.')
  rein <- .geld(d$reiner_anrechnungswert_2315);dopp <- .geld(d$doppelanrechnungswert_2316);basis <- .addieren(n,.multiplizieren(q,rein));teilung <- erbteilung_gemischter_ausgleich_mit_ueberempfang(.bruchteile(basis),d$miterben,ausgleichungsmodell,methodennachweis)$wert
  personen <- setNames(lapply(d$miterben,function(p).geld(p$relative_erbquote)),vapply(d$miterben,function(p)p$person_id,character(1)))
  if(!name %in% names(personen)) .fehler('berechtigter_id','Berechtigter muss Gruppenmitglied sein.')
  erb <- .bruch(0)
  for(p in teilung$zuteilungen) if(p$person_id==name) erb <- .geld(p$erbteil_nach_gemischtem_ausgleich)
  pflicht <- positiv(.subtrahieren(.subtrahieren(.multiplizieren(erb,.bruch(1,2)),.multiplizieren(dopp,.bruch(1,2))),rein))
  list(pflicht=pflicht,personen=personen)
 }
 ord <- bewertung(ordentliche_bewertung,masse);ordentlich <- ord$pflicht;.vorhanden(ergaenzungsposten,'ergaenzungsposten')
 if(!is.list(ergaenzungsposten)||!is.null(names(ergaenzungsposten))||length(ergaenzungsposten)>1000) .fehler('ergaenzungsposten','Liste0..1000erforderlich.')
 neu <- masse;extra <- .bruch(0);kennungen <- character()
 felder <- c('posten_id','hinzurechnungswert','bereits_erfasster_wert','bereits_erfasste_quote','ergaenzungsanrechnungswert','voranrechnungswert','voranrechnungsquote')
 for(p in ergaenzungsposten) {
  if(!is.list(p)||length(p)!=7||!setequal(names(p),felder)) .fehler('ergaenzungsposten','Vollst\u00e4ndige sieben Postenfelder erforderlich.')
  kennung <- .text(p$posten_id,'posten_id')
  if(kennung %in% kennungen) .fehler('posten_id','Jeden Posten nur einmal.')
  kennungen <- c(kennungen,kennung);v <- lapply(p[felder[-1]],.geld)
  if(.vergleichen(v$bereits_erfasste_quote,.bruch(1))>0||.vergleichen(v$voranrechnungsquote,.bruch(1))>0) .fehler('quote','Quoten h\u00f6chstens1.')
  vorhanden <- .multiplizieren(v$bereits_erfasster_wert,v$bereits_erfasste_quote);voran <- .multiplizieren(v$voranrechnungswert,v$voranrechnungsquote)
  if(.vergleichen(voran,v$ergaenzungsanrechnungswert)>0) .fehler('voranrechnung','Voranrechnung darf die hier betrachtete Erg\u00e4nzungsanrechnung nicht \u00fcbersteigen.')
  neu <- .addieren(neu,.subtrahieren(.multiplizieren(q,v$hinzurechnungswert),vorhanden));extra <- .addieren(extra,.subtrahieren(v$ergaenzungsanrechnungswert,voran))
 }
 if(.vergleichen(neu,.bruch(0))<0) .fehler('ergaenzungsposten','Resultierende Gruppenmasse muss nichtnegativ bleiben.')
 fik <- bewertung(fiktive_bewertung,neu);fiktiv <- fik$pflicht
 if(!setequal(names(ord$personen),names(fik$personen))) .fehler('bewertung','Beide Rechnungen ben\u00f6tigen identische Personen und relative Erbquoten.')
 for(k in names(ord$personen)) if(.vergleichen(ord$personen[[k]],fik$personen[[k]])!=0) .fehler('bewertung','Beide Rechnungen ben\u00f6tigen identische Personen und relative Erbquoten.')
 vor <- positiv(.subtrahieren(.subtrahieren(fiktiv,extra),ordentlich));nach <- pflichtteilsergaenzung_mehrhinterlassung(.bruchteile(vor),.bruchteile(hinter),.bruchteile(ordentlich),methodennachweis)$wert;erg <- .geld(nach$verbleibende_ergaenzung);mehr <- positiv(.subtrahieren(ordentlich,hinter))
 wert <- list(ergaenzte_gruppenmasse=.bruchteile(neu),ordentlicher_pflichtteil=.bruchteile(ordentlich),fiktiver_pflichtteil_vor_zusaetzlicher_anrechnung=.bruchteile(fiktiv),zusaetzliche_ergaenzungsanrechnung=.bruchteile(extra),ergaenzung_vor_mehrhinterlassung=.bruchteile(vor),mehrhinterlassung=nach$mehrhinterlassung,verbleibende_ergaenzung=.bruchteile(erg),ordentlicher_mehrbetrag=.bruchteile(mehr),zusaetzlicher_gesamtbetrag=.bruchteile(.addieren(erg,mehr)))
 eingaben <- list(gruppennachlass=gruppennachlass, gruppenquote_am_gesamtnachlass=gruppenquote_am_gesamtnachlass, berechtigter_id=berechtigter_id, ordentliche_bewertung=ordentliche_bewertung, fiktive_bewertung=fiktive_bewertung, ergaenzungsposten=ergaenzungsposten, hinterlassener_erbteilwert=hinterlassener_erbteilwert, ausgleichungsmodell=ausgleichungsmodell, methodennachweis=methodennachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_PFLICHTTEILSERGAENZUNG_GETRENNTE_BEWERTUNGEN",eingaben,list(list(operation="Zwei vollst\u00e4ndig berechnete Ausgleichungs-/Anrechnungsbewertungen mit differenzierten Schenkungswerten, Massen\u00fcberschneidungen und zus\u00e4tzlicher Anrechnung verbinden; Mehrhinterlassung zuletzt abziehen.")),eingaben)
 ergebnis$hinweise <- list("Bedingte Zweirechnungs-Komposition: ordentliche und fiktive gesetzliche Gruppenverteilung mit bestehendem2055/2056/2057a-Kern vollst\u00e4ndig berechnen, jeweils reine2315-Zuwendung gruppenanteilig zur Masse hinzuf\u00fcgen; eigenen hypothetischen Erbteil halbieren, halbe2316-Doppelanrechnung und reine2315-Anrechnung abziehen, mindestens0. Erg\u00e4nzte Gruppenmasse=urspr\u00fcnglicheGruppenmasse+Summe(Gruppenquote*Hinzurechnungswert-bereitsErfassterWert*Erfassungsquote). Unterschiedliche Bewertungen derselben Zuwendung erlaubt; kein pauschaler Vergleich verschiedener2315/2055-Werte als Obergrenze. Zus\u00e4tzliche2327-Anrechnung=Summe(Erg\u00e4nzungsanrechnungswert-Voranrechnungswert*Voranrechnungsquote), danach Erg\u00e4nzung=max(fiktiverPflichtteil-zus\u00e4tzlicheAnrechnung-ordentlicherPflichtteil,0).2326-Mehrhinterlassung mit vorhandenem Kern abziehen; ordentlicher Mehrbetrag=max(ordentlicherPflichtteil-Hinterlassung,0). Kein doppeltes Hinzurechnen/Anrechnen automatisch unterstellen: korrespondierende Werte und Quoten ausdr\u00fccklich rechtlich bestimmen. Dieses Rechenmodell und die Zuordnung der \u00dcberschneidungen sind keine allgemein best\u00e4tigte Rechtsauslegung; keine Standardwahl der Bewertungs-/Ausgleichsmethode. Gleiche Personengruppe und Erbquoten in beiden Rechnungen; kein automatischer Rechtsverzicht oder Bewertungsentscheid. Nur nichtnegative resultierende Gruppenmassen im vorhandenen Ausgleichskern.")
 ergebnis
}
