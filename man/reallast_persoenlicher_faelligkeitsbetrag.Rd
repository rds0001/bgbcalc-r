% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{reallast_persoenlicher_faelligkeitsbetrag}
\alias{reallast_persoenlicher_faelligkeitsbetrag}
\title{reallast persoenlicher faelligkeitsbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{reallast_persoenlicher_faelligkeitsbetrag(
  erster_haftungstag = NULL,
  letzter_haftungstag = NULL,
  leistungen = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{erster_haftungstag}{Erster eingeschlossener rechtlich normalisierter Tag des Eigentums-/Haftungszeitraums, ISO-Datum.}
\item{letzter_haftungstag}{Letzter eingeschlossener Tag eines abgeschlossenen qualifizierten Zeitraums; kein fiktives Ende laufenden Eigentums.}
\item{leistungen}{Liste0..10000 mit genau leistung_id, faellig_am und betrag. Eindeutige IDs, ISO-Fälligkeit, nichtnegative exakte noch offene EUR-Beträge.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des1108I-Grundfalls ohne abweichende Bestimmung; Fälligkeit und zeitliche Zuordnung vorqualifiziert, insbesondere bei Eigentumswechsel am Fälligkeitstag.}
}
\details{Beträge der im qualifizierten Eigentumszeitraum fälligen Leistungen addieren; keine zeitanteilige Kürzung. §1108I-Grundfall ohne abweichende Bestimmung. Maßgeblich ist Fälligkeit während des Eigentums, nicht anteilige Dauer der Leistungsperiode. Erster und letzter eingeschlossener Haftungstag sind rechtlich normalisierte Grenzen eines abgeschlossenen Eigentumszeitraums; bei Eigentumswechsel am Fälligkeitstag muss die zeitliche Zuordnung eindeutig vorqualifiziert sein. Keine automatischen Grundbuch-/Eigentumsfeststellungen, keine intratägliche Zeitrechnung. Nur bereits bestimmte Geldleistungen; Naturalleistungen nicht eigenmächtig bewerten. Eingangsbeträge sind die rechtlich maßgeblichen noch offenen Leistungen ohne doppelte Positionen. Verjährung, Einreden, dingliche Verwertung und andere Haftungsgründe werden nicht entschieden. Teilgrundstückseigentümer nach1108II nicht durch freie Flächenquote entlasten; Gesamtschuld und Innenausgleich separat. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{Exakter persönlicher Haftungsbetrag und IDs der zeitlich einbezogenen/ausgenommenen Leistungen. Einheit: EUR_und_Leistungszuordnung.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1108_T0001, BGB_1108_T0002}
\examples{
reallast_persoenlicher_faelligkeitsbetrag(
  erster_haftungstag = "2024-02-01",
  letzter_haftungstag = "2024-02-29",
  leistungen = list(
    list(
    "leistung_id" = "A",
    "faellig_am" = "2024-01-31",
    "betrag" = "100"
  ),
    list(
    "leistung_id" = "B",
    "faellig_am" = "2024-02-01",
    "betrag" = "10"
  ),
    list(
    "leistung_id" = "C",
    "faellig_am" = "2024-02-15",
    "betrag" = "20"
  ),
    list(
    "leistung_id" = "D",
    "faellig_am" = "2024-02-29",
    "betrag" = "30"
  ),
    list(
    "leistung_id" = "E",
    "faellig_am" = "2024-03-01",
    "betrag" = "200"
  )
  ),
  einordnungsnachweis = paste0(
    "Eigentumszeitraum und fällige Geldleistungen nach1108I ohne ",
    "abweichende Bestimmung; keine intratägliche Grenzunklarheit."
  )
)
}
