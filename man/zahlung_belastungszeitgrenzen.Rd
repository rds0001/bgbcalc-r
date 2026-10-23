% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{zahlung_belastungszeitgrenzen}
\alias{zahlung_belastungszeitgrenzen}
\title{zahlung belastungszeitgrenzen}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{zahlung_belastungszeitgrenzen(
  auftragszugang_utc = NULL,
  kontobelastung_utc = NULL,
  wertstellung_utc = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{auftragszugang_utc}{Tatsaechlicher rechtlich massgeblicher Zugang als sekundengenauer UTC-Zeitpunkt.}
\item{kontobelastung_utc}{Tatsaechliche Kontobelastung als sekundengenauer UTC-Zeitpunkt.}
\item{wertstellung_utc}{Tatsaechliche Belastungswertstellung als sekundengenauer UTC-Zeitpunkt.}
\item{einordnungsnachweis}{675tIIIAnwendbarkeit und tatsaechliche zeitliche Zuordnung belegen; UTCvorher normalisieren.}
}
\details{Tatsaechliche Kontobelastung nicht vor Auftragszugang und Wertstellung nicht vor Belastung vergleichen. §675tI2/III: Gutschriftspaetestens am qualifizierten Eingangsgeschaeftstag wertstellen; Belastung nicht vor tatsaechlichem Auftragszugang, Belastungswertstellung nicht vor tatsaechlicher Kontobelastung. Keine automatische Bankkalender-/Zeitzonenannahme. Eingangsgeschaeftstag nach tatsaechlichem Vorgang und anwendbarem Kalender qualifizieren, kein frei erfundener spaeterer Valutatag. Unverzuegliche Verfuegbarkeit und Verbraucherbareinzahlung675tII1 haben keine feste weitere BGB-Sekundenzahl; nicht als Erlaubnis bis Tagesende ausgeben. Nichtverbraucher-Bareinzahlung verwendet bestehenden Geschaeftstagskern675tII2.675tIVSperrfreigabe unverzueglich, genaue Zustimmungssumme ist qualitative Befugnisgrenze; keine erfundene fixe Haltefrist.675dVI/675tVSonderausnahmen vorqualifizieren. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Zwei getrennte einschliessliche UTC-Zeitgrenzenvergleiche. Einheit: wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_675t_T0008, BGB_675t_T0009}
\examples{
zahlung_belastungszeitgrenzen(
  auftragszugang_utc = "2024-02-29T08:00:00Z",
  kontobelastung_utc = "2024-02-29T09:00:00Z",
  wertstellung_utc = "2024-02-29T09:00:00Z",
  einordnungsnachweis = paste0(
    "§675tI2/III: Gutschriftspaetestens am qualifizierten Eingang",
    "sgeschaeftstag wertstellen; Belastung nicht vor tatsaechlich",
    "em Auftragszugang, Belastungswertstellung nicht vor tatsaech",
    "licher Kontobelastung. Keine automatische Bankkalender-/Zeit",
    "zonenannahme. Eingangsgeschaeftstag nach tatsaechlichem Vorg",
    "ang und anwendbarem Kalender qualifizieren, kein frei erfund",
    "ener spaeterer Valutatag. Unverzuegliche Verfuegbarkeit und ",
    "Verbraucherbareinzahlung675tII1 haben keine feste weitere BG",
    "B-Sekundenzahl; nicht als Erlaubnis bis Tagesende ausgeben. ",
    "Nichtverbraucher-Bareinzahlung verwendet bestehenden Geschae",
    "ftstagskern675tII2.675tIVSperrfreigabe unverzueglich, genaue",
    " Zustimmungssumme ist qualitative Befugnisgrenze; keine erfu",
    "ndene fixe Haltefrist.675dVI/675tVSonderausnahmen vorqualifi",
    "zieren."
  )
)
}
