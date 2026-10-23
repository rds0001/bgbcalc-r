% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{bereicherung_haftungszeitpunkte}
\alias{bereicherung_haftungszeitpunkte}
\title{bereicherung haftungszeitpunkte}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{bereicherung_haftungszeitpunkte(
  empfang_utc = NULL,
  kenntnis_rechtsgrundmangel_utc = NULL,
  rechtshaengigkeit_utc = NULL,
  haftung_ab_empfang_qualifiziert = NULL,
  sonderfall_820_qualifiziert = NULL,
  kenntnis_erfolgsverfehlung_utc = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{empfang_utc}{Tatsächlicher Empfang, sekundengenaues UTC.}
\item{kenntnis_rechtsgrundmangel_utc}{819I-Kenntnis; None/NULL bedeutet keine rechtlich qualifizierte Kenntnis. Kenntnis schon vor Empfang wird erst ab Empfang wirksam.}
\item{rechtshaengigkeit_utc}{Tatsächliche818IV-Rechtshängigkeit; None/NULL wenn nicht eingetreten.}
\item{haftung_ab_empfang_qualifiziert}{819II oder820I rechtlich erfüllt: Haftungsbeginn ab Empfang unabhängig von späterer Kenntnis.}
\item{sonderfall_820_qualifiziert}{820I/II-Sonderfall rechtlich erfüllt; gesonderte Zins-/Nutzungsgrenze.}
\item{kenntnis_erfolgsverfehlung_utc}{820II-Kenntnis von ausgebliebenem Erfolg/weggefallenem Grund; nur bei Sonderfall, None/NULL bedeutet noch nicht eingetreten.}
\item{einordnungsnachweis}{Tatbestände und tatsächliche UTC-Zeitpunkte qualifizieren. Allgemeine Haftungsregeln und konkrete Verlustzurechnung bleiben gesondert.}
}
\details{Frühestes qualifiziertes Haftungsereignis ab Empfang bestimmen; getrennten820II-Kenntniszeitpunkt ausweisen. 818IV/819: frühesten einschlägigen Haftungszeitpunkt aus Rechtshängigkeit,819I-Kenntnis und qualifiziertem Empfangstatbestand berechnen; keine Haftung vor Empfang.820I setzt Haftung ab Empfang voraus;820II-Zins-/Nutzungsgrenze bleibt davon getrennt beim tatsächlichen Kenntniszeitpunkt. Fehlende Kenntnis erzeugt keinen fiktiven Zinsstart. Keine automatische Gleichsetzung mit dem Folgetag eines291-Prozesszinsbeginns; Umrechnung auf rechtlich qualifizierte Zinstage mit vorhandener Kalender-/Zinsrechnung gesondert. Keine pauschale Streichung jeder Entreicherung nach einem Datum: allgemeine Haftungsregeln, Zurechnung und820II-Nutzungsentreicherung unterscheiden.821-Verjährungseinrede hat keine weitere Betragsformel.822-Herausgabe des Dritten nur im rechtlich festgestellten Umfang des durch unentgeltliche Weitergabe verursachten Haftungsausschlusses, keine doppelte Forderung für denselben Vermögenswert. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Optionaler Beginn verschärfter Haftung und davon getrennter optionaler820II-Zins-/Nutzungskenntniszeitpunkt. Einheit: utc_zeitpunkte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_818_T0001, BGB_818_T0002, BGB_818_T0003, BGB_818_T0004, BGB_819_T0001, BGB_819_T0002, BGB_820_T0001, BGB_820_T0002, BGB_820_T0003, BGB_821_T0001, BGB_822_T0001}
\examples{
bereicherung_haftungszeitpunkte(
  empfang_utc = "2024-01-01T00:00:00Z",
  kenntnis_rechtsgrundmangel_utc = "2024-01-10T12:00:00Z",
  rechtshaengigkeit_utc = "2024-01-20T12:00:00Z",
  haftung_ab_empfang_qualifiziert = FALSE,
  sonderfall_820_qualifiziert = FALSE,
  kenntnis_erfolgsverfehlung_utc = NULL,
  einordnungsnachweis = paste0(
    "818IV/819: frühesten einschlägigen Haftungszeitpunkt aus Rec",
    "htshängigkeit,819I-Kenntnis und qualifiziertem Empfangstatbe",
    "stand berechnen; keine Haftung vor Empfang.820I setzt Haftun",
    "g ab Empfang voraus;820II-Zins-/Nutzungsgrenze bleibt davon ",
    "getrennt beim tatsächlichen Kenntniszeitpunkt. Fehlende Kenn",
    "tnis erzeugt keinen fiktiven Zinsstart. Keine automatische G",
    "leichsetzung mit dem Folgetag eines291-Prozesszinsbeginns; U",
    "mrechnung auf rechtlich qualifizierte Zinstage mit vorhanden",
    "er Kalender-/Zinsrechnung gesondert. Keine pauschale Streich",
    "ung jeder Entreicherung nach einem Datum: allgemeine Haftung",
    "sregeln, Zurechnung und820II-Nutzungsentreicherung untersche",
    "iden.821-Verjährungseinrede hat keine weitere Betragsformel.",
    "822-Herausgabe des Dritten nur im rechtlich festgestellten U",
    "mfang des durch unentgeltliche Weitergabe verursachten Haftu",
    "ngsausschlusses, keine doppelte Forderung für denselben Verm",
    "ögenswert."
  )
)
}
