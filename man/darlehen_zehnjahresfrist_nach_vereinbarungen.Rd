% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{darlehen_zehnjahresfrist_nach_vereinbarungen}
\alias{darlehen_zehnjahresfrist_nach_vereinbarungen}
\title{darlehen zehnjahresfrist nach vereinbarungen}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{darlehen_zehnjahresfrist_nach_vereinbarungen(
  vollstaendiger_empfang_am = NULL,
  neue_vereinbarungen_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{vollstaendiger_empfang_am}{ISO-Datum des vollständigen Darlehensempfangs, nicht bloß erster Teilauszahlung.}
\item{neue_vereinbarungen_am}{Liste0..1000 ISO-Daten tatsächlich nach vollständigem Empfang geschlossener, rechtlich nach489I2 berücksichtigungsfähiger neuer Vereinbarungen über Rückzahlungszeit oder Sollzinssatz. Leere Liste nur bei festgestellt keiner solchen Vereinbarung.}
\item{einordnungsnachweis}{Nichtleerer Nachweis489I2, gebundener Sollzins und tatsächliche rechtlich qualifizierte Bezugsereignisse. Eine bloße einseitige Mitteilung oder Teilzahlung ist keine neue Vereinbarung.}
}
\details{Jüngsten qualifizierten Bezugsakt auswählen und zehn Kalenderjahre berechnen. §489I2: Vollständiger Empfang als Ausgangspunkt, bei späteren qualifizierten Vereinbarungen jüngstes Vereinbarungsdatum; ab diesem Ereignistag zehn Kalenderjahre berechnen. Gleichdatierte Vereinbarungen verändern den Ausgangspunkt nicht mehrfach. Sechsmonatige Kündigungsfrist und Zweiwochenrückzahlung489III separat ab ihren jeweils tatsächlichen Auslösern. Keine automatische Fälligkeit, Kündigungserklärung oder Einstufung beliebiger Vertragsänderungen als Fristneustart. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.massgeblicher_bezugstag und zehnjahresfrist_letzter_tag als ISO-Daten. Einheit: daten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_489_T0001, BGB_489_T0002, BGB_489_T0003}
\examples{
darlehen_zehnjahresfrist_nach_vereinbarungen(
  vollstaendiger_empfang_am = "2014-01-31",
  neue_vereinbarungen_am = list(
    
  ),
  einordnungsnachweis = paste0(
    "§489I2: Vollständiger Empfang als Ausgangspunkt, bei spätere",
    "n qualifizierten Vereinbarungen jüngstes Vereinbarungsdatum;",
    " ab diesem Ereignistag zehn Kalenderjahre berechnen. Gleichd",
    "atierte Vereinbarungen verändern den Ausgangspunkt nicht meh",
    "rfach. Sechsmonatige Kündigungsfrist und Zweiwochenrückzahlu",
    "ng489III separat ab ihren jeweils tatsächlichen Auslösern. K",
    "eine automatische Fälligkeit, Kündigungserklärung oder Einst",
    "ufung beliebiger Vertragsänderungen als Fristneustart."
  )
)
}
