% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{fund_herausgabebetrag_nach_kosten}
\alias{fund_herausgabebetrag_nach_kosten}
\title{fund herausgabebetrag nach kosten}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{fund_herausgabebetrag_nach_kosten(
  herausgabefaehiger_bruttobetrag = NULL,
  abzugsfaehige_kosten = NULL,
  anwendungsfall_qualifiziert = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{herausgabefaehiger_bruttobetrag}{Nichtnegativer rechtlich bewerteter Betrag in EUR, qualifizierte Bedeutung gemäß Abgrenzung.}
\item{abzugsfaehige_kosten}{Nichtnegativer rechtlich bewerteter Vergleichs-/Abzugs-/Zusatzbetrag in EUR für denselben Gegenstand und konsistente Bewertungsbasis.}
\item{anwendungsfall_qualifiziert}{Explizite Bestätigung des im Fachvertrag abgegrenzten Normfalls. FALSE ergibt NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleere Herkunft und rechtliche Begründung beider Beträge, Bewertungszeitpunkte und Anwendbarkeit.}
}
\details{Qualifizierten herauszugebenden Fundbetrag um abzugsfähige Kosten mindern, mindestens null. Nur rechtlich qualifizierter Herausgabebetrag und zugehörige abzugsfähige Kosten nach981Absatz3. Anspruchsperson, Erlöszuordnung und Fristablauf getrennt; übersteigende Kosten ergeben hier keinen negativen Auszahlungsbetrag und keinen neu festgestellten Zahlungsanspruch. Entsprechende981III-Anwendung bei qualifiziertem983-Behördenverwahrfall; keine eigenständige Berechtigungsentscheidung. Siehe fachkonzept/behoerdenfund_normanwendung.json. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter EUR-Bruch, keine automatische Rundung. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_981_T0004, BGB_983_T0001}
\examples{
fund_herausgabebetrag_nach_kosten(
  herausgabefaehiger_bruttobetrag = "100",
  abzugsfaehige_kosten = "30",
  anwendungsfall_qualifiziert = TRUE,
  bewertungsnachweis = "Synthetische qualifizierte Beträge für denselben Normfall."
)
}
