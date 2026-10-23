% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{leibrente_geldvorauszahlung}
\alias{leibrente_geldvorauszahlung}
\title{leibrente geldvorauszahlung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{leibrente_geldvorauszahlung(
  jahresrentenbetrag = NULL,
  vorauszahlungszeitraum_beginnt_am = NULL,
  beginn_des_zeitabschnitts_erlebt = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{jahresrentenbetrag}{Nichtnegativer rechtlich bestimmter Jahresgeldrentenbetrag in EUR als exakter Dezimalwert/Bruch.}
\item{vorauszahlungszeitraum_beginnt_am}{ISO-Datum eines qualifizierten regulären Dreimonatsperiodenbeginns (Tagesbeginn).}
\item{beginn_des_zeitabschnitts_erlebt}{Expliziter Wahrheitswert: Gläubiger hat den Beginn dieser neuen Periode erlebt; kein automatischer Schluss aus einem Todesdatum.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des gesetzlichen759/760-Geldrentenfalls ohne abweichende Vereinbarung/Rumpfperiode.}
}
\details{Jahresgeldrente/4 für drei Kalendermonate; voller Zeitraum bei erlebtem Periodenbeginn. Nur §§759/760 gesetzlicher Geldleibrentenfall ohne abweichende Vereinbarung: Eingabebetrag ist rechtlich bestimmter Jahresbetrag, Beginn einer regulären Dreimonatsvorausperiode als Tagesbeginn qualifiziert. Nicht Sachrente, abweichende Zahlungsperiode oder besonders geregelte erste Rumpfperiode. Erleben des Beginns ausdrücklich rechtlich/tatsächlich bestimmen; ein bloßes Todesdatum ersetzt bei Grenzfällen keine Feststellung. Tod während einer begonnenen Periode führt hier nicht zu tageweiser Kürzung. Bei nicht erlebtem Beginn null ausschließlich für diese neue Periode, keine Rückforderung früherer Vorauszahlungen. Betrag grundsätzlich im Voraus zu entrichten; keine automatische Feiertagsverschiebung des Periodenendes oder Auslegung abweichender Lebensdauervereinbarungen. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält Anfang/Ende der Dreimonatsperiode und exakte EUR-Regel-/gebührende Beträge. Einheit: EUR_und_daten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_759_T0002, BGB_760_T0001, BGB_760_T0002, BGB_760_T0003}
\examples{
leibrente_geldvorauszahlung(
  jahresrentenbetrag = "12000",
  vorauszahlungszeitraum_beginnt_am = "2026-01-01",
  beginn_des_zeitabschnitts_erlebt = TRUE,
  einordnungsnachweis = paste0(
    "Reguläre Dreimonatsgeldrente und rechtlich qualifiziert erle",
    "bter Beginn."
  )
)
}
