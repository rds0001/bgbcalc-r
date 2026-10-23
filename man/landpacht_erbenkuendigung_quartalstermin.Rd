% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{landpacht_erbenkuendigung_quartalstermin}
\alias{landpacht_erbenkuendigung_quartalstermin}
\title{landpacht erbenkuendigung quartalstermin}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{landpacht_erbenkuendigung_quartalstermin(
  kuendigungszugang_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{kuendigungszugang_am}{Rechtlich wirksamer ZugangYYYY-MM-DD innerhalb der gesondert qualifizierten einmonatigen Ausübungsfrist nach594dI.}
\item{einordnungsnachweis}{Nichtleerer Nachweis594dI: Tod des Pächters, zutreffende Kenntnis und rechtzeitige formwirksame Kündigung durch Erben oder Verpächter. Keine automatische Prüfung dieser Voraussetzungen.}
}
\details{Sechsmonatige Kündigungsfrist auf nächstes zulässiges Kalenderquartalsende ausrichten. §594dI: sechs Kalendermonate ab tatsächlichem Kündigungszugang berechnen, anschließend erstes Kalenderquartalsende auswählen, das nicht vor dieser Fristgrenze liegt. Einmonatige Ausübungsfrist ab Kenntnis ist eigenständig; sechs Monate beginnen nicht schon mit Tod oder Kenntnis. Erbenwiderspruch594dII und Fortsetzungsentscheidung gesondert. Keine automatische Feiertagsverschiebung des Pachtendtermins. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.sechsmonatige_kuendigungsfrist_letzter_tag und rechnerischer_pachtendtermin alsISO-Daten. Einheit: daten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_594d_T0001}
\examples{
landpacht_erbenkuendigung_quartalstermin(
  kuendigungszugang_am = "2024-03-31",
  einordnungsnachweis = paste0(
    "§594dI: sechs Kalendermonate ab tatsächlichem Kündigungszuga",
    "ng berechnen, anschließend erstes Kalenderquartalsende auswä",
    "hlen, das nicht vor dieser Fristgrenze liegt. Einmonatige Au",
    "sübungsfrist ab Kenntnis ist eigenständig; sechs Monate begi",
    "nnen nicht schon mit Tod oder Kenntnis. Erbenwiderspruch594d",
    "II und Fortsetzungsentscheidung gesondert. Keine automatisch",
    "e Feiertagsverschiebung des Pachtendtermins."
  )
)
}
