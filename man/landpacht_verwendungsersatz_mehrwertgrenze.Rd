% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{landpacht_verwendungsersatz_mehrwertgrenze}
\alias{landpacht_verwendungsersatz_mehrwertgrenze}
\title{landpacht verwendungsersatz mehrwertgrenze}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{landpacht_verwendungsersatz_mehrwertgrenze(
  ersatzfaehige_verwendungen = NULL,
  fortbestehender_mehrwert = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{ersatzfaehige_verwendungen}{Nichtnegative Kosten qualifizierter anderer als notwendiger Verwendungen in EUR, mit wirksamer Zustimmung.}
\item{fortbestehender_mehrwert}{Nichtnegative rechtlich bewertete Erhöhung des Wertes der Pachtsache über das Pachtende hinaus in EUR.}
\item{einordnungsnachweis}{Nachweis der Voraussetzungen591I und des bei Pachtende fortbestehenden Mehrwerts; besondere gerichtliche Anordnungen separat.}
}
\details{Ersatzfähige Verwendungen auf den über die Pachtzeit hinaus fortbestehenden Mehrwert begrenzen. §591I: Grundbetrag als Minimum aus ersatzfähigen Verwendungen und fortbestehendem Mehrwert. Notwendige Verwendungen590b und Wegnahmerechte591a, Zustimmung/gerichtliche Ersetzung, Bewertungsmethode und gerichtliche Teilzahlungen oder Vertragsfortsetzung591III separat. Kein automatischer Zahlungsplan und keine automatische Fälligkeit bei gerichtlich abweichender Regelung. Nichtnegative Eingangswerte, exakter nichtnegativer EUR-Bruch im sicheren gemeinsamen Zahlenbereich.}
\value{wert ist der exakte EUR-Bruch. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_591_T0001}
\examples{
landpacht_verwendungsersatz_mehrwertgrenze(
  ersatzfaehige_verwendungen = "1000",
  fortbestehender_mehrwert = "800",
  einordnungsnachweis = paste0(
    "§591I: Grundbetrag als Minimum aus ersatzfähigen Verwendunge",
    "n und fortbestehendem Mehrwert. Notwendige Verwendungen590b ",
    "und Wegnahmerechte591a, Zustimmung/gerichtliche Ersetzung, B",
    "ewertungsmethode und gerichtliche Teilzahlungen oder Vertrag",
    "sfortsetzung591III separat. Kein automatischer Zahlungsplan ",
    "und keine automatische Fälligkeit bei gerichtlich abweichend",
    "er Regelung."
  )
)
}
