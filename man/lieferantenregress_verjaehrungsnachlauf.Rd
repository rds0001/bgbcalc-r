% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{lieferantenregress_verjaehrungsnachlauf}
\alias{lieferantenregress_verjaehrungsnachlauf}
\title{lieferantenregress verjaehrungsnachlauf}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{lieferantenregress_verjaehrungsnachlauf(
  bisheriges_fristende = NULL,
  kaeuferanspruch_erfuellt_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{bisheriges_fristende}{Rechtlich maßgebliches ISO-Datum0001..9999 des benannten Ereignisses; kein bloßes Kenntnis-/Anzeigedatum.}
\item{kaeuferanspruch_erfuellt_am}{Rechtlich maßgebliches ISO-Datum0001..9999 des benannten Ereignisses; kein bloßes Kenntnis-/Anzeigedatum.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des gesetzlichen Anspruchsfalls und beider maßgeblicher Ereignisse; Hemmung/Korrekturen separat.}
}
\details{Maximum aus separat bestimmter konkreter Anspruchsfrist und Käuferanspruchserfüllung+2Monate. 437-/445a-Anspruchsfrist bereits separat bestimmt; keine pauschaleZweijahresfrist, keine historischeFünfjahreskappung. EigeneKorrekturen/Ereignisqualifikationgesondert. Nur Grundfristen vor Hemmung/Ablaufhemmung/Neubeginn/Feiertagskorrekturen. ISO-Daten und Ergebnisse0001..9999;852EntstehungnichtvorVerletzungsereignis.}
\value{wert enthält beide Teilfristenden und verknüpftes Ende; bei Grundfristfunktionen verknuepftes_grundfristende, beim Nachlauf verknuepftes_fristende; alle letzten eingeschlossenen Tage bisTagesablauf. Einheit: daten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_445b_T0002, BGB_445b_T0003}
\examples{
lieferantenregress_verjaehrungsnachlauf(
  bisheriges_fristende = "2033-02-28",
  kaeuferanspruch_erfuellt_am = "2033-01-31",
  einordnungsnachweis = "Qualifizierter437-AnspruchundseparatbestimmteGrundfrist."
)
}
