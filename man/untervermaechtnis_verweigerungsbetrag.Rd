% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{untervermaechtnis_verweigerungsbetrag}
\alias{untervermaechtnis_verweigerungsbetrag}
\title{untervermaechtnis verweigerungsbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{untervermaechtnis_verweigerungsbetrag(
  erhaltener_vermaechtniswert = NULL,
  erforderlicher_erfuellungswert = NULL,
  beschwerter_vermaechtnisnehmer = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{erhaltener_vermaechtniswert}{Nichtnegativer EUR-Wert dessen, was beschwerter Vermächtnisnehmer aus seinem Vermächtnis erhält; konsistente Bewertung, nicht ungeprüft ungekürzten nominalen Anspruch einsetzen.}
\item{erforderlicher_erfuellungswert}{Nichtnegativer EUR-Wert der Erfüllung der betrachteten Beschwerung durch Untervermächtnis oder Auflage. Bei mehreren Beschwerungen doppelte Verwendung desselben Deckungswerts vermeiden; keine automatische Rang-/Verteilungsentscheidung.}
\item{beschwerter_vermaechtnisnehmer}{Wahrheitswert des geprüften Tatbestands§2187 Absatz1: Vermächtnisnehmer mit Vermächtnis oder Auflage beschwert. Auch Annahme des eigenen Vermächtnisses schließt dieses Recht nicht aus.}
\item{bewertungsnachweis}{Nichtleere Begründung des Anspruchsregimes, des tatsächlich Erhaltenen und konsistent bewerteten Erfüllungsaufwands.}
}
\details{Maximum aus null und erforderlichem Erfüllungswert abzüglich erhaltenem Vermächtniswert. Nur Umfang des Verweigerungsrechts§2187 Absatz1. Keine automatische Ausübung/Tilgung; Fälligkeit§2186, Nachrücken Absatz2 und Verweis auf§1992 Absatz3 gesondert. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter EUR-Bruch des ungedeckten, verweigerbaren Betrags. Ohne geprüften Tatbestand NICHT_ANWENDBAR/null. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2187_T0001, BGB_2187_T0002, BGB_2187_T0003}
\examples{
untervermaechtnis_verweigerungsbetrag(
  erhaltener_vermaechtniswert = "80",
  erforderlicher_erfuellungswert = "100",
  beschwerter_vermaechtnisnehmer = TRUE,
  bewertungsnachweis = paste0(
    "Synthetisch konsistente EUR-Bewertung desselben Vermächtniss",
    "es und seiner Beschwerung."
  )
)
}
