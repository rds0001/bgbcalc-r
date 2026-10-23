schuldrecht_vertragsdauergrenze <- function(regelfall=NULL,vertragsbeginn_am=NULL,vertragsende_am=NULL,dauernachweis=NULL) {
 .auswahl(regelfall,'regelfall',c('teilzeitwohnrecht_481','urlaubsprodukt_481a','landpacht_textform_585a','landpacht_fortsetzung_594'))
 beginn <- .datum(vertragsbeginn_am,'vertragsbeginn_am');unbegrenzt <- identical(vertragsende_am,'unbegrenzt_verlaengerbar')
 if(unbegrenzt && !regelfall %in% c('teilzeitwohnrecht_481','urlaubsprodukt_481a')) .fehler('vertragsende_am','Unbegrenzte Verlaengerung nur fuer481/481a verwenden.')
 ende <- if(unbegrenzt) NULL else .datum(vertragsende_am,'vertragsende_am');.text(dauernachweis,'dauernachweis')
 if(!unbegrenzt && ende<beginn) .fehler('vertragsende_am','Vertragsende darf nicht vor Vertragsbeginn liegen.')
 jahre <- if(regelfall=='landpacht_fortsetzung_594') 3 else if(regelfall=='landpacht_textform_585a') 2 else 1
 grenze <- .frist(vertragsbeginn_am,jahre,'jahre','tagesbeginn');streng <- regelfall!='landpacht_fortsetzung_594'
 eingaben <- list(regelfall=regelfall,vertragsbeginn_am=vertragsbeginn_am,vertragsende_am=vertragsende_am,dauernachweis=dauernachweis)
 wert <- list(grenzdauer_jahre=jahre,ende_der_grenzdauer=.iso(grenze),vergleich=if(streng) 'mehr_als' else 'mindestens',dauergrenze_erfuellt=if(unbegrenzt) TRUE else if(streng) ende>grenze else ende>=grenze)
 ergebnis <- .ergebnis(wert,'datum_und_wahrheitswert','BGB_SCHULDRECHT_VERTRAGSDAUERGRENZE',eingaben,list(list(operation='Grenzdauer ab Tagesbeginn berechnen; inklusives Vertragsende streng mit Ein-/Zweijahresende oder einschlie\u00dflich mit Dreijahresende vergleichen.')),eingaben)
 ergebnis$hinweise <- list("Nur numerischer Dauervergleich, keine vollstaendige Vertragsqualifikation oder Formentscheidung. Beginn als rechtlich massgeblicher Tagesbeginn und endlichen letzten Vertragstag einschliesslich Tagesablauf vorgeben. Bei481/481a saemtliche rechtlich vorgesehenen Verlaengerungsmoeglichkeiten beruecksichtigen. Ein endlich bestimmbares maximales Enddatum kann auch aus gestaffelten oder alternativen Optionen stammen; kein automatisches Lesen beliebiger Vertragsklauseln. Nur bei481/481a bezeichnet vertragsende_am=unbegrenzt_verlaengerbar eine rechtlich qualifizierte ohne endliche Gesamtgrenze wiederholbare Verlaengerungsmoeglichkeit: die Einjahresgrenze ist dann ueberschreitbar und damit erfuellt, ohne ein fiktives Enddatum zu erfinden. Nicht gleichbedeutend mit unbekanntem Enddatum oder blosser Unklarheit der Vertragsauslegung. Bei585aTextform und bei594Anfrage/Ablehnungsfrist gesondert. Untertaegige Laufzeiten gesondert qualifizieren.")
 ergebnis
}
