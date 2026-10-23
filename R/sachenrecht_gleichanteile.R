sachenrecht_gleichanteil <- function(gesamtmenge=NULL, anzahl_berechtigte=NULL, regelfall=NULL, verteilungsnachweis=NULL) {
  menge <- .geld(gesamtmenge)
  .ganzzahl(anzahl_berechtigte, 'anzahl_berechtigte', 2, 1000)
  .text(regelfall, 'regelfall')
  if (!regelfall %in% c('grenzflaeche_920','grenzbaum_fruechte_923','grenzbaum_holz_923','wirtschaftsplan_kosten_1038')) .fehler('regelfall','Unbekannter Verteilungsfall.')
  if (regelfall == 'wirtschaftsplan_kosten_1038' && anzahl_berechtigte != 2) .fehler('anzahl_berechtigte','Wirtschaftsplankosten tragen Eigent\u00fcmer und Nie\u00dfbraucher je zur H\u00e4lfte.')
  .text(verteilungsnachweis,'verteilungsnachweis')
  eingaben <- list(gesamtmenge=gesamtmenge,anzahl_berechtigte=anzahl_berechtigte,regelfall=regelfall,verteilungsnachweis=verteilungsnachweis)
  wert <- list(anteilsquote=.bruchteile(.bruch(1,anzahl_berechtigte)),einzelanteil=.bruchteile(.dividieren(menge,.bruch(anzahl_berechtigte))))
  ergebnis <- .ergebnis(wert,'menge_oder_EUR','BGB_SACHENRECHT_GLEICHANTEIL',eingaben,list(list(operation='Qualifizierte Gesamtmenge durch Anzahl gleichberechtigter Teile teilen.')),eingaben)
  ergebnis$hinweise <- list('Nur gesetzliche Gleichverteilung:920 streitige Fl\u00e4che bei nicht ermittelbarer Grenze und nicht feststellbarem Besitzstand ohne abweichende Billigkeitskorrektur;923 Fr\u00fcchte oder gef\u00e4llter Baum zwischen betroffenen Nachbarn ohne Verzichtsfall;1038 Wirtschaftsplan-/\u00c4nderungskosten zwischen Eigent\u00fcmer und Nie\u00dfbraucher. Nachbarn bedeuten betroffene Grundst\u00fccksseiten, nicht beliebige Zahl ihrer Miteigent\u00fcmer. Gesamtmenge und Anteil in derselben Eingabeeinheit;1038 ausschlie\u00dflich EUR. Keine geometrische Grenzziehung oder Bewertung unteilbarer Sachst\u00fccke.')
  ergebnis
}
