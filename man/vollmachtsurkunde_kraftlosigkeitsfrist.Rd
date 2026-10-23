% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{vollmachtsurkunde_kraftlosigkeitsfrist}
\alias{vollmachtsurkunde_kraftlosigkeitsfrist}
\title{vollmachtsurkunde kraftlosigkeitsfrist}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{vollmachtsurkunde_kraftlosigkeitsfrist(
  letzte_einrueckung_am = NULL,
  vollmacht_widerruflich = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{letzte_einrueckung_am}{ISO-Datum der letzten rechtlich maßgeblichen Einrückung einer ordnungsgemäß bewilligten/veröffentlichten Kraftloserklärung; nicht erste Veröffentlichung oder bloßer Widerruf.}
\item{vollmacht_widerruflich}{Expliziter Wahrheitswert zur rechtlichen Widerruflichkeit; FALSE ergibt NICHT_ANWENDBAR entsprechend§176 Absatz3.}
\item{einordnungsnachweis}{Nichtleere Begründung der letzten Einrückung, ordnungsgemäßen Veröffentlichung und Widerruflichkeit.}
}
\details{Letzte Einrückung plus1 Kalendermonat als Ereignisfrist; Wirkung mit Tagesablauf. ZPO-Veröffentlichungsvoraussetzungen und Zuständigkeit nicht automatisch geprüft; keine pauschale§193-Verschiebung. ISO-Daten und berechnete Grenzen0001..9999, explizite Beginnart/Wahrheitswerte soweit gefordert und nichtleerer Nachweis.}
\value{wert enthält kraftlosigkeitsfristende, bei fehlender Widerruflichkeit null. Einheit: daten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_176_T0001, BGB_176_T0002, BGB_176_T0004}
\examples{
vollmachtsurkunde_kraftlosigkeitsfrist(
  letzte_einrueckung_am = "2030-01-31",
  vollmacht_widerruflich = TRUE,
  einordnungsnachweis = "Letzte ordnungsgemäße Einrückung, Vollmacht widerruflich."
)
}
