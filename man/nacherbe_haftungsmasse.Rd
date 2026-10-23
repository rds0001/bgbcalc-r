% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{nacherbe_haftungsmasse}
\alias{nacherbe_haftungsmasse}
\title{nacherbe haftungsmasse}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{nacherbe_haftungsmasse(
  erlangter_erbschaftswert_ohne_vorerbenansprueche = NULL,
  anspruchswert_gegen_vorerben = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{erlangter_erbschaftswert_ohne_vorerbenansprueche}{Nichtnegativer EUR-Wert des Erlangten ohne separat genannte Vorerbenansprüche.}
\item{anspruchswert_gegen_vorerben}{Nichtnegativer rechtlich/wirtschaftlich bewerteter EUR-Wert der Ansprüche gegen Vorerben als solchen. Nicht doppelt bereits erfüllte Ansprüche erfassen.}
\item{bewertungsnachweis}{Nichtleerer Nachweis der überschneidungsfreien2144I-Massenbestandteile.}
}
\details{Erlangten Erbschaftswert und überschneidungsfreie Vorerbenansprüche summieren. Numerische Masse, keine automatische Haftungsbeschränkung/Rangentscheidung oder Insolvenzbewertung. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist zusammengerechneter EUR-Massenwert als exakter Bruch. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2144_T0001}
\examples{
nacherbe_haftungsmasse(
  erlangter_erbschaftswert_ohne_vorerbenansprueche = "80",
  anspruchswert_gegen_vorerben = "20",
  bewertungsnachweis = "Synthetische getrennte Massenbestandteile."
)
}
