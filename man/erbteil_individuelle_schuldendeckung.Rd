% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{erbteil_individuelle_schuldendeckung}
\alias{erbteil_individuelle_schuldendeckung}
\title{erbteil individuelle schuldendeckung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{erbteil_individuelle_schuldendeckung(
  zugeteilter_erbteilwert = NULL,
  individuell_zugeordnete_nachlassschuld = NULL,
  last_nach_2046_abs2_qualifiziert = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{zugeteilter_erbteilwert}{Nichtnegativer rechtlich bestimmter EUR-Teilungsanteil nach gemeinsamer Lastbereinigung und ggf.Ausgleichung.}
\item{individuell_zugeordnete_nachlassschuld}{Nichtnegative EUR-Nachlassschuld, die nur diesem Erben zugeordnet ist. Nicht nochmals in gemeinsamen Schulden abziehen.}
\item{last_nach_2046_abs2_qualifiziert}{Pflichtwahrheitswert zu individuell qualifizierter Last2046II; bei mehreren belasteten Erben deren individuelle Last vorher bestimmen. FALSE NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleerer Nachweis des Teilungsanteils und der individuellen Last.}
}
\details{Berichtigung=min(Teilungsanteil,individuelleSchuld); verbleibender Anteil und ungedeckte Schuld als Differenzen. Ungedeckte Schuld erlischt nicht; keine Umlage auf unbelastete Erben oder erfundene Gleichquote mehrerer belasteter Erben. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält berichtigung_aus_eigenem_anteil, verbleibender_erbteilwert und nicht_aus_anteil_berichtigter_schuldteil als exakte EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2046_T0003}
\examples{
erbteil_individuelle_schuldendeckung(
  zugeteilter_erbteilwert = "40",
  individuell_zugeordnete_nachlassschuld = "60",
  last_nach_2046_abs2_qualifiziert = TRUE,
  bewertungsnachweis = "Synthetisch individuelle Nachlasslast."
)
}
