% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{unterhalt_sicherheitsregelbetrag}
\alias{unterhalt_sicherheitsregelbetrag}
\title{unterhalt sicherheitsregelbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{unterhalt_sicherheitsregelbetrag(
  monatsrente = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{monatsrente}{Nichtnegative qualifizierte konstante Monatsunterhaltsrente in EUR.}
\item{bewertungsnachweis}{Nichtleerer Nachweis der rechtlichen Höhe und Konstanz der Monatsrente für einfachen Jahresbetrag.}
}
\details{Einfacher Jahresbetrag=12×konstante Monatsrente. Rechnerische Regelsicherheitsgrenze nach§1585aI3 bei konstanter rechtlich qualifizierter Monatsrente. Keine automatische Sicherheitsleistungspflicht: Verlangen, Gefährdung, unbillige Belastung und Art der Sicherheit gesondert. Besondere Umstände können höhere Sicherheit rechtfertigen; dieser Regelbetrag ist keine ausnahmslose Höchstgrenze und keine freie gerichtliche Ermessensentscheidung. Wechselnde Rentenhöhen und zeitlich begrenzte Ansprüche außerhalb des konstanten Jahresansatzes separat bestimmen. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist einfacher Jahresbetrag als exakter EUR-Bruch, keine zwingende endgültige Sicherheitsleistung. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1585a_T0003}
\examples{
unterhalt_sicherheitsregelbetrag(
  monatsrente = "300",
  bewertungsnachweis = "Konstante qualifizierte Monatsrente300EUR."
)
}
