% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{besitzhaftung_verantwortungsgrenze}
\alias{besitzhaftung_verantwortungsgrenze}
\title{besitzhaftung verantwortungsgrenze}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{besitzhaftung_verantwortungsgrenze(
  schaden_nach_989 = NULL,
  verantwortungsbetrag_gegenueber_mittelbarem_besitzer = NULL,
  anwendungsfall_qualifiziert = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{schaden_nach_989}{Nichtnegativer rechtlich bewerteter Betrag in EUR, qualifizierte Bedeutung gemäß Abgrenzung.}
\item{verantwortungsbetrag_gegenueber_mittelbarem_besitzer}{Nichtnegativer rechtlich bewerteter Vergleichs-/Abzugs-/Zusatzbetrag in EUR für denselben Gegenstand und konsistente Bewertungsbasis.}
\item{anwendungsfall_qualifiziert}{Explizite Bestätigung des im Fachvertrag abgegrenzten Normfalls. FALSE ergibt NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleere Herkunft und rechtliche Begründung beider Beträge, Bewertungszeitpunkte und Anwendbarkeit.}
}
\details{Schadensbetrag nach§989 auf Verantwortungsbetrag gegenüber dem mittelbaren Besitzer begrenzen. Nur qualifizierter Fall§991 Absatz2 mit bei Besitzerwerb gutgläubigem Besitzer. Beide Beträge betreffen denselben Schaden; keine eigenständige Haftungs-/Verschuldensprüfung. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter EUR-Bruch, keine automatische Rundung. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_991_T0002}
\examples{
besitzhaftung_verantwortungsgrenze(
  schaden_nach_989 = "100",
  verantwortungsbetrag_gegenueber_mittelbarem_besitzer = "30",
  anwendungsfall_qualifiziert = TRUE,
  bewertungsnachweis = "Synthetische qualifizierte Beträge für denselben Normfall."
)
}
