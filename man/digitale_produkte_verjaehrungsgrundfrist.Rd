% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{digitale_produkte_verjaehrungsgrundfrist}
\alias{digitale_produkte_verjaehrungsgrundfrist}
\title{digitale produkte verjaehrungsgrundfrist}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{digitale_produkte_verjaehrungsgrundfrist(
  bereitstellung_am = NULL,
  bereitstellungsende_am = NULL,
  aktualisierungsende_am = NULL,
  mangel_gezeigt_am = NULL,
  unveraenderter_anwendungsfall = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{bereitstellung_am}{ISO-Datum der maßgeblichen Bereitstellung für den konkreten Anspruch nach327i Nummer1/3.}
\item{bereitstellungsende_am}{ISO-Enddatum des dauerhaften Bereitstellungszeitraums für diesen Anspruch; NULL bedeutet nicht einschlägig, nicht unbekannt.}
\item{aktualisierungsende_am}{ISO-Enddatum des rechtlich bestimmten Aktualisierungspflicht-Zeitraums, nur bei Anspruch wegenVerletzung dieser Pflicht. NULL=nicht einschlägig.}
\item{mangel_gezeigt_am}{Erstmaliges Zeigen des betrachteten Mangels als ISO-Datum, NULL wenn kein solches Ereignis zu berücksichtigen. Zeitpunkt am vorherigen Fristendtag noch innerhalb.}
\item{unveraenderter_anwendungsfall}{Explizite Bestätigung gesetzlicher327j-Fristberechnung ohne zusätzliche Hemmung/Neubeginn/Arglist-/Übergangs-/Kalenderkorrektur oder wirksame Abweichung.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des konkreten Anspruchs, der relevanten Zeiträume und des Mangelzeitpunkts.}
}
\details{2Jahre ab Bereitstellung; Maximum mit einschlägigen12Monaten nach Dauerbereitstellung/Aktualisierung. Bei innerhalb dieser Frist gezeigtem Mangel zusätzlich Maximum mit4Monaten ab erstmaligem Zeigen. Nur327i Nummer1/3; RechteNummer2 und218 separat. Keine sonstigen Friständerungen. Optionale Enddaten dürfen bei unbekanntem benötigtem Ende nicht weggelassen werden. ISO-Daten im Bereich0001..9999, feste Fallauswahl, Wahrheitswert und nichtleerer Nachweis.}
\value{wert enthält zweijahresende, mindestende_dauerbereitstellung, mindestende_aktualisierung, ende_vor_mangelablaufhemmung, mindestende_mangel, verjaehrungsgrundfristende; nicht einschlägige Mindestenden=null. Einheit: daten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_327j_T0001, BGB_327j_T0002, BGB_327j_T0003, BGB_327j_T0004, BGB_327j_T0005, BGB_327j_T0006}
\examples{
digitale_produkte_verjaehrungsgrundfrist(
  bereitstellung_am = "2030-01-31",
  bereitstellungsende_am = NULL,
  aktualisierungsende_am = NULL,
  mangel_gezeigt_am = NULL,
  unveraenderter_anwendungsfall = TRUE,
  einordnungsnachweis = paste0(
    "Synthetischer einschlägiger Anspruch ohne weitere Friständer",
    "ungen."
  )
)
}
