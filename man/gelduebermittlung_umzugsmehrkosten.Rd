% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{gelduebermittlung_umzugsmehrkosten}
\alias{gelduebermittlung_umzugsmehrkosten}
\title{gelduebermittlung umzugsmehrkosten}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{gelduebermittlung_umzugsmehrkosten(
  kosten_vor_verlegung = NULL,
  kosten_nach_verlegung = NULL,
  kostenvergleich_nach_270_absatz_3_anwendbar = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{kosten_vor_verlegung}{Nichtnegativer exakt eingegebener Betrag; gemäß rechtlich qualifizierter Vergleichsbasis.}
\item{kosten_nach_verlegung}{Nichtnegativer exakt eingegebener Betrag; gleiche Vergleichs- und Bewertungsbasis.}
\item{kostenvergleich_nach_270_absatz_3_anwendbar}{Explizite rechtliche Bestätigung des in der Abgrenzung beschriebenen Anwendungsfalls. FALSE ergibt NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleere Beschreibung von Herkunft, Zeitpunkt und rechtlicher Zuordnung aller Werte.}
}
\details{Kosten nach Verlegung minus vergleichbare Kosten ohne Verlegung, mindestens null. Nur kausale Mehrkosten der nach Entstehung des Schuldverhältnisses erfolgten Verlegung von Gläubigerwohnsitz oder maßgeblicher Niederlassung. Beträge unter ansonsten gleichen Bedingungen bestimmen; keine Übernahme der gesamten Übermittlungskosten oder Berechnung der Gefahrtragung. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist der exakte Ergebnisbetrag in EUR, keine automatische Cent-Rundung. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_270_T0003}
\examples{
gelduebermittlung_umzugsmehrkosten(
  kosten_vor_verlegung = "10",
  kosten_nach_verlegung = "15",
  kostenvergleich_nach_270_absatz_3_anwendbar = TRUE,
  bewertungsnachweis = paste0(
    "Synthetische qualifizierte Vergleichswerte; Fremdwährung USD",
    ", EUR/USD-Kurs am Ort und Zeitpunkt der Zahlung."
  )
)
}
