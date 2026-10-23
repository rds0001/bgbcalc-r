% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{besitzer_nuetzlicher_verwendungsersatz}
\alias{besitzer_nuetzlicher_verwendungsersatz}
\title{besitzer nuetzlicher verwendungsersatz}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{besitzer_nuetzlicher_verwendungsersatz(
  verwendungskosten = NULL,
  fortbestehende_werterhoehung = NULL,
  andere_als_notwendige_verwendung = NULL,
  vor_rechtshaengigkeit_verwendet = NULL,
  vor_haftungsbeginn_990_verwendet = NULL,
  eigentuemer_besitzer_verhaeltnis_anwendbar = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{verwendungskosten}{Nichtnegative tatsächliche Kosten der betrachteten anderen als notwendigen Verwendungen in EUR; notwendige Verwendungen separat.}
\item{fortbestehende_werterhoehung}{Nichtnegative gerade durch diese Verwendungen verursachte Werterhöhung, die noch bei Wiedererlangung der Sache durch Eigentümer besteht. Keine Gleichsetzung mit Aufwand oder früherer Wertsteigerung.}
\item{andere_als_notwendige_verwendung}{Wahrheitswert der rechtlichen Abgrenzung gegenüber notwendigen Verwendungen nach§994/995.}
\item{vor_rechtshaengigkeit_verwendet}{Wahrheitswert: betrachtete Verwendungen vor Eintritt der Rechtshängigkeit gemacht. Zeitliche Reihenfolge fachlich feststellen; gleicher Kalendertag allein genügt nicht.}
\item{vor_haftungsbeginn_990_verwendet}{Wahrheitswert: betrachtete Verwendungen vor Beginn der Haftung nach§990 gemacht; zusätzlich zur Grenze der Rechtshängigkeit erforderlich.}
\item{eigentuemer_besitzer_verhaeltnis_anwendbar}{Wahrheitswert des geprüften Anwendungsbereichs des Eigentümer-Besitzer-Verhältnisses.}
\item{bewertungsnachweis}{Nichtleere Begründung von Anspruchsregime, Kosten, kausaler fortbestehender Werterhöhung und beiden zeitlichen Voraussetzungen.}
}
\details{Bei kumulativ erfüllten Voraussetzungen Minimum aus qualifizierten Verwendungskosten und gesetzlicher Wertgrenze bilden. Andere Anspruchsgrundlagen, Geltendmachung nach§1001 und Erlöschen nach§1002 gesondert prüfen. Keine doppelte Erstattung desselben Aufwands. Bewertungen sind belegte Nutzervorgaben. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter EUR-Bruch des begrenzten Ersatzbetrags; bei nicht erfülltem Anwendungsbereich NICHT_ANWENDBAR/null. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_996_T0001}
\examples{
besitzer_nuetzlicher_verwendungsersatz(
  verwendungskosten = "80",
  fortbestehende_werterhoehung = "100",
  andere_als_notwendige_verwendung = TRUE,
  vor_rechtshaengigkeit_verwendet = TRUE,
  vor_haftungsbeginn_990_verwendet = TRUE,
  eigentuemer_besitzer_verhaeltnis_anwendbar = TRUE,
  bewertungsnachweis = paste0(
    "Synthetisch rechtlich und wirtschaftlich eingeordnete Verwen",
    "dungen mit belegtem Wert."
  )
)
}
