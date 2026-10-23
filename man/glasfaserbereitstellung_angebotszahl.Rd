% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{glasfaserbereitstellung_angebotszahl}
\alias{glasfaserbereitstellung_angebotszahl}
\title{glasfaserbereitstellung angebotszahl}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{glasfaserbereitstellung_angebotszahl(
  anzahl_qualifizierter_angebote = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{anzahl_qualifizierter_angebote}{Nichtnegative ganze Anzahl tatsächlich vor Vereinbarung eingeholter, rechtlich als eigenständige Angebote qualifizierter Angebote; keine mehrfach gezählten Kopien.}
\item{einordnungsnachweis}{Nichtleerer Nachweis556IIIa: aufwändige Maßnahme und rechtliche Qualifikation/Einholung der Angebote. Möglichkeit weiterer Angebote und Wirtschaftlichkeit gesondert prüfen.}
}
\details{Qualifizierte Angebotsanzahl mit gesetzlicher Zahl drei vergleichen. §556IIIa: Anzahl qualifizierter rechtzeitig eingeholter Angebote mit drei vergleichen und fehlende Zahl bis drei berechnen. Der Gesetzesvorbehalt soweit möglich und die Auswahl des wirtschaftlichsten Angebots werden nicht automatisch entschieden. Weniger als drei bedeutet daher kein automatisch unwirksames Bereitstellungsentgelt; drei oder mehr beweist keine Wirtschaftlichkeit. Keine TKG-Entgelthöhen oder erfundenen Kostenkennzahlen. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.mindestens_drei_angebote als Wahrheitswert und fehlende_angebote_bis_drei als nichtnegative ganze Zahl. Einheit: anzahl_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_556_T0014, BGB_556_T0015}
\examples{
glasfaserbereitstellung_angebotszahl(
  anzahl_qualifizierter_angebote = 0,
  einordnungsnachweis = paste0(
    "§556IIIa: Anzahl qualifizierter rechtzeitig eingeholter Ange",
    "bote mit drei vergleichen und fehlende Zahl bis drei berechn",
    "en. Der Gesetzesvorbehalt soweit möglich und die Auswahl des",
    " wirtschaftlichsten Angebots werden nicht automatisch entsch",
    "ieden. Weniger als drei bedeutet daher kein automatisch unwi",
    "rksames Bereitstellungsentgelt; drei oder mehr beweist keine",
    " Wirtschaftlichkeit. Keine TKG-Entgelthöhen oder erfundenen ",
    "Kostenkennzahlen."
  )
)
}
