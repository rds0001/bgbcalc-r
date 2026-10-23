% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{gesellschaft_liquidationsfehlbetrag_verteilen}
\alias{gesellschaft_liquidationsfehlbetrag_verteilen}
\title{gesellschaft liquidationsfehlbetrag verteilen}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{gesellschaft_liquidationsfehlbetrag_verteilen(
  fehlbetrag = NULL,
  gesellschafter = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{fehlbetrag}{Nichtnegativer exakter rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge/Bruchobjekt; gleiche Liquidationsabrechnung ohne Doppelzählung.}
\item{gesellschafter}{Vollständige Liste2..1000 Personen mit eindeutiger gesellschafter_id, nichtnegativem Gewinn-/Verlustanteil als exaktem Bruch/Dezimalwert (Summe1) und qualifiziertem einbringlicher_hoechstbetrag in EUR; letzterer ist tatsächlich/rechtlich erlangbarer Gesamtbetrag für diesen Fehlbetrag, keine frei gesetzte Haftungsgrenze.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des gesetzlichen Liquidationsfalls, qualifizierter Vermögens-/Verbindlichkeits-/Beitragswerte und gegebenenfalls Einbringlichkeitsgrenzen.}
}
\details{Fehlbetrag nach Quoten verteilen und qualifiziert uneinbringliche Teile proportional nachverteilen. Nur §737 bei qualifiziertem Liquidationsfehlbetrag einschließlich Beitragsrückerstattungsbedarf. Einbringlicher Höchstbetrag bezeichnet rechtlich/tatsächlich festgestellten insgesamt noch erlangbaren Betrag für diesen Fehlbetrag, keine beliebige vertragliche Haftungsbegrenzung und keine bereits gezahlte Summe. Beträge auf gemeinsame Abrechnungsbasis bringen; Ausfälle bis zur Ausschöpfung der übrigen Grenzen proportional nachverteilen. Nullquote trägt keine rechnerische Ausfalllast. Uneinbringlicher Rest bleibt offen; kein Erlass und keine freie Beitragsrückzahlungsquote. Keine Feststellung der Insolvenz oder automatischer Vollstreckungsprognosen. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält EUR-Bruchobjekte für Liquidationsgrundbedarf/Überschuss/Fehlbetrag bzw. Verteilung mit Regelanteil, beibringbarem Betrag, zusätzlicher Ausfalllast, Gesamteinbringlichkeit und ungedecktem Fehlbetrag. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_737_T0001, BGB_737_T0002}
\examples{
gesellschaft_liquidationsfehlbetrag_verteilen(
  fehlbetrag = "120",
  gesellschafter = list(
    list(
    "gesellschafter_id" = "A",
    "gewinn_verlust_anteil" = list(
    "zaehler" = "1",
    "nenner" = "3"
  ),
    "einbringlicher_hoechstbetrag" = "1000"
  ),
    list(
    "gesellschafter_id" = "B",
    "gewinn_verlust_anteil" = list(
    "zaehler" = "1",
    "nenner" = "3"
  ),
    "einbringlicher_hoechstbetrag" = "1000"
  ),
    list(
    "gesellschafter_id" = "C",
    "gewinn_verlust_anteil" = list(
    "zaehler" = "1",
    "nenner" = "3"
  ),
    "einbringlicher_hoechstbetrag" = "1000"
  )
  ),
  einordnungsnachweis = paste0(
    "Vollständige Quoten und qualifiziert erlangbare Gesamtbeträg",
    "e desselben Fehlbetrags."
  )
)
}
