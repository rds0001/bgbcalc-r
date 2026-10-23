% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{vorerbe_verbleibende_haftung}
\alias{vorerbe_verbleibende_haftung}
\title{vorerbe verbleibende haftung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{vorerbe_verbleibende_haftung(
  nachlassschuld = NULL,
  rechtlich_vom_nacherben_getragener_schuldteil = NULL,
  schuld_im_innenverhaeltnis_vorerbe = NULL,
  vorerbe_unbeschraenkt_haftend = NULL,
  fuer_forderung_verfuegbare_vorerbenmasse = NULL,
  nacherbfall_qualifiziert = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{nachlassschuld}{Nichtnegative rechtlich bestimmte EUR-Nachlassschuld.}
\item{rechtlich_vom_nacherben_getragener_schuldteil}{Nichtnegativer rechtlicher Haftungsteil des Nacherben, höchstens Schuld. Nicht Zahlungsfähigkeit/erlangbare Zahlung verwenden.}
\item{schuld_im_innenverhaeltnis_vorerbe}{Pflichtwahrheitswert: gesamte hier betrachtete Schuld fällt im Innenverhältnis dem Vorerben zur Last; gemischte Schuld vorher aufteilen.}
\item{vorerbe_unbeschraenkt_haftend}{Pflichtwahrheitswert: bei TRUE keine Kappung auf Vorerbenmasse.}
\item{fuer_forderung_verfuegbare_vorerbenmasse}{Nichtnegativer dem Vorerben aus Erbschaft gebührender und nach qualifizierten Rang-/Bindungsregeln für diese Forderung verfügbarer EUR-Wert. Nicht pauschal eigenes Vermögen.}
\item{nacherbfall_qualifiziert}{Pflichtwahrheitswert des eingetretenen Nacherbfalls und2145-Anwendungsfalls; FALSE NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleerer Nachweis rechtlicher Nacherbenhaftung, Innenlast und verfügbarer Masse.}
}
\details{Ohne eigene Innenlast Schuld minus rechtlicher Nacherbenhaftung; sonst volle Schuld. Unbeschränkte Haftung voll, beschränkte Haftung höchstens verfügbare Masse. Rechtliche Nacherbenhaftung nicht mit bloßer Nichtzahlung/Insolvenz des Nacherben verwechseln. Keine Doppeladdition eigener Innenlast; Rang-/Massenabgrenzung vorqualifiziert. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält verbleibende_haftung_vor_massenbegrenzung, befriedigungsbetrag_nach_massenbegrenzung und wegen_massenbegrenzung_nicht_gedeckter_teil als exakte EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2145_T0001, BGB_2145_T0002, BGB_2145_T0003, BGB_2145_T0004}
\examples{
vorerbe_verbleibende_haftung(
  nachlassschuld = "100",
  rechtlich_vom_nacherben_getragener_schuldteil = "60",
  schuld_im_innenverhaeltnis_vorerbe = FALSE,
  vorerbe_unbeschraenkt_haftend = FALSE,
  fuer_forderung_verfuegbare_vorerbenmasse = "30",
  nacherbfall_qualifiziert = TRUE,
  bewertungsnachweis = "Synthetische rechtliche Resthaftung."
)
}
