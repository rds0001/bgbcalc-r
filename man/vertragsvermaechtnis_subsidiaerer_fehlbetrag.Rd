% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{vertragsvermaechtnis_subsidiaerer_fehlbetrag}
\alias{vertragsvermaechtnis_subsidiaerer_fehlbetrag}
\title{vertragsvermaechtnis subsidiaerer fehlbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{vertragsvermaechtnis_subsidiaerer_fehlbetrag(
  geschuldeter_ersatzwert = NULL,
  vom_erben_erlangbarer_ersatz = NULL,
  subsidiaerfall_nach_2288_qualifiziert = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{geschuldeter_ersatzwert}{Nichtnegativer rechtlich bewerteter gesamter EUR-Ersatzwert2288II.}
\item{vom_erben_erlangbarer_ersatz}{Nichtnegativer rechtlich beim Erben erlangbarer Ersatzanteil, höchstens Gesamtwert; nicht bloß bislang gezahlte Summe.}
\item{subsidiaerfall_nach_2288_qualifiziert}{Pflichtwahrheitswert zu beeinträchtigender schenkweiser Veräußerung/Belastung eines vertragsmäßig vermachten Gegenstands2288II2; FALSE NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleerer Nachweis der Ersatzbewertung und rechtlichen Erlangbarkeit beim Erben.}
}
\details{Geschuldeten Ersatzwert minus vom Erben erlangbaren Ersatzanteil. Nur subsidiäre Ausgangsgröße vor weiteren2287-Bereicherungsgrenzen, kein automatischer endgültiger Zahlungsanspruch; kein2329-Rangmodell. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist subsidiärer Fehlbetrag als exakter EUR-Bruch. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2288_T0003}
\examples{
vertragsvermaechtnis_subsidiaerer_fehlbetrag(
  geschuldeter_ersatzwert = "100",
  vom_erben_erlangbarer_ersatz = "30",
  subsidiaerfall_nach_2288_qualifiziert = TRUE,
  bewertungsnachweis = "Synthetisch qualifizierter subsidiärer Ersatzfall."
)
}
