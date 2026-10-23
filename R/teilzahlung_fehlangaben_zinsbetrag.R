teilzahlung_fehlangaben_zinsbetrag <- function(massgeblicher_barzahlungspreis=NULL, vertraglicher_zinssatz_prozent=NULL, zeitanteil_zaehler=NULL, zeitanteil_nenner=NULL, zeitanteil_nachweis=NULL, einordnungsnachweis=NULL) {
 .text(einordnungsnachweis,'einordnungsnachweis');satz <- .geld(vertraglicher_zinssatz_prozent)
 if(.vergleichen(satz,.bruch(4))>0) satz <- .bruch(4)
 z <- gesetzliche_zinsen(massgeblicher_barzahlungspreis,zeitanteil_zaehler,zeitanteil_nenner,zeitanteil_nachweis,FALSE,.bruchteile(satz))
 wert <- list(massgeblicher_zinssatz_prozent=.bruchteile(satz),zinsbetrag=z$wert)
 eingaben <- list(massgeblicher_barzahlungspreis=massgeblicher_barzahlungspreis, vertraglicher_zinssatz_prozent=vertraglicher_zinssatz_prozent, zeitanteil_zaehler=zeitanteil_zaehler, zeitanteil_nenner=zeitanteil_nenner, zeitanteil_nachweis=zeitanteil_nachweis, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR_und_prozent","BGB_TEILZAHLUNG_FEHLANGABEN_ZINSBETRAG",eingaben,list(list(operation="Vertraglichen Jahreszinssatz auf vier Prozent begrenzen und vorhandenen exakten Zinskern auf qualifizierten Barzahlungs-/Marktpreis anwenden.")),eingaben)
 ergebnis$hinweise <- list("\u00a7507II3: Barzahlungspreis hoechstens mit gesetzlichem246-Jahreszinssatz4Prozent verzinsen. Niedrigerer rechtlich geschuldeter Vertragszins bleibt niedriger, keine Erhoehung auf4Prozent. Bei fehlendem Barzahlungspreis den rechtlich bewerteten Marktpreis nachII4 als gleiche Basis eingeben. Bestehender exakter Zinskern mit min(Vertragszins,4) wird verwendet. Abschnitt mit unveraenderter Basis und belegtem Jahresanteil; Raten-/Tilgungsplaene nach Vertrag abschnittsweise, kein erfundenes Annuitaetenmodell. Nicht die Gesamtbetragskorrektur bei zu niedrig angegebenem Effektivzins507II5 und nicht494II.507III-Kostenermaessigung verwendet246als qualifizierte Zinsbasis in vorhandenen501-Rechenwegen; Vorfaelligkeitsentschaedigung dort ausgeschlossen.")
 ergebnis
}
