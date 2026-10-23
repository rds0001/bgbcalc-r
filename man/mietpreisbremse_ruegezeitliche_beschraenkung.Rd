% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{mietpreisbremse_ruegezeitliche_beschraenkung}
\alias{mietpreisbremse_ruegezeitliche_beschraenkung}
\title{mietpreisbremse ruegezeitliche beschraenkung}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{mietpreisbremse_ruegezeitliche_beschraenkung(
  mietbeginn_am = NULL,
  ruegezugang_lokal_am = NULL,
  ruegezugang_utc = NULL,
  mietende_utc = NULL,
  zeitnachweis = NULL
)}
\arguments{
\item{mietbeginn_am}{ISO-Datum des rechtlich maßgeblichen Mietbeginns zu Tagesbeginn; nicht bloßer Vertragsabschluss.}
\item{ruegezugang_lokal_am}{ISO-Kalendertag des wirksamen Zugangs am rechtlich maßgeblichen Ort. Für30Monatsvergleich, nicht ungeprüft UTC-Datum verwenden.}
\item{ruegezugang_utc}{Derselbe wirksame Zugang als hinreichend genauer UTC-Sekundenzeitpunkt.}
\item{mietende_utc}{Rechtlich wirksamer Beendigungszeitpunkt als UTC-Sekundenzeitpunkt, ab dem das Mietverhältnis beendet ist; None/NULL wenn kein Ende feststeht.}
\item{zeitnachweis}{Geltung556gII3, Tagesbeginn des Mietverhältnisses, Lokal-/UTC-Zuordnung und wirksame Beendigung/Wirksamkeit der Rüge vorqualifizieren.}
}
\details{30Monatsende aus Tagesbeginn berechnen, lokalen Rügetag und unabhängig davon UTC-Beendigungszeitpunkt vergleichen; Beschränkungsgründe mit ODER verbinden. 556gII3:30Kalendermonate ab Mietbeginn zu Tagesbeginn nach187II/188. Zugang nach dem so berechneten letzten Tag ist verspätet. Unabhängig davon Beschränkung, wenn Mietverhältnis beim UTC-Zugang bereits beendet ist; Zugang gleich exklusivem Beendigungszeitpunkt zählt als beendet. Bei üblichem Vertragsende31.12.um24Uhr ist dieser Zeitpunkt1.1.um00Uhr in zutreffender Zeitzone, anschließend inUTC normalisieren. Keine pauschalen900Tage, keine Zeitzone raten und keine193-Verlängerung dieses Rückwirkungsmerkmals. Kein materielles Urteil über Rügeform/Auskunft, Rückzahlungsbetrag oder Verjährung. Lokalzugangstag undUTC-Zeit müssen dasselbe rechtlich qualifizierte Ereignis bezeichnen. Für untertägigen Mietbeginn ist diese Tagesbeginnvariante nicht freigegeben. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{30Monats-Endtag und getrennte Wahrheitswerte für Fristüberschreitung, Beendigung und kombinierte Rückforderungsbeschränkung. Einheit: datum_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_556g_T0013, BGB_556g_T0014, BGB_556g_T0015}
\examples{
mietpreisbremse_ruegezeitliche_beschraenkung(
  mietbeginn_am = "2024-01-01",
  ruegezugang_lokal_am = "2026-06-30",
  ruegezugang_utc = "2026-06-30T12:00:00Z",
  mietende_utc = NULL,
  zeitnachweis = paste0(
    "556gII3:30Kalendermonate ab Mietbeginn zu Tagesbeginn nach18",
    "7II/188. Zugang nach dem so berechneten letzten Tag ist vers",
    "pätet. Unabhängig davon Beschränkung, wenn Mietverhältnis be",
    "im UTC-Zugang bereits beendet ist; Zugang gleich exklusivem ",
    "Beendigungszeitpunkt zählt als beendet. Bei üblichem Vertrag",
    "sende31.12.um24Uhr ist dieser Zeitpunkt1.1.um00Uhr in zutref",
    "fender Zeitzone, anschließend inUTC normalisieren. Keine pau",
    "schalen900Tage, keine Zeitzone raten und keine193-Verlängeru",
    "ng dieses Rückwirkungsmerkmals. Kein materielles Urteil über",
    " Rügeform/Auskunft, Rückzahlungsbetrag oder Verjährung. Loka",
    "lzugangstag undUTC-Zeit müssen dasselbe rechtlich qualifizie",
    "rte Ereignis bezeichnen. Für untertägigen Mietbeginn ist die",
    "se Tagesbeginnvariante nicht freigegeben."
  )
)
}
