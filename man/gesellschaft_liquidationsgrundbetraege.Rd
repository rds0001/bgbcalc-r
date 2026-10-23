% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{gesellschaft_liquidationsgrundbetraege}
\alias{gesellschaft_liquidationsgrundbetraege}
\title{gesellschaft liquidationsgrundbetraege}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{gesellschaft_liquidationsgrundbetraege(
  gesellschaftsvermoegen = NULL,
  zu_berichtigende_verbindlichkeiten = NULL,
  erforderliche_rueckbehalte = NULL,
  rueckzuerstattende_beitraege = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{gesellschaftsvermoegen}{Nichtnegativer exakter rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge/Bruchobjekt; gleiche Liquidationsabrechnung ohne Doppelzählung.}
\item{zu_berichtigende_verbindlichkeiten}{Nichtnegativer exakter rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge/Bruchobjekt; gleiche Liquidationsabrechnung ohne Doppelzählung.}
\item{erforderliche_rueckbehalte}{Nichtnegativer exakter rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge/Bruchobjekt; gleiche Liquidationsabrechnung ohne Doppelzählung.}
\item{rueckzuerstattende_beitraege}{Nichtnegativer exakter rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge/Bruchobjekt; gleiche Liquidationsabrechnung ohne Doppelzählung.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des gesetzlichen Liquidationsfalls, qualifizierter Vermögens-/Verbindlichkeits-/Beitragswerte und gegebenenfalls Einbringlichkeitsgrenzen.}
}
\details{Gläubiger- und Reservebedarf vor Beiträgen; Überschuss und gesamten Fehlbetrag berechnen. §736d Absatz4–6/§737: tatsächlich verfügbares Liquidationsvermögen; fällige zu berichtigende Verbindlichkeiten und erforderliche Rückbehalte für nicht fällige/streitige Verbindlichkeiten überschneidungsfrei. Rückzuerstattende Beiträge sind rechtlich qualifiziert: Sachbeiträge zum Einbringungswert, Dienste/Nutzungsüberlassung im Zweifel kein Ersatz. Überschuss nach Gewinn-/Verlustquoten verteilen; Fehlbetrag nach §737 decken. Reicht Vermögen nicht, wird keine freie Quote für teilweise Beitragsrückerstattung oder Rangfolge unter Gläubigern erfunden. Kein Ersatz für Insolvenzprüfung, Bewertung von Sachbeiträgen oder Abrechnung bereits erfolgter Liquidationszahlungen. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält EUR-Bruchobjekte für Liquidationsgrundbedarf/Überschuss/Fehlbetrag bzw. Verteilung mit Regelanteil, beibringbarem Betrag, zusätzlicher Ausfalllast, Gesamteinbringlichkeit und ungedecktem Fehlbetrag. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_736d_T0006, BGB_736d_T0007, BGB_736d_T0008, BGB_736d_T0011, BGB_737_T0001}
\examples{
gesellschaft_liquidationsgrundbetraege(
  gesellschaftsvermoegen = "1000",
  zu_berichtigende_verbindlichkeiten = "400",
  erforderliche_rueckbehalte = "100",
  rueckzuerstattende_beitraege = "200",
  einordnungsnachweis = "Qualifizierte Liquidationswerte ohne Doppelzählung."
)
}
