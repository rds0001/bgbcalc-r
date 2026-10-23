% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{nachlassglaeubiger_restdeckung}
\alias{nachlassglaeubiger_restdeckung}
\title{nachlassglaeubiger restdeckung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{nachlassglaeubiger_restdeckung(
  haftungsmasse_vor_bindungen = NULL,
  vorrangig_gebundener_betrag = NULL,
  forderungsbetrag = NULL,
  haftungsfall = NULL,
  rang_und_einrede_qualifiziert = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{haftungsmasse_vor_bindungen}{Nichtnegativer rechtlich bewerteter EUR-Haftungswert vor angegebenen Bindungen;1973II bereicherungsrechtlich korrigiert,1991 Verantwortlichkeitskorrekturen berücksichtigt.}
\item{vorrangig_gebundener_betrag}{Nichtnegative Summe rechtlich vorrangiger Bindungen, einschließlich ggf.bereits befriedigter oder gleichstehend rechtskräftig zuerkannter Beträge. Nicht doppelt von bereits bereinigter Masse abziehen. Keine willkürliche Gleichrangpräferenz.}
\item{forderungsbetrag}{Nichtnegative rechtlich festgestellte einzelne Forderung.}
\item{haftungsfall}{ausgeschlossener_glaeubiger_1973, spaetglaeubiger_1974, duerftigkeit_1990 oder vermaechtnisueberschuldung_1992.}
\item{rang_und_einrede_qualifiziert}{Pflichtwahrheitswert: einschlägige Einrede und Rang/Bindung rechtlich vorqualifiziert.1973I2-Grundvorrang samt Vorleistungs-Ausnahme,1974II/1991IV-Insolvenzrang ausdrücklich berücksichtigen. FALSE NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleerer Nachweis der Masse, Bindungen, individuellen Forderung und Rangqualifikation.}
}
\details{FreieMasse=max(Masse-vorrangigeBindungen,0);Deckung=min(Forderung,freieMasse);Restforderung=Forderung-Deckung. Keine automatische InsO-Rangordnung oder Gleichrangquote. Forderung erlischt nicht, keine automatische Sachherausgabe-Geldpflicht. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält freie_haftungsmasse, gedeckter_forderungsteil und nicht_gedeckter_forderungsteil als exakte EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1973_T0001, BGB_1973_T0002, BGB_1973_T0003, BGB_1973_T0005, BGB_1974_T0003, BGB_1990_T0001, BGB_1991_T0003, BGB_1991_T0004, BGB_1992_T0001}
\examples{
nachlassglaeubiger_restdeckung(
  haftungsmasse_vor_bindungen = "100",
  vorrangig_gebundener_betrag = "70",
  forderungsbetrag = "50",
  haftungsfall = "ausgeschlossener_glaeubiger_1973",
  rang_und_einrede_qualifiziert = TRUE,
  bewertungsnachweis = "Synthetisch qualifizierte Masse und Ränge."
)
}
