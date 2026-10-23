% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{hypothek_widerspruchs_und_meldungsfrist}
\alias{hypothek_widerspruchs_und_meldungsfrist}
\title{hypothek widerspruchs und meldungsfrist}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{hypothek_widerspruchs_und_meldungsfrist(
  fristfall = NULL,
  ausloeser_am = NULL,
  erklaerung_am = NULL,
  werktagskorrektur_anwendbar = NULL,
  feiertagskalender = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{fristfall}{versicherung_anzeige_1128, versicherung_untunlich_1128 oder hinterlegung_meldung_1171.}
\item{ausloeser_am}{1128: tatsächlicher Empfang der Schadensanzeige; nur bei rechtlich untunlicher Anzeige stattdessen Fälligkeit der Versicherungssumme.1171: Rechtskraft des Ausschließungsbeschlusses. ISO-Datum.}
\item{erklaerung_am}{Qualifizierter tatsächlicher Eingang des Widerspruchs beim Versicherer beziehungsweise der Meldung bei der HinterlegungsstelleYYYY-MM-DD; kein bloßes Absendedatum.}
\item{werktagskorrektur_anwendbar}{Ausdrücklich rechtlich qualifizierter Wahrheitswert zur193-Anwendbarkeit auf diese Erklärungs-/Meldungsfrist; keine freie Fristverlängerungswahl.}
\item{feiertagskalender}{Bei anwendbarer193-Korrektur Objekt mit genau feiertage,ort,kalenderquelle,kalender_von,kalender_bis entsprechend werktagsverschiebung; andernfalls ausdrücklichNULL/None.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des Normfalls, maßgeblichen Auslösers, richtigen Empfängers, kalendertäglicher Erfüllung und begründeter193-Einordnung.1128IIangemeldeteHypothek/Schriftzustimmung gesondert.}
}
\details{Hypothekenbezogene Erklärungs-/Meldungsgrundfrist berechnen und tatsächlichen Eingang vergleichen. §1128I ein Monat ab qualifiziertem Auslöser;§1171III dreißig Jahre ab Rechtskraft. Grundfrist und gegebenenfalls rechtlich qualifizierte193-Korrektur über vorhandene Kalenderkerne berechnen; tatsächlichen Erklärungseingang bis einschließlich letztem Tag und verbleibenden Tagesabstand vergleichen. Keine automatische Auszahlung, Zustimmungsfiktion oder Erlöschensentscheidung; keine pauschale Gleichbehandlung von1128I und1128II.193-Anwendbarkeit ist rechtliche Voraussetzung, keine zusätzliche Zahlenschätzung. Keine untertägige Reihenfolge aus identischen Kalendertagen erfinden. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.grundfrist_letzter_tag/frist_letzter_tag alsISO-Datum, erklaerung_bis_fristende alsWahrheitswert, kalendertage_vom_eingang_bis_fristende als vorzeichenbehaftete ganzeZahl. Einheit: daten_anzahl_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1128_T0001, BGB_1128_T0002, BGB_1128_T0003, BGB_1171_T0005}
\examples{
hypothek_widerspruchs_und_meldungsfrist(
  fristfall = "versicherung_anzeige_1128",
  ausloeser_am = "2024-01-31",
  erklaerung_am = "2024-02-29",
  werktagskorrektur_anwendbar = FALSE,
  feiertagskalender = NULL,
  einordnungsnachweis = paste0(
    "§1128I ein Monat ab qualifiziertem Auslöser;§1171III dreißig",
    " Jahre ab Rechtskraft. Grundfrist und gegebenenfalls rechtli",
    "ch qualifizierte193-Korrektur über vorhandene Kalenderkerne ",
    "berechnen; tatsächlichen Erklärungseingang bis einschließlic",
    "h letztem Tag und verbleibenden Tagesabstand vergleichen. Ke",
    "ine automatische Auszahlung, Zustimmungsfiktion oder Erlösch",
    "ensentscheidung; keine pauschale Gleichbehandlung von1128I u",
    "nd1128II.193-Anwendbarkeit ist rechtliche Voraussetzung, kei",
    "ne zusätzliche Zahlenschätzung. Keine untertägige Reihenfolg",
    "e aus identischen Kalendertagen erfinden."
  )
)
}
