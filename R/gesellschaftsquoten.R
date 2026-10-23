gesellschaft_vererbter_anteil <- function(gesellschaftsanteil_zaehler=NULL,gesellschaftsanteil_nenner=NULL,erbquote_zaehler=NULL,erbquote_nenner=NULL,einordnungsnachweis=NULL) {
 eingaben <- list(gesellschaftsanteil_zaehler=gesellschaftsanteil_zaehler,gesellschaftsanteil_nenner=gesellschaftsanteil_nenner,erbquote_zaehler=erbquote_zaehler,erbquote_nenner=erbquote_nenner,einordnungsnachweis=einordnungsnachweis)
 quoten <- list()
 for(basis in c('gesellschaftsanteil','erbquote')) {
  z <- .ganzzahl(eingaben[[paste0(basis,'_zaehler')]],paste0(basis,'_zaehler'),0,9007199254740991);n <- .ganzzahl(eingaben[[paste0(basis,'_nenner')]],paste0(basis,'_nenner'),1,9007199254740991)
  if(z>n) .fehler(basis,'Anteil darf eins nicht \u00fcbersteigen.')
  quoten[[length(quoten)+1]] <- .bruch(z,n)
 }
 .text(einordnungsnachweis,'einordnungsnachweis')
 ergebnis <- .ergebnis(.bruchteile(.multiplizieren(quoten[[1]],quoten[[2]])),'anteil','BGB_GESELLSCHAFT_VERERBTER_ANTEIL',eingaben,list(list(operation="Bisherigen Gesellschaftsanteil mit individueller Erbquote multiplizieren; vererbten Anteil an der Gesellschaft als dimensionslosen Bruch ausweisen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7711II: qualifizierte gesellschaftsvertragliche Fortsetzung mit Erben und ma\u00dfgebliche Erbquote vorausgesetzt. Bei mehreren Erben f\u00e4llt jedem ein entsprechender Anteil zu; keine Umdeutung in einen einzigen ungeteilten Erbengemeinschaftsanteil. F\u00fcr mehrere Einzelaufrufe m\u00fcssen die verwendeten Erbquoten den Erbfall vollst\u00e4ndig und ohne Doppelz\u00e4hlung abbilden. Kein EUR-Wert, keine Vertragsauslegung, kein Abfindungsanspruch und keine Berechnung der Erbquote selbst.")
 ergebnis
}
stimmgewichts_mehrheitsgrenze <- function(regelfall=NULL,zustimmendes_stimmgewicht=NULL,massgebliches_gesamtgewicht=NULL,einordnungsnachweis=NULL) {
 .auswahl(regelfall,'regelfall',c('gesellschaft_aufloesung_732','gesellschaft_fortsetzung_734','gemeinschaft_verwaltung_745'))
 ja <- .geld(zustimmendes_stimmgewicht);gesamt <- .geld(massgebliches_gesamtgewicht);.text(einordnungsnachweis,'einordnungsnachweis')
 if(gesamt$zaehler==0||.vergleichen(ja,gesamt)>0) .fehler('massgebliches_gesamtgewicht','Positives ma\u00dfgebliches Gesamtgewicht erforderlich; Zustimmungsgewicht darf es nicht \u00fcbersteigen.')
 quote <- .dividieren(ja,gesamt);streng <- regelfall=='gemeinschaft_verwaltung_745';grenze <- if(streng) .bruch(1,2) else .bruch(3,4)
 eingaben <- list(regelfall=regelfall,zustimmendes_stimmgewicht=zustimmendes_stimmgewicht,massgebliches_gesamtgewicht=massgebliches_gesamtgewicht,einordnungsnachweis=einordnungsnachweis)
 wert <- list(zustimmungsquote=.bruchteile(quote),grenzquote=.bruchteile(grenze),vergleich=if(streng) 'mehr_als' else 'mindestens',mehrheitsgrenze_erreicht=if(streng) .vergleichen(quote,grenze)>0 else .vergleichen(quote,grenze)>=0)
 ergebnis <- .ergebnis(wert,'anteile_und_wahrheitswert','BGB_STIMMGEWICHTS_MEHRHEITSGRENZE',eingaben,list(list(operation="Zustimmendes Gewicht durch passenden Gesamtnenner teilen; mindestens drei Viertel beziehungsweise strikt mehr als die H\u00e4lfte vergleichen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7732/734II: nur bei gesellschaftsvertraglicher Mehrheitsentscheidung; Nenner sind rechtlich ma\u00dfgebliche abgegebene Stimmen, Stimmgewicht und Behandlung von Enthaltungen/Ung\u00fcltigkeit vorqualifizieren. \u00a7745I: Mehrheit nach Gr\u00f6\u00dfe s\u00e4mtlicher ma\u00dfgeblicher Gemeinschaftsanteile, nicht blo\u00df nach Kopfzahl oder abgegebenen Stimmen; Nenner umfasst die gesamte Anteilsbasis. Keine automatische Beschlusswirksamkeit, Quorums-, Kompetenz- oder Vertragspr\u00fcfung.736V und736dI enthalten keine pauschale Dreiviertelregel und sind hier nicht einbezogen. Gleichheit gen\u00fcgt bei drei Vierteln, nicht bei der H\u00e4lfte.")
 ergebnis
}
gesellschaft_zustimmungsanzahl <- function(erforderliche_personenzahl=NULL,zustimmende_personenzahl=NULL,einordnungsnachweis=NULL) {
 erforderlich <- .ganzzahl(erforderliche_personenzahl,'erforderliche_personenzahl',1,9007199254740991);zugestimmt <- .ganzzahl(zustimmende_personenzahl,'zustimmende_personenzahl',0,9007199254740991)
 if(zugestimmt>erforderlich) .fehler('zustimmende_personenzahl','Zustimmungen m\u00fcssen aus demselben erforderlichen Personenkreis stammen.')
 .text(einordnungsnachweis,'einordnungsnachweis')
 eingaben <- list(erforderliche_personenzahl=erforderliche_personenzahl,zustimmende_personenzahl=zustimmende_personenzahl,einordnungsnachweis=einordnungsnachweis)
 wert <- list(fehlende_zustimmungen=erforderlich-zugestimmt,alle_erforderlichen_zustimmungen_erfasst=zugestimmt==erforderlich)
 ergebnis <- .ergebnis(wert,'anzahl_und_wahrheitswert','BGB_GESELLSCHAFT_ZUSTIMMUNGSANZAHL',eingaben,list(list(operation="Erforderliche verschiedene Personen abz\u00fcglich bereits wirksam zustimmender verschiedener Personen desselben Kreises z\u00e4hlen.")),eingaben)
 ergebnis$hinweise <- list("Numerischer Vollst\u00e4ndigkeitsvergleich714/715II beziehungsweise gemeinsam erforderlicher Mitwirkung720I. Personenkreis, Stimmberechtigung, Stimmverbote, wirksame Zustimmung/Mitwirkung und abweichender Gesellschaftsvertrag vorqualifizieren. Jede Person nur einmal z\u00e4hlen, Zustimmungen fremder Personen nicht hinzuf\u00fcgen. Bei714 alle Stimmberechtigten, nicht lediglich abgegebene Stimmen als Nenner. Ergebnis begr\u00fcndet allein weder einen wirksamen Beschluss noch eine wirksame Gesamtvertretung; f\u00fcr736V/736dI besondere Beteiligtenkreise nicht ungepr\u00fcft \u00fcbernehmen.")
 ergebnis
}
