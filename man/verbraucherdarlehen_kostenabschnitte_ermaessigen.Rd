% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{verbraucherdarlehen_kostenabschnitte_ermaessigen}
\alias{verbraucherdarlehen_kostenabschnitte_ermaessigen}
\title{verbraucherdarlehen kostenabschnitte ermaessigen}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{verbraucherdarlehen_kostenabschnitte_ermaessigen(
  kostenabschnitte = NULL,
  ermaessigung_ab = NULL,
  ermaessigungsfall = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{kostenabschnitte}{Liste1..1000 eindeutig benannter position_id mit beginn_am/ende_am einschließlich, nichtnegativem exaktem kostenbetrag und kostenart zinsen/laufzeitabhaengige_kosten/sonstige_kosten. Innerhalb jeder Position gleichmäßige rechtlich qualifizierte Verteilung je tatsächlichem Kalendertag.}
\item{ermaessigung_ab}{ISO-Datum des rechtlich bestimmten ersten zu kürzenden Tages; bei Kündigung nach Fälligkeit.}
\item{ermaessigungsfall}{vorzeitige_erfuellung oder kuendigung; bereits qualifizierter501-Fall.}
\item{einordnungsnachweis}{Nichtleerer Nachweis der Kosten-/Zeitzuordnung, Homogenität jeder Position und bei Teilerfüllung ausschließlich betroffenen Kostenanteile. Andere Zeitkonventionen vorher getrennt behandeln.}
}
\details{Kostenabschnitte taganteilig ab qualifiziertem Kürzungsbeginn ermäßigen; Kündigung beschränkt auf Zinsen/laufzeitabhängige Kosten. Nur qualifizierte §501-Abschnitte mit ausdrücklich gleichmäßiger Zuordnung je tatsächlichem Kalendertag innerhalb jeder Position. Beginn/Ende inklusive; ermaessigung_ab ist der rechtlich bestimmte erste zu kürzende Tag, bei Absatz2 nach Fälligkeit, nicht automatisch der Kündigungszugangstag. Andere Zins-/Zeitkonventionen und nichtlinear innerhalb einer Position gestaffelte Kosten sind nicht erfasst; rechtlich passende kleinere homogene Positionen bilden. Bei vorzeitiger Teilerfüllung ausschließlich Kosten des rechtlich zugeordneten erfüllten Teils eingeben, kein pauschaler Schuldquotenabschlag. Absatz1 umfasst qualifiziert zugeordnete Zinsen/Kosten; Absatz2 nur Zinsen und sonstige laufzeitabhängige Kosten. Identische wirtschaftliche Kosten dürfen nicht mehrfach vorkommen; parallele unterschiedliche Kostenarten sind zulässig. Keine Berechnung des Effektivzinses, keine Tilgungsplan-Neuberechnung, keine Vorfälligkeitsentschädigung und keine automatische Einstufung einer Kostenart. §507 Absatz3 gesetzliche Zinsbasis separat bestimmen. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält je Kostenposition Ermäßigung/Rest sowie ursprüngliche Kostensumme, Gesamtermäßigung und verbleibende Kostensumme als exakte EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_501_T0001, BGB_501_T0002}
\examples{
verbraucherdarlehen_kostenabschnitte_ermaessigen(
  kostenabschnitte = list(
    list(
    "position_id" = "Z1",
    "beginn_am" = "2026-01-01",
    "ende_am" = "2026-01-10",
    "kostenbetrag" = "100",
    "kostenart" = "zinsen"
  ),
    list(
    "position_id" = "K2",
    "beginn_am" = "2026-01-11",
    "ende_am" = "2026-01-20",
    "kostenbetrag" = "200",
    "kostenart" = "laufzeitabhaengige_kosten"
  ),
    list(
    "position_id" = "S",
    "beginn_am" = "2026-01-01",
    "ende_am" = "2026-01-20",
    "kostenbetrag" = "40",
    "kostenart" = "sonstige_kosten"
  )
  ),
  ermaessigung_ab = "2026-01-06",
  ermaessigungsfall = "vorzeitige_erfuellung",
  einordnungsnachweis = paste0(
    "Qualifizierte Kosten des vorzeitig erfüllten Teils; je Posit",
    "ion homogene tatsächliche Tageszuordnung, keine Doppelzählun",
    "g."
  )
)
}
