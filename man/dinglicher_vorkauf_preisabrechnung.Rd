% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{dinglicher_vorkauf_preisabrechnung}
\alias{dinglicher_vorkauf_preisabrechnung}
\title{dinglicher vorkauf preisabrechnung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{dinglicher_vorkauf_preisabrechnung(
  vereinbarter_kaufpreis = NULL,
  bereits_berichtigter_kaufpreis = NULL,
  anwendungsfall_qualifiziert = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{vereinbarter_kaufpreis}{Nichtnegativer identischer maßgeblicher Kaufpreis des ursprünglichen Kaufs und des dinglichen Vorkaufs in EUR.}
\item{bereits_berichtigter_kaufpreis}{Nichtnegativer schon berichtigter Teil dieses Kaufpreises, höchstens vereinbarter_kaufpreis; keine Überzahlung oder Zahlung auf andere Forderungen.}
\item{anwendungsfall_qualifiziert}{Bestätigung der Voraussetzungen1100–1102 einschließlich Käufer-/Rechtsnachfolgerstellung, Eigentumsverlust und Erstattungslage; FALSE ergibt NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleerer Nachweis zu Preisidentität, Berichtigung und dinglichem Vorkaufsfall.}
}
\details{Berichtigten Preis beim Vorkaufsberechtigten als Erstattung und beim ursprünglichen Kaufpreis als schon erfüllt zuordnen. Vorkaufrestpreis=Preis-berichtigt; ursprünglicher Käufer wird vom selben Rest befreit. Nur qualifizierter gleichpreisiger Fall; keine automatische Eigentumsentscheidung oder doppelte Rückforderung gegen Verkäufer. Andere Preis-/Erfüllungsgrundlagen gesondert. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert: erstattung_an_kaeufer, verbleibender_vorkaufpreis_an_verpflichteten und befreiung_urspruenglicher_kaeufer in EUR. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1100_T0001, BGB_1100_T0002, BGB_1101_T0001, BGB_1102_T0001}
\examples{
dinglicher_vorkauf_preisabrechnung(
  vereinbarter_kaufpreis = "100",
  bereits_berichtigter_kaufpreis = "30",
  anwendungsfall_qualifiziert = TRUE,
  bewertungsnachweis = "Synthetischer gleichpreisiger1100–1102-Fall."
)
}
