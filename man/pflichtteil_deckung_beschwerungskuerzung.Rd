% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pflichtteil_deckung_beschwerungskuerzung}
\alias{pflichtteil_deckung_beschwerungskuerzung}
\title{pflichtteil deckung beschwerungskuerzung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{pflichtteil_deckung_beschwerungskuerzung(
  erwerbswert_vor_beschwerung = NULL,
  beschwerungswert = NULL,
  zu_deckende_pflichtteilslast = NULL,
  kuerzung_nach_2322_qualifiziert = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{erwerbswert_vor_beschwerung}{Nichtnegativer EUR-Erwerbswert vor gerade dieser Beschwerung, aus rechtlich qualifiziert ausgeschlagener Erbschaft/Vermächtnis.}
\item{beschwerungswert}{Nichtnegative EUR-Beschwerung höchstens Erwerbswert; bei Überschreitung vorgelagerte Kürzungsregeln zuerst klären.}
\item{zu_deckende_pflichtteilslast}{Nichtnegative rechtlich zugeordnete EUR-Pflichtteilslast, keine ungekürzte Fremdlast.}
\item{kuerzung_nach_2322_qualifiziert}{Pflichtwahrheitswert zum durch Ausschlagung begünstigten beschwerten Erwerb2322; FALSE NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleerer Nachweis des Erwerbs, der Beschwerung und Lastzuordnung.}
}
\details{Freier Rest=Erwerb-Beschwerung; Kürzung=min(Beschwerung,max(Pflichtteilslast-freierRest,0)); Restbeschwerung und noch ungedeckte Last getrennt. Keine vorgelagerte Überschuldungs-/Haftungskürzung, kein interner Gleichrangverteiler oder Missachtung2189. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält kuerzungsbetrag, verbleibende_beschwerung und nicht_gedeckte_pflichtteilslast als exakte EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2322_T0001}
\examples{
pflichtteil_deckung_beschwerungskuerzung(
  erwerbswert_vor_beschwerung = "100",
  beschwerungswert = "80",
  zu_deckende_pflichtteilslast = "50",
  kuerzung_nach_2322_qualifiziert = TRUE,
  bewertungsnachweis = "Synthetisch qualifizierter beschwerter Erwerb."
)
}
