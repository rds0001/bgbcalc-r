% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{niessbrauch_uebermassfruechte_ersatz}
\alias{niessbrauch_uebermassfruechte_ersatz}
\title{niessbrauch uebermassfruechte ersatz}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{niessbrauch_uebermassfruechte_ersatz(
  wert_der_uebermassfruechte = NULL,
  wert_der_beeintraechtigten_eigenen_nutzungen = NULL,
  anwendungsfall_qualifiziert = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{wert_der_uebermassfruechte}{Nichtnegativer rechtlich bewerteter Betrag in EUR, qualifizierte Bedeutung gemäß Abgrenzung.}
\item{wert_der_beeintraechtigten_eigenen_nutzungen}{Nichtnegativer rechtlich bewerteter Vergleichs-/Abzugs-/Zusatzbetrag in EUR für denselben Gegenstand und konsistente Bewertungsbasis.}
\item{anwendungsfall_qualifiziert}{Explizite Bestätigung des im Fachvertrag abgegrenzten Normfalls. FALSE ergibt NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleere Herkunft und rechtliche Begründung beider Beträge, Bewertungszeitpunkte und Anwendbarkeit.}
}
\details{Fruchtwert um Beeinträchtigung der dem Nießbraucher gebührenden Nutzungen mindern, mindestens null. Nur wenn Verwendung zur Wiederherstellung nicht verlangt wird. Eingaben rechtlich bewertete, kausal zusammengehörige Werte. Eigenständige Verschuldenshaftung, Sicherheitsleistung und Wiederherstellungsalternative nicht eingerechnet. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter EUR-Bruch, keine automatische Rundung. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1039_T0002, BGB_1039_T0003, BGB_1039_T0004}
\examples{
niessbrauch_uebermassfruechte_ersatz(
  wert_der_uebermassfruechte = "100",
  wert_der_beeintraechtigten_eigenen_nutzungen = "30",
  anwendungsfall_qualifiziert = TRUE,
  bewertungsnachweis = "Synthetische qualifizierte Beträge für denselben Normfall."
)
}
