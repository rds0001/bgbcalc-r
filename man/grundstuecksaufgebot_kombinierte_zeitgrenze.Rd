% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{grundstuecksaufgebot_kombinierte_zeitgrenze}
\alias{grundstuecksaufgebot_kombinierte_zeitgrenze}
\title{grundstuecksaufgebot kombinierte zeitgrenze}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{grundstuecksaufgebot_kombinierte_zeitgrenze(
  berechnetes_eigenbesitzfristende = NULL,
  letzte_massgebliche_zustimmungseintragung_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{berechnetes_eigenbesitzfristende}{Vollständig mit Ersitzungszeitkette beziehungsweise Kalenderkern berechnetes30-Jahresende der qualifizierten BesitzzeitYYYY-MM-DD; keine ungeprüfte Rohfrist.}
\item{letzte_massgebliche_zustimmungseintragung_am}{Letzte rechtlich unter927I3 fallende zustimmungsbedürftige EintragungYYYY-MM-DD. Null nur wenn diese Zusatzgrenze rechtlich nicht greift oder nach vollständig geprüfter Historie keine solche Eintragung vorliegt; nicht bei unbekannter Historie.}
\item{einordnungsnachweis}{Nichtleerer Nachweis der Besitzfristberechnung, Anwendbarkeit der Grundbuchruhegrenze und der relevanten Eintragungshistorie. Tod/Verschollenheit und gerichtliche Voraussetzungen separat.}
}
\details{30Jährige Grundbuchruhe seit qualifizierter Zustimmungseintragung berechnen und mit bereits berechneter Besitzfrist als spätestes Ende verknüpfen. §927I: berechnetes Ende der30jährigen Eigenbesitzzeit mit gegebenenfalls zusätzlicher30jähriger Grundbuchruhe seit letzter eigentümerzustimmungsbedürftiger Eintragung als späteste Zeitgrenze verknüpfen. Besitzfrist zuvor einschließlich rechtlich wirksamer Hemmung, Unterbrechung und Zurechnung berechnen; ersitzung_anrechenbare_zeitkette stellt den numerischen Kern bereit. Grundbuchruhe nicht unbesehen um die Besitzhemmung verlängern. Null bei Eintragung darf keine ungeprüfte oder unbekannte Historie verdecken. Ausschließlich Zeitrechnung; kein Urteil über Tod/Verschollenheit, Aufgebotszulässigkeit, Ausschließungsbeschluss oder Eigentumserwerb. Erfüllung erst nach vollständigem Ablauf des jeweiligen Endtags; keine automatische193-Verschiebung. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.grundbuchruhefristende (Datum oder null) und wert.rechnerische_kombinierte_zeitgrenze alsYYYY-MM-DD. Einheit: daten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_927_T0001, BGB_927_T0002, BGB_927_T0003}
\examples{
grundstuecksaufgebot_kombinierte_zeitgrenze(
  berechnetes_eigenbesitzfristende = "2024-01-31",
  letzte_massgebliche_zustimmungseintragung_am = "1995-06-30",
  einordnungsnachweis = paste0(
    "§927I: berechnetes Ende der30jährigen Eigenbesitzzeit mit ge",
    "gebenenfalls zusätzlicher30jähriger Grundbuchruhe seit letzt",
    "er eigentümerzustimmungsbedürftiger Eintragung als späteste ",
    "Zeitgrenze verknüpfen. Besitzfrist zuvor einschließlich rech",
    "tlich wirksamer Hemmung, Unterbrechung und Zurechnung berech",
    "nen; ersitzung_anrechenbare_zeitkette stellt den numerischen",
    " Kern bereit. Grundbuchruhe nicht unbesehen um die Besitzhem",
    "mung verlängern. Null bei Eintragung darf keine ungeprüfte o",
    "der unbekannte Historie verdecken. Ausschließlich Zeitrechnu",
    "ng; kein Urteil über Tod/Verschollenheit, Aufgebotszulässigk",
    "eit, Ausschließungsbeschluss oder Eigentumserwerb. Erfüllung",
    " erst nach vollständigem Ablauf des jeweiligen Endtags; kein",
    "e automatische193-Verschiebung."
  )
)
}
