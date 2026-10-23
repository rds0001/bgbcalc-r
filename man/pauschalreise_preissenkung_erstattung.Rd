% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pauschalreise_preissenkung_erstattung}
\alias{pauschalreise_preissenkung_erstattung}
\title{pauschalreise preissenkung erstattung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{pauschalreise_preissenkung_erstattung(
  reisepreis = NULL,
  preissenkungsbetrag = NULL,
  geleistete_zahlung = NULL,
  tatsaechliche_verwaltungsausgaben = NULL,
  senkungsvoraussetzungen_erfuellt = NULL,
  berechnungsnachweis = NULL
)}
\arguments{
\item{reisepreis}{Nichtnegativer ursprünglicher Reisepreis in EUR vor der konkreten Senkung nach§651f Absatz4.}
\item{preissenkungsbetrag}{Nichtnegativer gesetzlich/vertraglich korrekt ermittelter Senkungsbetrag in EUR, höchstens Reisepreis. Bereits bewertete Ersparnisfolge der einschlägigen Kostenänderung; keine allgemeine Minderung wegen Reisemängeln.}
\item{geleistete_zahlung}{Nichtnegative bereits geleistete Zahlung auf den Reisepreis in EUR. Ein noch nicht gezahlter Preisanteil ist keine rückzahlbare Überzahlung.}
\item{tatsaechliche_verwaltungsausgaben}{Nichtnegative tatsächlich entstandene und im konkreten Fall gesetzlich abzugsfähige Verwaltungsausgaben in EUR; keine pauschal angenommene Bearbeitungsgebühr. Abzug nur aus gezahltem Mehrbetrag, höchstens dessen Höhe.}
\item{senkungsvoraussetzungen_erfuellt}{Wahrheitswert: vertraglicher Erhöhungsvorbehalt besteht und einschlägige nach Vertragsschluss, vor Reisebeginn eingetretene Preis-/Abgaben-/Wechselkursänderung führt zu geringeren Veranstalterkosten. Berechnungsweg rechtlich geprüft; FALSE ergibt NICHT_ANWENDBAR.}
\item{berechnungsnachweis}{Nichtleere Beschreibung von Kostenänderung, Senkungsberechnung, Zahlungen und tatsächlich abzugsfähigen Verwaltungsausgaben; Nachweisverlangen des Reisenden gesondert erfüllen.}
}
\details{Gesenkter Preis=Reisepreis minus Senkung. Gezahlter Mehrbetrag=max(Zahlung minus gesenkter Preis,0). Verwaltungsabzug=min(tatsächliche abzugsfähige Ausgaben,Mehrbetrag). Erstattung=Mehrbetrag minus Abzug. Nur Senkung§651f Absatz4, nicht Reisemangelminderung. Verwaltungskosten erhöhen nicht den gesenkten Vertragspreis und erzeugen keine zusätzliche Forderung. Kostenänderungsformel und tatsächliche Abzugsfähigkeit extern; keine Pauschalgebühr erfinden. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält gesenkter_reisepreis, gezahlter_mehrbetrag, verwaltungsabzug und erstattungsbetrag als exakte EUR-Brüche; bei fehlender Anwendbarkeit null. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_651f_T0013, BGB_651f_T0014, BGB_651f_T0015, BGB_651f_T0016}
\examples{
pauschalreise_preissenkung_erstattung(
  reisepreis = "1000",
  preissenkungsbetrag = "100",
  geleistete_zahlung = "0",
  tatsaechliche_verwaltungsausgaben = "0",
  senkungsvoraussetzungen_erfuellt = TRUE,
  berechnungsnachweis = paste0(
    "Synthetische Senkungsberechnung und tatsächlich entstandene ",
    "abzugsfähige Ausgaben."
  )
)
}
