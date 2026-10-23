% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pflichtteil_gemischter_ausgleich_mit_anrechnung}
\alias{pflichtteil_gemischter_ausgleich_mit_anrechnung}
\title{pflichtteil gemischter ausgleich mit anrechnung}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{pflichtteil_gemischter_ausgleich_mit_anrechnung(
  gruppennachlass = NULL,
  miterben = NULL,
  berechtigter_id = NULL,
  gruppenquote_am_gesamtnachlass = NULL,
  zugleich_anrechenbarer_zuwendungswert = NULL,
  reiner_anrechnungswert_2315 = NULL,
  hinterlassener_erbteilwert = NULL,
  ausgleichungsmodell = NULL,
  methodennachweis = NULL
)}
\arguments{
\item{gruppennachlass}{Rechtlich auf Ausgleichungsgruppe entfallender Nachlass vor zusätzlicher2315-Hinzurechnung.}
\item{miterben}{Vollständige Ausgleichungsgruppe nach Vertrag des gemischten Überempfangskerns.}
\item{berechtigter_id}{Kennung des konkret berechneten Pflichtteilsberechtigten in der hypothetischen Gruppe.}
\item{gruppenquote_am_gesamtnachlass}{Positive gesetzliche Quote der gesamten Ausgleichungsgruppe am Gesamtnachlass, höchstens1; relative Miterbenquoten bleiben auf die Gruppe bezogen.}
\item{zugleich_anrechenbarer_zuwendungswert}{Bereits in eigener2055-Zuwendung enthaltener zugleich2315-anrechenbarer Wert auf identischer Bewertungsbasis, höchstens eigener Zuwendungswert.}
\item{reiner_anrechnungswert_2315}{Zusätzliche eigene2315-Zuwendung ohne2050-Ausgleichspflicht, nicht bereits in Gruppenpositionen enthalten.}
\item{hinterlassener_erbteilwert}{Für2316IImaßgeblicher tatsächlich hinterlassener Wert;0bei Enterbung.}
\item{ausgleichungsmodell}{Zwingend rechtlich begründetes Modell des gemischten Überempfangskerns.}
\item{methodennachweis}{2316-Anwendbarkeit, Gruppe/Gruppequote, identische Doppelanrechnungswerte und vorgelagerte2315-Hinzurechnung der zusätzlichen Zuwendung ausdrücklich rechtlich qualifizieren; keine automatische Rechtsauslegung.}
}
\details{Reine2315-Zuwendung anteilig zur hypothetischen Gruppenmasse addieren, gemischtes Modell berechnen, Anteil halbieren und getrennte Anrechnungen abziehen. Bedingte2316/2315-Komposition: reine eigene2315-Zuwendung mit gesetzlicher Gruppenquote zur Gruppenmasse hinzufügen; vorhandenen ausdrücklich ausgewählten2055/2056/2057a-Kern auf hypothetische Masse anwenden. Eigenen hypothetischen gesetzlichen Anteil halbieren; zugleich ausgleichungspflichtige2315-Zuwendung nach2316IVnur halb, zusätzliche reine2315-Zuwendung vollständig abziehen; positiver Rest und2316II-Mehrbetrag. Gruppenquote verhindert volle Hinzurechnung zur Teilgruppe bei weiteren gesetzlichen Erben. Kein doppelt erfasstes Geschenk, keine automatische Bewertung/Kaufkraftbereinigung. Kombination und Reihenfolge sind rechtliche Modellvoraussetzungen, insbesondere zugleich leistende Überempfänger bleiben keine automatisch gelöste Auslegungsfrage. Unterschiedliche Wertansätze derselben Doppelzuwendung und2325/2327-Ergänzung separat. Rechtlicher Gruppenausschluss durch Erbverzicht und Ausstattungsschutz2316IIIvorqualifiziert. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Hypothetische Gruppenmasse/Erbteil, halber Grundwert/Doppelabzug, positiver Pflichtteil und Mehrbetrag. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2055_T0001, BGB_2055_T0002, BGB_2055_T0003, BGB_2056_T0001, BGB_2056_T0002, BGB_2057a_T0001, BGB_2057a_T0002, BGB_2057a_T0003, BGB_2057a_T0004, BGB_2057a_T0005, BGB_2057a_T0006, BGB_2057a_T0007, BGB_2315_T0001, BGB_2315_T0002, BGB_2315_T0003, BGB_2315_T0004, BGB_2316_T0001, BGB_2316_T0002, BGB_2316_T0003, BGB_2316_T0004, BGB_2316_T0005}
\examples{
pflichtteil_gemischter_ausgleich_mit_anrechnung(
  gruppennachlass = "100",
  miterben = list(
    list(
    "person_id" = "A",
    "relative_erbquote" = list(
    "zaehler" = "1",
    "nenner" = "3"
  ),
    "ausgleichungswert_zuwendungen" = "150",
    "leistungs_ausgleichsbetrag" = "50"
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
  berechtigter_id = "A",
  gruppenquote_am_gesamtnachlass = "1",
  zugleich_anrechenbarer_zuwendungswert = "0",
  reiner_anrechnungswert_2315 = "0",
  hinterlassener_erbteilwert = "0",
  ausgleichungsmodell = "leistungsvorwegabzug_mit_fortgeltung",
  methodennachweis = paste0(
    "Bedingte2316/2315-Komposition: reine eigene2315-Zuwendung mi",
    "t gesetzlicher Gruppenquote zur Gruppenmasse hinzufügen; vor",
    "handenen ausdrücklich ausgewählten2055/2056/2057a-Kern auf h",
    "ypothetische Masse anwenden. Eigenen hypothetischen gesetzli",
    "chen Anteil halbieren; zugleich ausgleichungspflichtige2315-",
    "Zuwendung nach2316IVnur halb, zusätzliche reine2315-Zuwendun",
    "g vollständig abziehen; positiver Rest und2316II-Mehrbetrag.",
    " Gruppenquote verhindert volle Hinzurechnung zur Teilgruppe ",
    "bei weiteren gesetzlichen Erben. Kein doppelt erfasstes Gesc",
    "henk, keine automatische Bewertung/Kaufkraftbereinigung. Kom",
    "bination und Reihenfolge sind rechtliche Modellvoraussetzung",
    "en, insbesondere zugleich leistende Überempfänger bleiben ke",
    "ine automatisch gelöste Auslegungsfrage. Unterschiedliche We",
    "rtansätze derselben Doppelzuwendung und2325/2327-Ergänzung s",
    "eparat. Rechtlicher Gruppenausschluss durch Erbverzicht und ",
    "Ausstattungsschutz2316IIIvorqualifiziert."
  )
)
}
