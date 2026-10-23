% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{familienunterhalt_mittelvorrang}
\alias{familienunterhalt_mittelvorrang}
\title{familienunterhalt mittelvorrang}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{familienunterhalt_mittelvorrang(
  bedarf_dieser_mittelstufe = NULL,
  gesamtgutsmittel = NULL,
  nachrangige_mittel = NULL,
  mittelart = NULL,
  zuordnungsnachweis = NULL
)}
\arguments{
\item{bedarf_dieser_mittelstufe}{Nichtnegativer bereits qualifizierter Bedarf, der aus der gewählten Mittelstufe zu decken ist, EUR.}
\item{gesamtgutsmittel}{Nichtnegative verfügbare Gesamtguteinkünfte oder Gesamtgutstamm je nach mittelart, EUR.}
\item{nachrangige_mittel}{Bei einkuenfte verfügbare Vorbehaltseinkünfte; bei vermoegensstamm verfügbare zusammengefasste Vorbehalts-/Sondergutstämme, nichtnegative EUR.}
\item{mittelart}{einkuenfte oder vermoegensstamm; rechtlich qualifizierte getrennte Mittelstufe, keine freie Umschichtung.}
\item{zuordnungsnachweis}{Nichtleerer Nachweis zu Mittelart, Bedarfszuordnung, Verfügbarkeit und identischem Bezugszeitraum.}
}
\details{Gesamtguteinsatz=min(Bedarf,Gesamtgutsmittel); nachrangiger Einsatz=min(Restbedarf,nachrangige Mittel); verbleibenden Bedarf und beide Restmittel ausweisen. §1420 enthält zwei getrennte Vorränge. mittelart=einkuenfte: Gesamtguteinkünfte vor Vorbehaltseinkünften. mittelart=vermoegensstamm: Gesamtgutstamm vor zusammengefasstem Vorbehalts-/Sondergutstamm. Bedarf und verfügbare Mittel für dieselbe qualifizierte Mittelstufe/Periode vorgeben. Keine zusätzliche allgemeine Reihenfolge zwischen Vorbehaltseinkünften und Gesamtgutstamm oder zwischen Vorbehalts-/Sondergutstamm erfunden; diese Funktion allein ist kein vollständiger Familienunterhaltsfinanzierungsplan. Keine Bedarfsermittlung, Verfügbarkeitsermittlung oder freie Vermögensmassenzuordnung. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält einsatz_gesamtgut, einsatz_nachrangige_mittel, ungedeckter_bedarf, verbleibende_gesamtgutsmittel und verbleibende_nachrangige_mittel als EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1420_T0001}
\examples{
familienunterhalt_mittelvorrang(
  bedarf_dieser_mittelstufe = "100",
  gesamtgutsmittel = "70",
  nachrangige_mittel = "20",
  mittelart = "einkuenfte",
  zuordnungsnachweis = paste0(
    "Getrennte Einkünfteebene rechtlich bestimmt; keine globale E",
    "inkünfte-/Stamm-Rangfolge."
  )
)
}
