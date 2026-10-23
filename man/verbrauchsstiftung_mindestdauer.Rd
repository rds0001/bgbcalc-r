% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{verbrauchsstiftung_mindestdauer}
\alias{verbrauchsstiftung_mindestdauer}
\title{verbrauchsstiftung mindestdauer}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{verbrauchsstiftung_mindestdauer(
  errichtungsbeginn_am = NULL,
  errichtungsende_am = NULL,
  beginnart = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{errichtungsbeginn_am}{ISO-Datum des rechtlich bestimmten Beginns des Satzungszeitraums einer Verbrauchsstiftung.}
\item{errichtungsende_am}{ISO-Datum des letzten eingeschlossenen Tages der Errichtungszeit mit Ende am Tagesablauf; nicht vor Beginn.}
\item{beginnart}{ereignis oder tagesbeginn gemäß rechtlich qualifiziertem Satzungsbeginn. Zehn Kalenderjahre statt3650Tage.}
\item{einordnungsnachweis}{Nichtleere Begründung der Verbrauchsstiftung und Zeitbestimmung einschließlich Beginnart und einschließliches Ende.}
}
\details{Zehnjahresende nach qualifizierter Beginnart; festgelegtes einschließliches Ende mindestens so spät. Nur numerische Voraussetzung§82 Satz2; keine Anerkennungsentscheidung, Prognose nachhaltiger Erfüllung oder automatische lineare Vermögensverbrauchsrate. ISO-Daten und berechnete Grenzen0001..9999, explizite Beginnart/Wahrheitswerte soweit gefordert und nichtleerer Nachweis.}
\value{wert enthält zehnjahres_mindestende und mindestdauer_erreicht. Einheit: daten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_82_T0001, BGB_82_T0002}
\examples{
verbrauchsstiftung_mindestdauer(
  errichtungsbeginn_am = "2028-02-29",
  errichtungsende_am = "2038-02-28",
  beginnart = "ereignis",
  einordnungsnachweis = "Qualifizierte Satzungsdauer einer Verbrauchsstiftung."
)
}
