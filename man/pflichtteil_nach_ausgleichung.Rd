% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pflichtteil_nach_ausgleichung}
\alias{pflichtteil_nach_ausgleichung}
\title{pflichtteil nach ausgleichung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{pflichtteil_nach_ausgleichung(
  gruppennachlass = NULL,
  ausgleichungsart = NULL,
  miterben = NULL,
  berechtigter_id = NULL,
  zugleich_anrechenbarer_zuwendungswert = NULL,
  hinterlassener_erbteilwert = NULL,
  fall_nach_2316_qualifiziert = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{gruppennachlass}{Nichtnegativer exakter EUR-Wert des Nachlassanteils der hypothetischen gesetzlichen Ausgleichungsgruppe.}
\item{ausgleichungsart}{zuwendungen oder leistungen; gleichzeitige Zuwendungs-/Leistungsausgleichung außerhalb dieses Modells.}
\item{miterben}{Liste2..1000. Bei zuwendungen: genau person_id,erbquote_zaehler,erbquote_nenner,ausgleichungswert wie erb_zuwendungen_ausgleichen. Bei leistungen: genau miterbe_id,relative_erbquote,leistungs_ausgleichsbetrag wie erbteilung_leistungsausgleich. Relative positive Quoten summieren sich auf eins; Erbverzichtspersonen2316I2 ausgeschlossen, Ausstattungswerte2316III rechtlich qualifiziert.}
\item{berechtigter_id}{Nichtleere ID eines Gruppenmitglieds, dessen Pflichtteil berechnet wird.}
\item{zugleich_anrechenbarer_zuwendungswert}{Nichtnegativer exakter EUR-Wert einer bereits im eigenen Ausgleichungswert enthaltenen und zugleich nach2315 anzurechnenden Zuwendung. Gleiche Wertgrundlage, höchstens eigener Ausgleichungswert; bei Leistungen null. Keine reine2315-Zuwendung hinzufügen.}
\item{hinterlassener_erbteilwert}{Nichtnegativer rechtlich maßgeblicher EUR-Erbteilwert; bei enterbtem Berechtigten null. Mehrbetrag unabhängig von nomineller Halbquote berechnen.}
\item{fall_nach_2316_qualifiziert}{Pflichtwahrheitswert zu berechtigtem Abkömmling und rechtlich korrekt bestimmter hypothetischer gesetzlicher Ausgleichungsgruppe; FALSE ergibt NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleerer Nachweis der Gruppe, Wertansätze und Anrechnung.}
}
\details{Hypothetische Teilung mit vorhandenem2055/2056- oder2057a-Kern; individuellen Erbteil halbieren; halben zugleich2315-anrechenbaren Zuwendungswert abziehen, mindestens null; positiven Mehrbetrag gegenüber hinterlassenem Erbteil berechnen. Keine simultane Zuwendungs-/Leistungsausgleichung, keine weiteren reinen2315-Zuwendungen oder2325-Ergänzung. Erbverzicht und Ausstattungsschutz rechtlich vorqualifizieren. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält hypothetischer_gesetzlicher_erbteil, pflichtteil_vor_doppelanrechnung, halber_anrechnungswert, pflichtteilswert, mehrbetrag_gegenueber_hinterlassenem_erbteil als exakte EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2316_T0001, BGB_2316_T0002, BGB_2316_T0003, BGB_2316_T0004, BGB_2316_T0005, BGB_2303_T0002}
\examples{
pflichtteil_nach_ausgleichung(
  gruppennachlass = "120",
  ausgleichungsart = "zuwendungen",
  miterben = list(
    list(
    "person_id" = "A",
    "erbquote_zaehler" = 1,
    "erbquote_nenner" = 2,
    "ausgleichungswert" = "40"
  ),
    list(
    "person_id" = "B",
    "erbquote_zaehler" = 1,
    "erbquote_nenner" = 2,
    "ausgleichungswert" = "0"
  )
  ),
  berechtigter_id = "A",
  zugleich_anrechenbarer_zuwendungswert = "0",
  hinterlassener_erbteilwert = "0",
  fall_nach_2316_qualifiziert = TRUE,
  bewertungsnachweis = "Synthetisch qualifizierte hypothetische gesetzliche Gruppe."
)
}
