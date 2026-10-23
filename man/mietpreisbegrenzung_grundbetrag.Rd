% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{mietpreisbegrenzung_grundbetrag}
\alias{mietpreisbegrenzung_grundbetrag}
\title{mietpreisbegrenzung grundbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{mietpreisbegrenzung_grundbetrag(
  ortsuebliche_vergleichsmiete = NULL,
  gebiet_rechtswirksam_bestimmt = NULL,
  ausnahme_von_556d = NULL,
  anwendungsnachweis = NULL
)}
\arguments{
\item{ortsuebliche_vergleichsmiete}{Nichtnegative rechtlich festgestellte ortsübliche Vergleichsmiete in EUR pro Monat für die konkrete Wohnung und den maßgeblichen Zeitpunkt. Betrag der ganzen Wohnung, nicht EUR/m²; alternativ vorgelagert Wohnfläche multiplizieren. Keine automatische Mietspiegelauswertung.}
\item{gebiet_rechtswirksam_bestimmt}{Wahrheitswert: Wohnung liegt zum maßgeblichen Zeitpunkt im wirksam nach§556d Absatz2 bestimmten Gebiet. Die lokale Fassung verlangt Außerkrafttreten spätestens31.12.2029; konkrete Geltungsdauer, Begründung und räumliche Lage vorab prüfen. Diese Funktion enthält keine Verordnungsdatenbank.}
\item{ausnahme_von_556d}{Wahrheitswert einer im konkreten Fall rechtlich nutzbaren Ausnahme von§556d. Bei Verwendung von mietpreisbegrenzung_ausnahmen müssen insbesondere Berufungshindernisse nach§556g Absatz1a gesondert ausgeschlossen sein. Ein bloßer Ausnahmetatbestand trotz fehlender Auskunft genügt nicht automatisch.}
\item{anwendungsnachweis}{Nichtleere Beschreibung von Bewertungszeitpunkt, Vergleichsmiete, örtlicher Verordnung, Übergangsrecht und etwaiger rechtlich nutzbarer Ausnahme. Bei Staffeln maßgeblichen Zeitpunkt nach§557a Absatz4 vorgeben.}
}
\details{Bei wirksam reguliertem Gebiet und keiner nutzbaren Ausnahme: Grundbetrag=ortsübliche Vergleichsmiete×11/10. Sonst NICHT_ANWENDBAR. Keine automatische höhere Grenze nach§556e, keine Auskunftsprüfung§556g, kein vollständiger Anspruch. Eine unwirksame oder abgelaufene Gebietsverordnung nicht als TRUE vorgeben. Keine automatische Rundung. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist der exakte Grundbetrag als EUR-Bruch; bei NICHT_ANWENDBAR null. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_556d_T0001, BGB_556d_T0002, BGB_556d_T0009, BGB_556d_T0013}
\examples{
mietpreisbegrenzung_grundbetrag(
  ortsuebliche_vergleichsmiete = "0",
  gebiet_rechtswirksam_bestimmt = TRUE,
  ausnahme_von_556d = FALSE,
  anwendungsnachweis = paste0(
    "Synthetische gültige Gebietsverordnung und Vergleichsmiete; ",
    "keine nutzbare Ausnahme."
  )
)
}
