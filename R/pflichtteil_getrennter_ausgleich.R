pflichtteil_getrennter_zuwendungs_leistungsausgleich <- function(gruppennachlass=NULL,miterben=NULL,berechtigter_id=NULL,zugleich_anrechenbarer_zuwendungswert=NULL,hinterlassener_erbteilwert=NULL,fall_nach_2316_qualifiziert=NULL,bewertungsnachweis=NULL) {
 name <- .text(berechtigter_id,'berechtigter_id');anrechnung <- .geld(zugleich_anrechenbarer_zuwendungswert);hinterlassen <- .geld(hinterlassener_erbteilwert)
 .wahrheitswert(fall_nach_2316_qualifiziert,'fall_nach_2316_qualifiziert');teilung <- erbteilung_getrennter_zuwendungs_leistungsausgleich(gruppennachlass,miterben,TRUE,bewertungsnachweis)
 personen <- Filter(function(p) p$person_id==name,miterben)
 if(length(personen)==0) .fehler('berechtigter_id','Berechtigter muss zur hypothetischen Ausgleichungsgruppe geh\u00f6ren.')
 if(.vergleichen(anrechnung,.geld(personen[[1]]$ausgleichungswert_zuwendungen))>0) .fehler('zugleich_anrechenbarer_zuwendungswert','Doppelanrechnung h\u00f6chstens eigener bereits enthaltener Zuwendungswert auf gleicher Wertgrundlage.')
 wert <- NULL
 if(fall_nach_2316_qualifiziert && !is.null(teilung$wert)) {
  p <- Filter(function(p) p$person_id==name,teilung$wert$zuteilungen)[[1]];anteil <- .geld(p$erbteil_nach_gemischtem_ausgleich)
  vor <- .multiplizieren(anteil,.bruch(1,2));halb <- .multiplizieren(anrechnung,.bruch(1,2));pflichtteil <- .subtrahieren(vor,halb)
  if(.vergleichen(pflichtteil,.bruch(0))<0) pflichtteil <- .bruch(0)
  mehr <- .subtrahieren(pflichtteil,hinterlassen);if(.vergleichen(mehr,.bruch(0))<0) mehr <- .bruch(0)
  wert <- list(hypothetischer_gesetzlicher_erbteil=.bruchteile(anteil),pflichtteil_vor_doppelanrechnung=.bruchteile(vor),halber_anrechnungswert=.bruchteile(halb),pflichtteilswert=.bruchteile(pflichtteil),mehrbetrag_gegenueber_hinterlassenem_erbteil=.bruchteile(mehr))
 }
 eingaben <- list(gruppennachlass=gruppennachlass,miterben=miterben,berechtigter_id=berechtigter_id,zugleich_anrechenbarer_zuwendungswert=zugleich_anrechenbarer_zuwendungswert,hinterlassener_erbteilwert=hinterlassener_erbteilwert,fall_nach_2316_qualifiziert=fall_nach_2316_qualifiziert,bewertungsnachweis=bewertungsnachweis)
 ergebnis <- .ergebnis(wert,'EUR','BGB_PFLICHTTEIL_GETRENNTER_ZUWENDUNGS_LEISTUNGSAUSGLEICH',eingaben,list(list(operation='Gemischte hypothetische Zuteilung halbieren; halbe zugleich2315-anrechenbare Zuwendung abziehen, mindestens null; positiven Mehrbetrag bestimmen')),eingaben)
 ergebnis$status <- if(!is.null(wert)) 'BERECHNET' else 'NICHT_ANWENDBAR'
 ergebnis$annahmen <- list("Hypothetische gesetzliche Ausgleichungsgruppe nach2316 einschlie\u00dflich Erbverzichtsausschluss,Ausstattungsschutz,getrennter Empf\u00e4nger und Leistungsvorwegabzugsreihenfolge rechtlich qualifiziert.")
 ergebnis$hinweise <- list("Nur fachlich qualifizierter Leistungsvorwegabzug mit getrennten Zuwendungs-/Leistungsempf\u00e4ngern: vorhandene2056-Ausscheidung ausschlie\u00dflich Nichtleistender. Positive Zuwendung und positive Leistung derselben Person ergeben NICHT_ANWENDBAR; zugleich leistende \u00dcberempf\u00e4nger bleiben ungel\u00f6st. Doppelanrechnungswert ist bereits in eigener Ausgleichungsposition enthalten und auf derselben Wertgrundlage bestimmt; keine weiteren reinen2315-Zuwendungen,2325-Erg\u00e4nzung oder Verm\u00e4chtnisanrechnung. F\u00fcr enterbten Berechtigten hinterlassenen Erbteil null, sonst rechtlich ma\u00dfgeblichen Wert eingeben. Mehrbetrag2316II h\u00e4ngt nicht von nomineller Halbquote ab.")
 ergebnis
}
