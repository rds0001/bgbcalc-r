% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{architekten_sonderkuendigung_verguetung}
\alias{architekten_sonderkuendigung_verguetung}
\title{architekten sonderkuendigung verguetung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{architekten_sonderkuendigung_verguetung(
  gesamtverguetung = NULL,
  leistungsanteil_zaehler = NULL,
  leistungsanteil_nenner = NULL,
  leistungsstandsnachweis = NULL
)}
\arguments{
\item{gesamtverguetung}{Nichtnegative EUR-Vergütung für den von der Sonderkündigung betroffenen Vertragsumfang.}
\item{leistungsanteil_zaehler}{Nichtnegative ganze Zahl des bis zur Kündigung erbrachten bewerteten Leistungsanteils, höchstens Nenner und2^53-1.}
\item{leistungsanteil_nenner}{Positive ganze Bezugsgröße der gesamten betrachteten Leistung, höchstens2^53-1. Keine automatische Zeitquote.}
\item{leistungsstandsnachweis}{Nichtleerer Nachweis wirksamer Sonderkündigung nach650rI oderII und des bewerteten Leistungsstandes; qualifizierte Vergütungsbasis.}
}
\details{Gesamtvergütung des gekündigten Umfangs mit dem bewerteten Anteil der bis zur Kündigung erbrachten Leistungen multiplizieren. §650rIII bei wirksamer Sonderkündigung nachAbsatz1 oder2. Keine Gleichsetzung mit einer Kündigung aus wichtigem Grund648a und keine Fünfprozentvermutung648. Vertragsvergütung und Leistungsanteil einschließlich eines etwaigen besonderen Vergütungsrechts vorqualifizieren; keine HOAI-Berechnung. Keine Vergütung nicht erbrachter Leistungen; bereits geleistete Zahlungen und gesonderte Ansprüche separat abrechnen. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert: exakter EUR-Vergütungsbruch für die erbrachte Leistung. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_650r_T0005}
\examples{
architekten_sonderkuendigung_verguetung(
  gesamtverguetung = "1000",
  leistungsanteil_zaehler = 1,
  leistungsanteil_nenner = 4,
  leistungsstandsnachweis = paste0(
    "§650rIII bei wirksamer Sonderkündigung nachAbsatz1 oder2. Ke",
    "ine Gleichsetzung mit einer Kündigung aus wichtigem Grund648",
    "a und keine Fünfprozentvermutung648. Vertragsvergütung und L",
    "eistungsanteil einschließlich eines etwaigen besonderen Verg",
    "ütungsrechts vorqualifizieren; keine HOAI-Berechnung. Keine ",
    "Vergütung nicht erbrachter Leistungen; bereits geleistete Za",
    "hlungen und gesonderte Ansprüche separat abrechnen."
  )
)
}
