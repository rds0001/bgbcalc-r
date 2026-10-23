auslobung_belohnungsanteil <- function(gesamtbelohnung=NULL,verteilungsart=NULL,anzahl_berechtigte=NULL,anteil_zaehler=NULL,anteil_nenner=NULL,verteilungsnachweis=NULL) {
 .auswahl(verteilungsart,'verteilungsart',c('gleichzeitige_handlung','gleiche_preiswuerdigkeit','mitwirkungsanteil'))
 .text(verteilungsnachweis,'verteilungsnachweis')
 if(verteilungsart=='mitwirkungsanteil') {
  if(!is.null(anzahl_berechtigte)) .fehler('anzahl_berechtigte','Bei vorgegebenem Mitwirkungsanteil keine ungenutzte Personenzahl eingeben.')
  betrag <- .teilbetrag(gesamtbelohnung,anteil_zaehler,anteil_nenner)
 } else {
  .ganzzahl(anzahl_berechtigte,'anzahl_berechtigte',2,9007199254740991)
  if(!is.null(anteil_zaehler)||!is.null(anteil_nenner)) .fehler('anteil','Gleichverteilung nicht mit vorgegebenen Anteilen vermischen.')
  betrag <- .teilbetrag(gesamtbelohnung,1,anzahl_berechtigte)
 }
 eingaben <- list(gesamtbelohnung=gesamtbelohnung,verteilungsart=verteilungsart,anzahl_berechtigte=anzahl_berechtigte,anteil_zaehler=anteil_zaehler,anteil_nenner=anteil_nenner,verteilungsnachweis=verteilungsnachweis)
 ergebnis <- .geld_ergebnis(betrag,'BGB_AUSLOBUNG_BELOHNUNGSANTEIL',eingaben,list(list(operation='Geldbelohnung durch Zahl gleichberechtigter Personen teilen beziehungsweise mit qualifiziertem Mitwirkungsanteil multiplizieren.')))
 ergebnis$hinweise <- c(ergebnis$hinweise,list('\u00a7659II/661III: rechtlich festgestellte Gleichzeitigkeit beziehungsweise gleiche Preisw\u00fcrdigkeit, teilbare Geldbelohnung und kein Vorbehalt nur eines Empf\u00e4ngers. Losentscheid bei Unteilbarkeit/Einzelempf\u00e4ngervorbehalt au\u00dferhalb dieser Berechnung. \u00a7660I: verbindlich festgestellter billiger Mitwirkungsanteil; Funktion bewertet Beitr\u00e4ge nicht. Bei mehreren Einzelaufrufen m\u00fcssen s\u00e4mtliche qualifizierten Mitwirkungsquoten zusammen eins ergeben, keine mehrfachen Vollbelohnungen. Streitbedingtes Leistungsverweigerungsrecht660II, Hinterlegung und Preisvergabewirksamkeit gesondert. Keine Rundung oder Abrechnung bereits gezahlter Teilbetr\u00e4ge.'))
 ergebnis
}
