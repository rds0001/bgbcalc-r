% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{landpacht_dreijahres_restlaufzeit}
\alias{landpacht_dreijahres_restlaufzeit}
\title{landpacht dreijahres restlaufzeit}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{landpacht_dreijahres_restlaufzeit(
  beurteilungsbeginn_am = NULL,
  beginnart = NULL,
  pachtende_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{beurteilungsbeginn_am}{Rechtlich qualifizierter Bezugstag YYYY-MM-DD für die verbleibende Vertragsdauer; nicht automatisch Antragstag.}
\item{beginnart}{ereignis oder tagesbeginn entsprechend rechtlich qualifiziertem Beginn.}
\item{pachtende_am}{Letzter eingeschlossener Kalendertag des bestimmten Pachtverhältnisses YYYY-MM-DD.}
\item{einordnungsnachweis}{Nichtleerer Nachweis der Zeitnormalisierung und des maßgeblichen Bezugstags nach590II oder591II; Kündigung und übrige gerichtliche Voraussetzungen separat.}
}
\details{Dreijährige Restlaufzeit streng unterschreiten. §§590II/591II: Ende eines Dreijahreszeitraums ab qualifiziertem Bezugstag mit dem letzten Vertragstag vergleichen. Strikt früheres Pachtende bedeutet weniger als drei Jahre; Gleichheit genügt nicht. Keine automatische gerichtliche Erlaubnis, keine Festlegung des juristischen Beurteilungszeitpunkts. Nur kalendertäglich eindeutig normalisierte Zeitpunkte, keine ungeklärten untertägigen Grenzfälle. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.dreijahreszeitraum_letzter_tag als ISO-Datum und restlaufzeit_weniger_als_drei_jahre als Wahrheitswert. Einheit: datum_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_590_T0002, BGB_590_T0003, BGB_590_T0004, BGB_590_T0005, BGB_590_T0006, BGB_590_T0007, BGB_591_T0002, BGB_591_T0003, BGB_591_T0004}
\examples{
landpacht_dreijahres_restlaufzeit(
  beurteilungsbeginn_am = "2024-01-01",
  beginnart = "tagesbeginn",
  pachtende_am = "2026-12-31",
  einordnungsnachweis = paste0(
    "§§590II/591II: Ende eines Dreijahreszeitraums ab qualifizier",
    "tem Bezugstag mit dem letzten Vertragstag vergleichen. Strik",
    "t früheres Pachtende bedeutet weniger als drei Jahre; Gleich",
    "heit genügt nicht. Keine automatische gerichtliche Erlaubnis",
    ", keine Festlegung des juristischen Beurteilungszeitpunkts. ",
    "Nur kalendertäglich eindeutig normalisierte Zeitpunkte, kein",
    "e ungeklärten untertägigen Grenzfälle."
  )
)
}
