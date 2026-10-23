% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pacht_inventar_ausgleichsdifferenz}
\alias{pacht_inventar_ausgleichsdifferenz}
\title{pacht inventar ausgleichsdifferenz}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{pacht_inventar_ausgleichsdifferenz(
  uebernommener_gesamtschaetzwert_zu_endpreisen = NULL,
  zurueckzugewaehrender_gesamtschaetzwert_zu_endpreisen = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{uebernommener_gesamtschaetzwert_zu_endpreisen}{Nichtnegativer exakter Dezimalwert/Bruch; Inventarwerte in EUR zu einheitlichen Endpreisen, Holzmengen in identischer Einheit/Qualität, Einheitswert in EUR je Mengeneinheit. Bei entsprechender Anwendung590III beide Bestände zum rechtlich maßgeblichen Zwischenabrechnungszeitpunkt bewerten; Endpreise bezeichnet dann diesen gemeinsamen Zeitpunkt.}
\item{zurueckzugewaehrender_gesamtschaetzwert_zu_endpreisen}{Nichtnegativer exakter Dezimalwert/Bruch; Inventarwerte in EUR zu einheitlichen Endpreisen, Holzmengen in identischer Einheit/Qualität, Einheitswert in EUR je Mengeneinheit. Bei entsprechender Anwendung590III beide Bestände zum rechtlich maßgeblichen Zwischenabrechnungszeitpunkt bewerten; Endpreise bezeichnet dann diesen gemeinsamen Zeitpunkt.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des gesetzlichen Pachtfalls, rechtlich qualifizierter Bestände/Mengen und vergleichbarer Bewertung.}
}
\details{Gesamtschätzwert des übernommenen Inventars minus Gesamtschätzwert des zurückzugewährenden Inventars, beide zu Preisen bei Pachtende §582a Absatz3 bei qualifizierter Inventarübernahme/-rückgewähr zum Schätzwert; entsprechend §590 Absatz3 bei qualifizierter wesentlicher Inventarverminderung während der Pachtzeit ohne gesetzliche Verwendungsausnahme. Im letzteren Fall sind Endpreise die einheitlichen Preise des rechtlich maßgeblichen Zwischenabrechnungszeitpunkts; der zweite Bestand ist das dort verbleibende Inventar, nicht ein erfundener künftiger Rückgabebestand. Positives Ergebnis bezeichnet Ausgleich vom Pächter an Verpächter, negatives Ergebnis den Betrag mit umgekehrter Richtung, null keinen Wertausgleich. Beide Inventarbestände mit Preisen desselben maßgeblichen Abrechnungszeitpunkts bewerten, nicht historische Anfangspreise gegen aktuelle Endpreise. Rechtlich wirksam abgelehnte überflüssige/überwertige Stücke zuvor aus dem zurückzugewährenden Bestand ausschließen. Keine Inventarbewertung, Eigentumsentscheidung oder zusätzliche Schadensersatzrechnung. Nichtnegative Eingangswerte; exakte vorzeichenbehaftete Ausgleichsdifferenz im sicheren gemeinsamen Zahlenbereich.}
\value{wert ist exakter EUR-Bruch. Bei Inventardifferenz positiv=Pächter zahlt Verpächter, negativ=umgekehrte Richtung; Holzwertersatz nichtnegativ. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_582a_T0007, BGB_582a_T0008, BGB_590_T0008}
\examples{
pacht_inventar_ausgleichsdifferenz(
  uebernommener_gesamtschaetzwert_zu_endpreisen = "1000",
  zurueckzugewaehrender_gesamtschaetzwert_zu_endpreisen = "800",
  einordnungsnachweis = paste0(
    "Qualifiziertes Inventar; beide Bestände zu Preisen bei Pacht",
    "ende, abgelehnte Stücke bereinigt."
  )
)
}
