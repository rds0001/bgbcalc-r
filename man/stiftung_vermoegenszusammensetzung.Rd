% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{stiftung_vermoegenszusammensetzung}
\alias{stiftung_vermoegenszusammensetzung}
\title{stiftung vermoegenszusammensetzung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{stiftung_vermoegenszusammensetzung(
  gewidmetes_vermoegen = NULL,
  davon_sonstig_gewidmet = NULL,
  zustiftungen = NULL,
  umgewidmeter_grundstock = NULL,
  weiteres_sonstiges_vermoegen = NULL,
  zuordnungsnachweis = NULL
)}
\arguments{
\item{gewidmetes_vermoegen}{Bewerteter noch vorhandener Gesamtbestand der WidmungEUR, einschließlich separat sonstig gewidmetem Teil.}
\item{davon_sonstig_gewidmet}{Nach83bIII dem sonstigen Vermögen zugeordneter Teil, höchstens Gesamtwidmung.}
\item{zustiftungen}{Zusätzlicher zugeordneter Grundstockbestand, nicht bereits in Widmung erfasst.}
\item{umgewidmeter_grundstock}{Von Stiftung zusätzlich zum Grundstock bestimmter Bestand, nicht bereits in Widmung/Zustiftungen/sonstigem Rest erfasst.}
\item{weiteres_sonstiges_vermoegen}{Sonstiger Restbestand nach Abzug umgewidmeter Werte, ohne separat genannten sonstig gewidmeten Teil.}
\item{zuordnungsnachweis}{Nichtleere Bewertung und überschneidungsfreie Zuordnung der Bestände desselben Stichtags. Nur auf unbestimmte Zeit errichtete Stiftung.}
}
\details{Grundstock=Widmung-sonstigerWidmungsteil+Zustiftungen+Umwidmungen; sonstiges=sonstigerWidmungsteil+sonstigerRest; Gesamt=summe. Keine Verbrauchsstiftung, keine unbereinigten historischen Zuflüsse, keine Doppelzählung einer internen Umwidmung. Erhaltung, Vermögensbewertung und Verwendbarkeit separat. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält grundstockvermoegen, sonstiges_vermoegen und stiftungsvermoegen als EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_83b_T0001, BGB_83b_T0002, BGB_83b_T0003, BGB_83b_T0004, BGB_83b_T0005, BGB_83b_T0006, BGB_83b_T0007, BGB_83b_T0008, BGB_83b_T0009}
\examples{
stiftung_vermoegenszusammensetzung(
  gewidmetes_vermoegen = "100",
  davon_sonstig_gewidmet = "20",
  zustiftungen = "30",
  umgewidmeter_grundstock = "10",
  weiteres_sonstiges_vermoegen = "5",
  zuordnungsnachweis = paste0(
    "Gleicher Stichtag, überschneidungsfreie vorhandene Vermögens",
    "bestandteile."
  )
)
}
