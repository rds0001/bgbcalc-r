% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{touristische_leistung_wertanteil}
\alias{touristische_leistung_wertanteil}
\title{touristische leistung wertanteil}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{touristische_leistung_wertanteil(
  touristischer_teilwert = NULL,
  gesamtwert_zusammenstellung = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{touristischer_teilwert}{Nichtnegativer qualifizierter EUR-Wert der zusätzlichen touristischen Leistungen, höchstens Gesamtwert.}
\item{gesamtwert_zusammenstellung}{Strikt positiver qualifizierter EUR-Gesamtwert derselben Zusammenstellung auf konsistenter Bewertungsbasis.}
\item{einordnungsnachweis}{Nichtleerer Nachweis zu maßgeblicher Vergleichsbasis und rechtlicher Einordnung; keine Gesamtentscheidung allein aus Zahlen.}
}
\details{Touristischen Teilwert durch positiven Gesamtwert teilen; Anteil strikt mit25Prozent vergleichen. §651aIV: nur rechnerischer touristischer Wertanteil in einer qualifizierten Zusammenstellung aus einer Art651aIII1bis3 und zusätzlichen touristischen Leistungen. Genau25Prozent ist nicht weniger als25Prozent. Teil-/Gesamtwerte derselben Bewertungsbasis, Gesamtwert strikt positiv, Teilwert höchstens Gesamtwert. Wesentliches Merkmal/Bewerbung sowie spätere Auswahl bleiben gesondert; ein kleiner Anteil allein schließt Pauschalreiserecht nicht aus. Keine automatische Bewertung aus unbekannten Einzelpreisen. Nichtnegative exakte Eingaben; bei Wertanteil positiver Gesamtwert. Keine automatische Rundung.}
\value{wert enthält wertanteil, wertanteil_prozent, unter_25_prozent. Beträge als exakte Brüche, Anzahlen als Ganzzahlen, Vergleiche als Wahrheitswerte. Einheit: zahlen_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_651a_T0001, BGB_651a_T0002, BGB_651a_T0003, BGB_651a_T0004, BGB_651a_T0005, BGB_651a_T0006, BGB_651a_T0007, BGB_651a_T0008, BGB_651a_T0009, BGB_651a_T0010, BGB_651a_T0011, BGB_651a_T0012, BGB_651a_T0013, BGB_651a_T0014, BGB_651a_T0015, BGB_651a_T0016, BGB_651a_T0017, BGB_651a_T0018, BGB_651a_T0019, BGB_651a_T0020, BGB_651a_T0021, BGB_651a_T0022, BGB_651a_T0023}
\examples{
touristische_leistung_wertanteil(
  touristischer_teilwert = "24.99",
  gesamtwert_zusammenstellung = "100",
  einordnungsnachweis = paste0(
    "§651aIV: nur rechnerischer touristischer Wertanteil in einer",
    " qualifizierten Zusammenstellung aus einer Art651aIII1bis3 u",
    "nd zusätzlichen touristischen Leistungen. Genau25Prozent ist",
    " nicht weniger als25Prozent. Teil-/Gesamtwerte derselben Bew",
    "ertungsbasis, Gesamtwert strikt positiv, Teilwert höchstens ",
    "Gesamtwert. Wesentliches Merkmal/Bewerbung sowie spätere Aus",
    "wahl bleiben gesondert; ein kleiner Anteil allein schließt P",
    "auschalreiserecht nicht aus. Keine automatische Bewertung au",
    "s unbekannten Einzelpreisen."
  )
)
}
