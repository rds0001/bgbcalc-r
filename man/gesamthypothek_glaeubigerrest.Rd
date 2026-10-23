% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{gesamthypothek_glaeubigerrest}
\alias{gesamthypothek_glaeubigerrest}
\title{gesamthypothek glaeubigerrest}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{gesamthypothek_glaeubigerrest(
  ausgangsforderung = NULL,
  befriedigungsbetraege = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{ausgangsforderung}{Nichtnegativer exakter EUR-Betrag der rechtlich abgegrenzten gesicherten Ausgangsforderung; frühere bereits abgezogene Zahlungen nicht nochmals ansetzen.}
\item{befriedigungsbetraege}{Liste1..10000 nichtnegativer exakter EUR-Dezimaltexte oder Bruchobjekte. Rechtlich zugeordnete, überschneidungsfreie Positionen; Wenn keine Beträge anzusetzen sind, ausdrücklich eine einzelne Null angeben. Grundstücks-/Zahlungsbelege im Einordnungsnachweis zuordnen.}
\item{einordnungsnachweis}{Nichtleerer Nachweis der einheitlichen gesicherten Forderung, zugehörigen Grundstücke, Betragszuordnung und des qualifizierten1132-Falls.}
}
\details{Alle auf dieselbe gesicherte Forderung wirkenden Befriedigungen einmal summieren; Rest beim bisherigen Gläubiger und übersteigenden Zahlbetrag getrennt bestimmen. §1132I: dieselbe Forderung wird nicht mit der Zahl belasteter Grundstücke multipliziert. Qualifizierte Befriedigungen aus verschiedenen Grundstücken und sonstigen Quellen nur einmal auf dieselbe Ausgangsforderung anrechnen. Zahlung auf Kosten/Zinsen oder andere Forderungen zuerst richtig zuordnen; Ausgangsforderung und Beträge müssen denselben Umfang und Zeitraum betreffen. Ergebnis ist der Rest beim bisherigen Gläubiger, kein allgemeines Erlöschensurteil: Forderungs-/Hypothekenübergang insbesondere1143/1150, Ausgleich und verbleibende Eigentümerrechte separat. Übersteigender Zahlbetrag begründet keinen automatisch festgestellten Erstattungsanspruch. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält exakte EUR-Brüche für beruecksichtigte_befriedigung, verbleibende_glaeubigerforderung, uebersteigender_zahlbetrag. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1132_T0001, BGB_1132_T0002}
\examples{
gesamthypothek_glaeubigerrest(
  ausgangsforderung = "100",
  befriedigungsbetraege = list(
    "30",
    "40"
  ),
  einordnungsnachweis = paste0(
    "§1132I: dieselbe Forderung wird nicht mit der Zahl belastete",
    "r Grundstücke multipliziert. Qualifizierte Befriedigungen au",
    "s verschiedenen Grundstücken und sonstigen Quellen nur einma",
    "l auf dieselbe Ausgangsforderung anrechnen. Zahlung auf Kost",
    "en/Zinsen oder andere Forderungen zuerst richtig zuordnen; A",
    "usgangsforderung und Beträge müssen denselben Umfang und Zei",
    "traum betreffen. Ergebnis ist der Rest beim bisherigen Gläub",
    "iger, kein allgemeines Erlöschensurteil: Forderungs-/Hypothe",
    "kenübergang insbesondere1143/1150, Ausgleich und verbleibend",
    "e Eigentümerrechte separat. Übersteigender Zahlbetrag begrün",
    "det keinen automatisch festgestellten Erstattungsanspruch."
  )
)
}
