% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{ausgleichung_zuschuss_mehrbetrag}
\alias{ausgleichung_zuschuss_mehrbetrag}
\title{ausgleichung zuschuss mehrbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{ausgleichung_zuschuss_mehrbetrag(
  zuwendungswert = NULL,
  angemessenes_mass = NULL,
  zuwendung_nach_2050_abs2_qualifiziert = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{zuwendungswert}{Nichtnegativer exakter EUR-Wert qualifizierter Einkünftezuschüsse oder Berufsvorbildungskosten2050II.}
\item{angemessenes_mass}{Nichtnegative rechtlich bewertete angemessene Summe nach Vermögensverhältnissen des Erblassers auf vergleichbarer Wertgrundlage. Keine erfundene gesetzliche Prozentgrenze.}
\item{zuwendung_nach_2050_abs2_qualifiziert}{Pflichtwahrheitswert: Ausgleichungsfall2050II rechtlich festgestellt. FALSE ergibt NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleerer Nachweis des Anwendungsfalls und angemessenen Maßes.}
}
\details{Zuwendungswert minus angemessenes Maß, mindestens null. Keine automatische Angemessenheitsprüfung, Bewertung2055 oder abschließende Ausgleichung2055/2056. Keine unqualifizierte Zusammenrechnung verschiedener Zuwendungen. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist ausgleichungsrelevanter Mehrbetrag als exakter EUR-Bruch; kein sofortiger Zahlungsanspruch. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2050_T0002}
\examples{
ausgleichung_zuschuss_mehrbetrag(
  zuwendungswert = "100",
  angemessenes_mass = "60",
  zuwendung_nach_2050_abs2_qualifiziert = TRUE,
  bewertungsnachweis = paste0(
    "Synthetisch qualifizierte Vorbildungskosten und angemessenes",
    " Maß."
  )
)
}
