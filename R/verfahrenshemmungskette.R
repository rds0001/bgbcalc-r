verjaehrung_verfahrenshemmungskette <- function(fristlauf_erster_tag=NULL,grundfrist_letzter_tag=NULL,verfahrensabschnitte=NULL,einordnungsnachweis=NULL) {
  .datum(fristlauf_erster_tag,'fristlauf_erster_tag');.datum(grundfrist_letzter_tag,'grundfrist_letzter_tag')
  .vorhanden(verfahrensabschnitte,'verfahrensabschnitte')
  if (!is.list(verfahrensabschnitte) || length(verfahrensabschnitte)>10000 || !is.null(names(verfahrensabschnitte))) .fehler('verfahrensabschnitte','Liste mit h\u00f6chstens10000 abgeschlossenen Verfahrensabschnitten erforderlich.')
  .text(einordnungsnachweis,'einordnungsnachweis')
  intervalle <- list()
  for (abschnitt in verfahrensabschnitte) {
    if (!is.list(abschnitt) || length(abschnitt)!=3 || !setequal(names(abschnitt),c('hemmungsbeginn_am','nachlaufereignis_am','nachlaufgrund'))) .fehler('verfahrensabschnitte','Genau hemmungsbeginn_am, nachlaufereignis_am und nachlaufgrund erforderlich.')
    beginn <- .datum(abschnitt$hemmungsbeginn_am,'hemmungsbeginn_am');ereignis <- .datum(abschnitt$nachlaufereignis_am,'nachlaufereignis_am')
    .auswahl(abschnitt$nachlaufgrund,'nachlaufgrund',c('rechtskraeftige_entscheidung','anderweitige_beendigung','stillstand_letzte_verfahrenshandlung'))
    if (ereignis < beginn) .fehler('verfahrensabschnitte','Nachlaufereignis darf nicht vor Beginn desselben Hemmungsabschnitts liegen.')
    ende <- .frist(abschnitt$nachlaufereignis_am,6,'monate','ereignis')
    intervalle[[length(intervalle)+1]] <- list(erster_gehemmter_tag=.iso(beginn),letzter_gehemmter_tag=.iso(ende))
  }
  kern <- verjaehrung_gehemmte_kalendertage(fristlauf_erster_tag,grundfrist_letzter_tag,intervalle,TRUE)
  eingaben <- list(fristlauf_erster_tag=fristlauf_erster_tag,grundfrist_letzter_tag=grundfrist_letzter_tag,verfahrensabschnitte=verfahrensabschnitte,einordnungsnachweis=einordnungsnachweis)
  ergebnis <- .ergebnis(kern$wert,'datum_und_tage','BGB_VERJAEHRUNG_VERFAHRENSHEMMUNGSKETTE',eingaben,c(list(list(operation='Je qualifiziertem Abschnitt sechs Monate Nachlauf berechnen; Anfangs-/Weiterbetriebsintervalle ohne Doppelz\u00e4hlung mit vorhandenem209-Kern verrechnen.')),kern$rechenschritte),eingaben)
  ergebnis$hinweise <- list('\u00a7204Absatz2: Beginn des ersten Abschnitts ist rechtlich wirksamer Hemmungsbeginn; nach Stillstand ist Beginn des n\u00e4chsten Abschnitts das qualifizierte Weiterbetreiben durch eine Partei. Stillstandsereignis ist letzte ma\u00dfgebliche Verfahrenshandlung, nicht beliebiger sp\u00e4terer Beobachtungstag. Vollst\u00e4ndige abgeschlossene Abschnitte und auf ganze Kalendertage normalisierte Grenzen erforderlich. Nachl\u00e4ufe k\u00f6nnen sich \u00fcberschneiden; \u00dcberlappungen z\u00e4hlen nur einmal. Zwischen Abschnitten l\u00e4uft die Frist weiter; bereits eingetretene Verj\u00e4hrung wird nicht wiederbelebt. Kein endlos laufendes Verfahren mit k\u00fcnstlichem Enddatum eingeben. Keine automatische Qualifikation von Zustellung, Rechtskraft, Stillstand oder Weiterbetreiben. Besondere Fristen nach204Absatz1/3, weitere Hemmungen, Neubeginn und193 gesondert.')
  ergebnis
}
