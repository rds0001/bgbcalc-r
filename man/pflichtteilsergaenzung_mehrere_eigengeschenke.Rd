% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pflichtteilsergaenzung_mehrere_eigengeschenke}
\alias{pflichtteilsergaenzung_mehrere_eigengeschenke}
\title{pflichtteilsergaenzung mehrere eigengeschenke}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{pflichtteilsergaenzung_mehrere_eigengeschenke(
  pflichtteilsnachlass = NULL,
  drittschenkungen_ergaenzungswert = NULL,
  eigengeschenke = NULL,
  gesetzliche_erbquote_zaehler = NULL,
  gesetzliche_erbquote_nenner = NULL,
  kombination_ohne_ausgleichung_qualifiziert = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{pflichtteilsnachlass}{Vorzeichenbehaftete exakte EUR-Nettobasis; vor Hinzurechnungen nicht aufnull kürzen.}
\item{drittschenkungen_ergaenzungswert}{Nichtnegative Summe rechtlich bewerteter ggf.abgeschmolzener ergänzungsrelevanter Drittschenkungen.}
\item{eigengeschenke}{Liste0..1000 mit genau geschenk_id (eindeutig),einheitlicher_wert (nichtnegativer exakter EUR-Wert für sämtliche Schritte dieses Geschenks),anrechnung_nach_2315 (Pflichtwahrheitswert der rechtlich wirksamen Anrechnungsbestimmung). Keine Doppelzählung.}
\item{gesetzliche_erbquote_zaehler}{Ganzzahl0..Nenner der gesetzlichen Erbquote, Pflichtteilshälfte wird intern angewandt.}
\item{gesetzliche_erbquote_nenner}{Ganzzahl1..2^53-1.}
\item{kombination_ohne_ausgleichung_qualifiziert}{Pflichtwahrheitswert des gemeinsamen2315/2327-Modells ohne2316-Ausgleichung,2326-Mehrhinterlassung oder unterschiedliche Werte desselben Geschenks; FALSE NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleerer Nachweis jeder Bewertung und Anrechnungsbestimmung; Eigengeschenke nicht ungeprüft abschmelzen.}
}
\details{A=Summe2315-Geschenke,B=SummeübrigeEigengeschenke;q=halbeGesetzquote. Ordentlich=max(q×max(N+A,0)-A,0);Ergänzung=max(q×max(N+D+A+B,0)-A-B-ordentlich,0);Gesamt=ordentlich+Ergänzung. Je Geschenk identischer Wert für alle Rechenschritte. Unterschiedliche Bewertungen desselben Geschenks,2316 und2326 nicht mitumgesetzt. Nur2327-Geschenke dürfen ordentlichen Pflichtteil nicht mindern. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG. Pflichtteilsnachlass darf negativ sein; übrige Geldwerte nichtnegativ.}
\value{wert enthält eigengeschenke_mit_2315,eigengeschenke_ohne_2315,ordentlicher_pflichtteil,pflichtteilsergaenzung und gesamtanspruch als exakte EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2327_T0001, BGB_2327_T0002, BGB_2327_T0003, BGB_2315_T0001, BGB_2315_T0002}
\examples{
pflichtteilsergaenzung_mehrere_eigengeschenke(
  pflichtteilsnachlass = "100",
  drittschenkungen_ergaenzungswert = "200",
  eigengeschenke = list(
    list(
    "geschenk_id" = "A",
    "einheitlicher_wert" = "20",
    "anrechnung_nach_2315" = TRUE
  ),
    list(
    "geschenk_id" = "B",
    "einheitlicher_wert" = "10",
    "anrechnung_nach_2315" = FALSE
  )
  ),
  gesetzliche_erbquote_zaehler = 1,
  gesetzliche_erbquote_nenner = 2,
  kombination_ohne_ausgleichung_qualifiziert = TRUE,
  bewertungsnachweis = "Synthetische einheitliche Werte je Eigengeschenk."
)
}
