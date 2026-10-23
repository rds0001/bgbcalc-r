fortgesetzte_guetergemeinschaft_vorempfangsausgleich <- function(abkoemmlings_teilungsmasse=NULL,abkoemmlinge=NULL,bewertungsnachweis=NULL) {
  .geld(abkoemmlings_teilungsmasse);.text(bewertungsnachweis,"bewertungsnachweis");.vorhanden(abkoemmlinge,"abkoemmlinge")
  if (!is.list(abkoemmlinge) || !is.null(names(abkoemmlinge)) || length(abkoemmlinge)<1 || length(abkoemmlinge)>1000) .fehler("abkoemmlinge","Liste mit 1 bis 1000 qualifizierten Abk\u00f6mmlingen erforderlich.")
  gruppe <- list();reste <- list()
  for (person in abkoemmlinge) {
    if (!is.list(person) || !identical(sort(names(person)),sort(c("person_id","erbquote_zaehler","erbquote_nenner","vorempfangswert","bereits_ausgeglichener_vorempfangswert")))) .fehler("abkoemmlinge","Genau person_id, erbquote_zaehler, erbquote_nenner, vorempfangswert und bereits_ausgeglichener_vorempfangswert erforderlich.")
    wert <- .geld(person$vorempfangswert);ausgeglichen <- .geld(person$bereits_ausgeglichener_vorempfangswert)
    if (.vergleichen(ausgeglichen,wert)>0) .fehler("bereits_ausgeglichener_vorempfangswert","Bereits ausgeglichener Teil darf den Vorempfangswert nicht \u00fcbersteigen.")
    rest <- .bruchteile(.subtrahieren(wert,ausgeglichen))
    gruppe[[length(gruppe)+1L]] <- list(person_id=person$person_id,erbquote_zaehler=person$erbquote_zaehler,erbquote_nenner=person$erbquote_nenner,ausgleichungswert=rest)
    reste[[length(reste)+1L]] <- list(person_id=person$person_id,verbleibender_ausgleichungswert=rest)
  }
  kern <- erb_zuwendungen_ausgleichen(abkoemmlings_teilungsmasse,gruppe,TRUE,bewertungsnachweis)
  eingaben <- list(abkoemmlings_teilungsmasse=abkoemmlings_teilungsmasse,abkoemmlinge=abkoemmlinge,bewertungsnachweis=bewertungsnachweis)
  ergebnis <- .ergebnis(list(verbleibende_vorempfaenge=reste,verteilung=kern$wert$verteilung,ausser_ansatz=kern$wert$ausser_ansatz),"EUR","BGB_FORTGESETZTE_GUETERGEMEINSCHAFT_VOREMPFANGSAUSGLEICH",eingaben,c(list(list(operation="Bereits ausgeglichene Vorempfangsteile auf gleicher Wertbasis abziehen; verbleibende Werte im vorhandenen Ausgleichungskern nach\u00a7\u00a72055/2056 einschlie\u00dflich \u00dcberempfangausschluss verteilen.")),kern$rechenschritte),eingaben)
  ergebnis$hinweise <- list("\u00a71503II mit\u00a7\u00a72055/2056: vollst\u00e4ndige rechtlich qualifizierte Ausgleichungsgruppe und relative positive Quoten innerhalb dieser Gruppe mit Summe eins. Teilungsmasse ist ausschlie\u00dflich der dieser Gruppe zufallende bereinigte Abk\u00f6mmlingsbetrag, nicht das gesamte Gesamtgut; Halbierung und andere Lasten davor gesondert bestimmen. Vorempfangswert und bereits bei der Nachlassteilung ausgeglichener Teil auf identischer ma\u00dfgeblicher Bewertungsbasis vorgeben; bereits ausgeglichener Teil ist kein fr\u00fcherer Auszahlungsbetrag und kein nach freier Wahl verrechneter Vorteil. Die rechtliche Ausgleichungspflicht und wertm\u00e4\u00dfige Abgrenzung/Indexierung werden nicht ermittelt. Keine erneute Anrechnung desselben Vorempfangs. Qualifizierte einfache Ausgleichungsgruppe; St\u00e4mme, Nachfolgezuordnungen, Leistungsausgleich\u00a72057a und abweichende Anordnungen nicht automatisch modelliert. \u00a71503III beg\u00fcnstigtenbezogene Abfindungslasten sind hier nicht verteilt. Ausgeschlossene \u00dcberempf\u00e4nger zahlen nach\u00a72056 den Mehrbetrag nicht zur\u00fcck.")
  ergebnis
}
