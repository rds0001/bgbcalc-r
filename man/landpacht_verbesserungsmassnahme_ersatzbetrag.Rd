% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{landpacht_verbesserungsmassnahme_ersatzbetrag}
\alias{landpacht_verbesserungsmassnahme_ersatzbetrag}
\title{landpacht verbesserungsmassnahme ersatzbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{landpacht_verbesserungsmassnahme_ersatzbetrag(
  ersatzfaehige_aufwendungen = NULL,
  ersatzfaehige_entgangene_ertraege = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{ersatzfaehige_aufwendungen}{Qualifizierte, der Verbesserungsmaßnahme zugeordnete angemessene Aufwendungen in EUR.}
\item{ersatzfaehige_entgangene_ertraege}{Qualifizierte, angemessene entgangene Erträge in EUR, bereits ohne Überschneidung mit den eingegebenen Aufwendungen bewertet.}
\item{einordnungsnachweis}{Nachweis der Maßnahme588II und des angemessenen Ersatzumfangs; Überschneidungen zwischen Aufwand und Ertragsausfall ausdrücklich ausgeschlossen.}
}
\details{Angemessene ersatzfähige Aufwendungen und überschneidungsfrei bewertete entgangene Erträge addieren. §588II: numerischer Ersatzumfang aus qualifizierten Betragskomponenten. Keine automatische Billigkeitsbewertung oder Brutto-/Nettobewertung entgangener Erträge; diese ist widerspruchsfrei mit den Aufwendungen vorzugeben. Vorschüsse/Zahlungen gesondert anrechnen. Eine Pachterhöhung wegen höherer Erträge588III ist ein anderer Rechengegenstand und wird nicht erfunden. Nichtnegative Eingangswerte, exakter nichtnegativer EUR-Bruch im sicheren gemeinsamen Zahlenbereich.}
\value{wert ist der exakte EUR-Bruch. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_588_T0002, BGB_588_T0003, BGB_588_T0004}
\examples{
landpacht_verbesserungsmassnahme_ersatzbetrag(
  ersatzfaehige_aufwendungen = "200",
  ersatzfaehige_entgangene_ertraege = "300",
  einordnungsnachweis = paste0(
    "§588II: numerischer Ersatzumfang aus qualifizierten Betragsk",
    "omponenten. Keine automatische Billigkeitsbewertung oder Bru",
    "tto-/Nettobewertung entgangener Erträge; diese ist widerspru",
    "chsfrei mit den Aufwendungen vorzugeben. Vorschüsse/Zahlunge",
    "n gesondert anrechnen. Eine Pachterhöhung wegen höherer Ertr",
    "äge588III ist ein anderer Rechengegenstand und wird nicht er",
    "funden."
  )
)
}
