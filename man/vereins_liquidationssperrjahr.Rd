% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{vereins_liquidationssperrjahr}
\alias{vereins_liquidationssperrjahr}
\title{vereins liquidationssperrjahr}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{vereins_liquidationssperrjahr(
  erste_einrueckung = NULL,
  bekanntmachung_ordnungsgemaess = NULL,
  bekanntmachungsnachweis = NULL
)}
\arguments{
\item{erste_einrueckung}{ISO-Datum0001..9999 der maßgeblichen Einrückung beziehungsweise ersten Einrückung in das satzungsmäßige Veröffentlichungsblatt nach§50. Nicht das Auflösungsdatum oder eine spätere Wiederholung einsetzen.}
\item{bekanntmachung_ordnungsgemaess}{Expliziter Wahrheitswert zur gesetzeskonformen Bekanntmachung nach§50, insbesondere Inhalt mit Gläubigeraufforderung und maßgebliches Blatt. FALSE ergibt NICHT_ANWENDBAR. Keine automatische Inhaltsprüfung eines Textes.}
\item{bekanntmachungsnachweis}{Nichtleere Beschreibung/Beleg der Einrückung, ihrer Reihenfolge und ordnungsgemäßen Veröffentlichung. Besondere Mitteilungen an bekannte Gläubiger und spätere Verteilungsreife zusätzlich prüfen.}
}
\details{Bekanntmachung bewirkt mit Ablauf des zweiten Kalendertags nach erster Einrückung. Von diesem Ereignis ein Kalenderjahr nach§§187/188; Sperre bis dessen Tagesablauf. Erster Tag danach ist früheste kalenderseitige Grenze. Nur Sperrjahrgrenze, kein umfassender Auszahlungstermin. Gläubigerbefriedigung, Hinterlegung/Sicherheiten, besondere Mitteilungen und Insolvenzpflichten bleiben getrennt. Keine pauschale§193-Verschiebung. Sämtliche Zwischendaten müssen0001..9999 bleiben. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält bekanntmachung_bewirkt_mit_tagesablauf, sperrjahr_ende und fruehester_tag_nach_sperrjahr als ISO-Daten. NICHT_ANWENDBAR bei nicht bestätigter ordnungsgemäßer Bekanntmachung. Einheit: kalenderdaten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_50_T0001, BGB_50_T0002, BGB_50_T0003, BGB_50_T0004, BGB_51_T0001, BGB_187_T0001, BGB_188_T0002, BGB_188_T0003}
\examples{
vereins_liquidationssperrjahr(
  erste_einrueckung = "2026-01-01",
  bekanntmachung_ordnungsgemaess = TRUE,
  bekanntmachungsnachweis = paste0(
    "Synthetische erste Einrückung mit Gläubigeraufforderung im m",
    "aßgeblichen Blatt."
  )
)
}
