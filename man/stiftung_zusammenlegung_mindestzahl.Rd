% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{stiftung_zusammenlegung_mindestzahl}
\alias{stiftung_zusammenlegung_mindestzahl}
\title{stiftung zusammenlegung mindestzahl}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{stiftung_zusammenlegung_mindestzahl(
  anzahl_uebertragender_stiftungen = NULL
)}
\arguments{
\item{anzahl_uebertragender_stiftungen}{Ganzzahl0..2^53-1 rechtlich bestimmter übertragender Stiftungen; neue übernehmende Stiftung nicht mitzählen.}
}
\details{Zahl übertragender Stiftungen mindestens2. Nur numerische Voraussetzung, keine Zulässigkeit/Genehmigung und keine qualitative Prüfung der Nummern1bis3. ISO-Daten und berechnete Grenzen0001..9999; Anzahl als Ganzzahl0..2^53-1; nichtleerer Nachweis beim Fristmodell.}
\value{wert enthält mindestzahl=2 und mindestzahl_erreicht. Einheit: anzahl_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_86a_T0001}
\examples{
stiftung_zusammenlegung_mindestzahl(
  anzahl_uebertragender_stiftungen = 0
)
}
