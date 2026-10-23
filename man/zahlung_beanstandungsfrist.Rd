% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{zahlung_beanstandungsfrist}
\alias{zahlung_beanstandungsfrist}
\title{zahlung beanstandungsfrist}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{zahlung_beanstandungsfrist(
  belastung_am = NULL,
  ordnungsgemaesse_unterrichtung_am = NULL,
  beanstandung_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{belastung_am}{Tag der nicht autorisierten/fehlerhaften Kontobelastung.}
\item{ordnungsgemaesse_unterrichtung_am}{Tag der vollstaendigen qualifizierten248EGBGB-Unterrichtung; None/NULL wenn noch nicht erfolgt. Nicht blosse Kenntnis des Nutzers.}
\item{beanstandung_am}{Tag der tatsaechlichen Unterrichtung des verpflichteten Zahlungsdienstleisters durch den Nutzer.}
\item{einordnungsnachweis}{676bII/IVAnwendbarkeit, rechtlich vollstaendige Unterrichtung und richtiger Empfaenger vorqualifizieren. Grundfrist ohne gegebenenfalls erforderliche193-Korrektur.}
}
\details{Spaeteren qualifizierten Belastungs-/Unterrichtungstag bestimmen,13Monatsgrundfrist berechnen und Beanstandung vergleichen; bei fehlender Unterrichtung kein Fristende erfinden. §676bII/IV:13Monate ab Belastung, bei spaeterer ordnungsgemaesser Unterrichtung erst ab dieser; vollstaendig fehlende Unterrichtung startet keinen fiktiven Fristlauf. Fehlendes Fristende ist keine Behauptung unbegrenzter Anspruchsdauer: allgemeine Verjaehrung und unverzuegliche Meldung676bI bleiben getrennt. Fristende nach187I/188, kein pauschales390Tage-Fenster. Beanstandung vor spaeterer formeller Unterrichtung kann die Ausschlussfrist bereits wahren.676bIII/Vunverschuldete Verhinderung bei dort genannten anderen Anspruechen ist qualitative Ausnahme ohne feste weitere Tageszahl; keine automatische6Monatsverlaengerung oder erfundenes Nachfristende.676cHaftungsausschluesse sind qualitative Tatbestaende ohne zusaetzliche feste Rechenregel.193gegebenenfalls mit bestehendem Kern nach rechtlicher Qualifikation, keine automatische Verschiebung. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Optionaler Fristbeginn, Grundfristende und einschliesslicher Zeitvergleich; ohne Unterrichtung alle drei None/NULL. Einheit: daten_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_676b_T0001, BGB_676b_T0002, BGB_676b_T0003, BGB_676b_T0004, BGB_676b_T0005, BGB_676b_T0006, BGB_676b_T0007, BGB_676b_T0008, BGB_676b_T0009, BGB_676c_T0001, BGB_676c_T0002, BGB_676c_T0003}
\examples{
zahlung_beanstandungsfrist(
  belastung_am = "2024-01-31",
  ordnungsgemaesse_unterrichtung_am = "2024-01-31",
  beanstandung_am = "2025-02-28",
  einordnungsnachweis = paste0(
    "§676bII/IV:13Monate ab Belastung, bei spaeterer ordnungsgema",
    "esser Unterrichtung erst ab dieser; vollstaendig fehlende Un",
    "terrichtung startet keinen fiktiven Fristlauf. Fehlendes Fri",
    "stende ist keine Behauptung unbegrenzter Anspruchsdauer: all",
    "gemeine Verjaehrung und unverzuegliche Meldung676bI bleiben ",
    "getrennt. Fristende nach187I/188, kein pauschales390Tage-Fen",
    "ster. Beanstandung vor spaeterer formeller Unterrichtung kan",
    "n die Ausschlussfrist bereits wahren.676bIII/Vunverschuldete",
    " Verhinderung bei dort genannten anderen Anspruechen ist qua",
    "litative Ausnahme ohne feste weitere Tageszahl; keine automa",
    "tische6Monatsverlaengerung oder erfundenes Nachfristende.676",
    "cHaftungsausschluesse sind qualitative Tatbestaende ohne zus",
    "aetzliche feste Rechenregel.193gegebenenfalls mit bestehende",
    "m Kern nach rechtlicher Qualifikation, keine automatische Ve",
    "rschiebung."
  )
)
}
