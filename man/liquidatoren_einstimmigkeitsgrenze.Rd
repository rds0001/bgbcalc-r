% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{liquidatoren_einstimmigkeitsgrenze}
\alias{liquidatoren_einstimmigkeitsgrenze}
\title{liquidatoren einstimmigkeitsgrenze}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{liquidatoren_einstimmigkeitsgrenze(
  anzahl_liquidatoren = NULL,
  zustimmende_liquidatoren = NULL
)}
\arguments{
\item{anzahl_liquidatoren}{Ganze Zahl1..2^53-1 des qualifizierten Liquidatorenkreises.}
\item{zustimmende_liquidatoren}{Ganze Zahl0..AnzahlLiquidatoren der tatsächlich anrechenbaren Zustimmungen.}
}
\details{ErforderlicheStimmen=AnzahlLiquidatoren; Fehlbetrag=Anzahl-Zustimmungen; erreicht genau bei Gleichheit. Nur gesetzlicher Grundfall ohne abweichende Bestimmung. Keine Beschluss-/Vertretungswirksamkeitsentscheidung. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält erforderliche_zustimmungen, fehlende_zustimmungen und einstimmigkeit_erreicht. Einheit: anzahl_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_48_T0004}
\examples{
liquidatoren_einstimmigkeitsgrenze(
  anzahl_liquidatoren = 3,
  zustimmende_liquidatoren = 2
)
}
