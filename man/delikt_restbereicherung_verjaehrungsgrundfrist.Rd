% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{delikt_restbereicherung_verjaehrungsgrundfrist}
\alias{delikt_restbereicherung_verjaehrungsgrundfrist}
\title{delikt restbereicherung verjaehrungsgrundfrist}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{delikt_restbereicherung_verjaehrungsgrundfrist(
  anspruch_entstanden_am = NULL,
  verletzungsereignis_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{anspruch_entstanden_am}{Rechtlich maßgebliches ISO-Datum0001..9999 des benannten Ereignisses; kein bloßes Kenntnis-/Anzeigedatum.}
\item{verletzungsereignis_am}{Rechtlich maßgebliches ISO-Datum0001..9999 des benannten Ereignisses; kein bloßes Kenntnis-/Anzeigedatum.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des gesetzlichen Anspruchsfalls und beider maßgeblicher Ereignisse; Hemmung/Korrekturen separat.}
}
\details{Früheres Ende aus Entstehung des Restbereicherungsanspruchs plus zehn Jahre und Verletzungshandlung/sonstigem auslösendem Ereignis plus dreißig Jahre Nur§852 Restbereicherung nach deliktischem Erlangen auf Kosten des Verletzten, keine allgemeine Schadensersatzverjährung oder Anspruchshöhe. Maßgebliches auslösendes Ereignis rechtlich qualifizieren; Entstehung nicht vor Ereignis. Kenntnis ist hier kein Beginnparameter. Herausgabeumfang nachBereicherungsrecht gesondert. Nur Grundfristen vor Hemmung/Ablaufhemmung/Neubeginn/Feiertagskorrekturen. ISO-Daten und Ergebnisse0001..9999;852EntstehungnichtvorVerletzungsereignis.}
\value{wert enthält beide Teilfristenden und verknüpftes Ende; bei Grundfristfunktionen verknuepftes_grundfristende, beim Nachlauf verknuepftes_fristende; alle letzten eingeschlossenen Tage bisTagesablauf. Einheit: daten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_852_T0001, BGB_852_T0002}
\examples{
delikt_restbereicherung_verjaehrungsgrundfrist(
  anspruch_entstanden_am = "2028-02-29",
  verletzungsereignis_am = "2000-02-29",
  einordnungsnachweis = "Qualifizierter852RestbereicherungsanspruchundEreignisse."
)
}
