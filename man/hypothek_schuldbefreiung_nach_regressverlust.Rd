% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{hypothek_schuldbefreiung_nach_regressverlust}
\alias{hypothek_schuldbefreiung_nach_regressverlust}
\title{hypothek schuldbefreiung nach regressverlust}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{hypothek_schuldbefreiung_nach_regressverlust(
  persoenliche_restschuld = NULL,
  verlorener_hypothekarischer_regress = NULL,
  anwendungsfall_qualifiziert = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{persoenliche_restschuld}{Nichtnegativer rechtlich bewerteter Betrag in EUR, qualifizierte Bedeutung gemäß Abgrenzung.}
\item{verlorener_hypothekarischer_regress}{Nichtnegativer rechtlich bewerteter Vergleichs-/Abzugs-/Zusatzbetrag in EUR für denselben Gegenstand und konsistente Bewertungsbasis.}
\item{anwendungsfall_qualifiziert}{Explizite Bestätigung des im Fachvertrag abgegrenzten Normfalls. FALSE ergibt NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleere Herkunft und rechtliche Begründung beider Beträge, Bewertungszeitpunkte und Anwendbarkeit.}
}
\details{Persönliche Restschuld bis zur Höhe des kausal verlorenen hypothekarischen Ersatzes freistellen. Qualifizierter Verzicht, Aufhebung oder Vorrangeinräumung durch Gläubiger. Verlorener Regress ist rechtlich bewerteter ohne Verfügung erzielbarer1164-Ersatz, nicht pauschaler Grundstücks- oder Hypothekennennwert. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter EUR-Bruch, keine automatische Rundung. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1165_T0001}
\examples{
hypothek_schuldbefreiung_nach_regressverlust(
  persoenliche_restschuld = "100",
  verlorener_hypothekarischer_regress = "30",
  anwendungsfall_qualifiziert = TRUE,
  bewertungsnachweis = "Synthetische qualifizierte Beträge für denselben Normfall."
)
}
