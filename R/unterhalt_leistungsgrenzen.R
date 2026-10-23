unterhalt_anteile_mit_leistungsgrenzen <- function(verteilbarer_barunterhalt=NULL, unterhaltspflichtige=NULL, verteilungsnachweis=NULL) {
 bedarf <- .geld(verteilbarer_barunterhalt);.text(verteilungsnachweis,'verteilungsnachweis');.vorhanden(unterhaltspflichtige,'unterhaltspflichtige')
 if(!is.list(unterhaltspflichtige)||!is.null(names(unterhaltspflichtige))||length(unterhaltspflichtige)<1L||length(unterhaltspflichtige)>1000L) .fehler('unterhaltspflichtige','Liste1..1000 qualifizierter gleich naher Pflichtiger erforderlich.')
 namen <- character();gewichte <- list();grenzen <- list();summe <- .bruch(0)
 for(person in unterhaltspflichtige) {
  if(!is.list(person)||is.null(names(person))||length(person)!=3L||!setequal(names(person),c('person_id','verteilungsgewicht','leistungsfaehiger_hoechstbetrag'))) .fehler('unterhaltspflichtige','Genau person_id, verteilungsgewicht und leistungsfaehiger_hoechstbetrag erforderlich.')
  name <- .text(person$person_id,'person_id');gewicht <- .geld(person$verteilungsgewicht)
  if(name %in% namen||.vergleichen(gewicht,.bruch(0))<=0) .fehler('unterhaltspflichtige','Eindeutige Kennungen und positive qualifizierte Gewichte erforderlich.')
  namen <- c(namen,name);gewichte[[length(gewichte)+1L]] <- gewicht;grenzen[[length(grenzen)+1L]] <- .geld(person$leistungsfaehiger_hoechstbetrag);summe <- .addieren(summe,gewicht)
 }
 zuordnung <- .begrenzte_quotenverteilung(bedarf,gewichte,grenzen)
 wert <- list(verteilung=lapply(seq_along(namen),function(i) list(person_id=namen[i],ungekuerzter_anteil=.bruchteile(.multiplizieren(bedarf,.dividieren(gewichte[[i]],summe))),beibringbarer_unterhaltsbetrag=.bruchteile(zuordnung$zugeordnet[[i]]))),gesamt_beibringbar=.bruchteile(.subtrahieren(bedarf,zuordnung$rest)),ungedeckter_barunterhalt=.bruchteile(zuordnung$rest))
 eingaben <- list(verteilbarer_barunterhalt=verteilbarer_barunterhalt, unterhaltspflichtige=unterhaltspflichtige, verteilungsnachweis=verteilungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_UNTERHALT_ANTEILE_MIT_LEISTUNGSGRENZEN",eingaben,list(list(operation="Qualifizierten Barunterhalt mit vorhandenem begrenztem Quotenkern nach Gewichten unter individuellen Leistungsgrenzen verteilen und ungedeckten Rest ausweisen.")),eingaben)
 ergebnis$hinweise <- list("\u00a71606III1 mit rechtlich bestimmten1603-Leistungsgrenzen: proportionaler Barunterhaltsanteil f\u00fcr einen Berechtigten; bei Begrenzung verbleibenden Bedarf im ausdr\u00fccklich qualifizierten Modell nach relativen Gewichten der \u00fcbrigen Pflichtigen nachverteilen. Keine automatisch vorausgesetzte einheitliche Methode f\u00fcr s\u00e4mtliche Unterhalts-Mangelf\u00e4lle. Eingaben enthalten bereits passende Selbstbehalte, Belastungen, Rang- und Bewertungsentscheidungen; keine Tabelle oder Einkommensbereinigung erfinden. Gewichte/Grenzen m\u00fcssen f\u00fcr diesen Bedarf und s\u00e4mtliche Nachverteilungsschritte rechtlich gelten. \u00c4ndert sich dadurch die rechtliche Berechnungsbasis, ist diese au\u00dferhalb neu zu bestimmen. Mehrere Berechtigte, konkurrierende1609-R\u00e4nge, gesteigerte1603II-Gesamtmittelaufteilung, Wechselmodell, Naturalunterhalt und subsidi\u00e4re1607-Haftung nicht automatisch kombiniert. Ergebnis ungedeckter Bedarf ist kein Erlass oder automatischer Anspruch gegen weitere Personen. Keine Cent-Rundung.")
 ergebnis
}
