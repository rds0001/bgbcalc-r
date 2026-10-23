% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{empfaengniszeit_gesetzlicher_zeitraum}
\alias{empfaengniszeit_gesetzlicher_zeitraum}
\title{empfaengniszeit gesetzlicher zeitraum}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{empfaengniszeit_gesetzlicher_zeitraum(
  geburt_am = NULL
)}
\arguments{
\item{geburt_am}{Tatsächliches ISO-Geburtsdatum als Referenz für gesetzliches Ausgangsfenster.}
}
\details{Geburt-300Tage bis Geburt-181Tage einschließlich beider Grenzen;120Tage. Nur gesetzlicher Ausgangszeitraum nach§1600dIII1. Ein feststehender abweichender Empfängniszeitraum nachSatz2 verdrängt diesen Zeitraum und muss fachlich belegt gesondert verwendet werden. Keine medizinische Schätzung und keine Feststellung der Vaterschaft; Beischlaf, Zweifel und sonstige Ausschlüsse nicht geprüft. Nicht mit300-Tage-Regel nach§1593 gleichsetzen. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält zeitraum_beginn/zeitraum_ende als ISO-Daten und tage_einschliesslich=120. Einheit: daten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1600d_T0004}
\examples{
empfaengniszeit_gesetzlicher_zeitraum(
  geburt_am = "2030-01-01"
)
}
