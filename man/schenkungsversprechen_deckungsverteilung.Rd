% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{schenkungsversprechen_deckungsverteilung}
\alias{schenkungsversprechen_deckungsverteilung}
\title{schenkungsversprechen deckungsverteilung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{schenkungsversprechen_deckungsverteilung(
  verfuegbare_mittel = NULL,
  geschuetzter_mittelbedarf = NULL,
  schenkungsansprueche = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{verfuegbare_mittel}{Nichtnegative rechtlich verfügbare Mittel in EUR als Dezimalzeichenfolge/Bruchobjekt.}
\item{geschuetzter_mittelbedarf}{Qualifizierter EUR-Gesamtbedarf für sonstige Verpflichtungen, angemessenen Eigenunterhalt und gesetzliche Unterhaltspflichten, nichtnegativ und ohne Doppelzählung.}
\item{schenkungsansprueche}{Liste höchstens1000 Objekte: eindeutige anspruch_id, eindeutiger ganzzahliger entstehungsrang1..1000000 (höher bedeutet später), nichtnegativer exakter anspruchsbetrag. Nur noch offene Geldansprüche gleicher Bewertungsbasis.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des §519-Tatbestands, der Mittel-/Bedarfsbewertung und eindeutigen Anspruchsentstehungsrangfolge.}
}
\details{Positiver Mittelüberschuss über Schutzbedarf; frühere Schenkungsansprüche vor späteren bis zur Anspruchshöhe decken. Nur §519 für zusammentreffende qualifizierte noch nicht erfüllte Geldansprüche aus Schenkungsversprechen. Geschützter Mittelbedarf umfasst ohne Doppelzählung sonstige Verpflichtungen, angemessenen Eigenunterhalt und gesetzliche Unterhaltspflichten; alle Werte gleiche rechtlich bestimmte Bewertungsbasis. Höherer Rang bedeutet später entstandener Anspruch, frühere Ansprüche gehen vor. Keine automatische Bestimmung von Bedürftigkeit, Vermögensverwertbarkeit, Leistungszeit oder gesetzlichem Unterhalt. Gleichzeitige Anspruchsentstehung und Sachleistungsbewertung nicht erfasst. Fehlbetrag bezeichnet den bei qualifiziertem §519-Tatbestand verweigerbaren Teil, keine automatische Erlöschung der Forderung. Bereits erfüllte Schenkungen fallen gegebenenfalls unter §528/529, dort umgekehrte Rangfolge. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält verfuegbare_deckung, verteilung je Anspruch mit deckungsbetrag/verweigerbarer_fehlbetrag, gesamtdeckungsbetrag und unverbrauchte_deckung als EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_519_T0001, BGB_519_T0002}
\examples{
schenkungsversprechen_deckungsverteilung(
  verfuegbare_mittel = "1000",
  geschuetzter_mittelbedarf = "400",
  schenkungsansprueche = list(
    list(
    "anspruch_id" = "spaeter",
    "entstehungsrang" = 2,
    "anspruchsbetrag" = "400"
  ),
    list(
    "anspruch_id" = "frueher",
    "entstehungsrang" = 1,
    "anspruchsbetrag" = "400"
  )
  ),
  einordnungsnachweis = paste0(
    "Qualifizierte offene Geldschenkungsansprüche; Schutzbedarf u",
    "nd eindeutiger Entstehungsrang."
  )
)
}
