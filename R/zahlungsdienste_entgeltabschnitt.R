zahlungsdienste_entgeltabschnitt <- function(abschnitt_von_utc=NULL, abschnitt_bis_utc=NULL, beendigung_utc=NULL, abschnittsentgelt=NULL, vorausgezahltes_entgelt=NULL, einordnungsnachweis=NULL) {
 von <- .reise_utc_zeitpunkt(abschnitt_von_utc,'abschnitt_von_utc');bis <- .reise_utc_zeitpunkt(abschnitt_bis_utc,'abschnitt_bis_utc');ende <- .reise_utc_zeitpunkt(beendigung_utc,'beendigung_utc');.text(einordnungsnachweis,'einordnungsnachweis')
 preis <- .geld(abschnittsentgelt);zahlung <- .geld(vorausgezahltes_entgelt)
 if(bis<=von) .fehler('abschnitt_bis_utc','Abschnitt muss positive Dauer haben.')
 if(.vergleichen(zahlung,preis)>0) .fehler('vorausgezahltes_entgelt','Vorauszahlung darf Abschnittsentgelt nicht uebersteigen.')
 gesamt <- as.numeric(difftime(bis,von,units='secs'));vor <- max(0,min(gesamt,as.numeric(difftime(ende,von,units='secs'))))
 quote <- .bruch(vor,gesamt)
 wert <- list(sekunden_gesamt=gesamt,sekunden_bis_beendigung=vor,geschuldeter_zeitanteil=.bruchteile(quote),geschuldetes_entgelt=.bruchteile(.multiplizieren(preis,quote)),erstattungsbetrag=.bruchteile(.multiplizieren(zahlung,.bruch(gesamt-vor,gesamt))))
 eingaben <- list(abschnitt_von_utc=abschnitt_von_utc, abschnitt_bis_utc=abschnitt_bis_utc, beendigung_utc=beendigung_utc, abschnittsentgelt=abschnittsentgelt, vorausgezahltes_entgelt=vorausgezahltes_entgelt, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"sekunden_quote_und_eur","BGB_ZAHLUNGSDIENSTE_ENTGELTABSCHNITT",eingaben,list(list(operation="Halb offenen Entgeltabschnitt am Beendigungszeitpunkt schneiden; Zeitanteile exakt bestimmen und Entgelt sowie Vorauszahlung proportional abrechnen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7675hIII: Entgelt nur bis zur Beendigung; auf danach entfallende Zeit zugeordnete Vorauszahlung erstatten. Berechnung unter ausdr\u00fccklich rechtlich bestimmter gleichm\u00e4\u00dfiger Zeitbewertung in Sekunden; keine automatische Wahl einer Vertrags-/Tageskonvention. Abweichend bewertete Preisperioden getrennt normalisieren und abrechnen. Halb offene Intervalle verhindern doppelte Grenzsekunden. Standardbibliotheken und vorhandener UTC-Parser, keine neue Datumsbibliothek; keine stillschweigende Zeitzone oder Rundung von Subsekunden. Vertragswirksamkeit, zul\u00e4ssige K\u00fcndigungsfrist675hI/II und EntgeltverbotIV separat; kein K\u00fcndigungsentgelt erg\u00e4nzen. Geschuldetes Entgelt und R\u00fcckerstattung nicht als zwei zus\u00e4tzliche Anspr\u00fcche zusammenz\u00e4hlen.")
 ergebnis
}
