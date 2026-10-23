landpacht_verzug_zeit_und_terminvergleich <- function(verzugsbeginn_am=NULL, beginnart=NULL, prueftag=NULL, rueckstaendige_terminnummern=NULL, einordnungsnachweis=NULL) {
 beginn <- .datum(verzugsbeginn_am,'verzugsbeginn_am');tag <- .datum(prueftag,'prueftag');.text(einordnungsnachweis,'einordnungsnachweis')
 if(tag<beginn) .fehler('prueftag','Pr\u00fcftag darf nicht vor dem qualifizierten Verzugsbeginn liegen.')
 ende <- .frist(verzugsbeginn_am,3,'monate',beginnart)
 .vorhanden(rueckstaendige_terminnummern,'rueckstaendige_terminnummern')
 if(!is.list(rueckstaendige_terminnummern) || !is.null(names(rueckstaendige_terminnummern)) || length(rueckstaendige_terminnummern)>1000) .fehler('rueckstaendige_terminnummern','Liste0..1000 erforderlich.')
 nummern <- vapply(rueckstaendige_terminnummern,function(n) .ganzzahl(n,'terminnummer',1,9007199254740991),numeric(1))
 if(anyDuplicated(nummern)) .fehler('rueckstaendige_terminnummern','Termine d\u00fcrfen nicht doppelt vorkommen.')
 laengste <- 0;aktuell <- 0;vorher <- NULL
 for(nummer in sort(nummern)) {
  aktuell <- if(!is.null(vorher) && nummer-vorher==1) aktuell+1 else 1
  laengste <- max(laengste,aktuell);vorher <- nummer
 }
 wert <- list(dreimonatszeitraum_letzter_tag=.iso(ende),laenger_als_drei_monate=tag>ende,laengste_rueckstandsfolge=laengste,mindestens_zwei_aufeinanderfolgende_termine=laengste>=2)
 eingaben <- list(verzugsbeginn_am=verzugsbeginn_am, beginnart=beginnart, prueftag=prueftag, rueckstaendige_terminnummern=rueckstaendige_terminnummern, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"datum_anzahl_und_wahrheitswerte","BGB_LANDPACHT_VERZUG_ZEIT_UND_TERMINVERGLEICH",eingaben,list(list(operation="Dreimonats-Verzugslaufzeit streng vergleichen und aufeinanderfolgende qualifiziert r\u00fcckst\u00e4ndige Pachtzahlungstermine z\u00e4hlen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7594eII: Ende einer qualifizierten Dreimonats-Verzugslaufzeit und strenges \u00dcberschreiten am Pr\u00fcftag berechnen; daneben l\u00e4ngste l\u00fcckenlos aufeinanderfolgende Folge qualifiziert r\u00fcckst\u00e4ndiger Zahlungstermine z\u00e4hlen und mit2vergleichen. Keine erfundene Euro-/Prozentgrenze f\u00fcr nicht unerheblichen Teil. Beide numerischen Teilpr\u00fcfungen getrennt ausgegeben; rechtliche Fallzuordnung nach Zahlungsabschnitt sowie deren Zusammenspiel und K\u00fcndigung nicht automatisch entschieden. Terminnummern m\u00fcssen dem vollst\u00e4ndigen Kalender entsprechen, keine nachtr\u00e4gliche Neunummerierung nur r\u00fcckst\u00e4ndiger Raten. Kein k\u00fcnstlicher Neustart/Stillstand des Verzugs bei unbekannten Zahlungsvorg\u00e4ngen; Fristbeginn und kontinuierlicher Verlauf vorqualifiziert.")
 ergebnis
}
