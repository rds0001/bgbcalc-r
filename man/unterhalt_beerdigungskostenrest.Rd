% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{unterhalt_beerdigungskostenrest}
\alias{unterhalt_beerdigungskostenrest}
\title{unterhalt beerdigungskostenrest}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{unterhalt_beerdigungskostenrest(
  beerdigungskosten = NULL,
  vom_erben_erlangbar = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{beerdigungskosten}{Rechtlich zu tragende Beerdigungskosten in EUR. Nichtnegative exakte EUR-Zahl.}
\item{vom_erben_erlangbar}{Von dem Erben für genau diese Kosten rechtlich und tatsächlich erlangbarer Betrag, nicht bloß bereits gezahlter Betrag. Nichtnegative exakte EUR-Zahl.}
\item{bewertungsnachweis}{Nichtleerer Nachweis der rechtlichen Qualifikation, Bewertung und gegebenenfalls identischen Bezugsperiode.}
}
\details{max(erster Betrag-zweiter Betrag,0) §1615II: Kosten abzüglich vom Erben erlangbarem Betrag, mindestens null. Unterhaltspflicht und Umfang der Beerdigungskosten vorqualifiziert; keine automatische Erbenhaftungsprüfung. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter nichtnegativer EUR-Bruch. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1615_T0002}
\examples{
unterhalt_beerdigungskostenrest(
  beerdigungskosten = "1000",
  vom_erben_erlangbar = "400",
  bewertungsnachweis = "Qualifizierte synthetische Beträge derselben Bezugsperiode."
)
}
