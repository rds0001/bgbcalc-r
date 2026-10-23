% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{abtrennung_abwendungsfehlbetrag}
\alias{abtrennung_abwendungsfehlbetrag}
\title{abtrennung abwendungsfehlbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{abtrennung_abwendungsfehlbetrag(
  bestandteilswert_nach_abtrennung = NULL,
  bereits_ersetzter_bestandteilswert = NULL,
  anwendungsfall_qualifiziert = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{bestandteilswert_nach_abtrennung}{Nichtnegativer rechtlich bewerteter Betrag in EUR, qualifizierte Bedeutung gemäß Abgrenzung.}
\item{bereits_ersetzter_bestandteilswert}{Nichtnegativer rechtlich bewerteter Vergleichs-/Abzugs-/Zusatzbetrag in EUR für denselben Gegenstand und konsistente Bewertungsbasis.}
\item{anwendungsfall_qualifiziert}{Explizite Bestätigung des im Fachvertrag abgegrenzten Normfalls. FALSE ergibt NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleere Herkunft und rechtliche Begründung beider Beträge, Bewertungszeitpunkte und Anwendbarkeit.}
}
\details{Wert des Bestandteils nach Abtrennung um bereits ersetzten Wert mindern, mindestens null. Nur numerischer Fehlbetrag der Wertabwendung nach997Absatz2. Wert ist der rechtlich bewertete Nutzen des abgetrennten Bestandteils gerade für den Besitzer; tatsächlicher Ersatz, kein bloß angebotenes Geld. Weitere Ausschlüsse wegen gewöhnlicher Erhaltung oder fehlendem Nutzen sowie258 bleiben separat; Ergebnis allein entscheidet kein Abtrennungsrecht. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter EUR-Bruch, keine automatische Rundung. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_997_T0003}
\examples{
abtrennung_abwendungsfehlbetrag(
  bestandteilswert_nach_abtrennung = "100",
  bereits_ersetzter_bestandteilswert = "30",
  anwendungsfall_qualifiziert = TRUE,
  bewertungsnachweis = "Synthetische qualifizierte Beträge für denselben Normfall."
)
}
