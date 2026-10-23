% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{wiederkauf_verwendungsersatz}
\alias{wiederkauf_verwendungsersatz}
\title{wiederkauf verwendungsersatz}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{wiederkauf_verwendungsersatz(
  verwendungsaufwand = NULL,
  bewirkte_werterhoehung = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{verwendungsaufwand}{Nichtnegativer rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge oder Bruchobjekt zaehler/nenner; gleiche Bewertungsbasis, keine Doppelzählung.}
\item{bewirkte_werterhoehung}{Nichtnegativer rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge oder Bruchobjekt zaehler/nenner; gleiche Bewertungsbasis, keine Doppelzählung.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des gesetzlichen Anwendungsfalls und der rechtlich qualifizierten Beträge; kein automatischer Anspruchstatbestand.}
}
\details{Qualifizierten Verwendungsaufwand auf dadurch bewirkte Werterhöhung begrenzen Nur§459 Verwendungen vor Wiederkauf; keine Schätzungswertvereinbarung nach§460, die diesen Anspruch ausschließt. Kausale Werterhöhung extern bewerten; Wegnahmerecht und weitere Kosten gesondert. Nichtnegative exakte EUR-Beträge und sichere Zwischenwerte nachNUMERIK; positiveGesamtwertbasis und validierteTeilgrenzen.}
\value{wert ist der exakt berechnete EUR-Betrag als Bruchobjekt. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_459_T0001}
\examples{
wiederkauf_verwendungsersatz(
  verwendungsaufwand = "300",
  bewirkte_werterhoehung = "200",
  einordnungsnachweis = paste0(
    "Qualifizierte Verwendungen vor Wiederkauf ohne460-Sonderfall",
    "."
  )
)
}
