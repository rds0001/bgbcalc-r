% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{vorkauf_gesamtpreisanteil}
\alias{vorkauf_gesamtpreisanteil}
\title{vorkauf gesamtpreisanteil}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{vorkauf_gesamtpreisanteil(
  gesamtpreis = NULL,
  wert_vorkaufsgegenstand = NULL,
  wert_gesamtkauf = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{gesamtpreis}{Nichtnegativer rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge oder Bruchobjekt zaehler/nenner; gleiche Bewertungsbasis, keine Doppelzählung.}
\item{wert_vorkaufsgegenstand}{Nichtnegativer rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge oder Bruchobjekt zaehler/nenner; gleiche Bewertungsbasis, keine Doppelzählung.}
\item{wert_gesamtkauf}{Nichtnegativer rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge oder Bruchobjekt zaehler/nenner; gleiche Bewertungsbasis, keine Doppelzählung. Striktpositiv und mindestens Gegenstandswert.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des gesetzlichen Anwendungsfalls und der rechtlich qualifizierten Beträge; kein automatischer Anspruchstatbestand.}
}
\details{Gesamtpreis mit Wert des Vorkaufsgegenstands geteilt durch positiven Wert des Gesamtkaufs multiplizieren Nur§467 Satz1, rechtlich qualifiziertes Wertverhältnis als Eingabe. Bei Verlangen der Gesamterstreckung nach Satz2 anderen Umfang bewerten; keine automatische Alleinbewertung oder Kopfteilung. Gegenstandswert darf Gesamtwert nicht übersteigen. Nichtnegative exakte EUR-Beträge und sichere Zwischenwerte nachNUMERIK; positiveGesamtwertbasis und validierteTeilgrenzen.}
\value{wert ist der exakt berechnete EUR-Betrag als Bruchobjekt. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_467_T0001}
\examples{
vorkauf_gesamtpreisanteil(
  gesamtpreis = "1000",
  wert_vorkaufsgegenstand = "1",
  wert_gesamtkauf = "3",
  einordnungsnachweis = paste0(
    "Qualifiziertes Wertverhältnis des Vorkaufsgegenstands im Ges",
    "amtkauf."
  )
)
}
