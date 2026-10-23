% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{reiseleistungsarten_mindestzahl}
\alias{reiseleistungsarten_mindestzahl}
\title{reiseleistungsarten mindestzahl}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{reiseleistungsarten_mindestzahl(
  anzahl_verschiedener_reiseleistungsarten = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{anzahl_verschiedener_reiseleistungsarten}{Nichtnegative ganze Zahl rechtlich verschiedener Reiseleistungsarten derselben Reise nach651aIII; keine bloße Anzahl einzelner Leistungserbringer.}
\item{einordnungsnachweis}{Nichtleerer Nachweis zu maßgeblicher Vergleichsbasis und rechtlicher Einordnung; keine Gesamtentscheidung allein aus Zahlen.}
}
\details{Zahl rechtlich verschiedener Reiseleistungsarten mit mindestens zwei vergleichen. Nur numerische Mindestzahl651aII/651bI; rechtlich verschiedene Arten nach651aIII für dieselbe Reise vorqualifizieren. Mehrere Hotels sind nicht automatisch mehrere Arten. Wesensmäßige Bestandteile anderer Leistungen nicht doppelt zählen. Weitere Voraussetzungen, touristische Nebenleistungsgrenzen und Ausnahmen separat; Ergebnis ist keine abschließende Pauschalreiseentscheidung. Nichtnegative exakte Eingaben; bei Wertanteil positiver Gesamtwert. Keine automatische Rundung.}
\value{wert enthält mindestzahl, fehlende_arten, mindestzahl_erreicht. Beträge als exakte Brüche, Anzahlen als Ganzzahlen, Vergleiche als Wahrheitswerte. Einheit: zahlen_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_651a_T0001, BGB_651a_T0002, BGB_651a_T0003, BGB_651a_T0004, BGB_651a_T0005, BGB_651a_T0006, BGB_651a_T0007, BGB_651a_T0008, BGB_651a_T0009, BGB_651a_T0010, BGB_651a_T0011, BGB_651a_T0012, BGB_651a_T0013, BGB_651a_T0014, BGB_651a_T0015, BGB_651a_T0016, BGB_651a_T0017, BGB_651a_T0018, BGB_651a_T0019, BGB_651a_T0020, BGB_651a_T0021, BGB_651a_T0022, BGB_651a_T0023, BGB_651b_T0001, BGB_651b_T0002, BGB_651b_T0003, BGB_651b_T0004, BGB_651b_T0005, BGB_651b_T0006, BGB_651b_T0007}
\examples{
reiseleistungsarten_mindestzahl(
  anzahl_verschiedener_reiseleistungsarten = 0,
  einordnungsnachweis = paste0(
    "Nur numerische Mindestzahl651aII/651bI; rechtlich verschiede",
    "ne Arten nach651aIII für dieselbe Reise vorqualifizieren. Me",
    "hrere Hotels sind nicht automatisch mehrere Arten. Wesensmäß",
    "ige Bestandteile anderer Leistungen nicht doppelt zählen. We",
    "itere Voraussetzungen, touristische Nebenleistungsgrenzen un",
    "d Ausnahmen separat; Ergebnis ist keine abschließende Pausch",
    "alreiseentscheidung."
  )
)
}
