% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{vereins_mitgliederschwellen}
\alias{vereins_mitgliederschwellen}
\title{vereins mitgliederschwellen}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{vereins_mitgliederschwellen(
  mitgliederzahl = NULL,
  satzungsunterzeichner = NULL
)}
\arguments{
\item{mitgliederzahl}{Nichtnegative ganze Zahl bis2^53-1 der Mitglieder zum maßgeblichen Beurteilungszeitpunkt. Für Eintragung und späteres Unterschreiten den jeweils relevanten Bestand vorgeben.}
\item{satzungsunterzeichner}{Nichtnegative ganze Zahl bis2^53-1 rechtlich zählender Mitgliedsunterschriften unter der Satzung. Nicht bloß Zahl beliebiger Unterschriften. Dieser historisch maßgebliche Unterschriftenbestand muss nicht ungeprüft mit dem heutigen Mitgliederbestand gleichgesetzt werden.}
}
\details{Eintragungszahl erreicht bei mindestens7Mitgliedern. Unterschriftenzahl erreicht bei mindestens7zählenden Mitgliedsunterschriften. Untergrenze unterschritten nur bei weniger als3Mitgliedern, nicht bei genau3. Nur drei numerische Prädikate. Weitere Voraussetzungen, Soll-Regelungen, Satzungsdatum und registergerichtliche Entscheidungen getrennt. Unter3 bewirkt nicht automatisch Entziehung; Dreimonatsfrist/Anhörung§73 hier nicht berechnet. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält eintragungs_mitgliederzahl_erreicht, satzungsunterschriftenzahl_erreicht und mitgliederzahl_unter_drei als Wahrheitswerte. Keine kombinierte Registerfreigabe. Einheit: wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_56_T0001, BGB_59_T0003, BGB_73_T0001}
\examples{
vereins_mitgliederschwellen(
  mitgliederzahl = 0,
  satzungsunterzeichner = 0
)
}
