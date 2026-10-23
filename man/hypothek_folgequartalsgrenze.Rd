% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{hypothek_folgequartalsgrenze}
\alias{hypothek_folgequartalsgrenze}
\title{hypothek folgequartalsgrenze}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{hypothek_folgequartalsgrenze(
  bezugsereignis_am = NULL,
  faelligkeit_am = NULL,
  regelfall = NULL,
  anwendungsfall_qualifiziert = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{bezugsereignis_am}{ISO-Datum der teilweisen Eigentümerbefriedigung1145 oder maßgeblichen Eigentümerkenntnis der Forderungsübertragung1158.}
\item{faelligkeit_am}{ISO-Fälligkeitstag der betrachteten Zinsen/anderen Nebenleistung. Darf vor Bezugsereignis liegen.}
\item{regelfall}{teilbefriedigung_1145: spätere Fälligkeit als Folgequartalsende erforderlich; uebertragungskenntnis_1158: Fälligkeit spätestens am Folgequartalsende.}
\item{anwendungsfall_qualifiziert}{Explizite Bestätigung des jeweiligen Anwendungsfalls,1145 insbesondere keine1118-Kosten. FALSE ergibt NICHT_ANWENDBAR.}
\item{einordnungsnachweis}{Nichtleere Herkunft und rechtliche Zuordnung von Bezug und konkreter Nebenleistungsfälligkeit.}
}
\details{Bezugsquartalsbeginn plus6Monate nach Tagesbeginnregel: Ende des Folgequartals. Fälligkeit strikt danach1145 oder spätestens dann1158 vergleichen. Nur numerisches Zeitmerkmal, keine abschließende Brief-/Einwendungs-/Gutglaubensprüfung oder Zinsberechnung.1145-Kosten1118 ausgeschlossen. ISO-Daten einschließlich Resultat0001..9999; feste Fallwahl und nichtleerer Nachweis.}
\value{wert: folgequartalsende, faelligkeit_nach_folgequartal, zeitmerkmal_erfuellt. Einheit: datum_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1145_T0001, BGB_1145_T0002, BGB_1145_T0003, BGB_1145_T0004, BGB_1158_T0001}
\examples{
hypothek_folgequartalsgrenze(
  bezugsereignis_am = "2030-01-01",
  faelligkeit_am = "2030-06-30",
  regelfall = "teilbefriedigung_1145",
  anwendungsfall_qualifiziert = TRUE,
  einordnungsnachweis = paste0(
    "Synthetisch qualifizierte Zinsnebenleistung, keine1118-Koste",
    "n."
  )
)
}
