\name{indexmiete_betrag}
\alias{indexmiete_betrag}
\title{indexmiete betrag}
\description{Indexverhältnis=neuer Index/Ausgangsindex. Neue Miete=Ausgangsmiete mal Indexverhältnis. Mietänderung=neue Miete minus Ausgangsmiete; negative Änderung bedeutet Senkung.}
\usage{
indexmiete_betrag(ausgangsmiete = NULL,
  ausgangsindex = NULL,
  neuer_index = NULL,
  indexnachweis = NULL,
  wirksame_indexvereinbarung = NULL)
}
\arguments{
  \item{ausgangsmiete}{Nichtnegative indexierte Mietbasis in EUR, passend zum angegebenen Ausgangsindex. Dezimalzeichenfolge oder exaktes Bruchobjekt mit den Zeichenfolgenfeldern zaehler und nenner nach NUMERIK.md. Bereits eingetretene Indexänderungen nicht erneut auf eine unpassende Ausgangsbasis anwenden. Nicht indexierte Betriebskosten und gesonderte Erhöhungen nach §§559 bis560 nicht ungeprüft in die Basis aufnehmen.}
  \item{ausgangsindex}{Positiver zur Mietbasis gehörender Ausgangsstand des amtlichen Preisindexes gemäß §557b Abs.1. Dezimalzeichenfolge oder exaktes Bruchobjekt mit den Zeichenfolgenfeldern zaehler und nenner nach NUMERIK.md.}
  \item{neuer_index}{Positiver neuer Stand derselben amtlichen Indexreihe auf derselben Basis. Dezimalzeichenfolge oder exaktes Bruchobjekt mit den Zeichenfolgenfeldern zaehler und nenner nach NUMERIK.md. Auch ein geringerer Indexstand ist zulässig; keine Gleichsetzung von Indexpunkten und Prozentpunkten.}
  \item{indexnachweis}{Nichtleere Herkunftsangabe einschließlich Indexreihe, gemeinsamer Basis sowie Ausgangs- und Änderungsmonat. Die Vergleichbarkeit und Zuordnung der eingegebenen Werte werden vom Nutzer belegt; die Library prüft die amtliche Veröffentlichung nicht.}
  \item{wirksame_indexvereinbarung}{Expliziter Wahrheitswert zur wirksamen schriftlichen Indexvereinbarung im gesetzlichen Anwendungsbereich. FALSE ergibt NICHT_ANWENDBAR. Form und Vertragsauslegung werden nicht automatisch entschieden.}
}
\details{Feste lokale BGB-Fassung. Teilbaustein der Indexmiete; keine automatische Beschaffung amtlicher Indizes oder Vertragsauslegung. Spezial- und Übergangsrecht einschließlich Anwendungsbereich vorab prüfen. Keine automatische Cent-Rundung. Jahresfrist und Erklärung sind gesondert zu prüfen. Ausgangsmietbegrenzung nach §§556d bis556g gilt nach §557b Abs.4 nur für die Ausgangsmiete; deren Prüfung ist hier nicht enthalten. Indexierte Mietbasis und etwaige nicht indexierte Zusatzbestandteile müssen getrennt bestimmt sein.}
\value{Ergebnis wert enthält indexverhaeltnis als dimensionslosen exakten Bruch sowie neue_miete und mietaenderung als exakte EUR-Brüche. Bei NICHT_ANWENDBAR ist wert null. Fehler als bgb_berechnungsfehler mit EINGABE_FEHLT oder EINGABE_UNGUELTIG.}
\examples{
indexmiete_betrag("800", "100", "110",
  "Synthetische gleiche Indexreihe und Basis; zwei ausdrücklich bestimmte Monate", TRUE)
}
