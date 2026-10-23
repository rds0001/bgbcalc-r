% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{miterbe_nachlassschuld_quotenbetrag}
\alias{miterbe_nachlassschuld_quotenbetrag}
\title{miterbe nachlassschuld quotenbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{miterbe_nachlassschuld_quotenbetrag(
  nachlassschuld = NULL,
  erbquote_zaehler = NULL,
  erbquote_nenner = NULL,
  haftungsfall = NULL,
  quotenhaftung_qualifiziert = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{nachlassschuld}{Nichtnegativer exakter EUR-Betrag der rechtlich festgestellten noch offenen Nachlassschuld.}
\item{erbquote_zaehler}{Ganzzahl0..Nenner der Erbquote des betrachteten Miterben.}
\item{erbquote_nenner}{Ganzzahl1..2^53-1. Erbquote bezieht sich auf Schuld, nicht bloß Erbteilwert.}
\item{haftungsfall}{vor_teilung_unbeschraenkt_2059, nach_teilung_2060 oder nach_teilung_aufgebot_2061. Unterschiedliche Rechtsbedeutung gleicher numerischer Quotenoperation beachten.}
\item{quotenhaftung_qualifiziert}{Pflichtwahrheitswert:2059 unbeschränkte persönliche Haftung vor Teilung;2060 nach Teilung und einer der abschließenden Tatbestände;2061 nach ordnungsgemäßem Aufgebot/Fristablauf/Teilung, keine rechtzeitige Anmeldung und keine individuelle Kenntnis bei Teilung. FALSE NICHT_ANWENDBAR.}
\item{einordnungsnachweis}{Nichtleerer Nachweis der Quote, Teilung, individuellen Kenntnis und konkreten Haftungsgrundlage.2061-Grundfrist erbrecht_weitere_grundfrist, Korrekturen rechtlich bestimmen.}
}
\details{Schuld mal Erbquote; über Quotenteil hinausgehende Forderung als Differenz. 2059 nur Umfang fehlenden Eigenvermögens-Verweigerungsrechts, Nachlasszugriff bleibt.2060/2061 nur bei qualifiziertem Sondertatbestand nach Teilung; keine Restforderungstilgung oder andere Erbenquote. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält quotenbetrag und ueber_quotenbetrag_hinausgehender_forderungsteil als exakte EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2059_T0002, BGB_2059_T0003, BGB_2060_T0001, BGB_2060_T0002, BGB_2060_T0003, BGB_2060_T0004, BGB_2061_T0002}
\examples{
miterbe_nachlassschuld_quotenbetrag(
  nachlassschuld = "100",
  erbquote_zaehler = 1,
  erbquote_nenner = 4,
  haftungsfall = "vor_teilung_unbeschraenkt_2059",
  quotenhaftung_qualifiziert = TRUE,
  einordnungsnachweis = "Synthetisch qualifizierter individueller Haftungsfall."
)
}
