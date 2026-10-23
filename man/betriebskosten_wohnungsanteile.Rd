% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{betriebskosten_wohnungsanteile}
\alias{betriebskosten_wohnungsanteile}
\title{betriebskosten wohnungsanteile}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{betriebskosten_wohnungsanteile(
  kostenpositionen = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{kostenpositionen}{Liste1..1000 eindeutige position_id, gesamtkosten, wohnungsbezugswert, gesamtbezugswert und umlagemassstab wohnflaeche/verbrauch/verursachung/vereinbarung/wohnungseigentum. Exakte nichtnegative Werte; Gesamtbezugswert positiv und mindestens Wohnungswert; je Position gleiche Einheit/Abrechnungsbasis.}
\item{einordnungsnachweis}{Nichtleerer Nachweis rechtlich zutreffenden556a-Umlagemaßstabs/Kostenkreises bzw. zulässiger Umstellung und bisherigen Kostenanteils.}
}
\details{Je Betriebskostenposition qualifizierten Bezugsanteil berechnen und Wohnungsbeträge summieren. Nur §556a mit bereits rechtlich qualifiziertem Umlagemaßstab und umlagefähigen Kosten. Vorrang abweichender Vorschriften/Vereinbarungen, erfasster Verbräuche/Verursachung sowie besonderer WEG-Verteilung rechtlich bestimmen; unbilligen WEG-Schlüssel nicht ungeprüft übernehmen. Bezugswerte je Position müssen denselben vollständigen Abrechnungskreis und Zeitraum betreffen. Einheiten können zwischen Positionen verschieden sein, innerhalb einer Position identisch. Verbrauchsabhängige Mischschlüssel in disjunkte Kostenkomponenten aufteilen, keine Doppelzählung. Keine Bestimmung der Kostenumlagefähigkeit, Messwertschätzung, Leerstands-/Nutzerwechselzuordnung oder Heizkosten-Sondervorschriften. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält je Position Quote/Wohnungsbetrag und Gesamtsumme oder den herabgesetzten Mietbetrag; exakte EUR-/Quotenbrüche. Einheit: EUR_und_quoten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_556a_T0001, BGB_556a_T0002, BGB_556a_T0006, BGB_556a_T0007}
\examples{
betriebskosten_wohnungsanteile(
  kostenpositionen = list(
    list(
    "position_id" = "Flaeche",
    "gesamtkosten" = "1000",
    "wohnungsbezugswert" = "30",
    "gesamtbezugswert" = "100",
    "umlagemassstab" = "wohnflaeche"
  ),
    list(
    "position_id" = "Verbrauch",
    "gesamtkosten" = "900",
    "wohnungsbezugswert" = "20",
    "gesamtbezugswert" = "100",
    "umlagemassstab" = "verbrauch"
  )
  ),
  einordnungsnachweis = paste0(
    "Qualifizierte umlagefähige Kosten nach unterschiedlichen pas",
    "senden556a-Schlüsseln ohne Überschneidung."
  )
)
}
