% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{adoption_ersetzungswartefrist}
\alias{adoption_ersetzungswartefrist}
\title{adoption ersetzungswartefrist}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{adoption_ersetzungswartefrist(
  geburt_am = NULL,
  belehrung_oder_erste_handlung_am = NULL,
  fristbeginnnachweis = NULL
)}
\arguments{
\item{geburt_am}{ISO-Geburtsdatum des Kindes für Fünfmonatsmindestende.}
\item{belehrung_oder_erste_handlung_am}{Qualifiziertes ISO-Ereignisdatum der Belehrung oder bei gesetzlichem Ausnahmefall ersten einschlägigen Handlung des Jugendamts.}
\item{fristbeginnnachweis}{Nichtleerer Nachweis der einschlägigen Alternative und rechtlichen Qualifikation des Dreimonatsbeginns.}
}
\details{Dreimonatsfrist ab qualifiziertem Beginn, Fünfmonatsgrenze ab Geburt, Maximum beider Endtage. §1748II betrifft Gleichgültigkeit ohne zugleich anhaltende gröbliche Pflichtverletzung. Beginn ist wirksame Belehrung oder im gesetzlich qualifizierten Ausnahmefall erste Handlung des Jugendamts zur Belehrung/Beratung oder Aufenthaltsermittlung. Beratung, Nachforschungen und Ausnahmevoraussetzungen vorqualifiziert. Ergebnisse sind Ablaufdaten; Ersetzung frühestens nach Ablauf, keine automatische Ersetzungsbefugnis. Keine§193-Verlängerung der bloßen Wartezeit. Andere Ersetzungsgründe nachAbsätzen1/3/4 nicht auf diese Wartezeit reduzieren. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält dreimonatsfristende, fuenfmonatsmindestende und wartefristende als ISO-Daten. Wartezeit läuft erst mit Ablauf des letzten Endtages ab. Einheit: daten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1748_T0003, BGB_1748_T0004, BGB_1748_T0005}
\examples{
adoption_ersetzungswartefrist(
  geburt_am = "2030-01-15",
  belehrung_oder_erste_handlung_am = "2030-02-15",
  fristbeginnnachweis = paste0(
    "Belehrung bzw. erste einschlägige Handlung rechtlich qualifi",
    "ziert, keine Entscheidung über Ersetzung."
  )
)
}
