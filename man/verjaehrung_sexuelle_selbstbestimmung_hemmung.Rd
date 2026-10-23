% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{verjaehrung_sexuelle_selbstbestimmung_hemmung}
\alias{verjaehrung_sexuelle_selbstbestimmung_hemmung}
\title{verjaehrung sexuelle selbstbestimmung hemmung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{verjaehrung_sexuelle_selbstbestimmung_hemmung(
  geburtsdatum = NULL,
  stichtag = NULL,
  anspruch_wegen_sexueller_selbstbestimmung = NULL,
  gemeinschaft_bei_verjaehrungsbeginn = NULL,
  gemeinschaft_ununterbrochen_bis_stichtag = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{geburtsdatum}{ISO-Geburtsdatum des Gläubigers, nicht nach Stichtag. Vollendung21 nach§§187/188, einschließlich Schaltjahrregeln; berechnete Altersgrenze muss0001..9999 sein.}
\item{stichtag}{ISO-Datum0001..9999, für das der Hemmungstatbestand geprüft wird. Anspruch und Verjährungslage rechtlich vorab einordnen; kein automatischer Beginn oder Ablauf der Frist.}
\item{anspruch_wegen_sexueller_selbstbestimmung}{Wahrheitswert zur rechtlichen Anspruchseinordnung gerade wegen Verletzung sexueller Selbstbestimmung. FALSE schließt nur den Tatbestand des§208 aus, nicht sämtliche Hemmungsgründe.}
\item{gemeinschaft_bei_verjaehrungsbeginn}{Wahrheitswert, ob Gläubiger bei Beginn der betreffenden Verjährung mit Schuldner in häuslicher Gemeinschaft lebte. Später erstmals begründete Gemeinschaft hier nicht einsetzen.}
\item{gemeinschaft_ununterbrochen_bis_stichtag}{Wahrheitswert, ob dieselbe bei Verjährungsbeginn bestehende Gemeinschaft am Stichtag noch nicht beendet ist. Erneutes Zusammenleben nach Beendigung nicht als ununterbrochene Fortsetzung behandeln. Nur zusammen mit gemeinschaft_bei_verjaehrungsbeginn maßgeblich; keine Gleichsetzung mit bloßer Ehe.}
\item{einordnungsnachweis}{Nichtleere Beschreibung von Anspruchsart, Geburtsdatum, maßgeblichem Verjährungsbeginn und Bestand beziehungsweise Beendigung derselben häuslichen Gemeinschaft. Rechtliche Normalisierung untertägiger Änderungen gesondert.}
}
\details{Bei qualifiziertem Anspruch Hemmung bis Vollendung21 ODER solange die bereits bei Verjährungsbeginn bestehende häusliche Gemeinschaft noch ununterbrochen fortbesteht. Beide Gründe einzeln und als Vereinigung ausweisen. Keine automatische Tatsachenbewertung, keine Addition überlappender Hemmungen, kein endgültiger Verjährungstag. Wiederaufnahme einer beendeten Gemeinschaft nicht als durchgehende Hemmung behandeln. Andere Gründe wie§207 bleiben gesondert. ISO-Daten0001..9999; explizite Wahrheitswerte; nichtleerer Nachweis. Fehlende Pflichtwerte EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält altershemmung, gemeinschaftshemmung und hemmungstatbestand_am_stichtag als Wahrheitswerte; fehlende Anspruchsqualifikation ergibt alle FALSE. Einheit: wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_208_T0001, BGB_208_T0002, BGB_207_T0011}
\examples{
verjaehrung_sexuelle_selbstbestimmung_hemmung(
  geburtsdatum = "2004-02-29",
  stichtag = "2025-02-28",
  anspruch_wegen_sexueller_selbstbestimmung = FALSE,
  gemeinschaft_bei_verjaehrungsbeginn = FALSE,
  gemeinschaft_ununterbrochen_bis_stichtag = FALSE,
  einordnungsnachweis = paste0(
    "Synthetischer qualifizierter Anspruch und zeitlich abgegrenz",
    "te Gemeinschaft."
  )
)
}
