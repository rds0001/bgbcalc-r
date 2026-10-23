% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{vermaechtnis_pflichtteilskuerzung}
\alias{vermaechtnis_pflichtteilskuerzung}
\title{vermaechtnis pflichtteilskuerzung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{vermaechtnis_pflichtteilskuerzung(
  erwerbswert_vor_vermaechtnis = NULL,
  vermaechtniswert = NULL,
  gesamte_pflichtteilslast = NULL,
  anderweitig_getragene_last_2323 = NULL,
  schutzart = NULL,
  geschuetzter_pflichtteilswert = NULL,
  einzelfall_nach_2318_qualifiziert = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{erwerbswert_vor_vermaechtnis}{Nichtnegativer exakter EUR-Nettoerwerb vor diesem Vermächtnis und Pflichtteilslast; nach sonstigen berücksichtigungsfähigen Schulden.}
\item{vermaechtniswert}{Nichtnegativer EUR-Wert genau eines Vermächtnisses/einer Auflage, höchstens Erwerbswert.}
\item{gesamte_pflichtteilslast}{Nichtnegative EUR-Pflichtteilslast, höchstens Erwerbswert; nicht nochmals vermindert um separat angegebenen2323-Anteil.}
\item{anderweitig_getragene_last_2323}{Nichtnegativer rechtlich nach2320–2322 anderweitig getragener Teil der Gesamtlast, höchstens Gesamtlast. Vor proportionaler Kürzung abziehen.}
\item{schutzart}{kein_schutz, vermaechtnisnehmer oder erbe. Kein Modell für gleichzeitig pflichtteilsberechtigte Beteiligte.}
\item{geschuetzter_pflichtteilswert}{Nichtnegativer rechtlich bewerteter EUR-Pflichtteil des allein geschützten Beteiligten; bei kein_schutz null. Bei erbe schon vor dieser Pflichtteilslast durch Erwerb minus Vermächtnis gedeckt.}
\item{einzelfall_nach_2318_qualifiziert}{Pflichtwahrheitswert: ein Erbe, eine Beschwerung, höchstens ein Schutzfall; keine weiteren Vorränge/abweichende Anordnung. FALSE NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleerer Nachweis von Werten, Lastzuordnung und isoliertem Schutzfall.}
}
\details{2323-Fremdlast abziehen; eigene Last mal Vermächtnis/Erwerb. Nur Vermächtnisnehmer geschützt: Deckel positiver Vermächtnisüberschuss über Pflichtteil. Nur Erbe geschützt: zusätzliche Kürzung bis Erhalt eigenen Pflichtteils, höchstens Vermächtnis. Keine gleichzeitigen Schutzrechte beider Beteiligter, Mehrfachbeschwerung oder Rangfolge2189. Vorgelagerte Unterdeckung des eigenen Erbenpflichtteils gesondert. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält anteilige_grundkuerzung, kuerzungsbetrag, verbleibender_vermaechtniswert und beim_erben_verbleibende_pflichtteilslast als exakte EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2318_T0001, BGB_2318_T0002, BGB_2318_T0003, BGB_2318_T0004, BGB_2323_T0001}
\examples{
vermaechtnis_pflichtteilskuerzung(
  erwerbswert_vor_vermaechtnis = "100",
  vermaechtniswert = "40",
  gesamte_pflichtteilslast = "25",
  anderweitig_getragene_last_2323 = "0",
  schutzart = "kein_schutz",
  geschuetzter_pflichtteilswert = "0",
  einzelfall_nach_2318_qualifiziert = TRUE,
  bewertungsnachweis = "Synthetisch isolierter proportionaler Lastfall."
)
}
