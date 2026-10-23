% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{vermaechtnis_beschwerungskuerzung}
\alias{vermaechtnis_beschwerungskuerzung}
\title{vermaechtnis beschwerungskuerzung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{vermaechtnis_beschwerungskuerzung(
  ungekuerzter_vermaechtniswert = NULL,
  verbleibender_vermaechtniswert = NULL,
  urspruengliche_beschwerung = NULL,
  kuerzungsgrund = NULL,
  abweichender_erblasserwille = NULL,
  beschwerungsregel_anwendbar = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{ungekuerzter_vermaechtniswert}{Positiver ursprünglicher EUR-Wert der dem Vermächtnisnehmer gebührenden Leistung vor rechtlich qualifizierter Kürzung; unveränderte Bezugsbasis für Quote.}
\item{verbleibender_vermaechtniswert}{Nichtnegativer EUR-Wert derselben Leistung nach Kürzung aus gesetzlichem Grund, höchstens ursprünglicher Wert. Keine beliebige Wertschwankung.}
\item{urspruengliche_beschwerung}{Nichtnegativer ursprünglicher EUR-Wert der dem Vermächtnisnehmer auferlegten Beschwerung vor Anwendung dieser Kürzung. Bereits gekürzten Wert nicht nochmals mit kumulierter Quote kürzen.}
\item{kuerzungsgrund}{Genau erbenhaftungsbeschraenkung, pflichtteilsanspruch oder untervermaechtnis_2187. Rechtlich wirksame Kürzung aufgrund dieses Grundes belegen; kein frei gewählter Grund.}
\item{abweichender_erblasserwille}{Wahrheitswert: ein anderer Wille des Erblassers ist anzunehmen; dann NICHT_ANWENDBAR für dieses proportionale Modell.}
\item{beschwerungsregel_anwendbar}{Wahrheitswert des geprüften Anwendungsbereichs§2188 für Vermächtnisleistung und dem Vermächtnisnehmer auferlegte Beschwerung.}
\item{bewertungsnachweis}{Nichtleere Begründung von ursprünglicher/verbleibender Leistung, gesetzlichem Kürzungsgrund, Beschwerung und Erblasserwillen auf konsistenter Bewertungsbasis.}
}
\details{Verbleibensquote als verbleibender geteilt durch ungekürzten Vermächtniswert; ursprüngliche Beschwerung damit multiplizieren; Differenz als Kürzungsbetrag. Abweichender Erblasserwille oder fehlender Anwendungsbereich schließen Modell aus. Keine automatische Ausübung des Kürzungsrechts; kein erneutes Kürzen bereits proportional gekürzter Beschwerung mit Gesamtquote. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält dimensionslose verbleibensquote und EUR-Beträge gekuerzte_beschwerung/kuerzungsbetrag als exakte Brüche. NICHT_ANWENDBAR/null außerhalb Anwendungsbereich. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2188_T0001}
\examples{
vermaechtnis_beschwerungskuerzung(
  ungekuerzter_vermaechtniswert = "100",
  verbleibender_vermaechtniswert = "60",
  urspruengliche_beschwerung = "50",
  kuerzungsgrund = "erbenhaftungsbeschraenkung",
  abweichender_erblasserwille = FALSE,
  beschwerungsregel_anwendbar = TRUE,
  bewertungsnachweis = paste0(
    "Synthetisch gesetzlich begründete Kürzung und unveränderte u",
    "rsprüngliche Bezugsgrößen."
  )
)
}
