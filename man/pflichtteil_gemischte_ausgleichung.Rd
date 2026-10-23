% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pflichtteil_gemischte_ausgleichung}
\alias{pflichtteil_gemischte_ausgleichung}
\title{pflichtteil gemischte ausgleichung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{pflichtteil_gemischte_ausgleichung(
  gruppennachlass = NULL,
  miterben = NULL,
  berechtigter_id = NULL,
  zugleich_anrechenbarer_zuwendungswert = NULL,
  hinterlassener_erbteilwert = NULL,
  fall_nach_2316_qualifiziert = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{gruppennachlass}{Nichtnegativer exakter EUR-Nachlassanteil derselben vollständigen Ausgleichungsgruppe.}
\item{miterben}{Liste2..1000 mit genau person_id (eindeutig),relative_erbquote (positive exakte Zahl<=1, Summe1),ausgleichungswert_zuwendungen (nichtnegative rechtlich bewertete2055-Werte),leistungs_ausgleichsbetrag (nichtnegative billig bemessene, um2057aII-Ausschlüsse bereinigte Werte). Leistungssumme höchstens Gruppennachlass.}
\item{berechtigter_id}{Nichtleere ID eines Mitglieds der hypothetischen gesetzlichen Gruppe nach2316.}
\item{zugleich_anrechenbarer_zuwendungswert}{Nichtnegativer bereits im eigenen Ausgleichungswert enthaltener zugleich2315-anrechenbarer Wert, gleiche Wertbasis, höchstens eigener Zuwendungswert.}
\item{hinterlassener_erbteilwert}{Nichtnegativer rechtlich maßgeblicher EUR-Erbteilwert; bei Enterbung null.}
\item{fall_nach_2316_qualifiziert}{Pflichtwahrheitswert des Pflichtteilsfalls mit hypothetischer gesetzlicher Gruppe nach2316I/III. Keine zusätzlichen reinen2315-Zuwendungen/2325-Ergänzung.}
\item{bewertungsnachweis}{Nichtleerer Nachweis der hypothetischen Gruppe und Anrechnungswerte.}
}
\details{Gemischte gesetzliche Zuteilung aus2055/2057a halbieren; halben zugleich2315-anrechenbaren Wert abziehen; mindestens null; Mehrbetrag zu hinterlassenem Erbteil. Grenzen gemischter Teilung gelten: negativer individueller Teilungsbetrag NICHT_ANWENDBAR. Keine zusätzliche reine2315-Zuwendung,2325-Ergänzung oder Vermächtnisanrechnung. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält hypothetischer_gesetzlicher_erbteil,pflichtteil_vor_doppelanrechnung,halber_anrechnungswert,pflichtteilswert,mehrbetrag_gegenueber_hinterlassenem_erbteil als exakte EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2316_T0001, BGB_2316_T0003, BGB_2316_T0005, BGB_2303_T0002}
\examples{
pflichtteil_gemischte_ausgleichung(
  gruppennachlass = "120",
  miterben = list(
    list(
    "person_id" = "A",
    "relative_erbquote" = "0.5",
    "ausgleichungswert_zuwendungen" = "40",
    "leistungs_ausgleichsbetrag" = "0"
  ),
    list(
    "person_id" = "B",
    "relative_erbquote" = "0.5",
    "ausgleichungswert_zuwendungen" = "0",
    "leistungs_ausgleichsbetrag" = "20"
  )
  ),
  berechtigter_id = "A",
  zugleich_anrechenbarer_zuwendungswert = "0",
  hinterlassener_erbteilwert = "0",
  fall_nach_2316_qualifiziert = TRUE,
  bewertungsnachweis = "Synthetischer gemischter Pflichtteilsfall."
)
}
