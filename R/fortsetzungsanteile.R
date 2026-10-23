fortgesetzte_guetergemeinschaft_grundanteile <- function(teilungswert_gesamtgut=NULL,abkoemmlinge=NULL,quotennachweis=NULL) {
  gut <- .geld(teilungswert_gesamtgut)
  .vorhanden(abkoemmlinge,"abkoemmlinge")
  if (!is.list(abkoemmlinge) || length(abkoemmlinge)<1 || length(abkoemmlinge)>1000 || !is.null(names(abkoemmlinge))) .fehler("abkoemmlinge","Liste mit 1 bis 1000 qualifizierten anteilsberechtigten Abk\u00f6mmlingen erforderlich.")
  namen <- character(); quoten <- list(); summe <- .bruch(0)
  for (eintrag in abkoemmlinge) {
    if (!is.list(eintrag) || length(eintrag)!=2 || !setequal(names(eintrag),c("abkoemmling_id","hypothetischer_erbteil"))) .fehler("abkoemmlinge","Genau abkoemmling_id und hypothetischer_erbteil erforderlich.")
    name <- .text(eintrag$abkoemmling_id,"abkoemmling_id")
    if (name %in% namen) .fehler("abkoemmling_id","Abk\u00f6mmling nicht mehrfach auff\u00fchren.")
    .vorhanden(eintrag$hypothetischer_erbteil,"hypothetischer_erbteil")
    quote <- .zahleneingabe(eintrag$hypothetischer_erbteil)
    if (.vergleichen(quote,.bruch(0))<=0 || .vergleichen(quote,.bruch(1))>0) .fehler("hypothetischer_erbteil","Qualifizierter Erbteil muss positiv und h\u00f6chstens eins sein.")
    namen <- c(namen,name); quoten[[length(quoten)+1]] <- quote; summe <- .addieren(summe,quote)
  }
  if (.vergleichen(summe,.bruch(1))>0) .fehler("abkoemmlinge","Hypothetische gesetzliche Erbteile d\u00fcrfen zusammen eins nicht \u00fcberschreiten.")
  .text(quotennachweis,"quotennachweis")
  haelfte <- .dividieren(gut,.bruch(2)); anteile <- list()
  for (i in seq_along(namen)) {
    relativ <- .dividieren(quoten[[i]],summe); gesamtquote <- .dividieren(relativ,.bruch(2)); wert <- .multiplizieren(haelfte,relativ)
    anteile[[i]] <- list(abkoemmling_id=namen[[i]],anteil_abkoemmlingshaelfte=.bruchteile(relativ),anteil_gesamtgut=.bruchteile(gesamtquote),grundanteilswert=.bruchteile(wert),pflichtteilswertbasis=.bruchteile(.dividieren(wert,.bruch(2))))
  }
  eingaben <- list(teilungswert_gesamtgut=teilungswert_gesamtgut,abkoemmlinge=abkoemmlinge,quotennachweis=quotennachweis)
  ergebnis <- .ergebnis(list(ehegattenhaelfte=.bruchteile(haelfte),abkoemmlingshaelfte=.bruchteile(haelfte),abkoemmlingsanteile=anteile),"EUR","BGB_FORTGESETZTE_GUETERGEMEINSCHAFT_GRUNDANTEILE",eingaben,list(list(operation="Gesamtgutswert halbieren; Abk\u00f6mmlingsh\u00e4lfte nach relativ normalisierten hypothetischen gesetzlichen Erbteilen verteilen; jeweilige Pflichtteilswertbasis nochmals halbieren.")),eingaben)
  ergebnis$hinweise <- list("Grundanteile nach\u00a71503I und reine Wertbasis nach\u00a71505. Vollst\u00e4ndiger qualifizierter Kreis anteilsberechtigter Abk\u00f6mmlinge; hypothetische gesetzliche Erbfolge beim gedachten Tod des verstorbenen Ehegatten erst zur Beendigung der fortgesetzten G\u00fctergemeinschaft, nicht tats\u00e4chlicher urspr\u00fcnglicher Erbfall. Relative Quoten k\u00f6nnen zusammen unter eins liegen und werden innerhalb der Abk\u00f6mmlingsgruppe normalisiert. Teilungswert nach vorrangiger Verbindlichkeiten-/R\u00fcckbehaltsbereinigung vorgegeben. Abfindungseinrechnung\u00a71501, Vorempfangsausgleich\u00a71503II, Lastenzuordnung\u00a71503III und abweichende Vereinbarungen nicht berechnet; bei deren Eingreifen keine abschlie\u00dfenden Auszahlungsbetr\u00e4ge. Pflichtteilswertbasis ist kein fertiger Erg\u00e4nzungsanspruch; Schenkungshinzurechnungen, Abschmelzung und Anrechnungen gesondert.")
  ergebnis
}
