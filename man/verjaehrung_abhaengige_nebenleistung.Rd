% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{verjaehrung_abhaengige_nebenleistung}
\alias{verjaehrung_abhaengige_nebenleistung}
\title{verjaehrung abhaengige nebenleistung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{verjaehrung_abhaengige_nebenleistung(
  hauptanspruch_letzter_tag = NULL,
  nebenleistung_eigener_letzter_tag = NULL,
  nebenleistung_abhaengig = NULL,
  fristnachweis = NULL
)}
\arguments{
\item{hauptanspruch_letzter_tag}{ISO-Datum0001..9999 des rechtlich maßgeblichen letzten Tages vor Verjährung des Hauptanspruchs, einschließlich aller für ihn geltenden Fristveränderungen. Nicht bloß seine unmodifizierte Grundfrist.}
\item{nebenleistung_eigener_letzter_tag}{ISO-Datum0001..9999 des rechtlich maßgeblichen letzten Tages vor der eigenen Verjährung dieser Nebenleistung, unabhängig von der zusätzlichen Grenze§217. Frühere eigene Verjährung bleibt erhalten.}
\item{nebenleistung_abhaengig}{Wahrheitswert der rechtlichen Abhängigkeit der konkreten Nebenleistung vom bezeichneten Hauptanspruch im Sinne§217. Nicht jede andere Forderung zwischen denselben Parteien ist abhängig. FALSE ergibt NICHT_ANWENDBAR.}
\item{fristnachweis}{Nichtleere Beschreibung der rechtlichen Abhängigkeit und beider vollständig bestimmten Fristläufe. Hemmungen/Neubeginne je Anspruch korrekt berücksichtigen, nicht erst nach Auswahl dieses Minimums pauschal addieren.}
}
\details{Bei abhängiger Nebenleistung früheren letzten Tag aus Hauptanspruchsverjährung und eigener Nebenleistungsverjährung wählen. Nur Kombination zweier zuvor rechtlich bestimmter Fristgrenzen. Keine automatische Abhängigkeit, Einredeerhebung oder Berechnung der einzelnen Fristläufe. Frühere eigene Nebenleistungsverjährung nicht auf späteren Haupttermin verlängern. ISO-Daten0001..9999, explizite Auswahl/Wahrheitswerte und nichtleerer Nachweis.}
\value{wert ist ISO-Datum des maßgeblichen letzten unverjährten Tages der abhängigen Nebenleistung. Ohne Abhängigkeit NICHT_ANWENDBAR/null. Einheit: datum.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_217_T0001}
\examples{
verjaehrung_abhaengige_nebenleistung(
  hauptanspruch_letzter_tag = "2024-12-31",
  nebenleistung_eigener_letzter_tag = "2024-12-31",
  nebenleistung_abhaengig = TRUE,
  fristnachweis = paste0(
    "Synthetisch abschließend bestimmte eigenständige Fristläufe ",
    "und rechtliche Abhängigkeit."
  )
)
}
