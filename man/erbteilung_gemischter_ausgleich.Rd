% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{erbteilung_gemischter_ausgleich}
\alias{erbteilung_gemischter_ausgleich}
\title{erbteilung gemischter ausgleich}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{erbteilung_gemischter_ausgleich(
  gruppennachlass = NULL,
  miterben = NULL,
  gemischter_ausgleich_qualifiziert = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{gruppennachlass}{Nichtnegativer exakter EUR-Nachlassanteil derselben vollständigen Ausgleichungsgruppe.}
\item{miterben}{Liste2..1000 mit genau person_id (eindeutig),relative_erbquote (positive exakte Zahl<=1, Summe1),ausgleichungswert_zuwendungen (nichtnegative rechtlich bewertete2055-Werte),leistungs_ausgleichsbetrag (nichtnegative billig bemessene, um2057aII-Ausschlüsse bereinigte Werte). Leistungssumme höchstens Gruppennachlass.}
\item{gemischter_ausgleich_qualifiziert}{Pflichtwahrheitswert derselben Ausgleichungsgruppe und rechtlich kombinierbarer Wertansätze; FALSE NICHT_ANWENDBAR. Auch negative individuelle Endzuteilung ergibt NICHT_ANWENDBAR, da2056-Mischiteration ungeklärt.}
\item{bewertungsnachweis}{Nichtleerer Nachweis der Gruppe, rechtlichen Wertmaßstäbe und Leistungsbemessung.}
}
\details{M=N-SummeL+SummeZ;jePerson q×M-Z+L. Nur wenn alle Endbeträge nichtnegativ, ansonsten NICHT_ANWENDBAR. Keine ungeprüfte2056-Mehrempfangausscheidung oder Nullkappung, keine verschiedenen Ausgleichungsgruppen, keine automatische Billigkeits-/Bewertungsfeststellung. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält gemischte_rechenmasse und zuteilungen mit person_id,erbteil_nach_gemischtem_ausgleich als exakte EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2055_T0001, BGB_2055_T0002, BGB_2057a_T0006, BGB_2057a_T0007}
\examples{
erbteilung_gemischter_ausgleich(
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
  gemischter_ausgleich_qualifiziert = TRUE,
  bewertungsnachweis = "Synthetisch qualifizierter gemischter Ausgleich."
)
}
