% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{hoechstbetragshypothek_forderung_und_zinsen}
\alias{hoechstbetragshypothek_forderung_und_zinsen}
\title{hoechstbetragshypothek forderung und zinsen}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{hoechstbetragshypothek_forderung_und_zinsen(
  hauptforderung = NULL,
  zinsen = NULL,
  eingetragener_hoechstbetrag = NULL,
  hoechstbetragshypothek_anwendbar = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{hauptforderung}{Nichtnegative qualifizierte Hauptforderung in EUR, ohne nochmals enthaltene Zinsen.}
\item{zinsen}{Nichtnegative gesondert rechtlich bestimmte Zinsen in EUR; Zinssatz und Laufzeit nicht in dieser Summenfunktion berechnet.}
\item{eingetragener_hoechstbetrag}{Nichtnegativer eingetragener Höchstbetrag in EUR, der Hauptforderung und Zinsen gemeinsam begrenzt.}
\item{hoechstbetragshypothek_anwendbar}{Expliziter Wahrheitswert zur rechtlichen Anwendbarkeit§1190 auf diese Forderung; FALSE NICHT_ANWENDBAR.}
\item{einordnungsnachweis}{Nichtleere Begründung der Forderungs-/Zinsbeträge und wirksamen Höchstbetragshypothek.}
}
\details{Hauptforderung+Zinsen; gemeinsame Summe auf Höchstbetrag begrenzen; Überschuss als Differenz. Nur Hauptforderung/Zinsen, sonstige Kosten und Nebenleistungen gesondert. Kein Erlös-/Rangplan, keine automatische Erlöschung übersteigender persönlicher Forderung. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält forderung_mit_zinsen, durch_hoechstbetrag_erfasster_betrag, nicht_vom_hoechstbetrag_erfasster_anteil als exakte EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1190_T0001, BGB_1190_T0002, BGB_1190_T0003}
\examples{
hoechstbetragshypothek_forderung_und_zinsen(
  hauptforderung = "90",
  zinsen = "20",
  eingetragener_hoechstbetrag = "100",
  hoechstbetragshypothek_anwendbar = TRUE,
  einordnungsnachweis = "Qualifizierte Hauptforderung und gesonderte Zinsen."
)
}
