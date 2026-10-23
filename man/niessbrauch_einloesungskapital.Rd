% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{niessbrauch_einloesungskapital}
\alias{niessbrauch_einloesungskapital}
\title{niessbrauch einloesungskapital}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{niessbrauch_einloesungskapital(
  tilgungskapital = NULL,
  einloesungspraemie = NULL,
  anwendungsfall_qualifiziert = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{tilgungskapital}{Nichtnegativer rechtlich bewerteter Betrag in EUR, qualifizierte Bedeutung gemäß Abgrenzung.}
\item{einloesungspraemie}{Nichtnegativer rechtlich bewerteter Vergleichs-/Abzugs-/Zusatzbetrag in EUR für denselben Gegenstand und konsistente Bewertungsbasis.}
\item{anwendungsfall_qualifiziert}{Explizite Bestätigung des im Fachvertrag abgegrenzten Normfalls. FALSE ergibt NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleere Herkunft und rechtliche Begründung beider Beträge, Bewertungszeitpunkte und Anwendbarkeit.}
}
\details{Tilgungskapital und Einlösungsprämie zu Kapitalbetrag addieren. Nur Einlösung des vom Nießbrauch betroffenen Papiers. Einlösungsprämie wird als Kapital, nicht Zinsertrag behandelt; separat fällige Zinsen nicht als Prämie eingeben. Keine Bewertung oder automatische Auszahlung an den Nießbraucher. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter EUR-Bruch, keine automatische Rundung. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1083_T0002, BGB_1083_T0003}
\examples{
niessbrauch_einloesungskapital(
  tilgungskapital = "100",
  einloesungspraemie = "30",
  anwendungsfall_qualifiziert = TRUE,
  bewertungsnachweis = "Synthetische qualifizierte Beträge für denselben Normfall."
)
}
