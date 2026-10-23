% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{miete_erwerber_monatsgrenze}
\alias{miete_erwerber_monatsgrenze}
\title{miete erwerber monatsgrenze}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{miete_erwerber_monatsgrenze(
  regelfall = NULL,
  massgebliches_ereignis_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{regelfall}{Genau vorausverfuegung_566b (Eigentumsübergang maßgeblich) oder mietergeschaeft_566c (Kenntnis des Mieters vom Eigentumsübergang maßgeblich).}
\item{massgebliches_ereignis_am}{Qualifizierter maßgeblicher TagYYYY-MM-DD entsprechend regelfall. Datum des Eigentumsübergangs nicht mit Kaufvertragsschluss verwechseln; Kenntnistag bei566c eigenständig bestimmen.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des Normfalls und Ereignistags; weitere Kenntnis-/Chronologieausnahmen gesondert geprüft.}
}
\details{Bis einschließlich Tag15 das laufende Monatsende, ab Tag16 das Ende des Folgemonats als zeitliche Mietgrenze bestimmen. §566bI und566cSatz1/2: nur zeitliche Grundgrenze der erfassten Mietzeiträume. Ereignis am15. verlängert nicht, am16. verlängert um einen Kalendermonat. Bei566bII kann Kenntnis des Erwerbers weitergehende Vorausverfügungen wirksam werden lassen; bei566cSatz3 kann ein nach Eigentumsübergang mit Kenntnis vorgenommenes Mietergeschaft trotz dieses Zeitfensters unwirksam sein. Diese Ausnahmen nicht aus dem Datumsresultat ableiten. Für566d ist die zeitliche Grenze nur ein Bestandteil; Erwerbs-/Fälligkeitschronologie der Gegenforderung separat. Keine Kündigungsfrist, keine automatische193Verschiebung und kein Wirksamkeitsentscheid. Kalenderdaten0001..9999 einschließlich Grenz- und Folgedaten; keine Rundung.}
\value{wert: zeitliche_mietgrenzeYYYY-MM-DD einschließlich dieses Monatsendes, folgemonat_einbezogen als Wahrheitswert. Einheit: datum_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_566b_T0001, BGB_566b_T0002, BGB_566b_T0003, BGB_566c_T0001, BGB_566c_T0002, BGB_566c_T0003, BGB_566d_T0001, BGB_566d_T0002}
\examples{
miete_erwerber_monatsgrenze(
  regelfall = "vorausverfuegung_566b",
  massgebliches_ereignis_am = "2024-01-15",
  einordnungsnachweis = paste0(
    "§566bI und566cSatz1/2: nur zeitliche Grundgrenze der erfasst",
    "en Mietzeiträume. Ereignis am15. verlängert nicht, am16. ver",
    "längert um einen Kalendermonat. Bei566bII kann Kenntnis des ",
    "Erwerbers weitergehende Vorausverfügungen wirksam werden las",
    "sen; bei566cSatz3 kann ein nach Eigentumsübergang mit Kenntn",
    "is vorgenommenes Mietergeschaft trotz dieses Zeitfensters un",
    "wirksam sein. Diese Ausnahmen nicht aus dem Datumsresultat a",
    "bleiten. Für566d ist die zeitliche Grenze nur ein Bestandtei",
    "l; Erwerbs-/Fälligkeitschronologie der Gegenforderung separa",
    "t. Keine Kündigungsfrist, keine automatische193Verschiebung ",
    "und kein Wirksamkeitsentscheid."
  )
)
}
