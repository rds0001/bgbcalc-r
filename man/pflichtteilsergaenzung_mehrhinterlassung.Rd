% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pflichtteilsergaenzung_mehrhinterlassung}
\alias{pflichtteilsergaenzung_mehrhinterlassung}
\title{pflichtteilsergaenzung mehrhinterlassung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{pflichtteilsergaenzung_mehrhinterlassung(
  ergaenzungsbetrag_vor_mehrhinterlassung = NULL,
  hinterlassener_wert = NULL,
  ordentlicher_pflichtteilswert = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{ergaenzungsbetrag_vor_mehrhinterlassung}{Nichtnegativer rechtlich bestimmter Ergänzungsbetrag in EUR vor Abzug der hier betrachteten Mehrhinterlassung. Nicht den gesamten ordentlichen Pflichtteil oder einen bereits nach§2326 gekürzten Betrag eingeben.}
\item{hinterlassener_wert}{Nichtnegativer rechtlich nach§2326 maßgeblicher Wert des dem Pflichtteilsberechtigten Hinterlassenen in EUR. Anzuerkennende Belastungen, Vermächtnisse und konkrete erbrechtliche Lage vorab zutreffend bewerten; kein beliebiger Bruttowert.}
\item{ordentlicher_pflichtteilswert}{Nichtnegativer Wert des ordentlichen Pflichtteils in EUR als Hälfte des maßgeblichen gesetzlichen Erbteils am tatsächlichen rechtlich bewerteten Nachlass. Kein bereits um Schenkungen ergänzter Pflichtteilswert.}
\item{bewertungsnachweis}{Nichtleere Beschreibung von ordentlichem Pflichtteil, Hinterlassung und Ergänzungsbetrag vor dieser Anrechnung auf konsistenter Bewertungsbasis. Weitere Anrechnungen separat und ohne Doppelzählung bestimmen.}
}
\details{Mehrhinterlassung=max(hinterlassener Wert-ordentlicher Pflichtteilswert,0). Verbleibende Ergänzung=max(Ergänzung vor dieser Anrechnung-Mehrhinterlassung,0). Bloßes Hinterlassen des ordentlichen Pflichtteils schließt Ergänzung nicht aus. Nur Mehrwert darüber anrechnen. Eigengeschenke§2327, Erbenschutz§2328, Beschenktenhaftung§2329 und andere Anspruchsvoraussetzungen außerhalb dieser Operation. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält mehrhinterlassung, angerechneter_betrag (höchstens Ergänzungsbetrag) und verbleibende_ergaenzung als exakte EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2326_T0001, BGB_2326_T0002}
\examples{
pflichtteilsergaenzung_mehrhinterlassung(
  ergaenzungsbetrag_vor_mehrhinterlassung = "0",
  hinterlassener_wert = "0",
  ordentlicher_pflichtteilswert = "0",
  bewertungsnachweis = paste0(
    "Synthetisch konsistente ordentliche Pflichtteils- und Hinter",
    "lassungswerte."
  )
)
}
