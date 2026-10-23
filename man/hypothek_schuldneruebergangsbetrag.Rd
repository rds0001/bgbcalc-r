% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{hypothek_schuldneruebergangsbetrag}
\alias{hypothek_schuldneruebergangsbetrag}
\title{hypothek schuldneruebergangsbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{hypothek_schuldneruebergangsbetrag(
  hypothekarisch_gesicherte_befriedigung = NULL,
  ersatzanspruch_gegen_eigentuemer = NULL,
  anwendungsfall_qualifiziert = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{hypothekarisch_gesicherte_befriedigung}{Nichtnegativer rechtlich bewerteter Betrag in EUR, qualifizierte Bedeutung gemäß Abgrenzung.}
\item{ersatzanspruch_gegen_eigentuemer}{Nichtnegativer rechtlich bewerteter Vergleichs-/Abzugs-/Zusatzbetrag in EUR für denselben Gegenstand und konsistente Bewertungsbasis.}
\item{anwendungsfall_qualifiziert}{Explizite Bestätigung des im Fachvertrag abgegrenzten Normfalls. FALSE ergibt NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleere Herkunft und rechtliche Begründung beider Beträge, Bewertungszeitpunkte und Anwendbarkeit.}
}
\details{Gesicherten Befriedigungsbetrag auf rechtlich bestehenden Ersatzanspruch begrenzen. Nur Umfang des Übergangs nach1164, nicht dingliche Rangverteilung. Befriedigung bezeichnet tatsächlich getilgten hypothekarisch gesicherten Betrag, keine ungesicherten Nebenforderungen. Vereinigung von Forderung und Schuld ist als entsprechender qualifizierter Betrag verwendbar. Konkurrierende Eigentümerhypothek darf nicht zum Nachteil des Schuldners geltend gemacht werden; kein Verteilungsplan. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter EUR-Bruch, keine automatische Rundung. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1164_T0001, BGB_1164_T0002, BGB_1164_T0003}
\examples{
hypothek_schuldneruebergangsbetrag(
  hypothekarisch_gesicherte_befriedigung = "100",
  ersatzanspruch_gegen_eigentuemer = "30",
  anwendungsfall_qualifiziert = TRUE,
  bewertungsnachweis = "Synthetische qualifizierte Beträge für denselben Normfall."
)
}
