% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{verwaltungsanlagebetrag}
\alias{verwaltungsanlagebetrag}
\title{verwaltungsanlagebetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{verwaltungsanlagebetrag(
  geldbestand = NULL,
  ausgabenreserve = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{geldbestand}{Nichtnegativer verwalteter Geldbestand in EUR; Verwaltungsunterworfenheit und Bezugszeitpunkt qualifiziert.}
\item{ausgabenreserve}{Nichtnegativer rechtlich erforderlicher bereitgehaltener Ausgabenbedarf desselben Bezugszeitpunkts in EUR; kein frei gewählter Abschlag.}
\item{bewertungsnachweis}{Nichtleerer Nachweis zu Anwendungsfall§1642 oder§1841I, Geldbestand und qualifizierter Reserve.}
}
\details{Anlagebetrag=max(Geldbestand-Ausgabenreserve,0). Anlagebetrag nach§1642 für der elterlichen Verwaltung unterliegendes Kindesgeld oder§1841I für Geld des Betreuten nach Ausgabenbedarf§1839. Verwaltungsunterworfenheit, erforderliche Ausgabenreserve und Bewertungszeitpunkt rechtlich qualifiziert. Reserve ist kein frei gewählter Sicherheitsabschlag. Übersteigt Reserve den Bestand, Anlagebetrag0; kein automatisch festgestellter Zahlungsanspruch oder Fehlbetragsausgleich. Anlageform, wirtschaftliche Vermögensverwaltung, Kontoinhaberschaft, Genehmigung und Rendite nicht berechnet. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter EUR-Bruch. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1642_T0001, BGB_1841_T0001}
\examples{
verwaltungsanlagebetrag(
  geldbestand = "1000",
  ausgabenreserve = "300",
  bewertungsnachweis = paste0(
    "Verwaltetes Geld und notwendiger Ausgabenbedarf zum selben Z",
    "eitpunkt qualifiziert."
  )
)
}
