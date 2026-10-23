% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{schenkungsauflage_fehlbetrag}
\alias{schenkungsauflage_fehlbetrag}
\title{schenkungsauflage fehlbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{schenkungsauflage_fehlbetrag(
  erforderliche_aufwendungen = NULL,
  wert_der_mangelhaften_zuwendung = NULL,
  unterdeckung_vollstaendig_mangelbedingt = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{erforderliche_aufwendungen}{Nichtnegativer rechtlich bewerteter erforderlicher Aufwand zur Vollziehung der Auflage in EUR; nicht automatisch ein tatsächlicher Aufwand oder ein beliebiger Kostenvoranschlag.}
\item{wert_der_mangelhaften_zuwendung}{Nichtnegativer rechtlich bestimmter Wert der Zuwendung in ihrem mangelhaften Zustand in EUR, konsistent zum Bewertungszeitpunkt des Auflagenaufwands. Keine automatische Sachverständigenbewertung.}
\item{unterdeckung_vollstaendig_mangelbedingt}{Expliziter Wahrheitswert, dass eine etwaige Unterdeckung vollständig infolge eines Rechts- oder Sachmangels der verschenkten Sache entstanden ist. Insbesondere keine schon unabhängig vom Mangel bestehende Unterdeckung einbeziehen. FALSE ergibt NICHT_ANWENDBAR; teilweise mangelbedingte Unterdeckung nicht durch diese vereinfachte Differenz ersetzen.}
\item{bewertungsnachweis}{Nichtleere Beschreibung der Bewertung von erforderlichem Aufwand, Zuwendungswert und Mangelursächlichkeit. Bei fehlender Unterdeckung kann TRUE die erfolgte Ursachen-/Wertprüfung bezeichnen; Ergebnis dann null EUR.}
}
\details{Bei vollständig mangelbedingter Unterdeckung: Fehlbetrag=max(erforderliche Aufwendungen minus Wert der mangelhaften Zuwendung,0). Andernfalls keine Berechnung in diesem eingeschränkten Modell. Nur Fehlbetrag nach §526 Satz1 vor etwaigem Ausgleich. Keine abschließende Feststellung des noch bestehenden Verweigerungsrechts. Satz2 verlangt andere Aufwendungs-/Kenntnisvoraussetzungen und wird hier nicht mitberechnet. Teilweise anderweitig verursachte Unterdeckung bleibt offen. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist der exakte Fehlbetrag in EUR als zaehler/nenner-Zeichenfolgen. Bei fehlender Anwendbarkeit wert=null und NICHT_ANWENDBAR, bei fehlendem Fehlbetrag BERECHNET mit 0/1. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_526_T0001}
\examples{
schenkungsauflage_fehlbetrag(
  erforderliche_aufwendungen = "0",
  wert_der_mangelhaften_zuwendung = "0",
  unterdeckung_vollstaendig_mangelbedingt = TRUE,
  bewertungsnachweis = paste0(
    "Synthetische vollständig mangelbedingte Unterdeckung, vor Au",
    "sgleich."
  )
)
}
