% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{landpacht_beschreibung_kostenhaelfte}
\alias{landpacht_beschreibung_kostenhaelfte}
\title{landpacht beschreibung kostenhaelfte}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{landpacht_beschreibung_kostenhaelfte(
  sachverstaendigenkosten = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{sachverstaendigenkosten}{Nichtnegative exakte EUR-Gesamtkosten der rechtlich qualifizierten Sachverständigenbeschreibung585bII; keine beliebigen Beratungskosten.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des Sachverständigenverfahrens585bII und der diesem zugeordneten Kosten. Frist und gerichtliche Ernennung separat.}
}
\details{Qualifizierte Sachverständigenkosten zur Hälfte je Vertragsseite aufteilen. §585bII: Verpächter und Pächter tragen jeweils eine Hälfte der qualifizierten Kosten. Nicht erneut durch die Anzahl einzelner Personen innerhalb einer Vertragsseite teilen. Keine Kostenentscheidung über andere Verfahren; bereits gezahlte Beiträge separat. Exakte Hälfte ohne Cent-Rundung; beide Seitenanteile ergeben zusammen den Gesamtbetrag. Nichtnegative Eingangswerte, exakter nichtnegativer EUR-Bruch im sicheren gemeinsamen Zahlenbereich.}
\value{wert ist der exakte EUR-Bruch. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_585b_T0004, BGB_585b_T0005}
\examples{
landpacht_beschreibung_kostenhaelfte(
  sachverstaendigenkosten = "100",
  einordnungsnachweis = paste0(
    "§585bII: Verpächter und Pächter tragen jeweils eine Hälfte d",
    "er qualifizierten Kosten. Nicht erneut durch die Anzahl einz",
    "elner Personen innerhalb einer Vertragsseite teilen. Keine K",
    "ostenentscheidung über andere Verfahren; bereits gezahlte Be",
    "iträge separat. Exakte Hälfte ohne Cent-Rundung; beide Seite",
    "nanteile ergeben zusammen den Gesamtbetrag."
  )
)
}
