% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{ausstattung_schenkungsmehrbetrag}
\alias{ausstattung_schenkungsmehrbetrag}
\title{ausstattung schenkungsmehrbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{ausstattung_schenkungsmehrbetrag(
  ausstattungswert = NULL,
  angemessenes_mass = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{ausstattungswert}{Rechtlich bewertete Ausstattung in EUR. Nichtnegative exakte EUR-Zahl.}
\item{angemessenes_mass}{Nach Umständen insbesondere Elternvermögen qualifiziertes entsprechendes Maß in EUR. Nichtnegative exakte EUR-Zahl.}
\item{bewertungsnachweis}{Nichtleerer Nachweis der rechtlichen Qualifikation, Bewertung und gegebenenfalls identischen Bezugsperiode.}
}
\details{max(erster Betrag-zweiter Betrag,0) §1624I: Ausstattung über dem qualifizierten entsprechenden Maß, mindestens null. Ausstattungseigenschaft und Bewertung vorqualifiziert; keine selbst erfundene Vermögensquote. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter nichtnegativer EUR-Bruch. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1624_T0001}
\examples{
ausstattung_schenkungsmehrbetrag(
  ausstattungswert = "1000",
  angemessenes_mass = "400",
  bewertungsnachweis = "Qualifizierte synthetische Beträge derselben Bezugsperiode."
)
}
