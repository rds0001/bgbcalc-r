% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{vereinsvermoegen_mitgliederanteil}
\alias{vereinsvermoegen_mitgliederanteil}
\title{vereinsvermoegen mitgliederanteil}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{vereinsvermoegen_mitgliederanteil(
  verteilbarer_ueberschuss = NULL,
  mitglieder_bei_aufloesung = NULL,
  anfallberechtigte_anderweitig_bestimmt = NULL,
  ausschliessliche_mitgliederinteressen = NULL,
  verteilungsnachweis = NULL
)}
\arguments{
\item{verteilbarer_ueberschuss}{Nichtnegativer rechtlich verteilbarer Liquidationsüberschuss in EUR. Nicht ungeprüft Bruttovermögen oder bloßes Ergebnis einer Bestandsrechnung; Gläubigerbefriedigung, Sperrjahr und Sicherheiten separat erfüllen.}
\item{mitglieder_bei_aufloesung}{Positive ganze Zahl bis2^53-1 der zur Zeit der Auflösung beziehungsweise Entziehung der Rechtsfähigkeit vorhandenen maßgeblichen Mitglieder. Nicht einen späteren oder nur teilnehmenden Mitgliederkreis einsetzen.}
\item{anfallberechtigte_anderweitig_bestimmt}{Wahrheitswert einer rechtlich maßgeblichen anderen Bestimmung der Anfallberechtigten gemäß§45 Absätze1/2. TRUE schließt diese gesetzliche Gleichverteilung aus, ohne die andere Verteilung hier zu berechnen.}
\item{ausschliessliche_mitgliederinteressen}{Wahrheitswert, ob der Verein nach seiner Satzung ausschließlich den Interessen seiner Mitglieder diente. Nicht mit irgendeinem Mitgliedervorteil gleichsetzen. FALSE führt in dieser Funktion zu NICHT_ANWENDBAR; Fiskalanfall separat bestimmen.}
\item{verteilungsnachweis}{Nichtleere Beschreibung des verteilbaren Überschusses, maßgeblichen Mitgliederkreises, fehlender anderer Anfallbestimmung und satzungsmäßiger ausschließlicher Mitgliederinteressen.}
}
\details{Nur ohne anderweitige Anfallbestimmung und bei ausschließlichen Mitgliederinteressen: Überschuss geteilt durch maßgebliche Mitgliederzahl. Sonst NICHT_ANWENDBAR. Keine fiktive Gleichverteilung im Fiskalfall oder bei anderer Anfallbestimmung. Tatsächliche Ausantwortungsreife wird nicht aus Zahlen allein abgeleitet. Bruchteile bleiben exakt, keine willkürliche Verteilung von Centresten. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist der exakte EUR-Anteil je maßgeblichem Mitglied; sonst null und NICHT_ANWENDBAR. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_45_T0001, BGB_45_T0002, BGB_45_T0003, BGB_45_T0004}
\examples{
vereinsvermoegen_mitgliederanteil(
  verteilbarer_ueberschuss = "1000",
  mitglieder_bei_aufloesung = 1,
  anfallberechtigte_anderweitig_bestimmt = FALSE,
  ausschliessliche_mitgliederinteressen = TRUE,
  verteilungsnachweis = paste0(
    "Synthetisch verteilbarer Überschuss und gesetzlicher Auffang",
    "fall."
  )
)
}
