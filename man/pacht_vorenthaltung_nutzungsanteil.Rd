% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pacht_vorenthaltung_nutzungsanteil}
\alias{pacht_vorenthaltung_nutzungsanteil}
\title{pacht vorenthaltung nutzungsanteil}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{pacht_vorenthaltung_nutzungsanteil(
  vereinbarte_jahrespacht = NULL,
  nutzungswert_vorenthaltung = NULL,
  nutzungswert_pachtjahr = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{vereinbarte_jahrespacht}{Nichtnegativer exakter rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge oder Bruchobjekt; einheitlicher Zeitraum und keine Doppelzählung. Jahresnutzungswert positiv und mindestens Vorenthaltungsnutzungswert.}
\item{nutzungswert_vorenthaltung}{Nichtnegativer exakter rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge oder Bruchobjekt; einheitlicher Zeitraum und keine Doppelzählung. Jahresnutzungswert positiv und mindestens Vorenthaltungsnutzungswert.}
\item{nutzungswert_pachtjahr}{Nichtnegativer exakter rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge oder Bruchobjekt; einheitlicher Zeitraum und keine Doppelzählung. Jahresnutzungswert positiv und mindestens Vorenthaltungsnutzungswert.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des gesetzlichen Anwendungsfalls, einheitlichen Abrechnungszeitraums und rechtlich qualifizierter Beträge.}
}
\details{Vereinbarte Jahrespacht mal qualifizierter Nutzungswert der Vorenthaltung geteilt durch positiven Nutzungswert des ganzen Pachtjahrs Nur §584b für einen Abschnitt innerhalb eines Pachtjahrs; gezogene oder objektiv erzielbare Nutzungen gleichartig bewerten. Keine automatische Gleichsetzung des Nutzungsanteils mit einem Tagesanteil. Bei mehreren Pachtjahren getrennt rechnen. Weiterer Schaden und Anspruchsvoraussetzungen gesondert; nicht §597-Landpachtrechnung. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist der exakt berechnete EUR-Betrag als Bruchobjekt. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_584b_T0001}
\examples{
pacht_vorenthaltung_nutzungsanteil(
  vereinbarte_jahrespacht = "1200",
  nutzungswert_vorenthaltung = "100",
  nutzungswert_pachtjahr = "300",
  einordnungsnachweis = "Qualifizierte vergleichbare Nutzungswerte eines Pachtjahrs."
)
}
