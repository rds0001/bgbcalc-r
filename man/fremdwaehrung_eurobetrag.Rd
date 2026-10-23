% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{fremdwaehrung_eurobetrag}
\alias{fremdwaehrung_eurobetrag}
\title{fremdwaehrung eurobetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{fremdwaehrung_eurobetrag(
  fremdwaehrungsbetrag = NULL,
  eurokurs = NULL,
  eurozahlung_nach_244_zulaessig = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{fremdwaehrungsbetrag}{Nichtnegativer Betrag einer bestimmten Fremdwährung; Währung und Zahlungsumstände im Bewertungsnachweis nennen.}
\item{eurokurs}{Strikt positiver maßgeblicher Eurobetrag für genau eine Einheit dieser Fremdwährung. Exakte Dezimalzeichenfolge oder Bruchobjekt, kein inverser Kurs.}
\item{eurozahlung_nach_244_zulaessig}{Explizite rechtliche Bestätigung des in der Abgrenzung beschriebenen Anwendungsfalls. FALSE ergibt NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleere Beschreibung von Herkunft, Zeitpunkt und rechtlicher Zuordnung aller Werte.}
}
\details{Fremdwährungsbetrag mit Euro je Einheit Fremdwährung multiplizieren. Kurswert am Zahlungsort zur tatsächlichen Zahlungszeit als belegte Eingabe. Keine Onlinekurse, keine Umkehrung einer Fremdwährung-je-Euro-Notierung. Nur bei zulässiger Eurozahlung im Inland; ausdrücklich vereinbarte ausschließliche Fremdwährungszahlung ausgeschlossen. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist der exakte Ergebnisbetrag in EUR, keine automatische Cent-Rundung. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_244_T0001, BGB_244_T0002}
\examples{
fremdwaehrung_eurobetrag(
  fremdwaehrungsbetrag = "100",
  eurokurs = "0.9",
  eurozahlung_nach_244_zulaessig = TRUE,
  bewertungsnachweis = paste0(
    "Synthetische qualifizierte Vergleichswerte; Fremdwährung USD",
    ", EUR/USD-Kurs am Ort und Zeitpunkt der Zahlung."
  )
)
}
