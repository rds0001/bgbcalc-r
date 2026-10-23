% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{inventarfrist_ehegatten}
\alias{inventarfrist_ehegatten}
\title{inventarfrist ehegatten}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{inventarfrist_ehegatten(
  fristende_erbe = NULL,
  fristende_anderer_ehegatte = NULL,
  erbschaft_gehoert_zum_gesamtgut = NULL,
  anderer_ehegatte_verwaltet_gesamtgut = NULL,
  frist_auch_gegenueber_anderem_bestimmt = NULL,
  inventar_durch_anderen_errichtet = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{fristende_erbe}{ISO-Datum des rechtlich qualifizierten Inventarfristendes gegenüber dem Erben vor zusätzlicher Verlängerung nach§2008. Sonstige Friständerungen bereits berücksichtigen.}
\item{fristende_anderer_ehegatte}{Optionales qualifiziertes ISO-Fristende gegenüber dem anderen Ehegatten. Erforderlich bei Gesamtgut, dessen alleiniger/gemeinsamer Verwaltung und erfolgter Fristbestimmung. NULL bedeutet kein vorgegebenes Ende, nicht automatisch abgelaufen. Auch unbenötigte Eingaben werden validiert.}
\item{erbschaft_gehoert_zum_gesamtgut}{Expliziter Wahrheitswert zum Anwendungsbereich: Erbe ist Ehegatte und Erbschaft gehört zum Gesamtgut; auch nach Ende der Gütergemeinschaft gemäß Absatz2 entsprechend bestimmen. FALSE ergibt NICHT_ANWENDBAR.}
\item{anderer_ehegatte_verwaltet_gesamtgut}{Expliziter Wahrheitswert: anderer Ehegatte verwaltet Gesamtgut allein oder gemeinsam. Auch nach Ende der Gütergemeinschaft rechtlich entsprechend qualifizieren.}
\item{frist_auch_gegenueber_anderem_bestimmt}{Expliziter Wahrheitswert, ob wirksame Fristbestimmung auch gegenüber anderem Ehegatten erfolgt ist. Bei erforderlicher Mitbestimmung und FALSE kein wirksames Fristende des Erben.}
\item{inventar_durch_anderen_errichtet}{Expliziter Wahrheitswert der rechtlich wirksamen Inventarerrichtung durch anderen Ehegatten; keine bloße Entwurfserstellung und keine Aussage über rückwirkende Heilung versäumter Fristen.}
\item{einordnungsnachweis}{Nichtleerer Nachweis von Gesamtgutzugehörigkeit, Verwaltung, Fristbestimmungen, qualifizierten Fristenden und Inventarerrichtung; gegebenenfalls Fortgeltung nach Ende der Gütergemeinschaft begründen.}
}
\details{Bei Verwaltung durch anderen Ehegatten Fristbestimmung auch ihm gegenüber erforderlich. Bei wirksamer Bestimmung Ende gegenüber Erben auf späteres beider qualifizierten Fristenden anheben. Inventarerrichtung durch anderen kommt Erben zustatten. Fortgeltung nach Ende der Gütergemeinschaft. Keine Gesamthaftungsprüfung oder automatische Heilung früherer Fristversäumnisse. Nur Zusatzbedingung§2008; sonstige Wirksamkeits- und Fristfragen vorqualifiziert. Nicht verwaltender anderer Ehegatte verlängert Frist nicht; Inventarzurechnung nach Satz3 bleibt hiervon getrennt. ISO-Daten0001..9999, explizite Wahrheitswerte und nichtleerer Nachweis.}
\value{wert enthält fristbestimmung_nach_2008_wirksam, inventarfristende_erbe (NULL bei unwirksamer Bestimmung) und inventar_kommt_erben_zustatten. Außerhalb Gesamtgut NICHT_ANWENDBAR. Einheit: daten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2008_T0001, BGB_2008_T0002, BGB_2008_T0003, BGB_2008_T0004}
\examples{
inventarfrist_ehegatten(
  fristende_erbe = "2030-06-15",
  fristende_anderer_ehegatte = "2030-06-30",
  erbschaft_gehoert_zum_gesamtgut = TRUE,
  anderer_ehegatte_verwaltet_gesamtgut = FALSE,
  frist_auch_gegenueber_anderem_bestimmt = FALSE,
  inventar_durch_anderen_errichtet = FALSE,
  einordnungsnachweis = paste0(
    "Synthetisch qualifizierte Gesamtgutzugehörigkeit, Verwaltung",
    " und Inventarfristbestimmungen."
  )
)
}
