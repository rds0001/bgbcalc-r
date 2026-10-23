% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{mietpreisbegrenzung_ausnahmen}
\alias{mietpreisbegrenzung_ausnahmen}
\title{mietpreisbegrenzung ausnahmen}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{mietpreisbegrenzung_ausnahmen(
  erstmalige_nutzung = NULL,
  erstmalige_vermietung = NULL,
  erste_vermietung_nach_umfassender_modernisierung = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{erstmalige_nutzung}{ISO-Datum0001..9999 der rechtlich maßgeblichen ersten Nutzung der Wohnung; keine automatische Gleichsetzung mit Baujahr oder Beginn des aktuellen Mietvertrags.}
\item{erstmalige_vermietung}{ISO-Datum0001..9999 der rechtlich maßgeblichen erstmaligen Vermietung der Wohnung. Beide Daten müssen nach dem01.10.2014 liegen; der01.10.2014 selbst erfüllt Satz1 nicht.}
\item{erste_vermietung_nach_umfassender_modernisierung}{Expliziter Wahrheitswert, ob gerade die beurteilte Vermietung die erste Vermietung nach rechtlich als umfassend eingeordneter Modernisierung ist. Eine beliebige Modernisierung oder zweite Vermietung genügt nicht.}
\item{bewertungsnachweis}{Nichtleere Herkunfts-/Bewertungsbeschreibung der erstmaligen Daten und gegebenenfalls der umfassenden Modernisierung. Datumseinordnung wird nicht aus Belegen automatisch ermittelt.}
}
\details{Satz1 erfordert Erstnutzung und Erstvermietung jeweils strikt nach01.10.2014. Ausnahme von§556d liegt nach§556f vor, wenn Satz1 oder erste Vermietung nach umfassender Modernisierung. Satz2 bezieht auch§556e ein. Nur Ausnahmetatbestand§556f. Tatsächliche Berufungsmöglichkeit unterliegt insbesondere§556g Absatz1a und Übergangsrecht; diese Voraussetzungen werden nicht automatisch erfüllt. FALSE bei Ausnahme von§556e nach Satz2 bestätigt nicht dessen Anwendbarkeit. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält ausnahme_nach_satz_1, ausnahme_von_556d, ausnahme_von_556e_nach_satz_2 als Wahrheitswerte. BERECHNET bedeutet durchgeführte Prüfung, nicht zwingend TRUE. Einheit: wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_556f_T0001, BGB_556f_T0002, BGB_556f_T0003}
\examples{
mietpreisbegrenzung_ausnahmen(
  erstmalige_nutzung = "2014-09-30",
  erstmalige_vermietung = "2014-09-30",
  erste_vermietung_nach_umfassender_modernisierung = FALSE,
  bewertungsnachweis = "Synthetische rechtlich eingeordnete Nutzungsdaten."
)
}
