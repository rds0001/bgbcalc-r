% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{vorkauf_preis_mit_nebenleistungswert}
\alias{vorkauf_preis_mit_nebenleistungswert}
\title{vorkauf preis mit nebenleistungswert}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{vorkauf_preis_mit_nebenleistungswert(
  kaufpreis = NULL,
  zu_ersetzender_nebenleistungswert = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{kaufpreis}{Nichtnegativer rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge oder Bruchobjekt zaehler/nenner; gleiche Bewertungsbasis, keine Doppelzählung.}
\item{zu_ersetzender_nebenleistungswert}{Nichtnegativer rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge oder Bruchobjekt zaehler/nenner; gleiche Bewertungsbasis, keine Doppelzählung.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des gesetzlichen Anwendungsfalls und der rechtlich qualifizierten Beträge; kein automatischer Anspruchstatbestand.}
}
\details{Kaufpreis um qualifizierten Geldwert der nicht selbst erfüllbaren Nebenleistung erhöhen Nur§466 monetär schätzbare und rechtlich zu ersetzende Nebenleistung, die Vorkaufsberechtigter nicht selbst bewirken kann. Keine Wertbestimmung und kein Wert einer nach§466 unbeachtlichen Nebenleistungsvereinbarung. Kaufpreis darf diesen Wert noch nicht enthalten. Nichtnegative exakte EUR-Beträge und sichere Zwischenwerte nachNUMERIK; positiveGesamtwertbasis und validierteTeilgrenzen.}
\value{wert ist der exakt berechnete EUR-Betrag als Bruchobjekt. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_466_T0001}
\examples{
vorkauf_preis_mit_nebenleistungswert(
  kaufpreis = "1000",
  zu_ersetzender_nebenleistungswert = "200",
  einordnungsnachweis = paste0(
    "Schätzbare, nicht selbst erfüllbare und zu ersetzende Nebenl",
    "eistung."
  )
)
}
