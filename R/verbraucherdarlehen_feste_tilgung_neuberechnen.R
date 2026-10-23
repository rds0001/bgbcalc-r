verbraucherdarlehen_feste_tilgung_neuberechnen <- function(anfangskapital=NULL, korrigierter_sollzinssatz=NULL, teilzahlungen=NULL, plannachweis=NULL) {
 rest <- .geld(anfangskapital);satz <- .zahleneingabe(korrigierter_sollzinssatz);.text(plannachweis,'plannachweis');.vorhanden(teilzahlungen,'teilzahlungen')
 if(!is.list(teilzahlungen)||!is.null(names(teilzahlungen))||length(teilzahlungen)<1||length(teilzahlungen)>1000) .fehler('teilzahlungen','Chronologische Liste1..1000erforderlich.')
 namen <- character();zeilen <- list();zinsgesamt <- .bruch(0);kostengesamt <- .bruch(0);wegfallgesamt <- .bruch(0);gesamt <- .bruch(0)
 for(p in teilzahlungen) {
  if(!is.list(p)||length(p)!=5||!setequal(names(p),c('zahlung_id','kapitaltilgung','jahresanteil','vereinbarte_kosten','nicht_geschuldete_kosten'))) .fehler('teilzahlungen','Vollst\u00e4ndige Teilzahlungsfelder erforderlich.')
  name <- .text(p$zahlung_id,'zahlung_id');tilgung <- .geld(p$kapitaltilgung);zeit <- .geld(p$jahresanteil);kosten <- .geld(p$vereinbarte_kosten);wegfall <- .geld(p$nicht_geschuldete_kosten)
  if(name %in% namen) .fehler('zahlung_id','Jede Zahlung nur einmal.')
  if(.vergleichen(tilgung,rest)>0||.vergleichen(wegfall,kosten)>0) .fehler('teilzahlungen','Tilgung \u00fcbersteigt Restkapital oder Kostenwegfall \u00fcbersteigt Kosten.')
  namen <- c(namen,name);anfang <- rest;zins <- .multiplizieren(.multiplizieren(anfang,satz),zeit);geschuldet <- .subtrahieren(kosten,wegfall);rate <- .addieren(.addieren(tilgung,zins),geschuldet);rest <- .subtrahieren(rest,tilgung)
  zinsgesamt <- .addieren(zinsgesamt,zins);kostengesamt <- .addieren(kostengesamt,geschuldet);wegfallgesamt <- .addieren(wegfallgesamt,wegfall);gesamt <- .addieren(gesamt,rate)
  zeilen[[length(zeilen)+1]] <- list(zahlung_id=name,anfangssaldo=.bruchteile(anfang),kapitaltilgung=.bruchteile(tilgung),zinsbetrag=.bruchteile(zins),geschuldete_kosten=.bruchteile(geschuldet),neue_teilzahlung=.bruchteile(rate),restkapital=.bruchteile(rest))
 }
 if(.vergleichen(rest,.bruch(0))!=0) .fehler('teilzahlungen','Vollst\u00e4ndiger Tilgungsplan muss das Anfangskapital tilgen.')
 wert <- list(teilzahlungen=zeilen,zinsgesamtbetrag=.bruchteile(zinsgesamt),geschuldete_kosten_gesamt=.bruchteile(kostengesamt),entfallene_kosten_gesamt=.bruchteile(wegfallgesamt),neuer_gesamtbetrag=.bruchteile(gesamt),restkapital=.bruchteile(rest))
 eingaben <- list(anfangskapital=anfangskapital, korrigierter_sollzinssatz=korrigierter_sollzinssatz, teilzahlungen=teilzahlungen, plannachweis=plannachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_VERBRAUCHERDARLEHEN_FESTE_TILGUNG_NEUBERECHNEN",eingaben,list(list(operation="Kapitalsalden aus festen Tilgungen fortschreiben; korrigierte Abschnittszinsen und verbleibende Kosten zur neuen Teilzahlung addieren.")),eingaben)
 ergebnis$hinweise <- list("494V mit vertraglich unver\u00e4nderten festen Kapitaltilgungen: jeden Anfangssaldo aus Anfangskapital und vorherigen Tilgungen selbst fortschreiben; Zins=Anfangssaldo*korrigierte Jahresquote*Jahresanteil, geschuldete Kosten=vereinbart-nichtgeschuldet, neue Teilzahlung=Tilgung+Zins+geschuldete Kosten. Summe der Tilgungen muss das Anfangskapital vollst\u00e4ndig decken; keine \u00dcbertilgung. Negative mathematische Zinsen/Teilzahlungen sichtbar, keine automatische Zahlungspflicht des Darlehensgebers. Keine eigenst\u00e4ndige gesetzliche Annuit\u00e4tenannahme: Vertr\u00e4ge mit gleichbleibender Gesamtrate oder ver\u00e4ndertem Tilgungsverlauf werden hier nicht in feste Kapitaltilgungen umgedeutet. Jahresanteile und Vertragsstruktur m\u00fcssen belegt sein; keine Effektivzinsberechnung, keine automatische Rundung, keine Zins-/Kostenkapitalisierung. Rechtliche Folgen494II/III separat in vorhandenen Zinsfunktionen berechnen.")
 ergebnis
}
