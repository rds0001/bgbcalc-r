% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pfandrecht_einziehungsgrenze}
\alias{pfandrecht_einziehungsgrenze}
\title{pfandrecht einziehungsgrenze}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{pfandrecht_einziehungsgrenze(
  einziehbare_geldforderung = NULL,
  erforderlicher_befriedigungsbetrag = NULL,
  anwendungsfall_qualifiziert = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{einziehbare_geldforderung}{Nichtnegativer rechtlich bewerteter Betrag in EUR, qualifizierte Bedeutung gemäß Abgrenzung.}
\item{erforderlicher_befriedigungsbetrag}{Nichtnegativer rechtlich bewerteter Vergleichs-/Abzugs-/Zusatzbetrag in EUR für denselben Gegenstand und konsistente Bewertungsbasis.}
\item{anwendungsfall_qualifiziert}{Explizite Bestätigung des im Fachvertrag abgegrenzten Normfalls. FALSE ergibt NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleere Herkunft und rechtliche Begründung beider Beträge, Bewertungszeitpunkte und Anwendbarkeit.}
}
\details{Einziehbare Geldforderung auf erforderlichen Befriedigungsbetrag begrenzen. Einziehungsberechtigung gemäß1228Absatz2/1282 und Umfang der gepfändeten Geldforderung vorqualifiziert. Erforderlicher Befriedigungsbetrag enthält ausschließlich gedeckte Ansprüche; keine eigenständige Feststellung der Fälligkeit oder Ermächtigung zu anderen Verfügungen. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter EUR-Bruch, keine automatische Rundung. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1282_T0001, BGB_1282_T0002, BGB_1282_T0003}
\examples{
pfandrecht_einziehungsgrenze(
  einziehbare_geldforderung = "100",
  erforderlicher_befriedigungsbetrag = "30",
  anwendungsfall_qualifiziert = TRUE,
  bewertungsnachweis = "Synthetische qualifizierte Beträge für denselben Normfall."
)
}
