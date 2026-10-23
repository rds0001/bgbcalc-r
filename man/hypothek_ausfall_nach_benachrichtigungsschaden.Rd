% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{hypothek_ausfall_nach_benachrichtigungsschaden}
\alias{hypothek_ausfall_nach_benachrichtigungsschaden}
\title{hypothek ausfall nach benachrichtigungsschaden}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{hypothek_ausfall_nach_benachrichtigungsschaden(
  ausfallforderung = NULL,
  kausaler_benachrichtigungsschaden = NULL,
  anwendungsfall_qualifiziert = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{ausfallforderung}{Nichtnegativer rechtlich bewerteter Betrag in EUR, qualifizierte Bedeutung gemäß Abgrenzung.}
\item{kausaler_benachrichtigungsschaden}{Nichtnegativer rechtlich bewerteter Vergleichs-/Abzugs-/Zusatzbetrag in EUR für denselben Gegenstand und konsistente Bewertungsbasis.}
\item{anwendungsfall_qualifiziert}{Explizite Bestätigung des im Fachvertrag abgegrenzten Normfalls. FALSE ergibt NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleere Herkunft und rechtliche Begründung beider Beträge, Bewertungszeitpunkte und Anwendbarkeit.}
}
\details{Ausfallforderung um kausalen Schaden aus unterbliebener Benachrichtigung mindern, mindestens null. Nur nach1166 qualifiziertes Verweigerungsrecht, insbesondere Ersatzberechtigung, vom Gläubiger betriebene Versteigerung und nicht untunliche Benachrichtigung. Ergebnis ist verbleibender nicht durch diesen Schaden abgedeckter Ausfall, kein Erlöschen oder automatische Rechtsausübung. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter EUR-Bruch, keine automatische Rundung. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1166_T0001, BGB_1166_T0002}
\examples{
hypothek_ausfall_nach_benachrichtigungsschaden(
  ausfallforderung = "100",
  kausaler_benachrichtigungsschaden = "30",
  anwendungsfall_qualifiziert = TRUE,
  bewertungsnachweis = "Synthetische qualifizierte Beträge für denselben Normfall."
)
}
