verwaltungsanlagebetrag <- function(geldbestand=NULL,ausgabenreserve=NULL,bewertungsnachweis=NULL) {
  geld <- .geld(geldbestand); reserve <- .geld(ausgabenreserve)
  .text(bewertungsnachweis,"bewertungsnachweis")
  eingaben <- list(geldbestand=geldbestand,ausgabenreserve=ausgabenreserve,bewertungsnachweis=bewertungsnachweis)
  rest <- .subtrahieren(geld,reserve); if (.vergleichen(rest,.bruch(0))<0) rest <- .bruch(0)
  ergebnis <- .ergebnis(.bruchteile(rest),"EUR","BGB_VERWALTUNGSANLAGEBETRAG",eingaben,list(list(operation="Qualifizierte Ausgabenreserve vom verwalteten Geldbestand abziehen; verbleibenden Anlagebetrag bei null begrenzen.")),eingaben)
  ergebnis$hinweise <- list("Anlagebetrag nach\u00a71642 f\u00fcr der elterlichen Verwaltung unterliegendes Kindesgeld oder\u00a71841I f\u00fcr Geld des Betreuten nach Ausgabenbedarf\u00a71839. Verwaltungsunterworfenheit, erforderliche Ausgabenreserve und Bewertungszeitpunkt rechtlich qualifiziert. Reserve ist kein frei gew\u00e4hlter Sicherheitsabschlag. \u00dcbersteigt Reserve den Bestand, Anlagebetrag0; kein automatisch festgestellter Zahlungsanspruch oder Fehlbetragsausgleich. Anlageform, wirtschaftliche Verm\u00f6gensverwaltung, Kontoinhaberschaft, Genehmigung und Rendite nicht berechnet.")
  ergebnis
}
unterhalt_sicherheitsregelbetrag <- function(monatsrente=NULL,bewertungsnachweis=NULL) {
  rente <- .geld(monatsrente); .text(bewertungsnachweis,"bewertungsnachweis")
  eingaben <- list(monatsrente=monatsrente,bewertungsnachweis=bewertungsnachweis)
  ergebnis <- .ergebnis(.bruchteile(.multiplizieren(rente,.bruch(12))),"EUR","BGB_UNTERHALT_SICHERHEITSREGELBETRAG",eingaben,list(list(operation="Qualifizierte konstante Monatsrente mit zw\u00f6lf zum einfachen Jahresbetrag multiplizieren.")),eingaben)
  ergebnis$hinweise <- list("Rechnerische Regelsicherheitsgrenze nach\u00a71585aI3 bei konstanter rechtlich qualifizierter Monatsrente. Keine automatische Sicherheitsleistungspflicht: Verlangen, Gef\u00e4hrdung, unbillige Belastung und Art der Sicherheit gesondert. Besondere Umst\u00e4nde k\u00f6nnen h\u00f6here Sicherheit rechtfertigen; dieser Regelbetrag ist keine ausnahmslose H\u00f6chstgrenze und keine freie gerichtliche Ermessensentscheidung. Wechselnde Rentenh\u00f6hen und zeitlich begrenzte Anspr\u00fcche au\u00dferhalb des konstanten Jahresansatzes separat bestimmen.")
  ergebnis
}
