gesellschaft_anteil_nach_bestandswechsel <- function(bisheriger_anteil=NULL,wechselanteil=NULL,wechselart=NULL,einordnungsnachweis=NULL) {
 alt <- .zahleneingabe(bisheriger_anteil); wechsel <- .zahleneingabe(wechselanteil)
 .auswahl(wechselart,'wechselart',c('ausscheiden','eintritt')); .text(einordnungsnachweis,'einordnungsnachweis')
 if(.vergleichen(alt,.bruch(0))<0 || .vergleichen(alt,.bruch(1))>0 || .vergleichen(wechsel,.bruch(0))<0 || .vergleichen(wechsel,.bruch(1))>0) .fehler('anteile','Anteile m\u00fcssen zwischen null und eins liegen.')
 rest <- .subtrahieren(.bruch(1),wechsel)
 if(wechselart=='ausscheiden') {
  if(.vergleichen(rest,.bruch(0))==0 || .vergleichen(.addieren(alt,wechsel),.bruch(1))>0) .fehler('wechselanteil','Ausscheidender Anteil kleiner eins und Summe mit verbleibendem Einzelanteil h\u00f6chstens eins erforderlich.')
  neu <- .dividieren(alt,rest)
 } else neu <- .multiplizieren(alt,rest)
 eingaben <- list(bisheriger_anteil=bisheriger_anteil,wechselanteil=wechselanteil,wechselart=wechselart,einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(.bruchteile(neu),'quote','BGB_GESELLSCHAFT_ANTEIL_NACH_BESTANDSWECHSEL',eingaben,list(list(operation='Ausscheiden: alter Anteil/(1-ausscheidender Anteil); Eintritt: alter Anteil*(1-neuer Anteil).')),eingaben)
 ergebnis$hinweise <- list("Nur qualifizierter Zweifelsfall des \u00a7712 ohne abweichende Vereinbarung. Ergebnis betrifft einen verbleibenden bisherigen Gesellschafter. wechselanteil bei Ausscheiden ist bisheriger Anteil des ausscheidenden Gesellschafters; bei Eintritt der rechtlich bestimmte neue Endanteil des Eintretenden. Alte Anteile zuvor vollst\u00e4ndig auf eins normieren. Ein Wechsel je Rechnung; gleichzeitige Ein-/Austritte rechtlich ordnen, nicht blind nacheinander fortschreiben. Ausscheiden des alleinigen Inhabers und rechtlicher \u00dcbergang auf einen letzten Gesellschafter nach \u00a7712a gesondert pr\u00fcfen; keine Aussage zum Fortbestand der Gesellschaft. Nicht Abfindung oder pers\u00f6nliche Haftung.")
 ergebnis
}
