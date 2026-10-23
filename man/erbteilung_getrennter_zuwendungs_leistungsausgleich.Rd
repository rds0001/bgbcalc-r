% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{erbteilung_getrennter_zuwendungs_leistungsausgleich}
\alias{erbteilung_getrennter_zuwendungs_leistungsausgleich}
\title{erbteilung getrennter zuwendungs leistungsausgleich}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{erbteilung_getrennter_zuwendungs_leistungsausgleich(
  gruppennachlass = NULL,
  miterben = NULL,
  getrennte_empfaenger_und_reihenfolge_qualifiziert = NULL,
  rechts_und_bewertungsnachweis = NULL
)}
\arguments{
\item{gruppennachlass}{Nichtnegative vollständige EUR-Masse dieser Ausgleichungsgruppe.}
\item{miterben}{Liste2..1000 mit person_id,relative_erbquote,ausgleichungswert_zuwendungen,leistungs_ausgleichsbetrag. PositiveQuotenSumme1; Geldwerte nichtnegativ; Leistungssumme höchstensGruppennachlass.}
\item{getrennte_empfaenger_und_reihenfolge_qualifiziert}{Pflichtwahrheitswert: gleicheGruppe und Leistungsvorwegabzug vor2056-Rechnung rechtlichqualifiziert. JederEmpfänger höchstensZuwendung ODER Leistungpositiv; ÜberschneidungNICHT_ANWENDBAR.}
\item{rechts_und_bewertungsnachweis}{Nichtleere rechtlicheZuordnung dergetrenntenEmpfänger/Reihenfolge und bereitsbillige2057a-Werte sowie2055-Zuwendungswerte.}
}
\details{L=summeLeistungen; vorhandenen2055/2056-Kern auf N-L anwenden, anschließend jePersonLeistungaddieren. Bei getrenntenEmpfängern können nur NichtleistendeÜberempfängersein. Zugleich positiveZuwendung/Leistung beiirgendeinemEmpfänger NICHT_ANWENDBAR. Keine Lösung zugleichleistenderÜberempfänger; expliziteReihenfolgequalifikation erforderlich. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{Restnachlass,außerAnsatzgenommeneNichtleistende undindividuelleZuteilungen alsEUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2055_T0001, BGB_2056_T0001, BGB_2056_T0002, BGB_2057a_T0005, BGB_2057a_T0006, BGB_2057a_T0007}
\examples{
erbteilung_getrennter_zuwendungs_leistungsausgleich(
  gruppennachlass = "100",
  miterben = list(
    list(
    "person_id" = "A",
    "relative_erbquote" = list(
    "zaehler" = "1",
    "nenner" = "3"
  ),
    "ausgleichungswert_zuwendungen" = "300",
    "leistungs_ausgleichsbetrag" = "0"
  ),
    list(
    "person_id" = "B",
    "relative_erbquote" = list(
    "zaehler" = "1",
    "nenner" = "3"
  ),
    "ausgleichungswert_zuwendungen" = "0",
    "leistungs_ausgleichsbetrag" = "20"
  ),
    list(
    "person_id" = "C",
    "relative_erbquote" = list(
    "zaehler" = "1",
    "nenner" = "3"
  ),
    "ausgleichungswert_zuwendungen" = "0",
    "leistungs_ausgleichsbetrag" = "0"
  )
  ),
  getrennte_empfaenger_und_reihenfolge_qualifiziert = TRUE,
  rechts_und_bewertungsnachweis = paste0(
    "GetrennteEmpfänger, gleicheGruppe,Leistungsvorwegabzug fachl",
    "ichqualifiziert. A NichtleistenderÜberempfänger."
  )
)
}
