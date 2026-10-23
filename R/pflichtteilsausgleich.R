pflichtteil_nach_ausgleichung <- function(gruppennachlass=NULL,ausgleichungsart=NULL,miterben=NULL,berechtigter_id=NULL,zugleich_anrechenbarer_zuwendungswert=NULL,hinterlassener_erbteilwert=NULL,fall_nach_2316_qualifiziert=NULL,bewertungsnachweis=NULL) {
 .geld(gruppennachlass);.auswahl(ausgleichungsart,'ausgleichungsart',c('zuwendungen','leistungen'));.vorhanden(miterben,'miterben')
 if(!is.list(miterben)||!is.null(names(miterben))||length(miterben)<2||length(miterben)>1000) .fehler('miterben','Zwei bis1000 hypothetische gesetzliche Miterben erforderlich.')
 name <- .text(berechtigter_id,'berechtigter_id');anrechnung <- .geld(zugleich_anrechenbarer_zuwendungswert);hinterlassen <- .geld(hinterlassener_erbteilwert)
 .wahrheitswert(fall_nach_2316_qualifiziert,'fall_nach_2316_qualifiziert');.text(bewertungsnachweis,'bewertungsnachweis')
 anteil <- NULL
 if(ausgleichungsart=='zuwendungen') {
  teilung <- erb_zuwendungen_ausgleichen(gruppennachlass,miterben,TRUE,bewertungsnachweis)
  for(p in miterben) if(p$person_id==name && .vergleichen(anrechnung,.geld(p$ausgleichungswert))>0) .fehler('zugleich_anrechenbarer_zuwendungswert','Doppelanrechnung darf den auf gleicher Wertgrundlage erfassten eigenen Ausgleichungswert nicht \u00fcbersteigen.')
  for(p in teilung$wert$verteilung) if(p$person_id==name) anteil <- .geld(p$betrag)
 } else {
  if(.vergleichen(anrechnung,.bruch(0))!=0) .fehler('zugleich_anrechenbarer_zuwendungswert','Isolierter Leistungsausgleich enth\u00e4lt keine zugleich ausgleichungspflichtige Zuwendung; hier null erforderlich.')
  teilung <- erbteilung_leistungsausgleich(gruppennachlass,miterben,TRUE,FALSE,bewertungsnachweis)
  for(p in teilung$wert$zuteilungen) if(p$miterbe_id==name) anteil <- .geld(p$erbteil_nach_leistungsausgleich)
 }
 if(is.null(anteil)) .fehler('berechtigter_id','Berechtigter muss zur hypothetischen Ausgleichungsgruppe geh\u00f6ren.')
 eingaben <- list(gruppennachlass=gruppennachlass,ausgleichungsart=ausgleichungsart,miterben=miterben,berechtigter_id=berechtigter_id,zugleich_anrechenbarer_zuwendungswert=zugleich_anrechenbarer_zuwendungswert,hinterlassener_erbteilwert=hinterlassener_erbteilwert,fall_nach_2316_qualifiziert=fall_nach_2316_qualifiziert,bewertungsnachweis=bewertungsnachweis)
 wert <- NULL
 if(fall_nach_2316_qualifiziert) {
  vor <- .multiplizieren(anteil,.bruch(1,2));halb <- .multiplizieren(anrechnung,.bruch(1,2));pflichtteil <- .subtrahieren(vor,halb)
  if(.vergleichen(pflichtteil,.bruch(0))<0) pflichtteil <- .bruch(0)
  mehr <- .subtrahieren(pflichtteil,hinterlassen);if(.vergleichen(mehr,.bruch(0))<0) mehr <- .bruch(0)
  wert <- list(hypothetischer_gesetzlicher_erbteil=.bruchteile(anteil),pflichtteil_vor_doppelanrechnung=.bruchteile(vor),halber_anrechnungswert=.bruchteile(halb),pflichtteilswert=.bruchteile(pflichtteil),mehrbetrag_gegenueber_hinterlassenem_erbteil=.bruchteile(mehr))
 }
 ergebnis <- .ergebnis(wert,'EUR','BGB_PFLICHTTEIL_NACH_AUSGLEICHUNG',eingaben,list(list(operation='Vorhandenen hypothetischen Teilungskern anwenden, individuellen Teilungsbetrag halbieren, zugleich anrechenbare Zuwendung nur halb abziehen; positiven Mehrbetrag bilden')),eingaben)
 ergebnis$status <- if(!is.null(wert)) 'BERECHNET' else 'NICHT_ANWENDBAR'
 ergebnis$annahmen <- list("Rechtlich qualifizierte hypothetische gesetzliche Ausgleichungsgruppe; nur isolierte Zuwendungs- oder Leistungsausgleichung, keine Kombination beider Arten.")
 ergebnis$hinweise <- list("Gruppennachlass umfasst nur den Anteil der ausgleichenden Abk\u00f6mmlinge; relative Quoten summieren sich auf eins. Durch Erbverzicht ausgeschlossene Abk\u00f6mmlinge2316I2 vorher entfernen und gesetzliche Gruppe/Quoten neu bestimmen. Ausstattungen2316III trotz Ausschlussanordnung ber\u00fccksichtigen, soweit sonst Pflichtteilsnachteil; keine automatische Testamentsauslegung. Bei Zuwendungen rechnet vorhandener2055/2056-Kern einschlie\u00dflich \u00dcberempf\u00e4ngerausschluss. Doppelanrechnungswert2316IV muss in eigener Ausgleichungsposition enthalten und auf derselben Wertgrundlage beurteilt sein; andere reine2315-Zuwendungen nicht zus\u00e4tzlich hineinmischen. Leistungsausgleich nutzt2057a-Kern und setzt Doppelanrechnung null. Hinterlassenen Erbteilwert f\u00fcr enterbten Berechtigten null, f\u00fcr Erben rechtlich ma\u00dfgeblich bewerten; Mehrbetrag2316II nicht an nominelle Halbquote binden. Keine2325-Erg\u00e4nzung, Verm\u00e4chtnisanrechnung oder gemeinsame Anwendung2055/2057a.")
 ergebnis
}
