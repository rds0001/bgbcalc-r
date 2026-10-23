% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{mietsicherheit_mit_anlageertraegen}
\alias{mietsicherheit_mit_anlageertraegen}
\title{mietsicherheit mit anlageertraegen}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{mietsicherheit_mit_anlageertraegen(
  sicherheit_vor_ertragszuwachs = NULL,
  hinzukommende_anlageertraege = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{sicherheit_vor_ertragszuwachs}{Nichtnegativer vorhandener Sicherheitsbetrag in EUR unmittelbar vor den betrachteten Erträgen.}
\item{hinzukommende_anlageertraege}{Tatsächliche nichtnegative, dem Mieter zustehende und noch nicht im Sicherheitsbetrag enthaltene Anlageerträge in EUR.}
\item{einordnungsnachweis}{Nachweis des Sicherheitsbestands und der zusätzlich zugeordneten tatsächlichen Erträge nach551III.}
}
\details{Bestehende Sicherheit und noch nicht enthaltene zugeordnete Anlageerträge addieren. §551III: tatsächlicher Ertragszuwachs erhöht die Sicherheit; keine erneute Begrenzung des Ertragszuwachses auf drei Monatsmieten. Ausgangssicherheit gesondert nach551I prüfen. Keine Hochrechnung eines hypothetischen Sparzinses, kein Ersatz einer unterlassenen Anlage und keine automatische Kautionsfreigabe. Anlageverluste, Entnahmen und bereits eingerechnete Erträge getrennt berücksichtigen; keine Doppelzählung. Nichtnegative Eingangswerte, exakter nichtnegativer EUR-Bruch im sicheren gemeinsamen Zahlenbereich.}
\value{wert ist der exakte EUR-Bruch. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_551_T0005, BGB_551_T0006, BGB_551_T0007, BGB_551_T0008, BGB_551_T0009}
\examples{
mietsicherheit_mit_anlageertraegen(
  sicherheit_vor_ertragszuwachs = "900",
  hinzukommende_anlageertraege = "20",
  einordnungsnachweis = paste0(
    "§551III: tatsächlicher Ertragszuwachs erhöht die Sicherheit;",
    " keine erneute Begrenzung des Ertragszuwachses auf drei Mona",
    "tsmieten. Ausgangssicherheit gesondert nach551I prüfen. Kein",
    "e Hochrechnung eines hypothetischen Sparzinses, kein Ersatz ",
    "einer unterlassenen Anlage und keine automatische Kautionsfr",
    "eigabe. Anlageverluste, Entnahmen und bereits eingerechnete ",
    "Erträge getrennt berücksichtigen; keine Doppelzählung."
  )
)
}
