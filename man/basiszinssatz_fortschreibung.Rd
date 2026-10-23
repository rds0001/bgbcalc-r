\name{basiszinssatz_fortschreibung}
\alias{basiszinssatz_fortschreibung}
\title{basiszinssatz fortschreibung}
\description{Neuer Basiszinssatz = bisheriger Basiszinssatz + neuer Bezugszinssatz - bisheriger Bezugszinssatz. Anpassung nur zum 1. Januar oder 1. Juli; keine Rundung oder automatische Nulluntergrenze.}
\usage{
basiszinssatz_fortschreibung(bisheriger_basiszinssatz_prozent = NULL,
  bisheriger_bezugszinssatz_prozent = NULL,
  neuer_bezugszinssatz_prozent = NULL,
  anpassungsdatum = NULL,
  quellenangabe = NULL)
}
\arguments{
  \item{bisheriger_basiszinssatz_prozent}{Bisheriger Basiszinssatz als Dezimalzeichenfolge in Prozent pro Jahr. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
  \item{bisheriger_bezugszinssatz_prozent}{Bezugszinssatz des vorherigen Anpassungsstands als Dezimalzeichenfolge in Prozent. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
  \item{neuer_bezugszinssatz_prozent}{Maßgeblicher neuer Hauptrefinanzierungszinssatz als Dezimalzeichenfolge in Prozent. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
  \item{anpassungsdatum}{ISO-Datum der Anpassung, ausschließlich 1. Januar oder 1. Juli.}
  \item{quellenangabe}{Nichtleerer Beleg der vorgegebenen Bezugsgrößen und ihrer zeitlichen Zuordnung.}
}
\details{Keine Behauptung eines aktuellen amtlichen Basiszinssatzes; 3,62 Prozent aus dem Normtext ist kein zeitlos geltender Satz. Bezugswerte müssen genau die maßgeblichen Hauptrefinanzierungsoperationen und vorherigen Anpassungsstand bezeichnen. Gemeinsamer Zahlenvertrag NUMERIK.md; fehlend EINGABE_FEHLT, falscher Typ/Bereich EINGABE_UNGUELTIG.}
\value{S3-Objekt \code{bgb_ergebnis}; wert enthält zaehler und nenner als Ganzzahlzeichenfolgen. Einheit: prozent_pro_jahr. Nichtanwendbarkeit: status NICHT_ANWENDBAR und wert NULL. Fehlende oder ungültige Eingaben: bgb_berechnungsfehler mit Status EINGABE_FEHLT oder EINGABE_UNGUELTIG.}
\examples{
basiszinssatz_fortschreibung(
  bisheriger_basiszinssatz_prozent = "2",
  bisheriger_bezugszinssatz_prozent = "3",
  neuer_bezugszinssatz_prozent = "2.5",
  anpassungsdatum = "2026-07-01",
  quellenangabe = "Synthetische Bezugsgrößen, keine amtlichen Zeitreihendaten"
)
}
