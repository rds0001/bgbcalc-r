erbteilung_getrennter_zuwendungs_leistungsausgleich <- function(gruppennachlass=NULL,miterben=NULL,getrennte_empfaenger_und_reihenfolge_qualifiziert=NULL,rechts_und_bewertungsnachweis=NULL) {
 .wahrheitswert(getrennte_empfaenger_und_reihenfolge_qualifiziert,'getrennte_empfaenger_und_reihenfolge_qualifiziert')
 erbteilung_gemischter_ausgleich(gruppennachlass,miterben,TRUE,rechts_und_bewertungsnachweis)
 leistungen <- lapply(miterben,function(p).geld(p$leistungs_ausgleichsbetrag));summe <- .bruch(0);liste <- list();ueberschneidung <- FALSE
 for(i in seq_along(miterben)) {
  p <- miterben[[i]];l <- leistungen[[i]];q <- .zahleneingabe(p$relative_erbquote);summe <- .addieren(summe,l)
  ueberschneidung <- ueberschneidung||(.vergleichen(l,.bruch(0))>0&&.vergleichen(.geld(p$ausgleichungswert_zuwendungen),.bruch(0))>0)
  liste[[i]] <- list(person_id=p$person_id,erbquote_zaehler=q$zaehler,erbquote_nenner=q$nenner,ausgleichungswert=p$ausgleichungswert_zuwendungen)
 }
 rest <- .subtrahieren(.geld(gruppennachlass),summe);wert <- NULL
 if(getrennte_empfaenger_und_reihenfolge_qualifiziert&&!ueberschneidung) {
  kern <- erb_zuwendungen_ausgleichen(.bruchteile(rest),liste,TRUE,rechts_und_bewertungsnachweis)$wert
  wert <- list(restnachlass_nach_leistungsvorwegabzug=.bruchteile(rest),ausser_ansatz=kern$ausser_ansatz,zuteilungen=lapply(seq_along(kern$verteilung),function(i)list(person_id=kern$verteilung[[i]]$person_id,erbteil_nach_gemischtem_ausgleich=.bruchteile(.addieren(.geld(kern$verteilung[[i]]$betrag),leistungen[[i]])))))
 }
 eingaben <- list(gruppennachlass=gruppennachlass,miterben=miterben,getrennte_empfaenger_und_reihenfolge_qualifiziert=getrennte_empfaenger_und_reihenfolge_qualifiziert,rechts_und_bewertungsnachweis=rechts_und_bewertungsnachweis)
 ergebnis <- .ergebnis(wert,'EUR','BGB_ERBTEILUNG_GETRENNTER_ZUWENDUNGS_LEISTUNGSAUSGLEICH',eingaben,list(list(operation='Leistungssumme vorweg abziehen; bestehende2055/2056-Rechnung auf Rest; individuelleLeistung hinzuf\u00fcgen, nur getrennteEmpf\u00e4ngerkreise')),eingaben)
 ergebnis$status <- if(!is.null(wert))'BERECHNET' else 'NICHT_ANWENDBAR'
 ergebnis$annahmen <- list("Vollst\u00e4ndige gleiche Ausgleichungsgruppe, getrennte Zuwendungs-/Leistungsempf\u00e4nger und konkrete Vorwegabzugsreihenfolge fachlich qualifiziert.")
 ergebnis$hinweise <- list("Positive Zuwendung und positive Leistung bei derselben Person ergeben NICHT_ANWENDBAR. Somit keine Ausscheidung eines zugleich Leistenden; deren rechtliche Kombination bleibt offen. Nichtleistende \u00dcberempf\u00e4nger werden mit vorhandener2056-Iteration ausgeschlossen, ohne R\u00fcckzahlung. Bereits billig bemessene2057a-Betr\u00e4ge einschlie\u00dflich Ausschlussgr\u00fcnde und Vergleichsgruppe vorgeben; SummeLeistungen h\u00f6chstens Gruppennachlass. Keine zus\u00e4tzliche2315-Anrechnung oder Pflichtteilserg\u00e4nzung.")
 ergebnis
}
