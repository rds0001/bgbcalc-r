% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{hypothek_beschlagnahme_monatsgrenze}
\alias{hypothek_beschlagnahme_monatsgrenze}
\title{hypothek beschlagnahme monatsgrenze}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{hypothek_beschlagnahme_monatsgrenze(
  beschlagnahme_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{beschlagnahme_am}{ISO-Datum des im Parameternamen bezeichneten tatsächlichen Ereignisses.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des passenden Normfalls; keine automatische Rechtsfolgenentscheidung.}
}
\details{§§1123II/1124II: Monatsende, nach dem15.Tag Ende des Folgemonats. Nur gesetzliche Kalendergrenze für vorqualifizierte Miet-/Pachtfälle.1123 erfordert zusätzlich Fälligkeit, Jahresablauf und Beschlagnahmebezug;1124 vorherige Verfügung. Diese Grenze allein entscheidet weder Haftungsfreiheit noch Wirksamkeit. Nicht auf1126 übertragen; dort gilt eine andere Dreimonatsregel. Gültige ISO-Daten und Ergebnisse0001..9999,1171-Rechtskraftjahr mindestens0005.}
\value{wert enthält die ausdrücklich benannten Kalendergrenzen; keine Zins- oder Haftungsbeträge. Einheit: kalendergrenzen.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1123_T0001, BGB_1123_T0002, BGB_1123_T0003, BGB_1124_T0001, BGB_1124_T0002, BGB_1124_T0003, BGB_1124_T0004}
\examples{
hypothek_beschlagnahme_monatsgrenze(
  beschlagnahme_am = "2030-01-15",
  einordnungsnachweis = paste0(
    "Qualifiziertes gesetzliches Bezugsereignis ohne Sonderkorrek",
    "tur."
  )
)
}
