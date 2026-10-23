% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{guetergemeinschaft_einbringungsrueckerstattung}
\alias{guetergemeinschaft_einbringungsrueckerstattung}
\title{guetergemeinschaft einbringungsrueckerstattung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{guetergemeinschaft_einbringungsrueckerstattung(
  verfuegbares_gesamtgut = NULL,
  einbringungswert_ehegatte = NULL,
  einbringungswert_anderer = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{verfuegbares_gesamtgut}{Nichtnegativer für Einbringungsrückerstattung verfügbarer Gesamtgutswert in EUR nach qualifizierter vorrangiger Berichtigung/Rückbehalten.}
\item{einbringungswert_ehegatte}{Nichtnegativer qualifizierter Einbringungswert des ersten Ehegatten, zum Zeitpunkt der Einbringung bewertet, EUR.}
\item{einbringungswert_anderer}{Entsprechender qualifizierter Einbringungswert des anderen Ehegatten, EUR.}
\item{bewertungsnachweis}{Nichtleerer Nachweis zu Anwendbarkeit§1478, Verlangen, verfügbarem Wert und qualifizierten Einbringungswerten.}
}
\details{Erstattungsmasse=min(verfügbares Gesamtgut,Summe Einbringungswerte); Erstattung proportional Einbringungswerten, Fehlbeträge als Differenz; überschüssiges Gesamtgut gesondert. Bei Summe0 Erstattung0. Scheidung vor Abschluss der Auseinandersetzung und erforderliches Verlangen nach§1478I sind vorausgesetzt. Einbringungswerte nachAbsatz2 qualifiziert und nachAbsatz3 zum Zeitpunkt der jeweiligen Einbringung bewertet. Verfügbares Gesamtgut bereits nach vorrangiger Verbindlichkeitenberichtigung und erforderlichen Rückbehalten bestimmt. Ersatzforderungen/Anrechnung nach§1476II und anschließende Überschussverteilung sind gesonderte Berechnungen. Keine Bewertung von Gegenständen oder automatische Güterstandsprüfung. Bei beiden Einbringungswerten null keine Rückerstattung und keine Division durch null. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält rueckerstattung_ehegatte, rueckerstattung_anderer, fehlbetrag_ehegatte, fehlbetrag_anderer und verbleibendes_gesamtgut als EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1478_T0001, BGB_1478_T0006}
\examples{
guetergemeinschaft_einbringungsrueckerstattung(
  verfuegbares_gesamtgut = "120",
  einbringungswert_ehegatte = "100",
  einbringungswert_anderer = "200",
  bewertungsnachweis = paste0(
    "Scheidung und Verlangen gegeben; prioritäre Berichtigung abg",
    "eschlossen, Einbringungszeitwerte belegt."
  )
)
}
