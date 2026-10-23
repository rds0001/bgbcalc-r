% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{gesellschaft_jahresendkuendigung}
\alias{gesellschaft_jahresendkuendigung}
\title{gesellschaft jahresendkuendigung}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{gesellschaft_jahresendkuendigung(
  kuendigungszugang_am = NULL,
  kuendigungsfall = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{kuendigungszugang_am}{ISO-Datum des wirksamen Kündigungszugangs bei der Gesellschaft.}
\item{kuendigungsfall}{mitgliedschaft_725 oder privatglaeubiger_726.}
\item{einordnungsnachweis}{Gesetzlicher Dreimonate-zum-Kalenderjahresende-Fall, wirksamer Zugang und sämtliche Kündigungsvoraussetzungen qualifiziert. Keine abweichende Gesellschaftsvertragsregel.726Vollstreckung/Pfändung/Titel separat.}
}
\details{Dreimonats-Ereignisfrist berechnen und ersten danach liegenden Kalenderjahresablauf bestimmen. 725I/726: drei Kalendermonate ab wirksamem Zugang nach187I/188; erster Kalenderjahresablauf, der nicht vor diesem Mindestfristende liegt. Keine90Tage-Pauschale.725Gesellschaftsvertrags-/Zweckabweichungen, wichtiger Grund und Unzeit separat;726wirksame Anteilspfändung, Titel und erfolgloseVollstreckung im Sechsmonatsrückblick rechtlich und zeitlich vorqualifizieren. Tatsächlicher Kündigungszugang ist Eingabe, keine automatische Vorverlegung oder193-Verschiebung. Ergebnis ausschließlich gesetzlicher ordentlicher Beendigungsgrundtermin. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Dreimonatsfristende und gesetzlicher Beendigungsgrundtermin, ISO-Daten. Einheit: daten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_725_T0001, BGB_725_T0002, BGB_725_T0003, BGB_725_T0004, BGB_725_T0005, BGB_725_T0006, BGB_725_T0007, BGB_725_T0008, BGB_725_T0009, BGB_725_T0010, BGB_726_T0001}
\examples{
gesellschaft_jahresendkuendigung(
  kuendigungszugang_am = "2024-09-30",
  kuendigungsfall = "mitgliedschaft_725",
  einordnungsnachweis = paste0(
    "725I/726: drei Kalendermonate ab wirksamem Zugang nach187I/1",
    "88; erster Kalenderjahresablauf, der nicht vor diesem Mindes",
    "tfristende liegt. Keine90Tage-Pauschale.725Gesellschaftsvert",
    "rags-/Zweckabweichungen, wichtiger Grund und Unzeit separat;",
    "726wirksame Anteilspfändung, Titel und erfolgloseVollstrecku",
    "ng im Sechsmonatsrückblick rechtlich und zeitlich vorqualifi",
    "zieren. Tatsächlicher Kündigungszugang ist Eingabe, keine au",
    "tomatische Vorverlegung oder193-Verschiebung. Ergebnis aussc",
    "hließlich gesetzlicher ordentlicher Beendigungsgrundtermin."
  )
)
}
