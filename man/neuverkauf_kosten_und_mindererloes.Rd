% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{neuverkauf_kosten_und_mindererloes}
\alias{neuverkauf_kosten_und_mindererloes}
\title{neuverkauf kosten und mindererloes}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{neuverkauf_kosten_und_mindererloes(
  urspruenglicher_verkaufspreis = NULL,
  neuer_verkaufspreis = NULL,
  kosten_neuverkauf = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{urspruenglicher_verkaufspreis}{Nichtnegativer rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge oder Bruchobjekt zaehler/nenner; gleiche Bewertungsbasis, keine Doppelzählung.}
\item{neuer_verkaufspreis}{Nichtnegativer rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge oder Bruchobjekt zaehler/nenner; gleiche Bewertungsbasis, keine Doppelzählung.}
\item{kosten_neuverkauf}{Nichtnegativer rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge oder Bruchobjekt zaehler/nenner; gleiche Bewertungsbasis, keine Doppelzählung.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des gesetzlichen Anwendungsfalls und der rechtlich qualifizierten Beträge; kein automatischer Anspruchstatbestand.}
}
\details{Kosten des neuen Verkaufs plus positiver Mindererlös gegenüber ursprünglichem Verkauf Nur§451 Absatz2 nach qualifizierter Genehmigungsverweigerung und dadurch veranlasstem Neuverkauf. Mehrerlös wird nicht gegen Neuverkaufskosten aufgerechnet; kein automatischer Gesamtschadensersatz. Nichtnegative exakte EUR-Beträge und sichere Zwischenwerte nachNUMERIK; positiveGesamtwertbasis und validierteTeilgrenzen.}
\value{wert ist der exakt berechnete EUR-Betrag als Bruchobjekt. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_451_T0003}
\examples{
neuverkauf_kosten_und_mindererloes(
  urspruenglicher_verkaufspreis = "1000",
  neuer_verkaufspreis = "800",
  kosten_neuverkauf = "50",
  einordnungsnachweis = "Qualifizierte Genehmigungsverweigerung und Neuverkaufswerte."
)
}
