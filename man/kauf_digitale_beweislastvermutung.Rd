% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{kauf_digitale_beweislastvermutung}
\alias{kauf_digitale_beweislastvermutung}
\title{kauf digitale beweislastvermutung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{kauf_digitale_beweislastvermutung(
  gefahruebergang_am = NULL,
  zustand_zeigt_sich_am = NULL,
  bereitstellung_ab = NULL,
  bereitstellung_bis = NULL,
  dauerhafte_bereitstellung_vereinbart = NULL,
  digitaler_zustand_abweichend = NULL,
  regel_477_absatz_zwei_anwendbar = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{gefahruebergang_am}{ISO-Datum0001..9999 des rechtlich bestimmten Gefahrübergangs. Nicht ungeprüft Vertragsschluss oder Rechnungsdatum. Zeitpunkt nach den jeweils einschlägigen Regeln bestimmen.}
\item{zustand_zeigt_sich_am}{ISO-Datum0001..9999, an dem sich der konkret betrachtete abweichende Zustand zeigt; nicht späteres Reklamations-, Klage- oder Gutachtendatum einsetzen. Nicht vor Gefahrübergang.}
\item{bereitstellung_ab}{ISO-Datum0001..9999 des rechtlich maßgeblichen Beginns der dauerhaften digitalen Bereitstellung. Nicht mit Gefahrübergang gleichsetzen, wenn vertraglich/gesetzlich anderer Beginn maßgeblich ist.}
\item{bereitstellung_bis}{ISO-Datum0001..9999 des rechtlich letzten Bereitstellungstags einschließlich, mindestens bereitstellung_ab. NULL/None bedeutet ausdrücklich unbefristet fortlaufende Bereitstellung; kein Platzhalter für ein unbekanntes Enddatum. Tatsächliche technische Unterbrechung nicht ohne rechtliche Prüfung als Vertragsende einsetzen.}
\item{dauerhafte_bereitstellung_vereinbart}{Wahrheitswert, dass im Kaufvertrag dauerhafte Bereitstellung der digitalen Elemente vereinbart ist. Nicht bloß einmalige Lieferung eines digitalen Produkts.}
\item{digitaler_zustand_abweichend}{Wahrheitswert einer Abweichung gerade der digitalen Elemente von vertraglichen Anforderungen§434/§475b am angegebenen Datum. Sonstige körperliche Warenmängel nicht ungeprüft einsetzen.}
\item{regel_477_absatz_zwei_anwendbar}{Wahrheitswert des sachlichen und zeitlichen Anwendungsbereichs des Absatz2 bei Ware mit digitalen Elementen. FALSE ergibt NICHT_ANWENDBAR; die gesonderte Vereinbarungsbedingung wird zusätzlich geprüft.}
\item{einordnungsnachweis}{Nichtleere Beschreibung von Ware, digitalen Elementen, Gefahrübergang, vereinbarter dauerhafter Bereitstellung mit Zeitgrenzen und Auftreten der Abweichung. Unbefristeten Zeitraum bei NULL ausdrücklich begründen.}
}
\details{Zweijahresende seit Gefahrübergang und Bereitstellungsintervall getrennt prüfen. Vereinbarte dauerhafte Bereitstellung UND digitale Abweichung UND (innerhalb Zweijahreszeitraum ODER innerhalb Bereitstellungsdauer). Keine Verkürzung des Zweijahreswegs auf kürzere Bereitstellung und keine Begrenzung längerer Bereitstellung auf zwei Jahre. Keine automatische Übernahme der Unvereinbarkeitsausnahme ausAbsatz1. Kein allgemeiner Digitalproduktvertrag. Explizite Auswahl/Wahrheitswerte und nichtleerer Nachweis; Versuchszahl ganzzahlig0..2^53-1; Kalenderdaten und berechnete Grenzen0001..9999, sofern jeweiliger Parameter einschlägig.}
\value{wert enthält zweijahreszeitraum_ende als ISO-Datum, innerhalb_zweijahreszeitraum, innerhalb_bereitstellungsdauer und mangel_waehrend_bisheriger_bereitstellung_vermutet als Wahrheitswerte. Vermutung betrifft bisherige Dauer, nicht bloß Gefahrübergang. Ohne Anwendbarkeit NICHT_ANWENDBAR/null. Einheit: daten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_477_T0003}
\examples{
kauf_digitale_beweislastvermutung(
  gefahruebergang_am = "2024-02-29",
  zustand_zeigt_sich_am = "2026-02-27",
  bereitstellung_ab = "2024-02-29",
  bereitstellung_bis = "2027-02-28",
  dauerhafte_bereitstellung_vereinbart = FALSE,
  digitaler_zustand_abweichend = FALSE,
  regel_477_absatz_zwei_anwendbar = TRUE,
  einordnungsnachweis = paste0(
    "Synthetisch rechtlich bestimmte dauerhafte digitale Bereitst",
    "ellung und Auftreten der Abweichung."
  )
)
}
