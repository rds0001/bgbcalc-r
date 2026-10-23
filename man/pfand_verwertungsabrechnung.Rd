% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pfand_verwertungsabrechnung}
\alias{pfand_verwertungsabrechnung}
\title{pfand verwertungsabrechnung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{pfand_verwertungsabrechnung(
  gesicherte_forderung = NULL,
  befriedigungsbasis = NULL,
  verwertungsart = NULL,
  anwendungsfall_qualifiziert = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{gesicherte_forderung}{Nichtnegative noch offene gesicherte Forderung in EUR, rechtlich zugehörige Nebenleistungen nur einmal einbeziehen.}
\item{befriedigungsbasis}{Nichtnegative qualifizierte Basis in EUR:1247 nach Kosten/Rang verbleibender Verwertungserlös oder1259 gesamter Börsen-/Marktwert des Pfandes exakt am Fälligkeitstag.}
\item{verwertungsart}{erloes_1247 oder marktpreis_eigentumszufall_1259; keine Gleichsetzung der Bewertungszeitpunkte.}
\item{anwendungsfall_qualifiziert}{Explizite Bestätigung des Normfalls, bei1259 insbesondere persönlicher Anwendungsbereich und wirksame Eigentumszufall-Vereinbarung. FALSE ergibt NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleerer Nachweis zu Forderung, Kosten-/Rangbereinigung bzw.Fälligkeitstag und Marktwert, Doppelbefriedigung ausgeschlossen.}
}
\details{Tilgung=min(Forderung,Basis), Restforderung=Forderung-Tilgung, Überschuss=Basis-Tilgung. Nur eine abgegrenzte Forderungsposition, keine Rangverteilung.1247-Überschuss ist Ersatzpfanderlös;1259-Überschuss nur Rechendifferenz ohne hier begründete Erstattungspflicht. Keine spätere Marktpreiswahl. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält getilgte_forderung, restforderung und ueberschiessender_wert als EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1247_T0001, BGB_1247_T0002, BGB_1259_T0001, BGB_1259_T0002}
\examples{
pfand_verwertungsabrechnung(
  gesicherte_forderung = "100",
  befriedigungsbasis = "30",
  verwertungsart = "erloes_1247",
  anwendungsfall_qualifiziert = TRUE,
  bewertungsnachweis = paste0(
    "Synthetische rangbereinigte Basis; bei1259 Gesamtmarktwert a",
    "m Fälligkeitstag."
  )
)
}
