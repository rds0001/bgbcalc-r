% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{vergleichswohnungen_mindestzahl}
\alias{vergleichswohnungen_mindestzahl}
\title{vergleichswohnungen mindestzahl}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{vergleichswohnungen_mindestzahl(
  anzahl_vergleichswohnungen = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{anzahl_vergleichswohnungen}{Nichtnegative ganze Anzahl im gemeinsamen exakten Zahlenbereich.}
\item{einordnungsnachweis}{Nichtleerer Nachweis zu maßgeblicher Vergleichsbasis und rechtlicher Einordnung; keine Gesamtentscheidung allein aus Zahlen.}
}
\details{Anzahl qualifizierter Vergleichswohnungen mit drei vergleichen und fehlende Anzahl bestimmen. Nur numerische Mindestzahl nach558aII Nummer4. Wohnungen müssen tatsächlich verschieden und rechtlich vergleichbar sein; Benennung und entsprechende Entgelte vorqualifizieren. Drei Wohnungen genügen als dieser Begründungsweg, entscheiden aber keine materielle Mieterhöhung. Kein Ersatz für notwendige Mietspiegelangaben nachAbsatz3. Nichtnegative Eingaben; Kostendifferenz kann negativ sein. Keine automatische Rundung.}
\value{wert enthält mindestzahl, fehlende_wohnungen, mindestzahl_erreicht. Beträge als exakte Brüche, Anzahlen als Ganzzahlen, Vergleiche als Wahrheitswerte. Einheit: zahlen_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_558a_T0001, BGB_558a_T0002, BGB_558a_T0003, BGB_558a_T0004, BGB_558a_T0005, BGB_558a_T0006, BGB_558a_T0007, BGB_558a_T0008, BGB_558a_T0009, BGB_558a_T0010}
\examples{
vergleichswohnungen_mindestzahl(
  anzahl_vergleichswohnungen = 0,
  einordnungsnachweis = paste0(
    "Nur numerische Mindestzahl nach558aII Nummer4. Wohnungen müs",
    "sen tatsächlich verschieden und rechtlich vergleichbar sein;",
    " Benennung und entsprechende Entgelte vorqualifizieren. Drei",
    " Wohnungen genügen als dieser Begründungsweg, entscheiden ab",
    "er keine materielle Mieterhöhung. Kein Ersatz für notwendige",
    " Mietspiegelangaben nachAbsatz3."
  )
)
}
