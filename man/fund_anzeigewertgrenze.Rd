% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{fund_anzeigewertgrenze}
\alias{fund_anzeigewertgrenze}
\title{fund anzeigewertgrenze}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{fund_anzeigewertgrenze(
  sachenwert = NULL
)}
\arguments{
\item{sachenwert}{Nichtnegativer rechtlich bewerteter Wert der gefundenen SacheEUR.}
}
\details{Strikter Vergleich Sachenwert>10EUR, Gleichheit genügt nicht. Nur numerische965II-Anzeigegrenze; keine Befreiung von965I oder sonstigen Finderpflichten. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält wertgrenze als EUR-Bruch und wertgrenze_ueberschritten. Einheit: EUR_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_965_T0003}
\examples{
fund_anzeigewertgrenze(
  sachenwert = "0"
)
}
