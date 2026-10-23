% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{gesellschaft_nachhaftung_fristsicherung}
\alias{gesellschaft_nachhaftung_fristsicherung}
\title{gesellschaft nachhaftung fristsicherung}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{gesellschaft_nachhaftung_fristsicherung(
  nachhaftungsfrist_letzter_tag = NULL,
  faelligkeit_am = NULL,
  sicherungsereignisse = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{nachhaftungsfrist_letzter_tag}{Bereits aus Kenntnis/Registereintrag und erforderlichen204/206/210/211-Korrekturen berechneter letzter Fristtag.}
\item{faelligkeit_am}{Rechtlich maßgeblicher Fälligkeitstag der betrachteten Altverbindlichkeit.}
\item{sicherungsereignisse}{Liste0..1000 mit genau ereignis_id,art,datum,rueckwirkend_unwirksam_212. art:feststellung_197,gerichtliche_vollstreckung,behoerdliche_vollstreckung,vollstreckungsantrag,verwaltungsakt_oeffentlich_rechtlich,schriftliches_anerkenntnis. Zeitpunkte und jeweilige rechtliche Eignung vorqualifiziert.212-Rückwirkung nur für Vollstreckung/Antrag zulässig.}
\item{einordnungsnachweis}{728b-Fall: bis zum Ausscheiden begründete Verbindlichkeit, bei Schadensersatz vorherige Pflichtverletzung, richtig berechnete Frist, wirksame einschlägige Sicherungsakte und212II/III-Rückwirkung vorqualifizieren.}
}
\details{Fälligkeit und qualifizierte Sicherungszeitpunkte gegen unveränderte korrigierte Nachhaftungsfrist vergleichen;212II/III-rückwirkend unwirksame Vollstreckungsakte ausschließen. 728bI/II: Fälligkeit bis einschließlich letztem Fristtag und mindestens ein rechtlich geeigneter rechtzeitiger Sicherungsakt; schriftliches Anerkenntnis ersetzt in qualifiziertem Umfang Feststellung. Vollstreckungsakte/Anträge mit rechtlich feststehender212II/III-Rückwirkung zählen nicht. Kein pauschaler212I-Neubeginn: der übergebene korrigierte Nachhaftungsfristtag bleibt unverändert.212-Rückwirkung ist Rechtsbewertung, keine neue Fristdauer. Bei teilweise wirksamem Anerkenntnis oder nur teilweise gesicherter Forderung vorher sachlich in Forderungsteile trennen; kein volles Anerkenntnis vortäuschen. Gerichtliche/behördliche Vollstreckung, Titel nach197Absatz1Nummer3–5und öffentlich-rechtlicher Verwaltungsakt müssen zum konkreten Anspruch passen. Funktion berechnet Zeitkopplung, keinen vollständigen Haftungstatbestand. Untertägige Grenzprobleme vorab qualifizieren. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Unveränderter Nachhaftungsfristtag, Fälligkeitsmerkmal, rechtzeitige wirksame Sicherungskennungen und kombinierte Zeitkopplung. Einheit: datum_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_212_T0001, BGB_212_T0002, BGB_212_T0003, BGB_212_T0004, BGB_212_T0005, BGB_728b_T0001, BGB_728b_T0002, BGB_728b_T0003, BGB_728b_T0004, BGB_728b_T0005, BGB_728b_T0006, BGB_728b_T0007}
\examples{
gesellschaft_nachhaftung_fristsicherung(
  nachhaftungsfrist_letzter_tag = "2025-01-31",
  faelligkeit_am = "2025-01-31",
  sicherungsereignisse = list(
    list(
    "ereignis_id" = "V",
    "art" = "vollstreckungsantrag",
    "datum" = "2025-01-31",
    "rueckwirkend_unwirksam_212" = FALSE
  )
  ),
  einordnungsnachweis = paste0(
    "728bI/II: Fälligkeit bis einschließlich letztem Fristtag und",
    " mindestens ein rechtlich geeigneter rechtzeitiger Sicherung",
    "sakt; schriftliches Anerkenntnis ersetzt in qualifiziertem U",
    "mfang Feststellung. Vollstreckungsakte/Anträge mit rechtlich",
    " feststehender212II/III-Rückwirkung zählen nicht. Kein pausc",
    "haler212I-Neubeginn: der übergebene korrigierte Nachhaftungs",
    "fristtag bleibt unverändert.212-Rückwirkung ist Rechtsbewert",
    "ung, keine neue Fristdauer. Bei teilweise wirksamem Anerkenn",
    "tnis oder nur teilweise gesicherter Forderung vorher sachlic",
    "h in Forderungsteile trennen; kein volles Anerkenntnis vortä",
    "uschen. Gerichtliche/behördliche Vollstreckung, Titel nach19",
    "7Absatz1Nummer3–5und öffentlich-rechtlicher Verwaltungsakt m",
    "üssen zum konkreten Anspruch passen. Funktion berechnet Zeit",
    "kopplung, keinen vollständigen Haftungstatbestand. Untertägi",
    "ge Grenzprobleme vorab qualifizieren."
  )
)
}
