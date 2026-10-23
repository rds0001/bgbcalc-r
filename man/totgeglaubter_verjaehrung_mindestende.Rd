% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{totgeglaubter_verjaehrung_mindestende}
\alias{totgeglaubter_verjaehrung_mindestende}
\title{totgeglaubter verjaehrung mindestende}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{totgeglaubter_verjaehrung_mindestende(
  bisheriges_verjaehrungsende = NULL,
  kenntnis_todesannahme_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{bisheriges_verjaehrungsende}{ISO-Enddatum des Anspruchs ohne die zusätzliche2031-Mindestgrenze, rechtlich bestimmt.}
\item{kenntnis_todesannahme_am}{ISO-Datum der relevanten Kenntnis der tatsächlich lebenden betroffenen Person von ihrer falschen Todeserklärung/Todeszeitfeststellung oder sonst unrichtigen Todesannahme.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des2031-Anwendungsfalls, relevanten Kenntnisses und Fortlebens der Person über den betrachteten Zeitraum. Fälle mit Tod währenddessen gesondert.}
}
\details{Einjährige Ereignisfrist ab relevanter Kenntnis; späteres Ende aus bisheriger Verjährung und einjährigem Mindestende. Nur fortlebende betroffene Person; Tod während des Zeitraums außerhalb Modell. Keine pauschale neue Verjährung oder Jahresendregel; weitere Korrekturen/Einrede getrennt. ISO-Daten und berechnete Grenzen0001..9999, feste Auswahlwerte, nichtleerer Nachweis.}
\value{wert enthält einjaehriges_mindestende und massgebliches_verjaehrungsende. Einheit: daten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2031_T0002, BGB_2031_T0003}
\examples{
totgeglaubter_verjaehrung_mindestende(
  bisheriges_verjaehrungsende = "2030-12-31",
  kenntnis_todesannahme_am = "2030-06-15",
  einordnungsnachweis = "Synthetischer2031-Fall, betroffene Person lebt fort."
)
}
