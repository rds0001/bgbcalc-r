% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{vermaechtnis_vorrangverteilung}
\alias{vermaechtnis_vorrangverteilung}
\title{vermaechtnis vorrangverteilung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{vermaechtnis_vorrangverteilung(
  verfuegbarer_beschwerungsbetrag = NULL,
  vorrangige_beschwerung = NULL,
  nachrangige_beschwerungen = NULL,
  vorrang_nach_2189_qualifiziert = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{verfuegbarer_beschwerungsbetrag}{Nichtnegatives exaktes EUR-Budget für gerade diese Beschwerungen nach rechtlich qualifizierter Haftungsbeschränkung, Pflichtteilsbelastung oder2187/2188. Nicht pauschal gesamter Nachlass.}
\item{vorrangige_beschwerung}{Nichtnegativer voller EUR-Wert eines rechtlich vorrangigen Vermächtnisses/einer Auflage, vor gerade dieser Kürzung.}
\item{nachrangige_beschwerungen}{Nichtnegative volle EUR-Summe sämtlicher übrigen Beschwerungen; keine überlappende Erfassung.}
\item{vorrang_nach_2189_qualifiziert}{Pflichtwahrheitswert: wirksame Vorranganordnung und zulässiger Kürzungsfall2189 vorgeprüft. FALSE ergibt NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleerer Nachweis der Vorrangstruktur, Kürzungsgrundlage und vergleichbaren Werte.}
}
\details{Vorrang=min(Budget,Vorrangwert); Nachrang=min(Budget-Vorrang,Nachrangwert); Kürzungen und nicht verbrauchtes Budget getrennt ausweisen. Nur zwei Rangstufen und Gesamtwert des Nachrangs. Kein Quotierungssystem innerhalb eines Rangs, keine vorgelagerte Budgetermittlung, keine automatische Sachvermächtnis-Geldersatzpflicht. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält vorrangiger_zuteilungsbetrag, nachrangiger_zuteilungsbetrag, vorrangiger_kuerzungsbetrag, nachrangiger_kuerzungsbetrag und nicht_verbrauchtes_budget als exakte EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2189_T0001}
\examples{
vermaechtnis_vorrangverteilung(
  verfuegbarer_beschwerungsbetrag = "100",
  vorrangige_beschwerung = "60",
  nachrangige_beschwerungen = "80",
  vorrang_nach_2189_qualifiziert = TRUE,
  bewertungsnachweis = paste0(
    "Synthetisch qualifizierter Vorrang und begrenztes Beschwerun",
    "gsbudget."
  )
)
}
