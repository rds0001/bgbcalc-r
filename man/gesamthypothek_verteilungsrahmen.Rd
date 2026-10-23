% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{gesamthypothek_verteilungsrahmen}
\alias{gesamthypothek_verteilungsrahmen}
\title{gesamthypothek verteilungsrahmen}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{gesamthypothek_verteilungsrahmen(
  ausgangsforderung = NULL,
  zugeteilte_teilforderungen = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{ausgangsforderung}{Nichtnegativer exakter EUR-Betrag der rechtlich abgegrenzten gesicherten Ausgangsforderung; frühere bereits abgezogene Zahlungen nicht nochmals ansetzen.}
\item{zugeteilte_teilforderungen}{Liste1..10000 nichtnegativer exakter EUR-Dezimaltexte oder Bruchobjekte. Rechtlich zugeordnete, überschneidungsfreie Positionen; Wenn keine Beträge anzusetzen sind, ausdrücklich eine einzelne Null angeben. Grundstücks-/Zahlungsbelege im Einordnungsnachweis zuordnen.}
\item{einordnungsnachweis}{Nichtleerer Nachweis der einheitlichen gesicherten Forderung, zugehörigen Grundstücke, Betragszuordnung und des qualifizierten1132-Falls.}
}
\details{Zugewiesene Teilforderungen summieren, auf vorhandene Gesamtforderung begrenzen und noch nicht zugeordneten rechnerischen Betrag bestimmen. §1132II: numerische Verteilungsplanung mit ausdrücklich zugeordneten Teilbeträgen. Keine proportionale oder gleiche Verteilung erfinden; die rechtlich gewählte Zuordnung bleibt Eingabe. Summe darf die vorhandene Forderung nicht übersteigen. Ein positiver noch nicht zugeteilter Betrag zeigt eine unvollständige Planung, keine automatisch vollzogene teilweise Aufteilung oder Freigabe von Grundstücken. Voraussetzungen875/876/878, Grundbuchvollzug, Rang und Eigentümerrechte außerhalb der Rechnung. Bereits geleistete Zahlungen vorab eindeutig berücksichtigen. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält exakte EUR-Brüche für summe_teilforderungen, noch_nicht_zugeteilter_betrag. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1132_T0003, BGB_1132_T0004}
\examples{
gesamthypothek_verteilungsrahmen(
  ausgangsforderung = "100",
  zugeteilte_teilforderungen = list(
    "30",
    "40"
  ),
  einordnungsnachweis = paste0(
    "§1132II: numerische Verteilungsplanung mit ausdrücklich zuge",
    "ordneten Teilbeträgen. Keine proportionale oder gleiche Vert",
    "eilung erfinden; die rechtlich gewählte Zuordnung bleibt Ein",
    "gabe. Summe darf die vorhandene Forderung nicht übersteigen.",
    " Ein positiver noch nicht zugeteilter Betrag zeigt eine unvo",
    "llständige Planung, keine automatisch vollzogene teilweise A",
    "ufteilung oder Freigabe von Grundstücken. Voraussetzungen875",
    "/876/878, Grundbuchvollzug, Rang und Eigentümerrechte außerh",
    "alb der Rechnung. Bereits geleistete Zahlungen vorab eindeut",
    "ig berücksichtigen."
  )
)
}
