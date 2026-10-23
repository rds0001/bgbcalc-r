% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{zugewinnausgleich_sachanrechnungsrest}
\alias{zugewinnausgleich_sachanrechnungsrest}
\title{zugewinnausgleich sachanrechnungsrest}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{zugewinnausgleich_sachanrechnungsrest(
  ausgleichsforderung = NULL,
  gerichtlicher_anrechnungsbetrag = NULL,
  anrechnungsnachweis = NULL
)}
\arguments{
\item{ausgleichsforderung}{Nichtnegative qualifizierte Ausgleichsforderung in EUR.}
\item{gerichtlicher_anrechnungsbetrag}{Nichtnegativer gerichtlich festgesetzter und rechtlich wirksam anzurechnender Betrag für bestimmte Gegenstände in EUR, kein selbst gewählter Marktwert.}
\item{anrechnungsnachweis}{Nichtleerer Beleg der gerichtlichen Festsetzung und tatsächlichen Anrechnungsvoraussetzung.}
}
\details{Rest=max(Ausgleichsforderung-gerichtlicher Anrechnungsbetrag,0). Nur§1383I-Anrechnungsrechnung: Ausgleichsforderung bereits bestimmt, Anrechnungsbetrag gerichtlich festgesetzt und seine tatsächliche Anrechnungsvoraussetzung qualifiziert. Keinen Marktwert anstelle des festgesetzten Betrags einsetzen. Ob Anordnung/Übertragung/Erfüllung wirksam ist und wann anzurechnen ist, nicht automatisch entschieden. Übersteigt Anrechnungsbetrag die betrachtete Forderung, Rest0; kein automatisch festgestellter Überschuss-/Rückzahlungsanspruch. Keine erneute Zugewinn-, Sachwert- oder Billigkeitsbewertung. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter EUR-Restbruch. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1383_T0001}
\examples{
zugewinnausgleich_sachanrechnungsrest(
  ausgleichsforderung = "1000",
  gerichtlicher_anrechnungsbetrag = "300",
  anrechnungsnachweis = paste0(
    "Wirksam anzurechnender gerichtlich festgesetzter Betrag bele",
    "gt."
  )
)
}
