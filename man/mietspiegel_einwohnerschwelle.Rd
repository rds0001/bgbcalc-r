% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{mietspiegel_einwohnerschwelle}
\alias{mietspiegel_einwohnerschwelle}
\title{mietspiegel einwohnerschwelle}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{mietspiegel_einwohnerschwelle(
  einwohnerzahl = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{einwohnerzahl}{Nichtnegative ganze Anzahl im gemeinsamen exakten Zahlenbereich.}
\item{einordnungsnachweis}{Nichtleerer Nachweis zu maßgeblicher Vergleichsbasis und rechtlicher Einordnung; keine Gesamtentscheidung allein aus Zahlen.}
}
\details{Gemeindeeinwohnerzahl strikt mit50000 vergleichen. Nur numerische Schwelle nach558cIV2; rechtlich maßgebliche Einwohnerzahl der betreffenden Gemeinde vorgeben. Genau50000 erfüllt die strikte Überschreitung nicht. Unterhalb der Schwelle kann weiterhin ein Bedürfnis nachAbsatz4Satz1 bestehen; keine allgemeine Befreiung von Aufgaben und keine automatische Mietspiegelerstellung. Nichtnegative Eingaben; Kostendifferenz kann negativ sein. Keine automatische Rundung.}
\value{wert enthält einwohnergrenze, grenze_ueberschritten. Beträge als exakte Brüche, Anzahlen als Ganzzahlen, Vergleiche als Wahrheitswerte. Einheit: zahlen_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_558c_T0001, BGB_558c_T0002, BGB_558c_T0003, BGB_558c_T0004, BGB_558c_T0005, BGB_558c_T0006, BGB_558c_T0007}
\examples{
mietspiegel_einwohnerschwelle(
  einwohnerzahl = 0,
  einordnungsnachweis = paste0(
    "Nur numerische Schwelle nach558cIV2; rechtlich maßgebliche E",
    "inwohnerzahl der betreffenden Gemeinde vorgeben. Genau50000 ",
    "erfüllt die strikte Überschreitung nicht. Unterhalb der Schw",
    "elle kann weiterhin ein Bedürfnis nachAbsatz4Satz1 bestehen;",
    " keine allgemeine Befreiung von Aufgaben und keine automatis",
    "che Mietspiegelerstellung."
  )
)
}
