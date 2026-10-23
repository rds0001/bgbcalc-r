% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{hypothek_hinterlegung_zeitgrenzen}
\alias{hypothek_hinterlegung_zeitgrenzen}
\title{hypothek hinterlegung zeitgrenzen}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{hypothek_hinterlegung_zeitgrenzen(
  ausschliessungsbeschluss_rechtskraeftig_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{ausschliessungsbeschluss_rechtskraeftig_am}{ISO-Datum des im Parameternamen bezeichneten tatsächlichen Ereignisses.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des passenden Normfalls; keine automatische Rechtsfolgenentscheidung.}
}
\details{§1171: Beginn des vierten vorangegangenen Kalenderjahres und30Jahre ab Rechtskraft. Zinsbeginn ist nur früheste zu berücksichtigende Kalendergrenze, kein erfundener Zinsanspruch; Grundbucheintrag des Zinssatzes, tatsächlicher Zinslauf und Höhe gesondert.30Jahre sind Grundfrist für hinterlegten Betrag, keine automatische Erlöschensentscheidung bei vorheriger Meldung. Keine Anwendung anderer Aufgebotsfristen ohne Normprüfung. Gültige ISO-Daten und Ergebnisse0001..9999,1171-Rechtskraftjahr mindestens0005.}
\value{wert enthält die ausdrücklich benannten Kalendergrenzen; keine Zins- oder Haftungsbeträge. Einheit: kalendergrenzen.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1171_T0001, BGB_1171_T0002, BGB_1171_T0003, BGB_1171_T0004, BGB_1171_T0005}
\examples{
hypothek_hinterlegung_zeitgrenzen(
  ausschliessungsbeschluss_rechtskraeftig_am = "2030-07-15",
  einordnungsnachweis = paste0(
    "Qualifiziertes gesetzliches Bezugsereignis ohne Sonderkorrek",
    "tur."
  )
)
}
