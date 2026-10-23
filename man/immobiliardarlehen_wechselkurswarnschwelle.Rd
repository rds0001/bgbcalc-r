% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{immobiliardarlehen_wechselkurswarnschwelle}
\alias{immobiliardarlehen_wechselkurswarnschwelle}
\title{immobiliardarlehen wechselkurswarnschwelle}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{immobiliardarlehen_wechselkurswarnschwelle(
  wert_zum_vertragskurs = NULL,
  wert_zum_vergleichskurs = NULL,
  warnfolge_bereits_ausgeloest = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{wert_zum_vertragskurs}{Positiver Vergleichswert desselben aktuellen Rest-/Ratenbetrags zum Vertragskurs in Landeswährung als exakte Dezimalzeichenfolge/Bruch.}
\item{wert_zum_vergleichskurs}{Nichtnegativer Wert desselben Betrags zum Vergleichskurs in derselben Landeswährung, exakt.}
\item{warnfolge_bereits_ausgeloest}{Expliziter Wahrheitswert einer zuvor rechtlich qualifiziert ausgelösten Warnfolge.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des493IV-Anwendungsfalls, identischer Vergleichsgegenstände/Währung und bisherigen Warnfolgestatus.}
}
\details{Erstauslösung strikt über120\%; nach vorheriger Auslösung Fortdauer bei mindestens120\%, bis wieder unterschritten. Nur numerischer Vergleich nach §493 Absatz4 Satz1/Satz2 Nummer4 im qualifizierten Fremdwährungs-/entsprechenden Einkommenswährungsfall. Beide Werte müssen denselben aktuellen Restbetrag oder dieselbe regelmäßige Rate in gleicher Landeswährung zu Vertrags- bzw. Vergleichskurs darstellen; Werte gegebenenfalls mit immobiliardarlehen_wechselkursrechnung vorbereiten. Bei bereits ausgelöster Folge hält genau20\% die numerische Fortdauergrenze ein, löst aber erstmals keine Folge aus. Restbetrag und Raten gemeinsam fachlich berücksichtigen, sofern beide maßgeblich sind. Keine automatische Bestimmung regelmäßiger Informationsabstände, kein Versand und kein vollständiger Informationstatbestand. Nullvergleichsbasis außerhalb dieser relativen Rechnung. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält relative Wertänderung als Quote,20\%-Grenzwert in Landeswährung und boolesche numerische Erst-/Fortdauer-/Statusgrenzen. Einheit: quote_und_landeswaehrung.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_493_T0007, BGB_493_T0012}
\examples{
immobiliardarlehen_wechselkurswarnschwelle(
  wert_zum_vertragskurs = "1000",
  wert_zum_vergleichskurs = "1200",
  warnfolge_bereits_ausgeloest = FALSE,
  einordnungsnachweis = paste0(
    "Qualifizierte gleiche Beträge/Währung und rechtlich bestimmt",
    "er Warnfolgestatus."
  )
)
}
