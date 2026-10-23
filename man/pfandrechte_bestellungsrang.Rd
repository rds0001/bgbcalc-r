% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pfandrechte_bestellungsrang}
\alias{pfandrechte_bestellungsrang}
\title{pfandrechte bestellungsrang}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{pfandrechte_bestellungsrang(
  pfandrechte = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{pfandrechte}{Liste1..1000 mit genau pfandrecht_id und bestellung_am_utc (YYYY-MM-DDTHH:MM:SSZ). Wirksame Bestellungszeiten, nicht Entstehung/Fälligkeit der gesicherten Forderung; eindeutige Kennungen.}
\item{einordnungsnachweis}{Nichtleerer Nachweis von1209-Anwendungsbereich, wirksamen Bestellungszeitpunkten, ausreichender Sekundengenauigkeit und gegebenenfalls echter Gleichzeitigkeit. Keine abweichenden vorrangigen Rangregeln.}
}
\details{Pfandrechte nach qualifizierter wirksamer Bestellungszeit in zeitlich aufsteigende Ranggruppen einordnen; Gleichzeitigkeit gleichrangig behandeln. §1209: frühere rechtlich wirksame Bestellung hat niedrigere Ranggruppe, gleichzeitige Bestellung gleiche Ranggruppe. Künftige oder bedingte Forderungen verwenden ebenfalls die Bestellungszeit des Pfandrechts. Kein automatischer Rangwechsel, keine Entscheidung über Entstehung/Gutgläubigkeit oder Befriedigungsbeträge. Zeitpunkte müssen rechtlich ausreichend exakt auf UTC-Sekunden normalisiert sein; unterschiedliche Subsekunden dürfen nicht durch Abschneiden zu Gleichrang werden. Bei nicht sekundengenau abbildbarem Sachverhalt diese Funktion nicht verwenden. Ausgabe in Eingabereihenfolge; Ranggruppen sind lückenlos numeriert, kein Grundbuchrang nach879. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert als Liste in Eingabereihenfolge mit pfandrecht_id und positiver ganzzahliger ranggruppe;1 ist früheste Gruppe. Einheit: ranggruppen.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1209_T0001}
\examples{
pfandrechte_bestellungsrang(
  pfandrechte = list(
    list(
    "pfandrecht_id" = "B",
    "bestellung_am_utc" = "2024-01-01T10:00:01Z"
  ),
    list(
    "pfandrecht_id" = "A",
    "bestellung_am_utc" = "2024-01-01T10:00:00Z"
  ),
    list(
    "pfandrecht_id" = "C",
    "bestellung_am_utc" = "2024-01-01T10:00:01Z"
  )
  ),
  einordnungsnachweis = paste0(
    "§1209: frühere rechtlich wirksame Bestellung hat niedrigere ",
    "Ranggruppe, gleichzeitige Bestellung gleiche Ranggruppe. Kün",
    "ftige oder bedingte Forderungen verwenden ebenfalls die Best",
    "ellungszeit des Pfandrechts. Kein automatischer Rangwechsel,",
    " keine Entscheidung über Entstehung/Gutgläubigkeit oder Befr",
    "iedigungsbeträge. Zeitpunkte müssen rechtlich ausreichend ex",
    "akt auf UTC-Sekunden normalisiert sein; unterschiedliche Sub",
    "sekunden dürfen nicht durch Abschneiden zu Gleichrang werden",
    ". Bei nicht sekundengenau abbildbarem Sachverhalt diese Funk",
    "tion nicht verwenden. Ausgabe in Eingabereihenfolge; Ranggru",
    "ppen sind lückenlos numeriert, kein Grundbuchrang nach879."
  )
)
}
