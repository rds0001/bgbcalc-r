% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{stiftung_wiederaufstockungsrest}
\alias{stiftung_wiederaufstockungsrest}
\title{stiftung wiederaufstockungsrest}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{stiftung_wiederaufstockungsrest(
  verbrauchter_grundstock = NULL,
  bereits_wiederaufgestockt = NULL,
  zuordnungsnachweis = NULL
)}
\arguments{
\item{verbrauchter_grundstock}{Betrag eines rechtlich qualifizierten Grundstockverbrauchs nach83cII inEUR.}
\item{bereits_wiederaufgestockt}{Demselben Verbrauch auf gleicher Bewertungsbasis zugeordnete bisherige AuffüllungEUR.}
\item{zuordnungsnachweis}{Nichtleerer Nachweis der Zuordnung, keine doppelt angerechnete Auffüllung.}
}
\details{max(Verbrauch-zugeordneteAuffüllung,0). Keine Bewertung angemessener Zeit, keine Zulässigkeit des Verbrauchs, keine Entnahmefreigabe bei Überschuss. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist verbleibender Auffüllungsbetrag als exakter EUR-Bruch. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_83c_T0001, BGB_83c_T0002, BGB_83c_T0003, BGB_83c_T0004, BGB_83c_T0005, BGB_83c_T0006}
\examples{
stiftung_wiederaufstockungsrest(
  verbrauchter_grundstock = "100",
  bereits_wiederaufgestockt = "40",
  zuordnungsnachweis = "Derselbe qualifizierte Verbrauch, keine Doppelanrechnung."
)
}
