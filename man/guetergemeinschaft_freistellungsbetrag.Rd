% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{guetergemeinschaft_freistellungsbetrag}
\alias{guetergemeinschaft_freistellungsbetrag}
\title{guetergemeinschaft freistellungsbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{guetergemeinschaft_freistellungsbetrag(
  verbindlichkeit = NULL,
  inanspruchnahme = NULL,
  verwaltungsfall = NULL,
  aus_gesamtgut_erlangt = NULL,
  zuordnungsnachweis = NULL
)}
\arguments{
\item{verbindlichkeit}{Nichtnegativer Betrag eines konsistent abgegrenzten noch unberichtigten Schuldpostens einschließlich zugeordneter Nebenforderungen in EUR.}
\item{inanspruchnahme}{Nichtnegative vom Gläubiger geltend gemachte Belastung des geschützten Ehegatten für denselben Posten, höchstens Verbindlichkeit, EUR.}
\item{verwaltungsfall}{Rechtlich qualifizierte Zuordnung: alleinverwaltung_anderer fürAbsatz1, gemeinschaftlich fürAbsatz2, alleinlast_anderer fürAbsatz3. Keine freie Rechtswahl.}
\item{aus_gesamtgut_erlangt}{Nichtnegativer aus Gesamtgut erlangter Betrag des geschützten Ehegatten in EUR. Zusätzliche Grenze nur beiAbsatz1; auch in anderen Fällen numerisch validiert.}
\item{zuordnungsnachweis}{Nichtleerer Nachweis zu Gesamtgutsteilung vor Berichtigung, interner Lastzuordnung und Verwaltungssituation.}
}
\details{Grenze=Schuld/2 bei gemeinschaftlicher Verwaltung; bei Alleinverwaltung des anderen min(Schuld/2,Erlangtes); bei Alleinlast des anderen0. Freistellung=max(Inanspruchnahme-Grenze,0). Ein einzelner noch unberichtigter, vor Berichtigung geteiltem Gesamtgut zugeordneter Schuldposten. Beträge einschließlich rechtlich zugeordneter Nebenforderungen konsistent abgrenzen. alleinverwaltung_anderer bezeichnet den Schutz des nicht allein verwaltenden Ehegatten nachAbsatz1; gemeinschaftlich Absatz2. alleinlast_anderer bezeichnet ausschließlich interne Alleinlast des anderen Ehegatten nachAbsatz3 und geht Verwaltungssituation vor. Qualifizierte Zuordnung ist keine freie Wahl. Erlangtes wird nur inAbsatz1 als zusätzliche Grenze verwendet; inAbsätzen2/3 nicht automatisch anrechnen. Keine Änderung der Außenhaftung gegenüber Gläubigern und keine Mehrschuld-/Gesamthaftungsverrechnung. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält interne_belastungsgrenze und freistellungsbetrag als EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1481_T0001, BGB_1481_T0002, BGB_1481_T0003}
\examples{
guetergemeinschaft_freistellungsbetrag(
  verbindlichkeit = "100",
  inanspruchnahme = "80",
  verwaltungsfall = "gemeinschaftlich",
  aus_gesamtgut_erlangt = "20",
  zuordnungsnachweis = paste0(
    "Einzelposten und geschützter Ehegatte qualifiziert, Teilung ",
    "vor Berichtigung."
  )
)
}
