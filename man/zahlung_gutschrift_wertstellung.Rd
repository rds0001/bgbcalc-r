% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{zahlung_gutschrift_wertstellung}
\alias{zahlung_gutschrift_wertstellung}
\title{zahlung gutschrift wertstellung}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{zahlung_gutschrift_wertstellung(
  eingangsgeschaeftstag = NULL,
  wertstellungsdatum = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{eingangsgeschaeftstag}{Qualifizierter tatsaechlicher Eingangsgeschaeftstag beim Zahlungsdienstleister als ISO-Datum.}
\item{wertstellungsdatum}{Tatsaechlich gebuchtes Datum der Gutschrift-Wertstellung.}
\item{einordnungsnachweis}{675tI2Anwendbarkeit, Eingangsgeschaeftstag und Bankkalender rechtlich belegen.}
}
\details{Tatsaechliches Gutschrift-Wertstellungsdatum mit Eingangsgeschaeftstag als spaetester Grenze vergleichen. §675tI2/III: Gutschriftspaetestens am qualifizierten Eingangsgeschaeftstag wertstellen; Belastung nicht vor tatsaechlichem Auftragszugang, Belastungswertstellung nicht vor tatsaechlicher Kontobelastung. Keine automatische Bankkalender-/Zeitzonenannahme. Eingangsgeschaeftstag nach tatsaechlichem Vorgang und anwendbarem Kalender qualifizieren, kein frei erfundener spaeterer Valutatag. Unverzuegliche Verfuegbarkeit und Verbraucherbareinzahlung675tII1 haben keine feste weitere BGB-Sekundenzahl; nicht als Erlaubnis bis Tagesende ausgeben. Nichtverbraucher-Bareinzahlung verwendet bestehenden Geschaeftstagskern675tII2.675tIVSperrfreigabe unverzueglich, genaue Zustimmungssumme ist qualitative Befugnisgrenze; keine erfundene fixe Haltefrist.675dVI/675tVSonderausnahmen vorqualifizieren. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Spaetestes Datum und einschliesslicher Vergleich, keine automatische Verfuegbarkeitsentscheidung. Einheit: datum_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_675t_T0001, BGB_675t_T0002, BGB_675t_T0003, BGB_675t_T0004, BGB_675t_T0005}
\examples{
zahlung_gutschrift_wertstellung(
  eingangsgeschaeftstag = "2024-02-29",
  wertstellungsdatum = "2024-02-29",
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
