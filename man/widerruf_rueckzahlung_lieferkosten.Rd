% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{widerruf_rueckzahlung_lieferkosten}
\alias{widerruf_rueckzahlung_lieferkosten}
\title{widerruf rueckzahlung lieferkosten}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{widerruf_rueckzahlung_lieferkosten(
  empfangene_warenzahlung = NULL,
  gezahlte_lieferkosten = NULL,
  abweichende_lieferart_gewaehlt = NULL,
  guenstigste_standardlieferkosten = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{empfangene_warenzahlung}{Nichtnegativer exakter EUR-Betrag der tatsächlich empfangenen und dem widerrufenen Vertrag/Umfang zugeordneten Warenzahlung ohne Lieferkosten.}
\item{gezahlte_lieferkosten}{Nichtnegative exakte tatsächlich gezahlte EUR-Kosten der ursprünglichen Lieferung, keine Rücksendekosten.}
\item{abweichende_lieferart_gewaehlt}{Expliziter Wahrheitswert: Verbraucher hat sich für eine andere als die vom Unternehmer angebotene günstigste Standardlieferung entschieden. Bloßer höherer Rechnungsbetrag genügt nicht.}
\item{guenstigste_standardlieferkosten}{Nur bei abweichende_lieferart_gewaehltTRUE erforderlicher nichtnegativer exakter EUR-Preis der angebotenen günstigsten Standardlieferung desselben Umfangs; sonst zwingendNULL/None.}
\item{einordnungsnachweis}{Nichtleerer Nachweis wirksamen Widerrufs im357-Fall, zugeordneter Zahlungen, Lieferumfang und gegebenenfalls abweichender Lieferwahl. Keine automatische Aufrechnung mit Wertersatz.}
}
\details{Empfangene Warenzahlung und erstattungsfähige Lieferkosten addieren; bei gewählter abweichender Lieferung nur zusätzliche Liefermehrkosten ausschließen. §357I/II: grundsätzlich auch Lieferzahlungen zurückgewähren. Nur zusätzliche Kosten infolge gewählter abweichender Lieferart ausschließen; ohne diesen Tatbestand tatsächliche Lieferzahlung vollständig berücksichtigen. Standardvergleich auf denselben widerrufenen Lieferumfang beziehen, keine pauschale Zuordnung bei Teilwiderruf oder mehreren Warenkörben. Rücksendekosten357V/VI/VII, Wertersatz357a, mögliche Zahlungsverweigerung357IV, Rückzahlungsweg357III und Frist getrennt behandeln. Grundbetrag vor weiteren rechtlich zulässigen Anrechnungen; keine automatische Saldierung oder zusätzliche Rückabwicklungsgebühr. Nichtnegative exakte EUR-Dezimaltexte/Brüche nach NUMERIK.md. Kostenlisten ohne doppelte Positionen, keine Rundung.}
\value{wert: rueckzahlbare_lieferkosten, ausgeschlossene_liefermehrkosten und rueckzahlungsgrundbetrag als exakte EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_357_T0001, BGB_357_T0002, BGB_357_T0003, BGB_357_T0004, BGB_357_T0005, BGB_357_T0006, BGB_357_T0007, BGB_357_T0008, BGB_357_T0009, BGB_357_T0010, BGB_357_T0011, BGB_357_T0012}
\examples{
widerruf_rueckzahlung_lieferkosten(
  empfangene_warenzahlung = "100",
  gezahlte_lieferkosten = "10",
  abweichende_lieferart_gewaehlt = TRUE,
  guenstigste_standardlieferkosten = "5",
  einordnungsnachweis = paste0(
    "§357I/II: grundsätzlich auch Lieferzahlungen zurückgewähren.",
    " Nur zusätzliche Kosten infolge gewählter abweichender Liefe",
    "rart ausschließen; ohne diesen Tatbestand tatsächliche Liefe",
    "rzahlung vollständig berücksichtigen. Standardvergleich auf ",
    "denselben widerrufenen Lieferumfang beziehen, keine pauschal",
    "e Zuordnung bei Teilwiderruf oder mehreren Warenkörben. Rück",
    "sendekosten357V/VI/VII, Wertersatz357a, mögliche Zahlungsver",
    "weigerung357IV, Rückzahlungsweg357III und Frist getrennt beh",
    "andeln. Grundbetrag vor weiteren rechtlich zulässigen Anrech",
    "nungen; keine automatische Saldierung oder zusätzliche Rücka",
    "bwicklungsgebühr."
  )
)
}
