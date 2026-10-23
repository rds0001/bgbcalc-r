% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{dienstverguetung_annahmeverzug}
\alias{dienstverguetung_annahmeverzug}
\title{dienstverguetung annahmeverzug}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{dienstverguetung_annahmeverzug(
  vereinbarte_verguetung = NULL,
  ersparte_aufwendungen = NULL,
  anderweitiger_erwerb = NULL,
  boeswillig_unterlassener_erwerb = NULL,
  annahmeverzug = NULL,
  arbeitgeber_traegt_arbeitsausfallrisiko = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{vereinbarte_verguetung}{Nichtnegative vereinbarte Vergütung in EUR für die gerade wegen Annahmeverzugs beziehungsweise zugeordneten Arbeitsausfallrisikos nicht geleisteten Dienste im rechtlich abgegrenzten Zeitraum. Kein beliebiger Monatslohn bei nur teilweisem Ausfall.}
\item{ersparte_aufwendungen}{Nichtnegativer rechtlich anrechenbarer Wert der infolge desselben Dienstausfalls ersparten Aufwendungen in EUR. Keine ohnehin unverändert anfallenden Kosten abziehen.}
\item{anderweitiger_erwerb}{Nichtnegativer rechtlich anrechenbarer Erwerb durch anderweitige Verwendung derselben Dienste im maßgeblichen Zeitraum in EUR. Zeitliche/kausale Anrechenbarkeit und konsistente Brutto-/Nettobezüge vorab bestimmen; unabhängig ohnehin vorhandener Nebenverdienst nicht ungeprüft gleichsetzen.}
\item{boeswillig_unterlassener_erwerb}{Nichtnegativer rechtlich bewerteter Betrag in EUR des böswillig unterlassenen anderweitigen Erwerbs für denselben Ausfall. Kein pauschal geschätztes fiktives Gehalt und keine automatische Sanktion für fehlende Bewerbungen. Nicht zugleich im tatsächlichen anderweitigen Erwerb enthalten.}
\item{annahmeverzug}{Wahrheitswert des rechtlich festgestellten Annahmeverzugs des Dienstberechtigten. Leistungsfähigkeit/-willigkeit, Angebot und sonstige Voraussetzungen vorab prüfen.}
\item{arbeitgeber_traegt_arbeitsausfallrisiko}{Wahrheitswert des rechtlich dem Arbeitgeber zugewiesenen Arbeitsausfallrisikos nach§615 Satz3. Bloßer Ausfall oder allgemeine Betriebsstörung genügt nicht automatisch.}
\item{bewertungsnachweis}{Nichtleere Beschreibung von Dienst-/Arbeitsverhältnis, Ausfallzeitraum, Annahmeverzug/Risikozuordnung und kausal/zeitlich anrechenbaren überschneidungsfreien Geldwerten. Sondergesetze und abweichende zulässige Regelungen gesondert.}
}
\details{Bei Annahmeverzug ODER rechtlich zugeordnetem Arbeitgeber-Arbeitsausfallrisiko Vergütung minus ersparte Aufwendungen minus anderweitiger Erwerb minus böswillig unterlassener Erwerb, mindestens0. Kein automatischer Annahmeverzug, keine generelle Arbeitgeberhaftung für jeden Ausfall, keine erfundene Erwerbsobliegenheit. Abzüge nur rechtlich anrechenbar aus demselben Zeitraum/Ausfall. Sondergesetze wie besondere Kündigungsschutzfolgen separat. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter EUR-Vergütungsrest mindestens0. Fehlender gesetzlicher Ausgangsfall ergibt NICHT_ANWENDBAR/null, keine abschließende Verneinung anderer Vergütung. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_615_T0001, BGB_615_T0002, BGB_615_T0003}
\examples{
dienstverguetung_annahmeverzug(
  vereinbarte_verguetung = "1000",
  ersparte_aufwendungen = "0",
  anderweitiger_erwerb = "0",
  boeswillig_unterlassener_erwerb = "0",
  annahmeverzug = FALSE,
  arbeitgeber_traegt_arbeitsausfallrisiko = TRUE,
  bewertungsnachweis = paste0(
    "Synthetisch rechtlich abgegrenzter Dienstausfall mit konsist",
    "enten anrechenbaren Werten."
  )
)
}
