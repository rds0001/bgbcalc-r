% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{annahmeverzug_mehraufwendungsbetrag}
\alias{annahmeverzug_mehraufwendungsbetrag}
\title{annahmeverzug mehraufwendungsbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{annahmeverzug_mehraufwendungsbetrag(
  mehraufwand_erfolgloses_angebot = NULL,
  mehraufwand_aufbewahrung = NULL,
  mehraufwand_erhaltung = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{mehraufwand_erfolgloses_angebot}{Erforderlicher zusätzlicher EUR-Aufwand für erfolgloses Angebot, rechtlich nach304 zugeordnet.}
\item{mehraufwand_aufbewahrung}{Erforderlicher zusätzlicher EUR-Aufwand für Aufbewahrung, überschneidungsfrei.}
\item{mehraufwand_erhaltung}{Erforderlicher zusätzlicher EUR-Aufwand für Erhaltung, überschneidungsfrei.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des Gläubigerverzugs und der erforderlichen zusätzlichen Aufwendungen ohne Doppelzählung.}
}
\details{Erforderliche zusätzliche Aufwendungen für erfolgloses Angebot, Aufbewahrung und Erhaltung addieren. §304: nur rechtlich zugeordnete erforderliche Mehraufwendungen infolge des Annahmeverzugs; keine pauschale Bewertung von Arbeitszeit oder ohnehin angefallenen Kosten. Kostenpositionen überschneidungsfrei den drei Gruppen zuordnen; dieselbe Rechnung nur einmal erfassen. Grundvoraussetzungen des Annahmeverzugs sowie weitergehende Schadensersatzansprüche werden nicht ermittelt. Nichtnegative Eingangswerte, exakter nichtnegativer EUR-Bruch im sicheren gemeinsamen Zahlenbereich.}
\value{wert ist der exakte EUR-Bruch. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_304_T0001}
\examples{
annahmeverzug_mehraufwendungsbetrag(
  mehraufwand_erfolgloses_angebot = "10",
  mehraufwand_aufbewahrung = "20",
  mehraufwand_erhaltung = "30",
  einordnungsnachweis = paste0(
    "§304: nur rechtlich zugeordnete erforderliche Mehraufwendung",
    "en infolge des Annahmeverzugs; keine pauschale Bewertung von",
    " Arbeitszeit oder ohnehin angefallenen Kosten. Kostenpositio",
    "nen überschneidungsfrei den drei Gruppen zuordnen; dieselbe ",
    "Rechnung nur einmal erfassen. Grundvoraussetzungen des Annah",
    "meverzugs sowie weitergehende Schadensersatzansprüche werden",
    " nicht ermittelt."
  )
)
}
