% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pflichtteil_miterbe_eigenbedarf}
\alias{pflichtteil_miterbe_eigenbedarf}
\title{pflichtteil miterbe eigenbedarf}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{pflichtteil_miterbe_eigenbedarf(
  erbteilwert_nach_teilung = NULL,
  eigener_pflichtteilswert = NULL,
  verlangter_pflichtteilsbetrag = NULL,
  schutz_nach_2319_qualifiziert = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{erbteilwert_nach_teilung}{Nichtnegativer exakter EUR-Erbteilwert nach Teilung, vor gerade dieser Pflichtteilslast. Keine bereits erfüllte Last doppelt abziehen.}
\item{eigener_pflichtteilswert}{Nichtnegativer rechtlich bestimmter eigener EUR-Pflichtteilswert.}
\item{verlangter_pflichtteilsbetrag}{Nichtnegative rechtlich bestimmte noch offene Forderung eines anderen Pflichtteilsberechtigten gegen diesen Miterben.}
\item{schutz_nach_2319_qualifiziert}{Pflichtwahrheitswert zum pflichtteilsberechtigten Miterben nach Teilung und einschlägigen2319-Schutz; FALSE NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleerer Nachweis der Werte und Schutzvoraussetzungen.}
}
\details{Forderungsdeckung=min(verlangt,max(Erbteil-eigenerPflichtteil,0)); Ausfall=verlangt-Deckung. Kein automatischer interner Haftungsanteil der übrigen Erben und kein Schutz gegen andere Schulden. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält befriedigungsbetrag und ausfall_fuer_uebrige_erben als exakte EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2319_T0001, BGB_2319_T0002}
\examples{
pflichtteil_miterbe_eigenbedarf(
  erbteilwert_nach_teilung = "100",
  eigener_pflichtteilswert = "60",
  verlangter_pflichtteilsbetrag = "70",
  schutz_nach_2319_qualifiziert = TRUE,
  bewertungsnachweis = "Synthetisch qualifizierter Schutz nach Teilung."
)
}
