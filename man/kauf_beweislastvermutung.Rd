% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{kauf_beweislastvermutung}
\alias{kauf_beweislastvermutung}
\title{kauf beweislastvermutung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{kauf_beweislastvermutung(
  gefahruebergang_am = NULL,
  zustand_zeigt_sich_am = NULL,
  lebendes_tier = NULL,
  zustand_abweichend = NULL,
  vermutung_mit_art_unvereinbar = NULL,
  regel_477_absatz_eins_anwendbar = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{gefahruebergang_am}{ISO-Datum0001..9999 des rechtlich bestimmten Gefahrübergangs. Nicht ungeprüft Vertragsschluss oder Rechnungsdatum. Zeitpunkt nach den jeweils einschlägigen Regeln bestimmen.}
\item{zustand_zeigt_sich_am}{ISO-Datum0001..9999, an dem sich der konkret betrachtete abweichende Zustand zeigt; nicht späteres Reklamations-, Klage- oder Gutachtendatum einsetzen. Nicht vor Gefahrübergang.}
\item{lebendes_tier}{Wahrheitswert, ob der Kauf eines lebenden Tieres vorliegt; dann sechs Monate statt eines Jahres. Tierart oder Kaufpreis ändern diese gesetzliche Zeitregel nicht automatisch.}
\item{zustand_abweichend}{Wahrheitswert der rechtlich bewerteten Abweichung von Anforderungen§434/§475b, die sich am angegebenen Datum zeigt. Zeitablauf allein belegt keinen abweichenden Zustand.}
\item{vermutung_mit_art_unvereinbar}{Wahrheitswert der Unvereinbarkeit der Vermutung mit Art der Ware oder des mangelhaften Zustands. Keine automatische Ausnahme für Gebrauchtware oder jedes Tier.}
\item{regel_477_absatz_eins_anwendbar}{Wahrheitswert des sachlichen und zeitlichen Anwendungsbereichs von§477 Absatz1. FALSE ergibt NICHT_ANWENDBAR. Für dauerhafte digitale Bereitstellung Absatz2 eigenständig prüfen.}
\item{einordnungsnachweis}{Nichtleere Beschreibung von Gefahrübergang, Auftreten der Abweichung, Tierstatus, Unvereinbarkeit und gesetzlichem Anwendungsbereich.}
}
\details{Ereignisbezogenes Jahresende, bei lebendem Tier Sechsmonatsende bestimmen. Auftreten spätestens am letzten Tag UND Abweichung UND keine Unvereinbarkeit begründen gesetzliche Vermutung. Keine Verjährung, keine automatische endgültige Mangelhaftigkeitsentscheidung. Tatsächlicher Auftretenszeitraum ohne automatische§193-Verschiebung. Gefahrübergang und untertägige Reihenfolge vorher rechtlich bestimmen. Explizite Auswahl/Wahrheitswerte und nichtleerer Nachweis; Versuchszahl ganzzahlig0..2^53-1; Kalenderdaten und berechnete Grenzen0001..9999, sofern jeweiliger Parameter einschlägig.}
\value{wert enthält vermutungszeitraum_ende als ISO-Datum, innerhalb_vermutungszeitraum und mangel_bei_gefahruebergang_vermutet als Wahrheitswerte. Ohne Anwendbarkeit NICHT_ANWENDBAR/null. Einheit: daten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_477_T0001, BGB_477_T0002}
\examples{
kauf_beweislastvermutung(
  gefahruebergang_am = "2024-02-29",
  zustand_zeigt_sich_am = "2024-02-29",
  lebendes_tier = FALSE,
  zustand_abweichend = FALSE,
  vermutung_mit_art_unvereinbar = FALSE,
  regel_477_absatz_eins_anwendbar = TRUE,
  einordnungsnachweis = paste0(
    "Synthetisch rechtlich bestimmter Gefahrübergang und Auftrete",
    "n des konkreten abweichenden Zustands."
  )
)
}
