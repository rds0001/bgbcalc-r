% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{ehefaehigkeitszeugnis_geltungsende}
\alias{ehefaehigkeitszeugnis_geltungsende}
\title{ehefaehigkeitszeugnis geltungsende}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{ehefaehigkeitszeugnis_geltungsende(
  ausstellung_am = NULL,
  urkundenende_am = NULL
)}
\arguments{
\item{ausstellung_am}{ISO-Datum der Ausstellung des qualifizierten Ehefähigkeitszeugnisses als Ereignis.}
\item{urkundenende_am}{Optionales ISO-Datum des qualifizierten letzten Urkundengeltungstages, frühestens Ausstellung. NULL wenn keine besondere Begrenzung. Spätere Urkundengeltung verlängert gesetzliche Höchstfrist nicht.}
}
\details{Ende=min(Ausstellung+6Kalendermonate,gegebenenfalls qualifiziertes Urkundenende). §1309I3, nur Zeugnisgeltung. In der Urkunde angegebene kürzere Dauer vorab in rechtlich maßgeblichen letzten Geltungstag umsetzen; fehlende Begrenzung als NULL. Späteres Urkundenende verlängert die gesetzliche Sechsmonatsgrenze nicht. Keine automatische Prüfung von Ehefähigkeit, Herkunft, Befreiung oder Eheschließung. Keine Verlängerung einer materiellen Geltungsdauer durch Wochenende/Feiertag. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist ISO-Datum des letzten Geltungstages. Einheit: datum.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1309_T0003}
\examples{
ehefaehigkeitszeugnis_geltungsende(
  ausstellung_am = "2030-08-31",
  urkundenende_am = NULL
)
}
