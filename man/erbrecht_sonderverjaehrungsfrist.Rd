% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{erbrecht_sonderverjaehrungsfrist}
\alias{erbrecht_sonderverjaehrungsfrist}
\title{erbrecht sonderverjaehrungsfrist}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{erbrecht_sonderverjaehrungsfrist(
  erbfall_am = NULL,
  anspruchsart = NULL,
  korrigiertes_fristende = NULL,
  prueftag = NULL,
  anspruchsgrundlage_qualifiziert = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{erbfall_am}{ISO-Datum des Erbfalls; unmittelbar fristauslösendes Ereignis, kein Jahresendbeginn.}
\item{anspruchsart}{vertragserbe_schenkung für§2287 oder pflichtteil_beschenkter für§2329 mit§2332 Absatz1; kein gewöhnlicher Pflichtteilsanspruch gegen Erben.}
\item{korrigiertes_fristende}{Erforderliches rechtlich qualifiziertes ISO-Ende einschließlich einschlägiger Hemmung, Ablaufhemmung und zulässiger Kalenderkorrektur, mindestens rohe Dreijahresgrenze. Ohne solche Korrektur rohe Grenze ausdrücklich angeben. Unbekannte Korrekturen nicht mit erfundenem Datum ersetzen.}
\item{prueftag}{ISO-Datum mindestens Erbfall; Ergebnis nach vollständigem Ablauf dieses Tages.}
\item{anspruchsgrundlage_qualifiziert}{Expliziter Wahrheitswert: ausgewählte Anspruchsgrundlage gegen Beschenkten und Betrachtung der ursprünglichen gesetzlichen Frist vorqualifiziert. FALSE ergibt NICHT_ANWENDBAR. Neubeginn, Titulierung und abweichende Vereinbarungen außerhalb.}
\item{einordnungsnachweis}{Nichtleere Begründung des Anspruchstyps, Erbfalls und konkreter Fristkorrekturen. Erforderliche Ausschlagung begründet nach§2332 Absatz2 allein keine Hemmung; nicht mit anderem Hemmungsgrund verwechseln.}
}
\details{Dreijährige regelmäßige Dauer nach§195 unmittelbar ab Erbfall gemäß Sonderbeginn§2287II oder§2332I. Kein Kenntnis-/Jahresendbeginn. Qualifiziert korrigiertes Ende vergleichen. Keine Anspruchsberechnung oder automatische Hemmung. Neubeginn, Titulierung, abweichende Vereinbarungen außerhalb. Keine Einredeerhebung oder Forderungserlöschung. ISO-Daten0001..9999 einschließlich berechneter Grenzen, feste Auswahlwerte und expliziter Wahrheitswert.}
\value{wert enthält grundfristende, massgebliches_fristende, frist_am_prueftag_abgelaufen. Einheit: daten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_195_T0001, BGB_199_T0001, BGB_2287_T0002, BGB_2332_T0001, BGB_2332_T0002}
\examples{
erbrecht_sonderverjaehrungsfrist(
  erbfall_am = "2024-02-29",
  anspruchsart = "vertragserbe_schenkung",
  korrigiertes_fristende = "2027-02-28",
  prueftag = "2027-02-27",
  anspruchsgrundlage_qualifiziert = TRUE,
  einordnungsnachweis = paste0(
    "Synthetisch qualifizierter Anspruch gegen Beschenkten ohne F",
    "ristkorrektur."
  )
)
}
