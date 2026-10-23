% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{betreuer_aufwandspauschale}
\alias{betreuer_aufwandspauschale}
\title{betreuer aufwandspauschale}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{betreuer_aufwandspauschale(
  hoechststundensatz = NULL,
  betreuungsjahr_beginn = NULL,
  amtsende_am = NULL,
  erhaltener_vorschuss = NULL,
  erhaltener_aufwendungsersatz = NULL,
  verhinderungsbetreuung = NULL,
  taetigkeitszeitanteil = NULL,
  pauschalenanspruch_qualifiziert = NULL,
  berechnungsnachweis = NULL
)}
\arguments{
\item{hoechststundensatz}{Positiver zeitlich maßgeblicher externer JVEG§22-Zeugenhöchststundensatz in EUR; keine gesetzlich aktuelle Zahl fest eingebaut. Änderungen/Übergangsrecht vorqualifizieren.}
\item{betreuungsjahr_beginn}{ISO-Datum des rechtlich bestimmten ersten mitgezählten Tages eines einzelnen Betreuungsjahres; nicht automatisch1.Januar. Amtswirksamkeit und periodische Abgrenzung vorqualifiziert.}
\item{amtsende_am}{Optionales tatsächliches Amtsende innerhalb dieses Betreuungsjahres, einschließlich Endtag. NULL bedeutet Berechnung vollständiger Jahrespauschale, nicht Bestätigung heutiger Fälligkeit. Bei Amtsende begonnene Betreuungsmonate voll.}
\item{erhaltener_vorschuss}{Nichtnegativer erhaltener Vorschuss für dieselben erfassten Aufwendungen/Periode in EUR.}
\item{erhaltener_aufwendungsersatz}{Nichtnegativer schon erhaltener Aufwendungsersatz für dieselben erfassten Aufwendungen/Periode in EUR; keine Doppelzählung mit Vorschuss.}
\item{verhinderungsbetreuung}{Expliziter Wahrheitswert, ob§1817 Absatz4 einschlägig ist. Dann tatsächlich abgedeckten Tätigkeitsanteil qualifiziert vorgeben, statt pauschal alle Amtsmonate zu zählen.}
\item{taetigkeitszeitanteil}{Nur bei Verhinderungsbetreuung erforderlicher exakter Anteil0..1 des ganzen Betreuungsjahres. Tatsächliche Tätigkeit und rechtlich gebotene Monatsbehandlung bei Amtsende bereits berücksichtigen; wird nicht nochmals mit Monatsquote multipliziert. Bei normaler Betreuung NULL.}
\item{pauschalenanspruch_qualifiziert}{Expliziter Wahrheitswert der unvergüteten Betreuung und einschlägigen Pauschalenberechtigung; FALSE ergibt NICHT_ANWENDBAR.}
\item{berechnungsnachweis}{Nichtleerer Beleg zu Satzquelle/Zeitraum, Betreuungsjahr, Amtsende, erhaltenen Beträgen und gegebenenfalls tatsächlicher Verhinderungstätigkeit.}
}
\details{Jahrespauschale=18×Höchststundensatz; bei normalem Amtsende angefangene Betreuungsmonate/12, sonst voller Jahresanteil. Verhinderungsbetreuung verwendet qualifizierten tatsächlichen Anteil. Bereits erhaltenen Vorschuss/Ersatz abziehen, Rest mindestens0. Je Betreuung und Mitbetreuer gesondert, keine Teilung wegen Mitbetreuung. Keine automatische Satzrecherche, Übergangsrechtswahl oder Tagesdivisorregel für Verhinderung. Überdeckung erzeugt keinen automatisch festgestellten Rückzahlungsanspruch. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält betreuungsjahr_ende, beruecksichtigte_monate(NULL bei Verhinderung), zeitanteil, jahrespauschale, pauschale_vor_abzug, erhaltener_gesamtbetrag und restpauschale. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1878_T0001, BGB_1878_T0002, BGB_1878_T0003, BGB_1878_T0004, BGB_1878_T0005, BGB_1878_T0007}
\examples{
betreuer_aufwandspauschale(
  hoechststundensatz = "25",
  betreuungsjahr_beginn = "2030-01-15",
  amtsende_am = NULL,
  erhaltener_vorschuss = "0",
  erhaltener_aufwendungsersatz = "0",
  verhinderungsbetreuung = FALSE,
  taetigkeitszeitanteil = NULL,
  pauschalenanspruch_qualifiziert = TRUE,
  berechnungsnachweis = paste0(
    "Synthetischer externer Satz25EUR, keine Behauptung geltenden",
    " JVEG-Betrags; qualifizierte Abrechnungstage und deckungsgle",
    "iche Aufwendungen."
  )
)
}
