% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{lieferantenregress_verjaehrungsgrundfrist}
\alias{lieferantenregress_verjaehrungsgrundfrist}
\title{lieferantenregress verjaehrungsgrundfrist}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{lieferantenregress_verjaehrungsgrundfrist(
  ablieferung_am = NULL,
  kaeuferanspruch_erfuellt_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{ablieferung_am}{Rechtlich maßgebliches ISO-Datum0001..9999 des benannten Ereignisses; kein bloßes Kenntnis-/Anzeigedatum.}
\item{kaeuferanspruch_erfuellt_am}{Rechtlich maßgebliches ISO-Datum0001..9999 des benannten Ereignisses; kein bloßes Kenntnis-/Anzeigedatum.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des gesetzlichen Anspruchsfalls und beider maßgeblicher Ereignisse; Hemmung/Korrekturen separat.}
}
\details{Späteres Ende aus Ablieferung plus zwei Jahre und Erfüllung des Käuferanspruchs plus zwei Monate Nur§445b Absatz1/2 für qualifizierten Lieferantenregress beim Mangel einer neu hergestellten Sache. Keine historische Fünfjahreskappung. Käuferanspruchserfüllung muss rechtlich bestimmt sein; mehrere Ansprüche/Teilbefriedigungen separat qualifizieren. Nicht digitale Vertriebskette327u. Verjährung anderer437-Ansprüche kann andereGrundfrist haben: hier ausdrücklich zweijährige445a-Aufwendungsersatzgrundfrist. Nur Grundfristen vor Hemmung/Ablaufhemmung/Neubeginn/Feiertagskorrekturen. ISO-Daten und Ergebnisse0001..9999;852EntstehungnichtvorVerletzungsereignis.}
\value{wert enthält beide Teilfristenden und verknüpftes Ende; bei Grundfristfunktionen verknuepftes_grundfristende, beim Nachlauf verknuepftes_fristende; alle letzten eingeschlossenen Tage bisTagesablauf. Einheit: daten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_445b_T0001, BGB_445b_T0002}
\examples{
lieferantenregress_verjaehrungsgrundfrist(
  ablieferung_am = "2028-02-29",
  kaeuferanspruch_erfuellt_am = "2030-01-31",
  einordnungsnachweis = "Qualifizierter445aAufwendungsersatzregress."
)
}
