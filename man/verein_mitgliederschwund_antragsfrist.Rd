% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{verein_mitgliederschwund_antragsfrist}
\alias{verein_mitgliederschwund_antragsfrist}
\title{verein mitgliederschwund antragsfrist}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{verein_mitgliederschwund_antragsfrist(
  unterschreiten_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{unterschreiten_am}{ISO-Datum des rechtlich maßgeblichen Unterschreitens von drei Vereinsmitgliedern, nicht späterer Kenntnis. Tatsächlichen Verlauf einschließlich Wiederanstieg qualifizieren; Schwelle separat mit vereins_mitgliederschwellen prüfbar.}
\item{einordnungsnachweis}{Nichtleere Begründung des Ereignisses und rechtlichen Anwendungsbereichs§73.}
}
\details{Ereignisdatum plus3 Kalendermonate. Nur rechnerische Grundfrist; rechtliche Kalender-/Verfahrenskorrekturen separat. Keine Entziehung ohne gerichtliche Entscheidung. ISO-Daten und berechnete Grenzen0001..9999, explizite Beginnart/Wahrheitswerte soweit gefordert und nichtleerer Nachweis.}
\value{wert enthält rechnerisches_antragsfristende. Einheit: daten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_73_T0001}
\examples{
verein_mitgliederschwund_antragsfrist(
  unterschreiten_am = "2030-01-31",
  einordnungsnachweis = "Qualifiziertes Unterschreiten der Dreimitgliederschwelle."
)
}
