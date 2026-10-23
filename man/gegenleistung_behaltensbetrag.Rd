% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{gegenleistung_behaltensbetrag}
\alias{gegenleistung_behaltensbetrag}
\title{gegenleistung behaltensbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{gegenleistung_behaltensbetrag(
  vereinbarte_gegenleistung = NULL,
  ersparte_aufwendungen = NULL,
  anderweitiger_erwerb = NULL,
  boeswillig_unterlassener_erwerb = NULL,
  leistungsbefreiung_nach_275 = NULL,
  glaeubiger_allein_oder_weit_ueberwiegend_verantwortlich = NULL,
  schuldner_hat_umstand_zu_vertreten = NULL,
  annahmeverzug_bei_eintritt = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{vereinbarte_gegenleistung}{Nichtnegative vereinbarte Gegenleistung in EUR für den vollständig von der Leistung befreiten Bezugsfall. Teilweise Befreiung oder bloß ausgeschlossene Nacherfüllung nicht ungeprüft als diesen Fall eingeben.}
\item{ersparte_aufwendungen}{Nichtnegative infolge der Leistungsbefreiung ersparte Aufwendungen in EUR. Ursächliche und rechtlich anrechenbare Positionen vorab bestimmen.}
\item{anderweitiger_erwerb}{Nichtnegativer Erwerb durch anderweitige Verwendung der Arbeitskraft in EUR, rechtlich dem Befreiungsfall zugeordnet. Keine doppelte Anrechnung derselben Position als Ersparnis.}
\item{boeswillig_unterlassener_erwerb}{Nichtnegativer bewerteter Betrag böswillig unterlassenen anderweitigen Erwerbs in EUR. Böswilligkeit und Erwerbsmöglichkeit sind eigenständige rechtliche Bewertungen, keine frei eingesetzte Strafquote.}
\item{leistungsbefreiung_nach_275}{Wahrheitswert, ob der Schuldner nach§275 Absätze1–3 für den hier berechneten Bezugsfall nicht zu leisten braucht. Sachlichen Anwendungsbereich des§326 Absatz2 und Vorrang besonderer Gefahrtragungsregeln vorab bestimmen.}
\item{glaeubiger_allein_oder_weit_ueberwiegend_verantwortlich}{Wahrheitswert zur alleinigen oder weit überwiegenden Verantwortlichkeit des Gläubigers für den Befreiungsumstand. Nicht bloß irgendein Mitverschulden; keine erfundene prozentuale Schwelle.}
\item{schuldner_hat_umstand_zu_vertreten}{Wahrheitswert, ob der Schuldner den zur Leistungsbefreiung führenden Umstand zu vertreten hat. Für die Annahmeverzugsalternative muss dieser Wert FALSE sein.}
\item{annahmeverzug_bei_eintritt}{Wahrheitswert, ob gerade beim Eintritt des Befreiungsumstands der Gläubiger in Annahmeverzug war. Bloß irgendwann früherer Verzug reicht nicht.}
\item{bewertungsnachweis}{Nichtleere Beschreibung von Leistungsbefreiung, Gefahrtragung, Verantwortlichkeit, Zeitpunkt des Annahmeverzugs und den drei getrennten Anrechnungspositionen.}
}
\details{Behaltensgrund=Leistungsbefreiung UND(Gläubiger allein/weit überwiegend verantwortlich ODER(Schuldner nicht verantwortlich UND Annahmeverzug beim Eintritt)). Dann Gegenleistung minus Ersparnis minus Erwerb minus böswillig unterlassenen Erwerb, mindestens0. Ohne diesen Behaltensgrund NICHT_ANWENDBAR. Nur Absatz2, keine umfassende Gefahrtragungsberechnung. Bei Nichtanwendbarkeit kann Gegenleistung nach anderen Regeln bestehen oder entfallen; nicht automatisch0. Teilbefreiung, bloße Nacherfüllungsbefreiung, Ersatzverlangen nach Absatz3, Sonderregeln und Rückabwicklung separat. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält den exakten verbleibenden EUR-Betrag. Nichtanwendbarkeit ergibt null, nicht einen festgestellten Gegenleistungswegfall. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_326_T0002, BGB_326_T0003, BGB_326_T0004, BGB_326_T0005}
\examples{
gegenleistung_behaltensbetrag(
  vereinbarte_gegenleistung = "1000",
  ersparte_aufwendungen = "100",
  anderweitiger_erwerb = "200",
  boeswillig_unterlassener_erwerb = "50",
  leistungsbefreiung_nach_275 = TRUE,
  glaeubiger_allein_oder_weit_ueberwiegend_verantwortlich = FALSE,
  schuldner_hat_umstand_zu_vertreten = FALSE,
  annahmeverzug_bei_eintritt = TRUE,
  bewertungsnachweis = paste0(
    "Synthetischer vollständiger Befreiungsfall ohne vorrangige S",
    "onderregel."
  )
)
}
