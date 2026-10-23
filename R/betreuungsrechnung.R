.rechnungssumme <- function(positionen,name) {
  .vorhanden(positionen,name)
  if (!is.list(positionen) || length(positionen)<1 || length(positionen)>10000 || !is.null(names(positionen))) .fehler(name,"Liste mit 1 bis 10000 nichtnegativen Betragspositionen erforderlich; keine Bewegung ausdr\u00fccklich als einzelne Nullposition.")
  summe <- .bruch(0)
  for (betrag in positionen) summe <- .addieren(summe,.geld(betrag))
  summe
}
betreuungsrechnung_summen <- function(einnahmen=NULL,ausgaben=NULL,vermoegenszugaenge=NULL,vermoegensabgaenge=NULL,rechnungsnachweis=NULL) {
  ein <- .rechnungssumme(einnahmen,"einnahmen");aus <- .rechnungssumme(ausgaben,"ausgaben")
  zu <- .rechnungssumme(vermoegenszugaenge,"vermoegenszugaenge");ab <- .rechnungssumme(vermoegensabgaenge,"vermoegensabgaenge")
  .text(rechnungsnachweis,"rechnungsnachweis")
  eingaben <- list(einnahmen=einnahmen,ausgaben=ausgaben,vermoegenszugaenge=vermoegenszugaenge,vermoegensabgaenge=vermoegensabgaenge,rechnungsnachweis=rechnungsnachweis)
  wert <- lapply(list(einnahmensumme=ein,ausgabensumme=aus,einnahmen_ausgaben_saldo=.subtrahieren(ein,aus),vermoegenszugangssumme=zu,vermoegensabgangssumme=ab,vermoegensbewegungssaldo=.subtrahieren(zu,ab)),.bruchteile)
  ergebnis <- .ergebnis(wert,"EUR","BGB_BETREUUNGSRECHNUNG_SUMMEN",eingaben,list(list(operation="Einnahmen, Ausgaben, Verm\u00f6genszug\u00e4nge und Verm\u00f6gensabg\u00e4nge getrennt summieren; Geldfluss- und Verm\u00f6gensbewegungssaldo separat bilden, nicht addieren.")),eingaben)
  ergebnis$hinweise <- list("Rechnerischer Summenbaustein f\u00fcr\u00a71865III1 und Schlussrechnung\u00a71872III2, kein vollst\u00e4ndiges Rechnungslegungsformular. Alle Positionen derselben rechtlich abgegrenzten Rechnungsperiode zuordnen; Rechnungsjahr gerichtlich bestimmt, Schlussrechnung grunds\u00e4tzlich seit letzter eingereichter Rechnungslegung. Einnahmen/Ausgaben einerseits und Verm\u00f6genszug\u00e4nge/-abg\u00e4nge andererseits sind getrennte Sichten und k\u00f6nnen denselben wirtschaftlichen Vorgang abbilden. Ihre Salden daher nicht nochmals zu einem Verm\u00f6genszuwachs addieren. Verm\u00f6gensumschichtungen und Sachwerte fachlich konsistent qualifizieren, keine automatische Buchungs-/Bewertungsmethode. Keine Bewegung explizit als eine Nullposition angeben; fehlende Kategorie ist keine stillschweigende Null. Reihenfolge, Einzelbelege, Anfangs-/Endbestand, Vollst\u00e4ndigkeitserkl\u00e4rung, vom Betreuten selbst verwaltete Teile und Befreiungen gesondert. Negative Salden sind Rechenergebnisse, keine Feststellung einer Verbindlichkeit oder Pflichtverletzung.")
  ergebnis
}
