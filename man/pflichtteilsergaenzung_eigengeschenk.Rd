% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pflichtteilsergaenzung_eigengeschenk}
\alias{pflichtteilsergaenzung_eigengeschenk}
\title{pflichtteilsergaenzung eigengeschenk}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{pflichtteilsergaenzung_eigengeschenk(
  pflichtteilsnachlass = NULL,
  hinzuzurechnende_drittschenkungen = NULL,
  eigengeschenk_wert = NULL,
  gesetzliche_erbquote_zaehler = NULL,
  gesetzliche_erbquote_nenner = NULL,
  eigengeschenk_nach_2315_anzurechnen = NULL,
  einheitlicher_wert_qualifiziert = NULL,
  grundmodell_ohne_ausgleichung_anwendbar = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{pflichtteilsnachlass}{Exakter EUR-Nachlasswert vor Hinzurechnung dieser Schenkungen; negatives Vermögen zulässig. Zunächst gesetzlich einschlägige Hinzurechnung, erst dann Untergrenze null.}
\item{hinzuzurechnende_drittschenkungen}{Nichtnegative exakte EUR-Summe qualifizierter Drittschenkungen, bereits rechtlich bewertet und zeitlich berücksichtigungsfähig. Eigengeschenk aus diesem Parameter ausschließen, keine doppelte Hinzurechnung.}
\item{eigengeschenk_wert}{Nichtnegativer exakter EUR-Wert eines eigenen Geschenks, rechtlich gleicher Wert für Hinzurechnung und Anrechnung in diesem Modell. Bei2315 muss derselbe Wert auch dessen Bewertungsmaßstab genügen. Keine automatische Zeitabschmelzung; bei abweichenden maßgeblichen Werten Modell nicht anwenden.}
\item{gesetzliche_erbquote_zaehler}{Nichtnegative ganze Zahl höchstens Nenner, bis2^53-1; gesetzliche Erbquote, nicht schon halbierte Pflichtteilsquote.}
\item{gesetzliche_erbquote_nenner}{Positive ganze Zahl bis2^53-1; Pflichtteilsquote wird als halbe gesetzliche Erbquote berechnet.}
\item{eigengeschenk_nach_2315_anzurechnen}{Expliziter Wahrheitswert einer rechtlich wirksamen Anrechnungsbestimmung für dasselbe Eigengeschenk nach2315. TRUE: Anrechnung einmal auf Gesamtbetrag, ordentlicher Pflichtteil gesondert; FALSE: nur Ergänzung vermindern.}
\item{einheitlicher_wert_qualifiziert}{Expliziter Wahrheitswert, dass ein gemeinsamer Wert sämtliche erforderlichen Hinzurechnungs-/Anrechnungsmaßstäbe erfüllt. Bewertungsdifferenzen ergeben FALSE und NICHT_ANWENDBAR, keine pauschale Gleichsetzung2315/2325.}
\item{grundmodell_ohne_ausgleichung_anwendbar}{Expliziter Wahrheitswert: Pflichtteilsberechtigung und Grundmodell mit genau diesem Eigengeschenk ohne weitere Eigengeschenke/Mischanrechnungen und ohne Ausgleichung2316. Nachrückenszurechnung2327II/2051I, soweit relevant, vorab qualifiziert. FALSE ergibt NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleere Begründung der Werte, Pflichtteilsquote, Berechtigung, Eigengeschenkszuordnung, Bewertungsidentität und gegebenenfalls2315-Anrechnungsbestimmung. Drittschenkungs-Abschmelzung nicht ungeprüft auf Eigengeschenke übertragen.}
}
\details{Fiktiven Nachlass um Drittschenkungen und Eigengeschenk erhöhen, nichtnegative Basis mit halber gesetzlicher Quote multiplizieren. Ohne2315: ordentlichen Pflichtteil unverändert lassen, Differenz zum fiktiven Wert minus Eigengeschenk mindestens null als Ergänzung. Mit2315: ordentlichen Pflichtteil aus Nachlass plus Geschenk minus Anrechnung bestimmen; fiktiven Gesamtbetrag einmal um Geschenk mindern, verbleibende Ergänzung als Differenz zum ordentlichen Pflichtteil. Nur ein Eigengeschenk mit identischem maßgeblichem Wert für die erforderlichen Bewertungszwecke. Abweichende Werte, Mischgeschenke, Ausgleichung2316 und automatische Eigengeschenks-Abschmelzung nicht implementiert. Mehrhinterlassung2326, Erbenschutz2328 und Beschenktenhaftung2329 gesondert; kein abschließender Zahlungsanspruch. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält ordentlicher_pflichtteilsbetrag, erhoehter_pflichtteilswert_vor_anrechnung, ergaenzungsbetrag_nach_eigengeschenk und gesamtbetrag_nach_eigengeschenk als exakte EUR-Brüche. Nicht qualifiziertes Grundmodell NICHT_ANWENDBAR. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2327_T0001, BGB_2327_T0002, BGB_2327_T0003, BGB_2315_T0001, BGB_2315_T0002, BGB_2315_T0003}
\examples{
pflichtteilsergaenzung_eigengeschenk(
  pflichtteilsnachlass = "1000",
  hinzuzurechnende_drittschenkungen = "1000",
  eigengeschenk_wert = "100",
  gesetzliche_erbquote_zaehler = 1,
  gesetzliche_erbquote_nenner = 2,
  eigengeschenk_nach_2315_anzurechnen = FALSE,
  einheitlicher_wert_qualifiziert = TRUE,
  grundmodell_ohne_ausgleichung_anwendbar = TRUE,
  bewertungsnachweis = paste0(
    "Synthetisch ein Eigengeschenk, identische maßgebliche Bewert",
    "ung, keine2316-Ausgleichung."
  )
)
}
