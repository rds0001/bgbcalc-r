% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pflichtteil_getrennter_zuwendungs_leistungsausgleich}
\alias{pflichtteil_getrennter_zuwendungs_leistungsausgleich}
\title{pflichtteil getrennter zuwendungs leistungsausgleich}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{pflichtteil_getrennter_zuwendungs_leistungsausgleich(
  gruppennachlass = NULL,
  miterben = NULL,
  berechtigter_id = NULL,
  zugleich_anrechenbarer_zuwendungswert = NULL,
  hinterlassener_erbteilwert = NULL,
  fall_nach_2316_qualifiziert = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{gruppennachlass}{Nichtnegative vollständige hypothetische gesetzliche Ausgleichungsgruppenmasse.}
\item{miterben}{Liste wie erbteilung_getrennter_zuwendungs_leistungsausgleich: person_id,relative_erbquote,ausgleichungswert_zuwendungen,leistungs_ausgleichsbetrag. Getrennte positive Zuwendungs-/Leistungsempfänger.}
\item{berechtigter_id}{ID des Pflichtteilsberechtigten innerhalb der hypothetischen Gruppe.}
\item{zugleich_anrechenbarer_zuwendungswert}{Nichtnegativer zugleich2315-anrechenbarer Anteil des eigenen bereits enthaltenen Ausgleichungswertes; gleicheBewertungsbasis.}
\item{hinterlassener_erbteilwert}{Rechtlich maßgeblicher nichtnegativer Wert, beiEnterbung0.}
\item{fall_nach_2316_qualifiziert}{Pflichtwahrheitswert des2316-Falls einschließlich getrennterEmpfänger,Leistungsvorwegabzug,Erbverzichtsausschluss undAusstattungsschutz;FALSE NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleerer Nachweis gerade dieser rechtlichenReihenfolge undWertungen; keinefreieMethodenwahl.}
}
\details{Getrennten2055/2056/2057a-Kern anwenden; individuellenhypothetischenErbteil halbieren; zugleichanrechenbarenZuwendungswert nurhalbabziehen,mindestens0;positivenMehrbetrag gegenüberHinterlassenschaft bilden. ZugleichLeistenderZuwendungsempfänger NICHT_ANWENDBAR. Keinezusätzlichenreinen2315-Zuwendungen,keine2325/2327Ergänzung. QualifizierteReihenfolge erforderlich. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{HypothetischerErbteil,PflichtteilvorDoppelanrechnung,halberAnrechnungswert,Pflichtteilswert undMehrbetrag exakt. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2316_T0001, BGB_2316_T0003, BGB_2316_T0005}
\examples{
pflichtteil_getrennter_zuwendungs_leistungsausgleich(
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
  berechtigter_id = "B",
  zugleich_anrechenbarer_zuwendungswert = "0",
  hinterlassener_erbteilwert = "10",
  fall_nach_2316_qualifiziert = TRUE,
  bewertungsnachweis = paste0(
    "HypothetischegesetzlicheGruppe,A NichtleistenderÜberempfänge",
    "r,BLeistender; getrennteEmpfängerundReihenfolgequalifiziert."
  )
)
}
