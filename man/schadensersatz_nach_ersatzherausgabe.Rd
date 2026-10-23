% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{schadensersatz_nach_ersatzherausgabe}
\alias{schadensersatz_nach_ersatzherausgabe}
\title{schadensersatz nach ersatzherausgabe}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{schadensersatz_nach_ersatzherausgabe(
  schadensersatz_vor_anrechnung = NULL,
  wert_des_erlangten_ersatzes = NULL,
  ersatzrecht_nach_285_ausgeuebt = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{schadensersatz_vor_anrechnung}{Nichtnegativer exakt eingegebener Betrag; gemäß rechtlich qualifizierter Vergleichsbasis.}
\item{wert_des_erlangten_ersatzes}{Nichtnegativer exakt eingegebener Betrag; gleiche Vergleichs- und Bewertungsbasis.}
\item{ersatzrecht_nach_285_ausgeuebt}{Explizite rechtliche Bestätigung des in der Abgrenzung beschriebenen Anwendungsfalls. FALSE ergibt NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleere Beschreibung von Herkunft, Zeitpunkt und rechtlicher Zuordnung aller Werte.}
}
\details{Schadensersatz statt der Leistung um den Wert des herausverlangten Ersatzes mindern, mindestens null. Wirksamer Schadensersatzanspruch statt der Leistung und Ausübung des Rechts nach§285 Absatz1 fachlich vorgegeben. Ausgangsbetrag noch ohne diese Anrechnung. Keine Rückzahlungsforderung bei höherem Ersatzwert; Herausgabeanspruch und sonstige Anspruchsänderungen separat. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist der exakte Ergebnisbetrag in EUR, keine automatische Cent-Rundung. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_285_T0001, BGB_285_T0002}
\examples{
schadensersatz_nach_ersatzherausgabe(
  schadensersatz_vor_anrechnung = "100",
  wert_des_erlangten_ersatzes = "30",
  ersatzrecht_nach_285_ausgeuebt = TRUE,
  bewertungsnachweis = paste0(
    "Synthetische qualifizierte Vergleichswerte; Fremdwährung USD",
    ", EUR/USD-Kurs am Ort und Zeitpunkt der Zahlung."
  )
)
}
