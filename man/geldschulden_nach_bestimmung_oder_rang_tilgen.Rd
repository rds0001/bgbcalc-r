% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{geldschulden_nach_bestimmung_oder_rang_tilgen}
\alias{geldschulden_nach_bestimmung_oder_rang_tilgen}
\title{geldschulden nach bestimmung oder rang tilgen}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{geldschulden_nach_bestimmung_oder_rang_tilgen(
  zahlung = NULL,
  schulden = NULL,
  bestimmte_schuld_id = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{zahlung}{Zur Tilgung gleichartiger Geldschulden verfügbarer Betrag in Euro.}
\item{schulden}{Liste1..1000 mit genau schuld_id, offener_betrag(positivEUR), faellig(Wahrheitswert), sicherheitsrang, laestigkeitsrang, altersrang(positive ganze Zahlen). Niedriger Rang: geringere Sicherheit, größere Lästigkeit, älter. Auch noch nicht fällige Schulden müssen erfüllbar sein.}
\item{bestimmte_schuld_id}{Nichtleere Kennung bei rechtlich wirksamer eindeutiger Bestimmung genau einer Schuld nach366I;NULL bedeutet festgestellt keine Bestimmung und Anwendung366II. Andere Bestimmungsmodelle separat.}
\item{einordnungsnachweis}{Nichtleerer Nachweis366-Anwendung, gleicher Schuldner/Gläubiger, gleichartiger erfüllbarer Geldschulden, wirksamer Bestimmung oder gesetzlicher Rangmerkmale. Keine vorrangige Spezialregel.}
}
\details{Eindeutige Tilgungsbestimmung ausführen oder gesetzliche Fälligkeits-/Sicherheits-/Lästigkeits-/Altersgruppen proportional bedienen. §366I/II: bei qualifizierter eindeutiger Tilgungsbestimmung nur bestimmte Schuld bedienen; Überschuss bleibt unzugeordnet, keine erfundene weitere Schuldnerbestimmung. Ohne Bestimmung fällige vor nicht fälligen Schulden, dann geringere Sicherheit, größere Lästigkeit, höheres Alter; bei vollständigem Gleichrang verhältnismäßig nach offenen Beträgen. Nicht fällige Forderungen müssen vorzeitig erfüllbar sein. Qualifizierte Rangwerte sind keine automatisch bewertete Sicherheit/Lästigkeit. Mehrfachbestimmungen, Gläubiger-/Parteivereinbarungen und Spezialregeln gesondert. Innerhalb jeder Schuld Kosten/Zinsen/Hauptforderung367 separat; keine automatische Erstattung des unzugeordneten Betrags. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.zuordnungen in Eingabereihenfolge mit schuld_id, tilgungsbetrag und restschuld; nicht_zugeordnet. Beträge als exakte Eurobrüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_366_T0001, BGB_366_T0002}
\examples{
geldschulden_nach_bestimmung_oder_rang_tilgen(
  zahlung = "60",
  schulden = list(
    list(
    "schuld_id" = "A",
    "offener_betrag" = "100",
    "faellig" = TRUE,
    "sicherheitsrang" = 9,
    "laestigkeitsrang" = 9,
    "altersrang" = 9
  ),
    list(
    "schuld_id" = "B",
    "offener_betrag" = "100",
    "faellig" = FALSE,
    "sicherheitsrang" = 1,
    "laestigkeitsrang" = 1,
    "altersrang" = 1
  )
  ),
  bestimmte_schuld_id = NULL,
  einordnungsnachweis = paste0(
    "§366I/II: bei qualifizierter eindeutiger Tilgungsbestimmung ",
    "nur bestimmte Schuld bedienen; Überschuss bleibt unzugeordne",
    "t, keine erfundene weitere Schuldnerbestimmung. Ohne Bestimm",
    "ung fällige vor nicht fälligen Schulden, dann geringere Sich",
    "erheit, größere Lästigkeit, höheres Alter; bei vollständigem",
    " Gleichrang verhältnismäßig nach offenen Beträgen. Nicht fäl",
    "lige Forderungen müssen vorzeitig erfüllbar sein. Qualifizie",
    "rte Rangwerte sind keine automatisch bewertete Sicherheit/Lä",
    "stigkeit. Mehrfachbestimmungen, Gläubiger-/Parteivereinbarun",
    "gen und Spezialregeln gesondert. Innerhalb jeder Schuld Kost",
    "en/Zinsen/Hauptforderung367 separat; keine automatische Erst",
    "attung des unzugeordneten Betrags."
  )
)
}
