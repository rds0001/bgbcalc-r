% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{nachlass_dreissigster_zeitraum}
\alias{nachlass_dreissigster_zeitraum}
\title{nachlass dreissigster zeitraum}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{nachlass_dreissigster_zeitraum(
  erbfall_am = NULL,
  prueftag = NULL,
  familienangehoeriger = NULL,
  hausstandszugehoerigkeit_bei_erbfall = NULL,
  unterhalt_vom_erblasser_bezogen = NULL,
  abweichende_letztwillige_anordnung = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{erbfall_am}{ISO-Datum des Todes/Erbfalls; Ereignistag wird nicht mitgezählt.}
\item{prueftag}{ISO-Datum ab Erbfall einschließlich; Prüfung eines Kalendertages.}
\item{familienangehoeriger}{Expliziter Wahrheitswert der rechtlich qualifizierten Familienangehörigkeit zum Erblasser.}
\item{hausstandszugehoerigkeit_bei_erbfall}{Expliziter Wahrheitswert der Zugehörigkeit zum Hausstand gerade im Todeszeitpunkt, nicht nur früherer gemeinsamer Wohnsitz.}
\item{unterhalt_vom_erblasser_bezogen}{Expliziter Wahrheitswert des relevanten tatsächlichen Unterhaltsbezugs vom Erblasser. Abstrakte gesetzliche Unterhaltsberechtigung genügt nicht automatisch.}
\item{abweichende_letztwillige_anordnung}{Expliziter Wahrheitswert einer rechtlich wirksamen abweichenden letztwilligen Anordnung. TRUE ergibt NICHT_ANWENDBAR; die Anordnung kann den Anspruch verändern, erweitern oder ausschließen und wird nicht automatisch ausgelegt.}
\item{einordnungsnachweis}{Nichtleere Begründung der familiären, hausstandsbezogenen und unterhaltsbezogenen Einordnung sowie der letztwilligen Anordnungen.}
}
\details{Erbfalltag nicht mitzählen. Gesetzlicher Zeitraum vom Folgetag bis zum dreißigsten Folgetag einschließlich. Familienangehörigkeit, Hausstand im Todeszeitpunkt und Unterhaltsbezug kumulativ; Prüftag innerhalb beider Grenzen. Abweichende letztwillige Anordnung verlangt individuelle Auslegung und ergibt NICHT_ANWENDBAR. Nur Zeit- und persönliche Voraussetzungen; Vermächtnisvorschriften nach Absatz2, Einwendungen und Haftungsbeschränkungen separat. Keine Monetarisierung des Unterhalts oder der Wohnungs-/Hausratsbenutzung. Keine automatische Feiertagsverschiebung des Versorgungszeitraums. ISO-Daten und berechnete Grenzen0001..9999, explizite Wahrheitswerte und nichtleerer Nachweis.}
\value{wert enthält zeitraumbeginn, zeitraumende, persoenliche_voraussetzungen_erfuellt, prueftag_im_zeitraum und gesetzliche_zeit_und_personenvoraussetzungen_erfuellt. Keine abschließende Anspruchsentscheidung. Abweichende Anordnung ergibt wert=null. Einheit: daten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1969_T0001, BGB_1969_T0002, BGB_1969_T0003}
\examples{
nachlass_dreissigster_zeitraum(
  erbfall_am = "2030-01-31",
  prueftag = "2030-03-02",
  familienangehoeriger = FALSE,
  hausstandszugehoerigkeit_bei_erbfall = FALSE,
  unterhalt_vom_erblasser_bezogen = FALSE,
  abweichende_letztwillige_anordnung = FALSE,
  einordnungsnachweis = paste0(
    "Synthetisch qualifizierter Familienangehöriger im Hausstand ",
    "mit tatsächlichem Unterhaltsbezug."
  )
)
}
