% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{stiftung_uebergang_bekanntmachungsfristen}
\alias{stiftung_uebergang_bekanntmachungsfristen}
\title{stiftung uebergang bekanntmachungsfristen}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{stiftung_uebergang_bekanntmachungsfristen(
  wirkungen_am = NULL,
  veroeffentlichung_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{wirkungen_am}{ISO-Datum des Eintritts der Wirkungen§86f, regelmäßig Unanfechtbarkeit der Genehmigung/Entscheidung; keine bloße Vertragsunterzeichnung.}
\item{veroeffentlichung_am}{ISO-Datum der tatsächlichen ordnungsgemäßen Bundesanzeigerveröffentlichung ab Wirkungsereignis. Auch verspätete Veröffentlichung mit tatsächlichem Datum eingeben, nicht auf Sollfrist zurückdatieren.}
\item{einordnungsnachweis}{Nichtleere rechtliche Begründung von Wirkungsereignis und ordnungsgemäßer Bekanntmachung einschließlich Gläubigerhinweis.}
}
\details{Wirkungsdatum+1 Monat für Veröffentlichung; tatsächliche Veröffentlichung+2 Tage für Bewirkung; Bewirkung+6 Monate für Gläubigeranmeldung. Grundfristen, ohne automatische Kalenderkorrekturen oder Sicherungsberechtigungsprüfung. Bewirkung am Tagesende. ISO-Daten und berechnete Grenzen0001..9999; Anzahl als Ganzzahl0..2^53-1; nichtleerer Nachweis beim Fristmodell.}
\value{wert enthält rechnerisches_bekanntmachungsfristende, bekanntmachung_bewirkt_mit_ablauf, rechnerisches_anmeldefristende. Einheit: daten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_86g_T0001, BGB_86g_T0002, BGB_86g_T0003, BGB_86h_T0001, BGB_86h_T0002, BGB_86h_T0003}
\examples{
stiftung_uebergang_bekanntmachungsfristen(
  wirkungen_am = "2030-01-31",
  veroeffentlichung_am = "2030-02-28",
  einordnungsnachweis = paste0(
    "Qualifizierte Unanfechtbarkeit und Veröffentlichung mit Gläu",
    "bigerhinweis."
  )
)
}
