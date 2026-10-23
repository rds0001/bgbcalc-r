% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{nottestament_grundfrist}
\alias{nottestament_grundfrist}
\title{nottestament grundfrist}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{nottestament_grundfrist(
  errichtung_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{errichtung_am}{ISO-Datum YYYY-MM-DD der rechtlich qualifizierten Nottestamentserrichtung2249/2250/2251.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des Fristtatbestands. Ergebnis rohe Grundfrist, Hemmung2252II/UnterbrechungIII gesondert.}
}
\details{Drei Kalendermonate ab Errichtung als Ereignisfrist nach187/188. Keine Hemmung2252II oder neue ReiseIII berücksichtigt. Kein Gültigkeitsurteil bei Fortleben/Tod/TodeserklärungIV. Keine automatische193-Verschiebung. Kalenderdaten ISO YYYY-MM-DD im Bereich0001..9999, Pflichtwahrheitswerte und nichtleerer Nachweis. Fehlende Pflichteingabe EINGABE_FEHLT; ungültige Eingabe oder Datumsüberlauf EINGABE_UNGUELTIG.}
\value{wert ist ISO-Datum der rohen Dreimonatsgrundfrist. Einheit: datum.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2252_T0001}
\examples{
nottestament_grundfrist(
  errichtung_am = "2024-01-31",
  einordnungsnachweis = "Synthetisch qualifizierter Errichtungstag."
)
}
