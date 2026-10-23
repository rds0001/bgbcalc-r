% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{grundbuch_wertersatzgrenze}
\alias{grundbuch_wertersatzgrenze}
\title{grundbuch wertersatzgrenze}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{grundbuch_wertersatzgrenze(
  wertersatz = NULL,
  eingetragener_hoechstbetrag = NULL,
  hoechstbetrag_wirksam_bestimmt = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{wertersatz}{Nichtnegativer qualifizierter Wertersatz in EUR nach einschlägigen Versteigerungsvorschriften, vor Anwendung des konkreten Höchstbetrags.}
\item{eingetragener_hoechstbetrag}{Nichtnegativer wirksam eingetragener Höchstbetrag des Ersatzes in EUR.}
\item{hoechstbetrag_wirksam_bestimmt}{Expliziter Wahrheitswert des gesetzlichen Anwendungsbereichs§882 und wirksamer Eintragung; FALSE NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleere Begründung von Ersatzwert, belastetem Recht, Eintragung und Höchstbetrag.}
}
\details{min(Wertersatz,eingetragener Höchstbetrag). Keine Bewertung aus ZVG und kein Erlösverteilungsplan; Höchstbetrag schafft keinen Anspruch in voller Höhe. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter gedeckelter EUR-Betrag, sonst null. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_882_T0001, BGB_882_T0002}
\examples{
grundbuch_wertersatzgrenze(
  wertersatz = "100",
  eingetragener_hoechstbetrag = "80",
  hoechstbetrag_wirksam_bestimmt = TRUE,
  bewertungsnachweis = "Qualifizierter Ersatzwert und eingetragener Höchstbetrag."
)
}
