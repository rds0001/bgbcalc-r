% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{miete_erklaerungs_monatsendtermin}
\alias{miete_erklaerungs_monatsendtermin}
\title{miete erklaerungs monatsendtermin}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{miete_erklaerungs_monatsendtermin(
  fristfall = NULL,
  zugang_erklaerung_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{fristfall}{modernisierung_haerteeinwand_555d, modernisierung_kuendigungserklaerung_555e, modernisierung_beendigung_555e oder mieterhoehung_kuendigungserklaerung_561.}
\item{zugang_erklaerung_am}{ISO-Datum des qualifizierten Zugangs der Modernisierungsankündigung oder Mieterhöhungserklärung; nicht Zugang der späteren Mieterkündigung.}
\item{einordnungsnachweis}{Nichtleerer Nachweis gesetzlicher Anwendbarkeit, erforderlicher ordnungsgemäßer Ankündigung und gegebenenfalls Frist-/Formhinweis.}
}
\details{Kalendermonatsende nach qualifizierter Modernisierungsankündigung oder Erhöhungserklärung. Gesetzliche Grundtermine:555dIII Härteeinwand bis Ende des Folgemonats bei ordnungsgemäßer Ankündigung und anwendbarer Frist; Hinweismangel555dV und unverschuldete Verspätung555dIV gesondert.555eI Kündigungserklärung bis Folgemonatsende, Mietende zum Ende des übernächsten Monats bezogen auf Zugang der Modernisierungsankündigung;555cIV-Ausnahme vorqualifizieren.561I hier ausschließlich letzter Grundtermin der Kündigungserklärung nach Erhöhungserklärung558/559; Beendigungstermin und Wegfall der Erhöhung separat. Keine automatische193Verschiebung von Erklärungsfristen; erforderlichenfalls separat mit qualifiziertem Anwendungsbereich prüfen. Mietbeendigungsdatum nicht deshalb verschieben. Kalenderdaten0001..9999 einschließlich Grenz- und Folgedaten; keine Rundung.}
\value{wert: rechnerischer_monatsendtermin als ISO-Datum; bei Erklärungen nur Grundtermin ohne193Korrektur. Einheit: datum.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_555d_T0004, BGB_555d_T0005, BGB_555e_T0001, BGB_555e_T0002, BGB_561_T0001, BGB_561_T0002}
\examples{
miete_erklaerungs_monatsendtermin(
  fristfall = "modernisierung_haerteeinwand_555d",
  zugang_erklaerung_am = "2024-01-15",
  einordnungsnachweis = paste0(
    "Gesetzliche Grundtermine:555dIII Härteeinwand bis Ende des F",
    "olgemonats bei ordnungsgemäßer Ankündigung und anwendbarer F",
    "rist; Hinweismangel555dV und unverschuldete Verspätung555dIV",
    " gesondert.555eI Kündigungserklärung bis Folgemonatsende, Mi",
    "etende zum Ende des übernächsten Monats bezogen auf Zugang d",
    "er Modernisierungsankündigung;555cIV-Ausnahme vorqualifizier",
    "en.561I hier ausschließlich letzter Grundtermin der Kündigun",
    "gserklärung nach Erhöhungserklärung558/559; Beendigungstermi",
    "n und Wegfall der Erhöhung separat. Keine automatische193Ver",
    "schiebung von Erklärungsfristen; erforderlichenfalls separat",
    " mit qualifiziertem Anwendungsbereich prüfen. Mietbeendigung",
    "sdatum nicht deshalb verschieben."
  )
)
}
