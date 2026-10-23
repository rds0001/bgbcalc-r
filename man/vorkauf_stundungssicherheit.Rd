% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{vorkauf_stundungssicherheit}
\alias{vorkauf_stundungssicherheit}
\title{vorkauf stundungssicherheit}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{vorkauf_stundungssicherheit(
  gestundeter_kaufpreis = NULL,
  bereits_qualifiziert_gesicherter_teil = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{gestundeter_kaufpreis}{Nichtnegativer rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge oder Bruchobjekt zaehler/nenner; gleiche Bewertungsbasis, keine Doppelzählung.}
\item{bereits_qualifiziert_gesicherter_teil}{Nichtnegativer rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge oder Bruchobjekt zaehler/nenner; gleiche Bewertungsbasis, keine Doppelzählung. Nur§468II-befreiter Teil,0wennkeinFall, höchstens gestundeterKaufpreis.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des gesetzlichen Anwendungsfalls und der rechtlich qualifizierten Beträge; kein automatischer Anspruchstatbestand.}
}
\details{Gestundeten Kaufpreis um den nach§468 Absatz2 von zusätzlicher Sicherheit befreiten Teil vermindern Befreiter Teil nur für qualifiziert vereinbarte Hypothek bzw.in Anrechnung auf Kaufpreis übernommene hypothekarische Schuld, entsprechend eingetragenes Schiff/Schiffsbauwerk; sonst0. Keine beliebige vorhandene Sicherheit anrechnen, Überlappungen vorab entfernen. Teil höchstens gestundeter Kaufpreis. Nichtnegative exakte EUR-Beträge und sichere Zwischenwerte nachNUMERIK; positiveGesamtwertbasis und validierteTeilgrenzen.}
\value{wert ist der exakt berechnete EUR-Betrag als Bruchobjekt. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_468_T0001, BGB_468_T0002, BGB_468_T0003}
\examples{
vorkauf_stundungssicherheit(
  gestundeter_kaufpreis = "1000",
  bereits_qualifiziert_gesicherter_teil = "300",
  einordnungsnachweis = "Qualifiziert befreiter Hypothekenteil468II ohne Überlappung."
)
}
