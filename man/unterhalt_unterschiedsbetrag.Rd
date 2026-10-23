% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{unterhalt_unterschiedsbetrag}
\alias{unterhalt_unterschiedsbetrag}
\title{unterhalt unterschiedsbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{unterhalt_unterschiedsbetrag(
  voller_unterhalt = NULL,
  erwerbsdeckung = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{voller_unterhalt}{Voller Unterhalt für denselben Zeitraum, nach§1578 rechtlich bewertet. Nichtnegative exakte EUR-Zahl.}
\item{erwerbsdeckung}{Qualifizierte Erwerbseinkünfte nach§1573II oder nachhaltig gesicherter Teil nachIV2 für denselben Zeitraum. Nichtnegative exakte EUR-Zahl.}
\item{bewertungsnachweis}{Nichtleerer Nachweis der rechtlichen Qualifikation, Bewertung und gegebenenfalls identischen Bezugsperiode.}
}
\details{max(erster Betrag-zweiter Betrag,0) Gesetzlicher Unterschiedsbetrag nach§1573II/IV2, mindestens null. Angemessenheit, Nachhaltigkeit, Anschlussunterhalt und Ausschluss konkurrierender Ansprüche vorqualifiziert; keine Bedarfsbemessung, Quotenmethode oder vollständige Unterhaltsprüfung. Numerische Wiederverwendung für1577/1578 mit rechtlich qualifiziertem Bedarf und anrechenbaren Deckungsbeträgen: fachkonzept/unterhalt1577_normanwendung.json. Keine automatische1577II-Freistellung aus tatsächlich ausgebliebenen Zahlungen. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter nichtnegativer EUR-Bruch. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1573_T0002, BGB_1573_T0003, BGB_1573_T0005, BGB_1577_T0001, BGB_1578_T0001, BGB_1578_T0002, BGB_1578_T0003, BGB_1578_T0004}
\examples{
unterhalt_unterschiedsbetrag(
  voller_unterhalt = "1000",
  erwerbsdeckung = "400",
  bewertungsnachweis = "Qualifizierte synthetische Beträge derselben Bezugsperiode."
)
}
