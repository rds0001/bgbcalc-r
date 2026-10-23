% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{erbschaftskauf_belastungswertminderung}
\alias{erbschaftskauf_belastungswertminderung}
\title{erbschaftskauf belastungswertminderung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{erbschaftskauf_belastungswertminderung(
  wert_ohne_belastung = NULL,
  wert_mit_belastung = NULL,
  unentgeltliche_belastung_vor_kauf_qualifiziert = NULL,
  kaeufer_kennt_belastung_beim_kauf = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{wert_ohne_belastung}{Nichtnegativer exakter EUR-Vergleichswert des Gegenstands ohne die untersuchte Belastung am rechtlich maßgeblichen Bewertungszeitpunkt.}
\item{wert_mit_belastung}{Nichtnegativer exakter EUR-Vergleichswert mit derselben Belastung, sonst gleiche Bewertungsannahmen/gleicher Zeitpunkt. Keine ungeprüfte Mischung historischer und aktueller Marktpreise.}
\item{unentgeltliche_belastung_vor_kauf_qualifiziert}{Expliziter Wahrheitswert: unentgeltliche Belastung des Erbschaftsgegenstands durch Verkäufer vor Abschluss des Erbschaftskaufs nach2375I. FALSE ergibt NICHT_ANWENDBAR.}
\item{kaeufer_kennt_belastung_beim_kauf}{Expliziter Wahrheitswert rechtlich maßgeblicher Kenntnis des Käufers bei Vertragsschluss; TRUE ergibt Ersatzbetrag null, rechnerische Wertminderung bleibt ausgewiesen.}
\item{bewertungsnachweis}{Nichtleerer Nachweis der vergleichbaren Werte, Belastung, Kaufzeit und Käuferkenntnis.}
}
\details{Positive Differenz Wert ohne minus Wert mit Belastung; bei Käuferkenntnis bei Kauf Ersatzbetrag null. Nur unentgeltliche Vorbelastung2375I. Andere Ersatzgründe, Verbrauch/Veräußerung und Erbschaftsschenkung2385II separat. Keine Wertprognose oder pauschale historische Preisänderung. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält wertminderung und ersatzbetrag als exakte EUR-Brüche; negative Anwendbarkeit NULL. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2375_T0001, BGB_2375_T0002}
\examples{
erbschaftskauf_belastungswertminderung(
  wert_ohne_belastung = "100",
  wert_mit_belastung = "70",
  unentgeltliche_belastung_vor_kauf_qualifiziert = TRUE,
  kaeufer_kennt_belastung_beim_kauf = FALSE,
  bewertungsnachweis = paste0(
    "Synthetisch vergleichbare Werte gleicher Bewertungszeitpunkt",
    "."
  )
)
}
