% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pfand_edelmetall_mindestpreis}
\alias{pfand_edelmetall_mindestpreis}
\title{pfand edelmetall mindestpreis}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{pfand_edelmetall_mindestpreis(
  angebotener_preis = NULL,
  gold_oder_silberwert = NULL,
  gold_oder_silbersache = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{angebotener_preis}{Nichtnegatives Gebot beziehungsweise angebotener Preis des freihändigen Ersatzverkaufs in EUR.}
\item{gold_oder_silberwert}{Nichtnegativer rechtlich maßgeblicher Gold-/Silberwert des Pfandes in EUR; keine automatische Marktpreis- oder Feingehaltsbewertung.}
\item{gold_oder_silbersache}{Expliziter Wahrheitswert des qualifizierten Edelmetallpfands im einschlägigen Verkaufsregime§1240; FALSE NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleere Begründung der Sache, Bewertung und des Verkaufsregimes einschließlich zulässiger Abweichungen.}
}
\details{Angebotener Preis>=Gold-/Silberwert; denselben Mindestwert für Zuschlag und freihändigen Ersatzverkauf anwenden. Nur Preisuntergrenze, keine Gesamtzulässigkeit des Verkaufs, kein Preisabschlag bei fehlenden Geboten. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält mindestpreis als EUR-Bruch und mindestpreis_erreicht. Einheit: EUR_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1240_T0001, BGB_1240_T0002}
\examples{
pfand_edelmetall_mindestpreis(
  angebotener_preis = "99.99",
  gold_oder_silberwert = "100",
  gold_oder_silbersache = TRUE,
  bewertungsnachweis = paste0(
    "Qualifizierter Gold-/Silberwert und gesetzliches Verkaufsreg",
    "ime."
  )
)
}
