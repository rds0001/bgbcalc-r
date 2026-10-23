% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{buergschaft_schuldkomponenten}
\alias{buergschaft_schuldkomponenten}
\title{buergschaft schuldkomponenten}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{buergschaft_schuldkomponenten(
  schuldpositionen = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{schuldpositionen}{Unbenannte Liste1..1000 Objekte mit genau positions_id (eindeutiger nichtleerer Text), betrag (nichtnegativer exakter EUR-Dezimaltext/Bruch), spaetere_rechtsgeschaeftliche_erweiterung (expliziter Wahrheitswert). Nur den Erweiterungsanteil in einer gesonderten Position markieren. Alle übrigen Positionen bereits dem gesicherten aktuellen Hauptschuldbestand beziehungsweise erstattungsfähigen Kosten767II zugeordnet.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des gesicherten Bestands, der Komponenten und ihrer Ursachen/Zeitpunkte; keine automatische Vertragsauslegung oder Einredenprüfung.}
}
\details{Qualifizierte Schuldkomponenten summieren; spätere rechtsgeschäftliche Erweiterungen getrennt ausschließen. §767I/II: qualifizierter gegenwärtiger Hauptschuldbestand einschließlich zurechenbarer Verschuldens-/Verzugsfolgen und vom Hauptschuldner zu ersetzender Kündigungs-/Rechtsverfolgungskosten. Jede Komponente nur einmal erfassen. Durch ein nach Übernahme der Bürgschaft vorgenommenes Rechtsgeschäft des Hauptschuldners bewirkte Erweiterungen gesondert ausschließen; nur den Erweiterungsanteil als eigene Position kennzeichnen, nicht die unveränderte gesamte Hauptschuld. Ursache, Zeitpunkt, wirksame Bürgschaft und Zuordnung extern qualifizieren. Vertragliche Höchstbeträge, weitere Haftungsgrenzen, Einreden768/770, Mitbürgen769 und bereits geleistete Zahlungen gesondert berücksichtigen. Numerischer Umfang nach767, kein abschließender durchsetzbarer Zahlungsanspruch. Keine Positionen ausdrücklich als einzelne Nullposition eingeben. Nichtnegative exakte EUR-Dezimaltexte/Brüche nach NUMERIK.md. Kostenlisten ohne doppelte Positionen, keine Rundung.}
\value{wert: schuldumfang_nach_767 und ausgeschlossene_erweiterungen als exakte EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_767_T0001, BGB_767_T0002, BGB_767_T0003, BGB_767_T0004}
\examples{
buergschaft_schuldkomponenten(
  schuldpositionen = list(
    list(
    "positions_id" = "hauptschuld",
    "betrag" = "1000",
    "spaetere_rechtsgeschaeftliche_erweiterung" = FALSE
  ),
    list(
    "positions_id" = "verzug",
    "betrag" = "50",
    "spaetere_rechtsgeschaeftliche_erweiterung" = FALSE
  ),
    list(
    "positions_id" = "kuendigung",
    "betrag" = "10",
    "spaetere_rechtsgeschaeftliche_erweiterung" = FALSE
  ),
    list(
    "positions_id" = "rechtsverfolgung",
    "betrag" = "40",
    "spaetere_rechtsgeschaeftliche_erweiterung" = FALSE
  ),
    list(
    "positions_id" = "vertragserweiterung",
    "betrag" = "200",
    "spaetere_rechtsgeschaeftliche_erweiterung" = TRUE
  )
  ),
  einordnungsnachweis = paste0(
    "Hauptschuld, zurechenbare Verzugsfolgen und erstattungsfähig",
    "e Kosten qualifiziert; spätere rechtsgeschäftliche Erweiteru",
    "ngen einzeln abgegrenzt."
  )
)
}
