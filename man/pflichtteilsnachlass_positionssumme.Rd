% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pflichtteilsnachlass_positionssumme}
\alias{pflichtteilsnachlass_positionssumme}
\title{pflichtteilsnachlass positionssumme}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{pflichtteilsnachlass_positionssumme(
  nachlasspositionen = NULL,
  ehegattenvoraus_wert = NULL,
  berechtigter_abkoemmling_oder_elternteil = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{nachlasspositionen}{Liste0..1000 eindeutiger Positionen mit genau position_id (nichtleer), betrag (nichtnegativer exakter EUR-Wert), vermoegensseite (aktiv/passiv), ansatzart (unbedingt/aufloesend_offen/aufschiebend_offen/ungewiss_oder_unsicher). Vollständig, überschneidungsfrei und rechtlich qualifiziert. Nur erste zwei Ansatzarten zählen.}
\item{ehegattenvoraus_wert}{Nichtnegativer exakter Vorauswert, bereits in Aktiva enthalten und dort noch nicht abgezogen.}
\item{berechtigter_abkoemmling_oder_elternteil}{Pflichtwahrheitswert: nur bei TRUE Voraus nach2311I2 abziehen.}
\item{bewertungsnachweis}{Nichtleerer Nachweis rechtlicher Qualifizierung, Ansatzarten und gleicher maßgeblicher Bewertungsgrundlage. Geeigneter Ertragswert2312 darf qualifizierter Bewertungsinput sein.}
}
\details{Berücksichtigte Aktiv-/Passivpositionen getrennt addieren; Passiva und ggf.Voraus abziehen; negative Nettobasis erhalten. Keine automatische Bewertung oder rechtliche Bedingungsprüfung; nach Bedingungseintritt Positionen neu qualifizieren. Keine Pflichtteilsquote, Kapitalisierung oder Zahlungsanspruch. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält beruecksichtigte_aktiva, beruecksichtigte_passiva, abgezogener_ehegattenvoraus und vorzeichenbehafteten pflichtteilsnachlass als exakte EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2311_T0001, BGB_2311_T0002, BGB_2313_T0001, BGB_2313_T0002, BGB_2313_T0004}
\examples{
pflichtteilsnachlass_positionssumme(
  nachlasspositionen = list(
    list(
    "position_id" = "A",
    "betrag" = "100",
    "vermoegensseite" = "aktiv",
    "ansatzart" = "unbedingt"
  ),
    list(
    "position_id" = "B",
    "betrag" = "20",
    "vermoegensseite" = "aktiv",
    "ansatzart" = "aufloesend_offen"
  ),
    list(
    "position_id" = "C",
    "betrag" = "30",
    "vermoegensseite" = "passiv",
    "ansatzart" = "unbedingt"
  ),
    list(
    "position_id" = "D",
    "betrag" = "1000",
    "vermoegensseite" = "aktiv",
    "ansatzart" = "aufschiebend_offen"
  ),
    list(
    "position_id" = "E",
    "betrag" = "1000",
    "vermoegensseite" = "passiv",
    "ansatzart" = "ungewiss_oder_unsicher"
  )
  ),
  ehegattenvoraus_wert = "10",
  berechtigter_abkoemmling_oder_elternteil = TRUE,
  bewertungsnachweis = "Synthetisch rechtlich qualifizierte Stichtagspositionen."
)
}
