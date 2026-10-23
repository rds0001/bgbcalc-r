% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{ruecktritt_aufwendungsersatz}
\alias{ruecktritt_aufwendungsersatz}
\title{ruecktritt aufwendungsersatz}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{ruecktritt_aufwendungsersatz(
  notwendige_verwendungen = NULL,
  andere_aufwendungen = NULL,
  bereicherung_durch_andere_aufwendungen = NULL,
  gegenstand_zurueckgegeben = NULL,
  wertersatz_geleistet = NULL,
  wertersatzpflicht_nach_346_3_nummer_1_2_ausgeschlossen = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{notwendige_verwendungen}{Nichtnegative tatsächlich getätigte und rechtlich notwendige Verwendungen auf den zurückzugewährenden Gegenstand in EUR. Notwendigkeit vorab bestimmen; kein beliebiges Investitionsbudget.}
\item{andere_aufwendungen}{Nichtnegative andere tatsächliche Aufwendungen in EUR, die nicht schon als notwendige Verwendungen erfasst sind. Überschneidungsfrei; keine doppelte Erstattung.}
\item{bereicherung_durch_andere_aufwendungen}{Nichtnegative rechtlich bewertete Bereicherung des Gläubigers gerade durch die eingegebenen anderen Aufwendungen in EUR. Gleicher Gegenstand und Bewertungsbezug; kein gesamter Gegenstandswert ohne Kausalbezug.}
\item{gegenstand_zurueckgegeben}{Wahrheitswert einer im Rücktrittsverhältnis erfolgten Rückgabe des Gegenstands, nicht bloß Angebot oder Rückgabeabsicht.}
\item{wertersatz_geleistet}{Wahrheitswert eines im Rücktrittsverhältnis geleisteten Wertersatzes, nicht bloß Bestehen der Wertersatzpflicht.}
\item{wertersatzpflicht_nach_346_3_nummer_1_2_ausgeschlossen}{Wahrheitswert des Ausschlusses gerade nach§346 Absatz3 Nummer1 oder2. Allein Nummer3 (eigenübliche Sorgfalt bei gesetzlichem Rücktritt) genügt hier nicht. Voraussetzungen und gegebenenfalls Teilfälle rechtlich abgrenzen.}
\item{bewertungsnachweis}{Nichtleere Beschreibung des wirksamen Rücktrittsverhältnisses, Rückgabe-/Wertersatzlage, qualifizierten Verwendungen und kausalen Bereicherung. Keine sonstigen Ausschlüsse im abgegrenzten Fall.}
}
\details{Bei Rückgabe ODER geleistetem Wertersatz ODER Ausschluss nach§346 Absatz3 Nummer1/2: notwendige Verwendungen + min(andere Aufwendungen, dadurch verursachte Bereicherung). Sonst NICHT_ANWENDBAR. Nicht mit Wertersatzausschluss nach§346 Absatz3 Nummer3 verwechseln. Kein automatischer Rücktritt, keine automatische Aufrechnung und keine erfundene Bewertungsformel für Notwendigkeit/Bereicherung. Teilgegenstände gesondert zutreffend abgrenzen. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält notwendige_verwendungen_ersatz, andere_aufwendungen_ersatz, gesamtbetrag als exakte EUR-Brüche. Fehlender Ausgangsfall ergibt NICHT_ANWENDBAR mit null. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_347_T0003, BGB_347_T0004}
\examples{
ruecktritt_aufwendungsersatz(
  notwendige_verwendungen = "100",
  andere_aufwendungen = "500",
  bereicherung_durch_andere_aufwendungen = "0",
  gegenstand_zurueckgegeben = FALSE,
  wertersatz_geleistet = FALSE,
  wertersatzpflicht_nach_346_3_nummer_1_2_ausgeschlossen = TRUE,
  bewertungsnachweis = paste0(
    "Synthetischer wirksamer Rücktritt und getrennt bewertete Ver",
    "wendungen/Aufwendungen."
  )
)
}
