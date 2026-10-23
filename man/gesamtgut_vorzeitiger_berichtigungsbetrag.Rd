% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{gesamtgut_vorzeitiger_berichtigungsbetrag}
\alias{gesamtgut_vorzeitiger_berichtigungsbetrag}
\title{gesamtgut vorzeitiger berichtigungsbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{gesamtgut_vorzeitiger_berichtigungsbetrag(
  schuld = NULL,
  verfuegbares_vorbehaltsgut = NULL,
  verfuegbares_sondergut = NULL,
  zuordnungsnachweis = NULL
)}
\arguments{
\item{schuld}{Nichtnegative qualifizierte Innenlast in EUR gemäß§1446II oder§1468.}
\item{verfuegbares_vorbehaltsgut}{Nichtnegativer rechtlich verfügbarer Wert des Vorbehaltsguts des Schuldners in EUR.}
\item{verfuegbares_sondergut}{Nichtnegativer rechtlich verfügbarer Wert des Sonderguts des Schuldners in EUR.}
\item{zuordnungsnachweis}{Nichtleerer Nachweis des einschlägigen Verwaltungsfalls, der Innenlast und verfügbaren bereinigten Vermögenswerte.}
}
\details{Vorzeitige Berichtigung=min(Schuld,verfügbares Vorbehaltsgut+Sondergut); Rest=Schuld-Berichtigung. Qualifizierte Innenlast gegenüber Gesamtgut oder Vorbehalts-/Sondergut des anderen Ehegatten. §1446II nur für den nicht allein verwaltenden Ehegatten; bei gemeinschaftlicher Verwaltung§1468. Verfügbarkeit der Vermögenswerte und konkurrierende Verpflichtungen rechtlich bereinigt. Keine Pflicht zur vorzeitigen Leistung aus Gesamtgut und keine Rangfolge zwischen Vorbehaltsgut und Sondergut erfunden. Restschuld wird nicht erlassen; gesetzlicher Aufschub bis Beendigung und weitere Fälligkeit rechtlich gesondert. Keine Außenhaftungsentscheidung. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält vorzeitiger_berichtigungsbetrag und restschuld als exakte EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1446_T0002, BGB_1468_T0001}
\examples{
gesamtgut_vorzeitiger_berichtigungsbetrag(
  schuld = "100",
  verfuegbares_vorbehaltsgut = "20",
  verfuegbares_sondergut = "30",
  zuordnungsnachweis = paste0(
    "Innenlast und Verfügbarkeit qualifiziert, zutreffender Verwa",
    "ltungsfall."
  )
)
}
