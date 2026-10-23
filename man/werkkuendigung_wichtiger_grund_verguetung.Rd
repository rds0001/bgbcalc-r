% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{werkkuendigung_wichtiger_grund_verguetung}
\alias{werkkuendigung_wichtiger_grund_verguetung}
\title{werkkuendigung wichtiger grund verguetung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{werkkuendigung_wichtiger_grund_verguetung(
  verguetung_gekuendigter_umfang = NULL,
  leistungsanteil_zaehler = NULL,
  leistungsanteil_nenner = NULL,
  wichtiger_grund_wirksam_gekuendigt = NULL,
  bautraegervertrag = NULL,
  leistungsstandsnachweis = NULL
)}
\arguments{
\item{verguetung_gekuendigter_umfang}{Nichtnegative vereinbarte EUR-Vergütung ausschließlich für den wirksam gekündigten Werkumfang. Bei Teilkündigung abgegrenzten betroffenen Teil verwenden, nicht Vergütung fortgesetzter anderer Werkteile.}
\item{leistungsanteil_zaehler}{Nichtnegative ganze Zahl des rechtlich bestimmten Anteils bisher erbrachter Leistung, höchstens Nenner und2^53-1. Nicht automatisch Zeitanteil; Wert/Umfang der vereinbarten Leistungen bestimmen.}
\item{leistungsanteil_nenner}{Positive ganze Bezugsgröße der gesamten betrachteten Leistung im selben Maßstab, höchstens2^53-1. Leistungsanteil0..1.}
\item{wichtiger_grund_wirksam_gekuendigt}{Wahrheitswert einer rechtlich wirksamen Kündigung aus wichtigem Grund nach§648a, einschließlich erforderlicher Voraussetzungen nach§314 Absatz2/3 und bei Teilkündigung Abgrenzbarkeit. Freie Kündigung§648 nicht gleichsetzen.}
\item{bautraegervertrag}{Wahrheitswert eines Bauträgervertrags nach§650u. TRUE schließt dieses§648a-Modell gemäßAbsatz2 aus; andere Beendigungs-/Abrechnungswege separat.}
\item{leistungsstandsnachweis}{Nichtleere Beschreibung des gekündigten Umfangs und des bis Kündigung erbrachten Leistungsstands, einschließlich rechtlich maßgeblicher Feststellung/Beweislast§648a Absatz4. Leistungsanteil nicht ungeprüft Zeitquote.}
}
\details{Vergütung des gekündigten Werkumfangs×bis zur Kündigung erbrachter Leistungsanteil. Keine Vergütung für nicht erbrachten Anteil nach§648a Absatz5. Keine Fünfprozentvermutung§648 übertragen. Kündigungswirksamkeit, Beweislast/Leistungsstand und Teilabgrenzung vorab. Schadenersatz§648a Absatz6 und Vergütung fortgesetzter Werkteile separat. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter EUR-Vergütungsbetrag des erbrachten gekündigten Werkteils; fehlende wirksame Kündigung aus wichtigem Grund ergibt NICHT_ANWENDBAR/null. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_648a_T0001, BGB_648a_T0002, BGB_648a_T0003, BGB_648a_T0004, BGB_648a_T0005, BGB_648a_T0006, BGB_648a_T0007, BGB_648a_T0008, BGB_648a_T0009, BGB_650u_T0004}
\examples{
werkkuendigung_wichtiger_grund_verguetung(
  verguetung_gekuendigter_umfang = "1200",
  leistungsanteil_zaehler = 0,
  leistungsanteil_nenner = 3,
  wichtiger_grund_wirksam_gekuendigt = TRUE,
  bautraegervertrag = FALSE,
  leistungsstandsnachweis = paste0(
    "Synthetisch wirksame Kündigung und belegter abgegrenzter Lei",
    "stungsstand."
  )
)
}
