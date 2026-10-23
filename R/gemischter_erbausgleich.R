erbteilung_gemischter_ausgleich <- function(gruppennachlass=NULL,miterben=NULL,gemischter_ausgleich_qualifiziert=NULL,bewertungsnachweis=NULL) {
 nachlass <- .geld(gruppennachlass);.vorhanden(miterben,'miterben')
 if(!is.list(miterben)||!is.null(names(miterben))||length(miterben)<2||length(miterben)>1000) .fehler('miterben','Liste2..1000 rechtlich bestimmter Mitglieder derselben Ausgleichungsgruppe erforderlich.')
 namen <- character();quoten <- list();zuwendungen <- list();leistungen <- list();quotensumme <- .bruch(0);zuwendungssumme <- .bruch(0);leistungssumme <- .bruch(0)
 for(p in miterben) {
  if(!is.list(p)||!identical(sort(names(p)),sort(c('person_id','relative_erbquote','ausgleichungswert_zuwendungen','leistungs_ausgleichsbetrag')))) .fehler('miterben','Genau person_id, relative_erbquote, ausgleichungswert_zuwendungen und leistungs_ausgleichsbetrag erforderlich.')
  name <- .text(p$person_id,'person_id');if(name %in% namen) .fehler('person_id','Jedes Gruppenmitglied nur einmal.')
  quote <- .zahleneingabe(p$relative_erbquote)
  if(.vergleichen(quote,.bruch(0))<=0||.vergleichen(quote,.bruch(1))>0) .fehler('relative_erbquote','Positive relative Quote h\u00f6chstens eins erforderlich.')
  zuwendung <- .geld(p$ausgleichungswert_zuwendungen);leistung <- .geld(p$leistungs_ausgleichsbetrag)
  namen <- c(namen,name);quoten[[length(quoten)+1L]] <- quote;zuwendungen[[length(zuwendungen)+1L]] <- zuwendung;leistungen[[length(leistungen)+1L]] <- leistung
  quotensumme <- .addieren(quotensumme,quote);zuwendungssumme <- .addieren(zuwendungssumme,zuwendung);leistungssumme <- .addieren(leistungssumme,leistung)
 }
 if(.vergleichen(quotensumme,.bruch(1))!=0) .fehler('relative_erbquote','Relative Quoten derselben Ausgleichungsgruppe m\u00fcssen zusammen eins ergeben.')
 if(.vergleichen(leistungssumme,nachlass)>0) .fehler('leistungs_ausgleichsbetrag','Leistungssumme \u00fcber zugeordnetem Nachlass au\u00dferhalb dieses Modells; Billigkeitsbewertung zun\u00e4chst kl\u00e4ren.')
 .wahrheitswert(gemischter_ausgleich_qualifiziert,'gemischter_ausgleich_qualifiziert');.text(bewertungsnachweis,'bewertungsnachweis')
 masse <- .addieren(.subtrahieren(nachlass,leistungssumme),zuwendungssumme)
 betraege <- lapply(seq_along(namen),function(i) .addieren(.subtrahieren(.multiplizieren(masse,quoten[[i]]),zuwendungen[[i]]),leistungen[[i]]))
 negativ <- any(vapply(betraege,function(b) .vergleichen(b,.bruch(0))<0,logical(1)))
 eingaben <- list(gruppennachlass=gruppennachlass,miterben=miterben,gemischter_ausgleich_qualifiziert=gemischter_ausgleich_qualifiziert,bewertungsnachweis=bewertungsnachweis)
 wert <- NULL
 if(gemischter_ausgleich_qualifiziert && !negativ) wert <- list(gemischte_rechenmasse=.bruchteile(masse),zuteilungen=lapply(seq_along(namen),function(i) list(person_id=namen[[i]],erbteil_nach_gemischtem_ausgleich=.bruchteile(betraege[[i]]))))
 ergebnis <- .ergebnis(wert,'EUR','BGB_ERBTEILUNG_GEMISCHTER_AUSGLEICH',eingaben,list(list(operation='N\u2212SummeLeistungen+SummeZuwendungen; je Mitglied mit relativer Quote multiplizieren\u2212eigeneZuwendung+eigeneLeistung')),eingaben)
 ergebnis$status <- if(!is.null(wert)) 'BERECHNET' else 'NICHT_ANWENDBAR'
 ergebnis$annahmen <- list("Dieselbe vollst\u00e4ndige rechtlich bestimmte Ausgleichungsgruppe f\u00fcr Zuwendungen und Leistungen; qualifizierte Werte auf zutreffender Bewertungsbasis.")
 ergebnis$hinweise <- list("Leistungswerte2057aIII sind rechtlich billig bemessene, bereits um Ausschl\u00fcsse2057aII bereinigte Eingaben; keine erfundene Pflegeverg\u00fctung. Zuwendungswerte2055II rechtlich bewertet. Rechenreihenfolge: Leistungssumme aus Gruppennachlass abziehen, Zuwendungssumme hinzuf\u00fcgen, quotieren, individuelle Zuwendung abziehen und Leistung hinzuf\u00fcgen. Endbetr\u00e4ge ergeben zusammen Gruppennachlass. Sobald ein individueller Endbetrag negativ wird, NICHT_ANWENDBAR: kombinierte2056-Mehrempfangausscheidung ist nicht durch einfache Nullkappung oder ungepr\u00fcfte Iteration gel\u00f6st. Kein Ersatz zwischen verschiedenen Ausgleichungsgruppen, keine automatische Gruppe/Erbenstatuswahl oder Pflichtteilsanrechnung.")
 ergebnis
}
pflichtteil_gemischte_ausgleichung <- function(gruppennachlass=NULL,miterben=NULL,berechtigter_id=NULL,zugleich_anrechenbarer_zuwendungswert=NULL,hinterlassener_erbteilwert=NULL,fall_nach_2316_qualifiziert=NULL,bewertungsnachweis=NULL) {
 name <- .text(berechtigter_id,'berechtigter_id');anrechnung <- .geld(zugleich_anrechenbarer_zuwendungswert);hinterlassen <- .geld(hinterlassener_erbteilwert)
 .wahrheitswert(fall_nach_2316_qualifiziert,'fall_nach_2316_qualifiziert');teilung <- erbteilung_gemischter_ausgleich(gruppennachlass,miterben,TRUE,bewertungsnachweis)
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
 ergebnis <- .ergebnis(wert,'EUR','BGB_PFLICHTTEIL_GEMISCHTE_AUSGLEICHUNG',eingaben,list(list(operation='Gemischte hypothetische Zuteilung halbieren; halbe zugleich2315-anrechenbare Zuwendung abziehen, mindestens null; positiven Mehrbetrag bestimmen')),eingaben)
 ergebnis$status <- if(!is.null(wert)) 'BERECHNET' else 'NICHT_ANWENDBAR'
 ergebnis$annahmen <- list("Hypothetische gesetzliche Ausgleichungsgruppe nach2316 einschlie\u00dflich Erbverzichtsausschluss und Ausstattungsschutz rechtlich qualifiziert.")
 ergebnis$hinweise <- list("Grenzen des gemischten Teilungskerns gelten: negative individuelle Zuteilung ergibt NICHT_ANWENDBAR, keine ungekl\u00e4rte2056-Mischfalliteration. Doppelanrechnungswert ist bereits in eigener Ausgleichungsposition enthalten und auf derselben Wertgrundlage bestimmt; keine weiteren reinen2315-Zuwendungen,2325-Erg\u00e4nzung oder Verm\u00e4chtnisanrechnung. F\u00fcr enterbten Berechtigten hinterlassenen Erbteil null, sonst rechtlich ma\u00dfgeblichen Wert eingeben. Mehrbetrag2316II h\u00e4ngt nicht von nomineller Halbquote ab.")
 ergebnis
}
