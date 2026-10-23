% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{gegenleistung_bei_ersatzverlangen}
\alias{gegenleistung_bei_ersatzverlangen}
\title{gegenleistung bei ersatzverlangen}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{gegenleistung_bei_ersatzverlangen(
  vereinbarte_gegenleistung = NULL,
  wert_geschuldeter_leistung = NULL,
  wert_ersatz_oder_ersatzanspruch = NULL,
  ersatz_nach_285_verlangt = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{vereinbarte_gegenleistung}{Nichtnegative vereinbarte Gegenleistung in EUR für den Bezugsfall des verlangten Ersatzes. Nicht durch den tatsächlichen Sachwert ersetzen.}
\item{wert_geschuldeter_leistung}{Positiver rechtlich maßgeblicher Wert der geschuldeten Leistung in EUR, konsistent zum Ersatzwert und dem Verweis auf§441 Absatz3 bewertet. Verhältnisrechnung benötigt einen positiven Vergleichswert.}
\item{wert_ersatz_oder_ersatzanspruch}{Nichtnegativer rechtlich maßgeblicher Wert des konkret nach§285 herauszugebenden Ersatzes oder abzutretenden Ersatzanspruchs in EUR. Der Nominalbetrag eines uneinbringlichen Anspruchs ist nicht automatisch dessen Wert.}
\item{ersatz_nach_285_verlangt}{Wahrheitswert eines rechtlich einschlägigen Ersatz-/Abtretungsverlangens nach§285 im Anwendungsbereich§326 Absatz3. FALSE ergibt NICHT_ANWENDBAR. Das Programm stellt keinen Ersatzanspruch aus beliebigen Drittzahlungen her.}
\item{bewertungsnachweis}{Nichtleere Beschreibung des Ersatzanspruchs, Verlangens und konsistenten Bewertungsmaßstabs/-zeitpunkts für geschuldete Leistung und Ersatz. Verhältnis zur sonstigen Gefahrtragung gesondert bestimmen.}
}
\details{Bei einschlägigem Ersatzverlangen: Gegenleistung×min(Ersatzwert,Wert geschuldeter Leistung)/Wert geschuldeter Leistung. Niedriger Ersatzwert vermindert relativ; gleicher oder höherer Wert belässt vereinbarte Gegenleistung. Nur§326 Absatz3; keine Feststellung des§285-Anspruchs und keine Addition zu einem Ergebnis nach Absatz2. Werte sind rechtlich bewertete Nutzervorgaben; Rückforderung bereits geleisteter Gegenleistung und Nutzungen separat. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist die exakte noch geschuldete Gegenleistung als EUR-Bruch für diesen gesetzlichen Weg. NICHT_ANWENDBAR bei fehlendem Ersatzverlangen. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_326_T0006, BGB_326_T0007, BGB_441_T0004, BGB_441_T0005}
\examples{
gegenleistung_bei_ersatzverlangen(
  vereinbarte_gegenleistung = "800",
  wert_geschuldeter_leistung = "1000",
  wert_ersatz_oder_ersatzanspruch = "0",
  ersatz_nach_285_verlangt = TRUE,
  bewertungsnachweis = paste0(
    "Synthetisches rechtlich einschlägiges Ersatzverlangen und ko",
    "nsistente Vergleichswerte."
  )
)
}
