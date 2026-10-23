% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{besitzschutz_jahresereignisse}
\alias{besitzschutz_jahresereignisse}
\title{besitzschutz jahresereignisse}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{besitzschutz_jahresereignisse(
  stoerung_lokal_am = NULL,
  stoerung_utc = NULL,
  ereignisse = NULL,
  monatsendregel = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{stoerung_lokal_am}{Rechtlich maßgeblicher lokaler Kalendertag der Besitzentziehung/Störung.}
\item{stoerung_utc}{Derselbe tatsächliche Zeitpunkt als UTC-Sekundenzeitpunkt.}
\item{ereignisse}{Liste0..1000 mit genau ereignis_id,lokal_am,zeitpunkt_utc. Tatsächliche Besitzerlangung oder Dienstbarkeitsausübung je Normfall; jede Ereigniskennung eindeutig.}
\item{monatsendregel}{Explizite Monatsendmethode des gemeinsamen Rückwärtskerns: nur_taggleiche_monate oder letzter_monatstag.}
\item{einordnungsnachweis}{Rechtlich einschlägiger861II/862II/1029-Jahresrückblick, Ereignisart sowie konsistente lokale undUTC-Zeitpunkte. Ereignistagbezogene Rückwärtsanalogie ausdrücklich bestätigen.}
}
\details{Jahresrückblick berechnen, rechtlich qualifizierte Ereignisse nach lokalem Grenztag und tatsächlicher UTC-Reihenfolge auswählen und zählen. 861II/862II: zeitliches Merkmal der konkreten Besitzerlangung im letzten Jahr vor Entziehung/Störung; rechtliche Fehlerhaftigkeit und Gegenüberbeziehung separat.1029: mindestens eine qualifizierte Dienstbarkeitsausübung im Jahresfenster, keine Mindesthäufigkeit über einmal hinaus. Gemeinsamer Rückwärtskern bestimmt Grenztagesbeginn mit ausdrücklich vorgegebener Monatsendmethode. Ereignisse am Grenztag zählen, Ereignisse am Störungstag nur soweit ihrUTC-Zeitpunkt tatsächlich vor der Störung liegt. Spätere/gleichzeitige Ereignisse zählen nicht. Für861/862die konkret betrachtete Besitzerlangung eingeben; nicht jede beliebige Ausübung als Neuerwerb behandeln. Vollständige und konsistente Zeitpunkte rechtlich vorqualifiziert, keine stille UTC-zu-Lokaldatum-Umrechnung. Ausgabe nur Zeitmerkmale, keine Besitzschutzentscheidung.864-Erlöschen/Anspruchswahrung getrennt. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Jahresfensterbeginn, ausgewählte Ereigniskennungen in Eingabereihenfolge, Anzahl und mindestens-ein-Merkmal. Einheit: datum_anzahl_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_861_T0001, BGB_861_T0002, BGB_862_T0001, BGB_862_T0002, BGB_862_T0003, BGB_1029_T0001}
\examples{
besitzschutz_jahresereignisse(
  stoerung_lokal_am = "2024-05-10",
  stoerung_utc = "2024-05-10T12:00:00Z",
  ereignisse = list(
    list(
    "ereignis_id" = "alt",
    "lokal_am" = "2023-05-09",
    "zeitpunkt_utc" = "2023-05-09T12:00:00Z"
  ),
    list(
    "ereignis_id" = "grenze",
    "lokal_am" = "2023-05-10",
    "zeitpunkt_utc" = "2023-05-10T12:00:00Z"
  ),
    list(
    "ereignis_id" = "vorher_am_tag",
    "lokal_am" = "2024-05-10",
    "zeitpunkt_utc" = "2024-05-10T11:59:59Z"
  ),
    list(
    "ereignis_id" = "gleich",
    "lokal_am" = "2024-05-10",
    "zeitpunkt_utc" = "2024-05-10T12:00:00Z"
  ),
    list(
    "ereignis_id" = "nachher",
    "lokal_am" = "2024-05-10",
    "zeitpunkt_utc" = "2024-05-10T12:00:01Z"
  )
  ),
  monatsendregel = "nur_taggleiche_monate",
  einordnungsnachweis = paste0(
    "861II/862II: zeitliches Merkmal der konkreten Besitzerlangun",
    "g im letzten Jahr vor Entziehung/Störung; rechtliche Fehlerh",
    "aftigkeit und Gegenüberbeziehung separat.1029: mindestens ei",
    "ne qualifizierte Dienstbarkeitsausübung im Jahresfenster, ke",
    "ine Mindesthäufigkeit über einmal hinaus. Gemeinsamer Rückwä",
    "rtskern bestimmt Grenztagesbeginn mit ausdrücklich vorgegebe",
    "ner Monatsendmethode. Ereignisse am Grenztag zählen, Ereigni",
    "sse am Störungstag nur soweit ihrUTC-Zeitpunkt tatsächlich v",
    "or der Störung liegt. Spätere/gleichzeitige Ereignisse zähle",
    "n nicht. Für861/862die konkret betrachtete Besitzerlangung e",
    "ingeben; nicht jede beliebige Ausübung als Neuerwerb behande",
    "ln. Vollständige und konsistente Zeitpunkte rechtlich vorqua",
    "lifiziert, keine stille UTC-zu-Lokaldatum-Umrechnung. Ausgab",
    "e nur Zeitmerkmale, keine Besitzschutzentscheidung.864-Erlös",
    "chen/Anspruchswahrung getrennt."
  )
)
}
