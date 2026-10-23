% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pflichtteil_schenkungswert}
\alias{pflichtteil_schenkungswert}
\title{pflichtteil schenkungswert}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{pflichtteil_schenkungswert(
  vergleichbarer_schenkungswert = NULL,
  wert_beim_erbfall = NULL,
  verbrauchbare_sache = NULL,
  pflicht_oder_anstandsschenkung = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{vergleichbarer_schenkungswert}{Nichtnegativer rechtlich bestimmter Schenkungswert in EUR aus dem Bewertungszeitpunkt der Schenkung, mit erforderlicher Wert-/Kaufkraftbereinigung für einen zulässigen Vergleich zum Erbfall. Belastungen und gegebenenfalls vorbehaltene Rechte fachlich bewerten. Kein ungeprüfter historischer Nominalwert.}
\item{wert_beim_erbfall}{Nichtnegativer rechtlich bestimmter Wert desselben Gegenstands zur Zeit des Erbfalls in EUR. Gleicher Bewertungsumfang und vergleichbarer Maßstab wie Schenkungswert. Bei verbrauchbarer Sache typgültig erforderlich, aber nicht maßgeblich.}
\item{verbrauchbare_sache}{Wahrheitswert der rechtlichen Einordnung nach§92: bewegliche Sache mit bestimmungsmäßigem Verbrauch/Veräußerung, einschließlich entsprechender Warenlager/Sachinbegriffe. Nicht bloß physische Abnutzbarkeit.}
\item{pflicht_oder_anstandsschenkung}{Wahrheitswert einer Schenkung zur Erfüllung sittlicher Pflicht oder einer auf den Anstand zu nehmenden Rücksicht gemäß§2330. TRUE ergibt NICHT_ANWENDBAR für diese Ergänzungsbewertung, nicht einen allgemeinen Wertnull der Sache.}
\item{bewertungsnachweis}{Nichtleere Beschreibung der Schenkung, beiden Bewertungszeitpunkte, vergleichbaren Wertansätze, etwaiger Bereinigung/Belastungen, Verbrauchbarkeit und Ausnahme§2330. Keine Schenkung an den Pflichtteilsberechtigten ungeprüft als Drittschenkung behandeln.}
}
\details{Verbrauchbare Sache: rechtlich vergleichbar bestimmter Schenkungswert. Sonst Minimum aus Schenkungs- und Erbfallwert. Pflicht-/Anstandsschenkung ausnehmen. Bewertungswahl vor Abschmelzung und Quotenberechnung; keine abschließende Pflichtteilsergänzung. Kein automatischer Verbraucherpreisindex oder Sachverständigenwert. Rechtlich erforderliche Preisbasis-/Belastungsbewertung als belegte Eingabe. Sonderfälle und weitere Anrechnungen separat. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter EUR-Bewertungsansatz. Ausnahme§2330 ergibt NICHT_ANWENDBAR mit null. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_92_T0001, BGB_92_T0002, BGB_2325_T0002, BGB_2325_T0003, BGB_2330_T0001}
\examples{
pflichtteil_schenkungswert(
  vergleichbarer_schenkungswert = "0",
  wert_beim_erbfall = "0",
  verbrauchbare_sache = FALSE,
  pflicht_oder_anstandsschenkung = FALSE,
  bewertungsnachweis = paste0(
    "Synthetische vergleichbare rechtlich bestimmte Schenkungs-/E",
    "rbfallwerte."
  )
)
}
