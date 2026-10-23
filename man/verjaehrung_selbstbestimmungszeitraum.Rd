% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{verjaehrung_selbstbestimmungszeitraum}
\alias{verjaehrung_selbstbestimmungszeitraum}
\title{verjaehrung selbstbestimmungszeitraum}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{verjaehrung_selbstbestimmungszeitraum(
  fristlauf_erster_tag = NULL,
  grundfrist_letzter_tag = NULL,
  geburtsdatum = NULL,
  gemeinschaft_bei_fristbeginn = NULL,
  letzter_gemeinschaftstag = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{fristlauf_erster_tag}{Erster rechtlich qualifizierter Verjährungslauftag alsISO-Datum.}
\item{grundfrist_letzter_tag}{Letzter Tag ohne diese Hemmung, nicht vor erstem Fristtag.}
\item{geburtsdatum}{ISO-Geburtstag des Anspruchsgläubigers, nicht nach Fristbeginn.}
\item{gemeinschaft_bei_fristbeginn}{Expliziter Wahrheitswert, ob bei Verjährungsbeginn häusliche Gemeinschaft mit Schuldner bestand.}
\item{letzter_gemeinschaftstag}{BeiTRUE Pflichtdatum des letzten eingeschlossenen Hemmungstags der ununterbrochenen anfänglichen Gemeinschaft; beiFALSE NULL. Kein Auswertungsstichtag einer laufenden Gemeinschaft.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des208-Anspruchs und der rechtlich normalisierten zeitlichen Voraussetzungen.}
}
\details{Altersintervall bis Tag vor21 und gegebenenfalls anfängliches Gemeinschaftsintervall bilden; vorhandener209-Kern zählt Vereinigungsdauer und verschiebt Fristablauf. Nur208-Ansprüche, keine neu begonnene spätere Gemeinschaft. Andere Hemmungen/Ablaufhemmung/Neubeginn und193 separat. ISO-Daten und Ergebnisse0001..9999 mit darstellbarer21-Jahresgrenze.}
\value{wert enthält rechnerischer_letzter_tag und beruecksichtigte_hemmungstage. Einheit: datum_und_tage.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_208_T0001, BGB_208_T0002}
\examples{
verjaehrung_selbstbestimmungszeitraum(
  fristlauf_erster_tag = "2030-01-01",
  grundfrist_letzter_tag = "2030-01-10",
  geburtsdatum = "2009-01-10",
  gemeinschaft_bei_fristbeginn = TRUE,
  letzter_gemeinschaftstag = "2030-01-20",
  einordnungsnachweis = paste0(
    "Qualifizierter208-Anspruch, anfängliche Gemeinschaft mit tat",
    "sächlichem Ende."
  )
)
}
