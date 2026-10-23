pauschalreise_beendigung_preisabrechnung <- function(reiseleistungen=NULL,einordnungsnachweis=NULL) {
 .vorhanden(reiseleistungen,'reiseleistungen')
 if(!is.list(reiseleistungen)||!is.null(names(reiseleistungen))||length(reiseleistungen)<1||length(reiseleistungen)>1000) .fehler('reiseleistungen','Liste mit1bis1000 eindeutig abgegrenzten Preis-/Zahlungspositionen erforderlich.')
 .text(einordnungsnachweis,'einordnungsnachweis')
 namen <- character();behalten <- .bruch(0);entfallen <- .bruch(0);erstattung <- .bruch(0);offen <- .bruch(0)
 for(leistung in reiseleistungen) {
  if(!is.list(leistung)||length(leistung)!=4||!setequal(names(leistung),c('leistung_id','preisanteil','gezahlter_anteil','leistungsstatus'))) .fehler('reiseleistungen','Genau leistung_id, preisanteil, gezahlter_anteil und leistungsstatus erforderlich.')
  name <- .text(leistung$leistung_id,'leistung_id')
  if(name %in% namen) .fehler('leistung_id','Leistung darf nicht mehrfach abgerechnet werden.')
  namen <- c(namen,name)
  preis <- .geld(leistung$preisanteil);bezahlt <- .geld(leistung$gezahlter_anteil)
  .auswahl(leistung$leistungsstatus,'leistungsstatus',c('erbracht','zur_beendigung_noch_zu_erbringen','entfaellt'))
  if(.vergleichen(bezahlt,preis)>0) .fehler('gezahlter_anteil','Preis\u00fcberschreitende Zahlungen erfordern gesonderte rechtliche Zuordnung.')
  if(leistung$leistungsstatus=='entfaellt') {entfallen <- .addieren(entfallen,preis);erstattung <- .addieren(erstattung,bezahlt)} else {behalten <- .addieren(behalten,preis);offen <- .addieren(offen,.subtrahieren(preis,bezahlt))}
 }
 wert <- list(verbleibender_preisanspruch=.bruchteile(behalten),entfallender_preisanspruch=.bruchteile(entfallen),zu_erstattende_zahlungen=.bruchteile(erstattung),offene_zahlung_auf_verbleibenden_preis=.bruchteile(offen))
 eingaben <- list(reiseleistungen=reiseleistungen,einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,'EUR','BGB_PAUSCHALREISE_BEENDIGUNG_PREISABRECHNUNG',eingaben,list(list(operation='Preis-/Zahlungsanteile nach qualifiziertem Leistungsstatus getrennt summieren; keine automatische Aufrechnung.')),eingaben)
 ergebnis$hinweise <- list('Nur wirksame K\u00fcndigung nach651l; Preis- und Zahlungsanteile s\u00e4mtlicher Leistungen rechtlich zutreffend und \u00fcberschneidungsfrei zuordnen. Keine pauschale Tagesquote f\u00fcr unterschiedlich bepreiste Leistungen. Teilweise erbrachte Leistungen in sachgerecht bewertete getrennte Positionen aufteilen. Mehrkosten notwendiger R\u00fcckbef\u00f6rderung tr\u00e4gt nachAbsatz3 der Veranstalter; nicht als zus\u00e4tzlichen Preisanteil des Reisenden einstellen. Minderung und Schadensersatz bleiben gesondert; keine doppelte Erstattung derselben Zahlung. Offene Preisforderung und R\u00fcckzahlung werden getrennt ausgegeben, ohne rechtliche Aufrechnung zu unterstellen. Preis\u00fcberschreitende Zahlungen und nicht zuordenbare Zahlungen au\u00dferhalb dieses Modells.')
 ergebnis
}
