% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pflichtteilsergaenzung_getrennte_bewertungen}
\alias{pflichtteilsergaenzung_getrennte_bewertungen}
\title{pflichtteilsergaenzung getrennte bewertungen}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{pflichtteilsergaenzung_getrennte_bewertungen(
  gruppennachlass = NULL,
  gruppenquote_am_gesamtnachlass = NULL,
  berechtigter_id = NULL,
  ordentliche_bewertung = NULL,
  fiktive_bewertung = NULL,
  ergaenzungsposten = NULL,
  hinterlassener_erbteilwert = NULL,
  ausgleichungsmodell = NULL,
  methodennachweis = NULL
)}
\arguments{
\item{gruppennachlass}{Nichtnegative tatsächliche Nachlassmasse der rechtlich bestimmten Abkömmlingsgruppe.}
\item{gruppenquote_am_gesamtnachlass}{Gesetzliche Gruppenquote größer0bis1; Hinzurechnungen aus Gesamtnachlasswerten werden damit multipliziert.}
\item{berechtigter_id}{Dieselbe berechtigte Person in beiden hypothetischen Teilungen.}
\item{ordentliche_bewertung}{Objekt: miterben (bestehendes gemischtes Ausgleichsschema), reiner_anrechnungswert_2315, doppelanrechnungswert_2316. Werte für ordentliche Rechnung.}
\item{fiktive_bewertung}{Gleiches Schema für ergänzte Rechnung; gleiche Personen/Erbquoten, rechtlich abweichende Zuwendungs-/Leistungs-/Anrechnungswerte möglich.}
\item{ergaenzungsposten}{Liste0..1000: posten_id, hinzurechnungswert, bereits_erfasster_wert, bereits_erfasste_quote, ergaenzungsanrechnungswert, voranrechnungswert, voranrechnungsquote. Bereits erfasste Gruppenmasse=Wert*Quote; schon wirksame Anrechnung=Wert*Quote. Drittschenkung ohne eigene Anrechnung mit Nullwerten. Werte/Quoten sind rechtliche Bewertungszuordnungen, keine fertigen Pflichtteilsbeträge.}
\item{hinterlassener_erbteilwert}{Rechtlich vergleichbarer tatsächlich hinterlassener Wert für2316II/2326.}
\item{ausgleichungsmodell}{Zwingendes Modell des vorhandenen gemischten Ausgleichskerns: leistungsvorwegabzug_mit_fortgeltung oder gemeinsame_neuberechnung_ohne_ausgeschiedene.}
\item{methodennachweis}{2315/2316/2327-Kombination, unterschiedliche Bewertungsstichtage, Massenüberschneidungen, bereits wirksame Anrechnungsquoten und2326-Anwendung ausdrücklich rechtlich begründen.}
}
\details{Zwei vollständig berechnete Ausgleichungs-/Anrechnungsbewertungen mit differenzierten Schenkungswerten, Massenüberschneidungen und zusätzlicher Anrechnung verbinden; Mehrhinterlassung zuletzt abziehen. Bedingte Zweirechnungs-Komposition: ordentliche und fiktive gesetzliche Gruppenverteilung mit bestehendem2055/2056/2057a-Kern vollständig berechnen, jeweils reine2315-Zuwendung gruppenanteilig zur Masse hinzufügen; eigenen hypothetischen Erbteil halbieren, halbe2316-Doppelanrechnung und reine2315-Anrechnung abziehen, mindestens0. Ergänzte Gruppenmasse=ursprünglicheGruppenmasse+Summe(Gruppenquote*Hinzurechnungswert-bereitsErfassterWert*Erfassungsquote). Unterschiedliche Bewertungen derselben Zuwendung erlaubt; kein pauschaler Vergleich verschiedener2315/2055-Werte als Obergrenze. Zusätzliche2327-Anrechnung=Summe(Ergänzungsanrechnungswert-Voranrechnungswert*Voranrechnungsquote), danach Ergänzung=max(fiktiverPflichtteil-zusätzlicheAnrechnung-ordentlicherPflichtteil,0).2326-Mehrhinterlassung mit vorhandenem Kern abziehen; ordentlicher Mehrbetrag=max(ordentlicherPflichtteil-Hinterlassung,0). Kein doppeltes Hinzurechnen/Anrechnen automatisch unterstellen: korrespondierende Werte und Quoten ausdrücklich rechtlich bestimmen. Dieses Rechenmodell und die Zuordnung der Überschneidungen sind keine allgemein bestätigte Rechtsauslegung; keine Standardwahl der Bewertungs-/Ausgleichsmethode. Gleiche Personengruppe und Erbquoten in beiden Rechnungen; kein automatischer Rechtsverzicht oder Bewertungsentscheid. Nur nichtnegative resultierende Gruppenmassen im vorhandenen Ausgleichskern. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Ergänzte Gruppenmasse, ordentlicher/fiktiver Pflichtteil, zusätzliche Anrechnung, Ergänzung vor/nach Mehrhinterlassung und zusätzlicher Gesamtzahlbetrag unter qualifiziertem Modell. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2315_T0001, BGB_2315_T0002, BGB_2315_T0003, BGB_2315_T0004, BGB_2316_T0001, BGB_2316_T0002, BGB_2316_T0003, BGB_2316_T0004, BGB_2316_T0005, BGB_2326_T0001, BGB_2326_T0002, BGB_2327_T0001, BGB_2327_T0002, BGB_2327_T0003}
\examples{
pflichtteilsergaenzung_getrennte_bewertungen(
  gruppennachlass = "300",
  gruppenquote_am_gesamtnachlass = "1",
  berechtigter_id = "A",
  ordentliche_bewertung = list(
    "miterben" = list(
    list(
    "person_id" = "A",
    "relative_erbquote" = list(
    "zaehler" = "1",
    "nenner" = "3"
  ),
    "ausgleichungswert_zuwendungen" = "0",
    "leistungs_ausgleichsbetrag" = "0"
  ),
    list(
    "person_id" = "B",
    "relative_erbquote" = list(
    "zaehler" = "1",
    "nenner" = "3"
  ),
    "ausgleichungswert_zuwendungen" = "0",
    "leistungs_ausgleichsbetrag" = "0"
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
    "reiner_anrechnungswert_2315" = "0",
    "doppelanrechnungswert_2316" = "0"
  ),
  fiktive_bewertung = list(
    "miterben" = list(
    list(
    "person_id" = "A",
    "relative_erbquote" = list(
    "zaehler" = "1",
    "nenner" = "3"
  ),
    "ausgleichungswert_zuwendungen" = "0",
    "leistungs_ausgleichsbetrag" = "0"
  ),
    list(
    "person_id" = "B",
    "relative_erbquote" = list(
    "zaehler" = "1",
    "nenner" = "3"
  ),
    "ausgleichungswert_zuwendungen" = "0",
    "leistungs_ausgleichsbetrag" = "0"
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
    "reiner_anrechnungswert_2315" = "0",
    "doppelanrechnungswert_2316" = "0"
  ),
  ergaenzungsposten = list(
    list(
    "posten_id" = "D",
    "hinzurechnungswert" = "300",
    "bereits_erfasster_wert" = "0",
    "bereits_erfasste_quote" = "0",
    "ergaenzungsanrechnungswert" = "0",
    "voranrechnungswert" = "0",
    "voranrechnungsquote" = "0"
  )
  ),
  hinterlassener_erbteilwert = "0",
  ausgleichungsmodell = "leistungsvorwegabzug_mit_fortgeltung",
  methodennachweis = paste0(
    "Bedingte Zweirechnungs-Komposition: ordentliche und fiktive ",
    "gesetzliche Gruppenverteilung mit bestehendem2055/2056/2057a",
    "-Kern vollständig berechnen, jeweils reine2315-Zuwendung gru",
    "ppenanteilig zur Masse hinzufügen; eigenen hypothetischen Er",
    "bteil halbieren, halbe2316-Doppelanrechnung und reine2315-An",
    "rechnung abziehen, mindestens0. Ergänzte Gruppenmasse=ursprü",
    "nglicheGruppenmasse+Summe(Gruppenquote*Hinzurechnungswert-be",
    "reitsErfassterWert*Erfassungsquote). Unterschiedliche Bewert",
    "ungen derselben Zuwendung erlaubt; kein pauschaler Vergleich",
    " verschiedener2315/2055-Werte als Obergrenze. Zusätzliche232",
    "7-Anrechnung=Summe(Ergänzungsanrechnungswert-Voranrechnungsw",
    "ert*Voranrechnungsquote), danach Ergänzung=max(fiktiverPflic",
    "htteil-zusätzlicheAnrechnung-ordentlicherPflichtteil,0).2326",
    "-Mehrhinterlassung mit vorhandenem Kern abziehen; ordentlich",
    "er Mehrbetrag=max(ordentlicherPflichtteil-Hinterlassung,0). ",
    "Kein doppeltes Hinzurechnen/Anrechnen automatisch unterstell",
    "en: korrespondierende Werte und Quoten ausdrücklich rechtlic",
    "h bestimmen. Dieses Rechenmodell und die Zuordnung der Übers",
    "chneidungen sind keine allgemein bestätigte Rechtsauslegung;",
    " keine Standardwahl der Bewertungs-/Ausgleichsmethode. Gleic",
    "he Personengruppe und Erbquoten in beiden Rechnungen; kein a",
    "utomatischer Rechtsverzicht oder Bewertungsentscheid. Nur ni",
    "chtnegative resultierende Gruppenmassen im vorhandenen Ausgl",
    "eichskern."
  )
)
}
