betreuung_numerische_wertgrenze <- function(grenzfall=NULL, massgeblicher_gesamtwert=NULL, einordnungsnachweis=NULL) {
 grenzen <- list(zahlungsanspruch_1849='3000',vergleichsgegenstand_1854='6000',vermoegenswert_1860='6000')
 .auswahl(grenzfall,'grenzfall',names(grenzen));betrag <- .geld(massgeblicher_gesamtwert);.text(einordnungsnachweis,'einordnungsnachweis');grenze <- .geld(grenzen[[grenzfall]])
 ueber <- .vergleichen(betrag,grenze)>0
 wert <- list(wertgrenze=.bruchteile(grenze),wertgrenze_eingehalten=!ueber,ueberschreitungsbetrag=.bruchteile(if(ueber) .subtrahieren(betrag,grenze) else .geld('0')))
 eingaben <- list(grenzfall=grenzfall, massgeblicher_gesamtwert=massgeblicher_gesamtwert, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR_und_wahrheitswert","BGB_BETREUUNG_NUMERISCHE_WERTGRENZE",eingaben,list(list(operation="Qualifizierten betreuungsrechtlichen Gesamtwert mit gesetzlicher3000-/6000-Euro-Grenze einschlie\u00dflich Gleichheit vergleichen.")),eingaben)
 ergebnis$hinweise <- list("Nur numerische H\u00f6chstwertvergleiche1849II1a,1854Nr6 und1860I: nicht mehr als/nicht \u00fcbersteigt schlie\u00dft Gleichheit ein. Keine automatische Genehmigungsfreiheit oder gerichtliche Befreiung.1849III-Ausnahmen insbesondere gesperrte Geldanlage/Wertpapiereinl\u00f6sung gesondert;1854 gerichtlicher Vergleichsvorschlag eigener Ausnahmeweg;1860 Antrag, Ermessen und Gef\u00e4hrdungspr\u00fcfung gesondert. F\u00fcr1849 nicht blo\u00df aktuell abgehobenen Teilbetrag verwenden; f\u00fcr1860 keine Verbindlichkeiten vom Nichtimmobilienverm\u00f6gen abziehen.")
 ergebnis
}
