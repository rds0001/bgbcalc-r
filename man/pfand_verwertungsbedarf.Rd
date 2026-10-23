% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pfand_verwertungsbedarf}
\alias{pfand_verwertungsbedarf}
\title{pfand verwertungsbedarf}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{pfand_verwertungsbedarf(
  gesicherter_befriedigungsbedarf = NULL,
  pfaender_in_auswahlreihenfolge = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{gesicherter_befriedigungsbedarf}{Nichtnegativer offener gesicherter Bedarf in EUR nach einheitlicher Kosten-/Rangbereinigung.}
\item{pfaender_in_auswahlreihenfolge}{Geordnete Liste1..1000 mit genau pfand_id und verfuegbarer_nettoerloes je unteilbarer Verkaufseinheit. Eindeutige IDs; nichtnegative exakte EUR-Beträge. Zulässige Reihenfolge vorgegeben.}
\item{bewertungsnachweis}{Nichtleerer rechtlicher und wirtschaftlicher Nachweis für Auswahlreihenfolge, Bedarf und verfügbare Nettoerlöse; keine doppelte Kostenanrechnung.}
}
\details{In qualifizierter Reihenfolge positive Nettoerlöse einbeziehen, solange die Summe den Bedarf unterschreitet. Rest und Überschuss getrennt. Nur numerisches Bedarfsmodell nach1230 für einzeln verwertbare Pfänder mit vorqualifizierter zulässiger Auswahlreihenfolge. Keine Optimierung oder eigene Bestimmung des Wahlrechts. Nettoerlöse sind belastbar bewertete, gerade für diese Forderung verfügbare Beträge nach Kosten und vorrangigen Rechten; Bedarfsbetrag ohne erneute Aufnahme bereits abgezogener Kosten. Keine unsicheren Prognosen als tatsächlich erzielte Erlöse ausgeben. Bei veränderten Erlösen/Bedingungen neu rechnen; Ergebnis erteilt keine Verkaufserlaubnis. Pfänder mit null verfügbarem Erlös tragen zur Deckung nichts bei; dies entscheidet kein sonstiges Verwertungsrecht. Ein Pfand ist hier eine unteilbare Verkaufseinheit; weitere Teilbarkeit, gemeinsamer Mehrerlös, negative Nettoerlöse, weitere Forderungen und abweichende Auswahlvereinbarungen vorab abgrenzen. Überschuss ist nur Rechendifferenz; seine Rechtszuordnung gesondert nach1247. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{Ausgewählte/übrige IDs und exakte Beträge für Erlössumme, gedeckten Bedarf, Restbedarf und Überschuss. Einheit: EUR_und_Pfandzuordnung.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1230_T0001, BGB_1230_T0002}
\examples{
pfand_verwertungsbedarf(
  gesicherter_befriedigungsbedarf = "100",
  pfaender_in_auswahlreihenfolge = list(
    list(
    "pfand_id" = "A",
    "verfuegbarer_nettoerloes" = "40"
  ),
    list(
    "pfand_id" = "B",
    "verfuegbarer_nettoerloes" = "60"
  ),
    list(
    "pfand_id" = "C",
    "verfuegbarer_nettoerloes" = "80"
  )
  ),
  bewertungsnachweis = paste0(
    "Qualifizierte Reihenfolge und einzelne unteilbare Pfänder, f",
    "este verfügbare Nettoerlöse nach Kosten-/Rangbereinigung."
  )
)
}
