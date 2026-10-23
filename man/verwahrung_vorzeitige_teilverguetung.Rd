% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{verwahrung_vorzeitige_teilverguetung}
\alias{verwahrung_vorzeitige_teilverguetung}
\title{verwahrung vorzeitige teilverguetung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{verwahrung_vorzeitige_teilverguetung(
  gesamtverguetung = NULL,
  leistungsanteil_zaehler = NULL,
  leistungsanteil_nenner = NULL,
  leistungsstandsnachweis = NULL
)}
\arguments{
\item{gesamtverguetung}{Nichtnegative EUR-Vergütung für den vorzeitig beendeten Aufbewahrungsumfang.}
\item{leistungsanteil_zaehler}{Nichtnegative ganze Zahl des bis zur Beendigung erbrachten bewerteten Leistungsanteils, höchstens Nenner und2^53-1.}
\item{leistungsanteil_nenner}{Positive ganze Bezugsgröße der gesamten betrachteten Leistung, höchstens2^53-1. Keine automatische Zeitquote.}
\item{leistungsstandsnachweis}{Nichtleerer Nachweis vorzeitiger Beendigung699II und des bewerteten Leistungsstands; keine abweichende Vergütungsvereinbarung.}
}
\details{Gesamtvergütung der vorzeitig beendeten Aufbewahrung mit dem bewerteten Anteil der bis zur Beendigung erbrachten Leistungen multiplizieren. §699II: vorzeitiges Aufbewahrungsende ohne abweichende Vergütungsvereinbarung. Teilbetrag entspricht rechtlich bewerteter bisheriger Leistung; keine ungeprüfte Tagesquote. Keine volle Vergütung nicht erbrachter Leistungen. Bereits geleistete Vergütung, Aufwendungsersatz und Zinsen bei Eigennutzung698 separat abrechnen; keine automatische Aufrechnung. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert: exakter EUR-Vergütungsbruch für die erbrachte Leistung. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_699_T0003}
\examples{
verwahrung_vorzeitige_teilverguetung(
  gesamtverguetung = "1000",
  leistungsanteil_zaehler = 1,
  leistungsanteil_nenner = 4,
  leistungsstandsnachweis = paste0(
    "§699II: vorzeitiges Aufbewahrungsende ohne abweichende Vergü",
    "tungsvereinbarung. Teilbetrag entspricht rechtlich bewertete",
    "r bisheriger Leistung; keine ungeprüfte Tagesquote. Keine vo",
    "lle Vergütung nicht erbrachter Leistungen. Bereits geleistet",
    "e Vergütung, Aufwendungsersatz und Zinsen bei Eigennutzung69",
    "8 separat abrechnen; keine automatische Aufrechnung."
  )
)
}
