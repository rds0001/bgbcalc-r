% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{gesellschaft_ausscheidensfehlbetrag}
\alias{gesellschaft_ausscheidensfehlbetrag}
\title{gesellschaft ausscheidensfehlbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{gesellschaft_ausscheidensfehlbetrag(
  gesellschaftsverbindlichkeiten = NULL,
  wert_gesellschaftsvermoegen = NULL,
  gewinn_verlust_anteil = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{gesellschaftsverbindlichkeiten}{Nichtnegativer exakter qualifizierter EUR-Wert als Dezimalzeichenfolge/Bruchobjekt; gleiche Stichtags-/Bewertungsbasis.}
\item{wert_gesellschaftsvermoegen}{Nichtnegativer exakter qualifizierter EUR-Wert als Dezimalzeichenfolge/Bruchobjekt; gleiche Stichtags-/Bewertungsbasis.}
\item{gewinn_verlust_anteil}{Qualifizierter exakter Gewinn-/Verlustanteil des Ausgeschiedenen zwischen0und1 als Dezimalzeichenfolge/Bruchobjekt.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des §728a-Ausscheidensfalls, maßgeblicher Werte und Gewinn-/Verlustquote.}
}
\details{Positiven Fehlbetrag aus Gesellschaftsverbindlichkeiten minus Gesellschaftsvermögen mit Gewinn-/Verlustanteil des Ausgeschiedenen multiplizieren Nur §728a im qualifizierten Ausscheidensfall. Vermögens- und Verbindlichkeitswerte auf rechtlich einheitlichen Stichtag und Bewertungsumfang beziehen; Gewinn-/Verlustanteil aus Vereinbarung bzw. §709 rechtlich bestimmen. Kein automatischer Abfindungswert nach §728, keine Liquidations-Beitragsrückerstattung nach §736d/737 und kein Ausfall anderer Gesellschafter. Gesellschaftsanteil zwischen null und eins; bereits geleistete Fehlbetragszahlungen gesondert anrechnen. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist der anteilige Fehlbetrag in EUR als exaktes Bruchobjekt. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_728a_T0001}
\examples{
gesellschaft_ausscheidensfehlbetrag(
  gesellschaftsverbindlichkeiten = "1000",
  wert_gesellschaftsvermoegen = "400",
  gewinn_verlust_anteil = "0.25",
  einordnungsnachweis = paste0(
    "Qualifiziertes Ausscheiden, gleiche Stichtagswerte und Gewin",
    "n-/Verlustquote."
  )
)
}
