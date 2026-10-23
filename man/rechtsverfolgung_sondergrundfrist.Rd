% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{rechtsverfolgung_sondergrundfrist}
\alias{rechtsverfolgung_sondergrundfrist}
\title{rechtsverfolgung sondergrundfrist}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{rechtsverfolgung_sondergrundfrist(
  fristfall = NULL,
  ereignis_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{fristfall}{eilverfahren_zustellung_204, behoerdliche_vorentscheidung_204, gerichtsstandsbestimmung_204 oder verbandsunterlassung_zustellung_204a.}
\item{ereignis_am}{ISO-Datum des für den ausgewählten Fall gesetzlich maßgeblichen Ereignisses; Zuordnung im Nachweis belegen.}
\item{einordnungsnachweis}{Nichtleerer Nachweis von Fall, Fristauslöser und rechtlich erforderlichen gesonderten Fristkorrekturen.}
}
\details{Gesetzlich ausgewählte Ein- oder Dreimonats-Ereignisgrundfrist mit vorhandenem Kalenderkern berechnen. §204I9: maßgebliche Verkündung oder Zustellung an Gläubiger, danach Monatsfrist zur Zustellung an Schuldner.204I12: Erledigung des behördlichen Gesuchs, danach drei Monate für Klage/zulässigen Folgeantrag;204I13 entsprechend nach Erledigung des Gerichtsstandsbestimmungsgesuchs.204aI2: maßgebliche Verkündung oder Zustellung der einstweiligen Verfügung an Antragsteller, danach Monat zur Zustellung an Antragsgegner. Fristauslöser rechtlich vorqualifizieren, nicht Antragseinreichung oder Kenntnis frei einsetzen. Nur Grundfristen: entsprechende206/210/211-Korrekturen nach204III für die dort genannten204-Fälle zusätzlich, keine ungeprüfte Übertragung dieses Verweises auf204aI2.193 bei feststehender Anwendung gesondert. Keine automatische Hemmungs-/Rückwirkungsentscheidung, keine Berechnung aus dem KapMuG außerhalb desBGB. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.rechnerisches_fristende alsYYYY-MM-DD vor gesonderten Korrekturen. Einheit: datum.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_204_T0016, BGB_204_T0021, BGB_204_T0022, BGB_204_T0027, BGB_204a_T0010}
\examples{
rechtsverfolgung_sondergrundfrist(
  fristfall = "eilverfahren_zustellung_204",
  ereignis_am = "2024-01-31",
  einordnungsnachweis = paste0(
    "§204I9: maßgebliche Verkündung oder Zustellung an Gläubiger,",
    " danach Monatsfrist zur Zustellung an Schuldner.204I12: Erle",
    "digung des behördlichen Gesuchs, danach drei Monate für Klag",
    "e/zulässigen Folgeantrag;204I13 entsprechend nach Erledigung",
    " des Gerichtsstandsbestimmungsgesuchs.204aI2: maßgebliche Ve",
    "rkündung oder Zustellung der einstweiligen Verfügung an Antr",
    "agsteller, danach Monat zur Zustellung an Antragsgegner. Fri",
    "stauslöser rechtlich vorqualifizieren, nicht Antragseinreich",
    "ung oder Kenntnis frei einsetzen. Nur Grundfristen: entsprec",
    "hende206/210/211-Korrekturen nach204III für die dort genannt",
    "en204-Fälle zusätzlich, keine ungeprüfte Übertragung dieses ",
    "Verweises auf204aI2.193 bei feststehender Anwendung gesonder",
    "t. Keine automatische Hemmungs-/Rückwirkungsentscheidung, ke",
    "ine Berechnung aus dem KapMuG außerhalb desBGB."
  )
)
}
