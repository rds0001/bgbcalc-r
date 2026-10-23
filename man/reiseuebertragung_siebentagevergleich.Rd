% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{reiseuebertragung_siebentagevergleich}
\alias{reiseuebertragung_siebentagevergleich}
\title{reiseuebertragung siebentagevergleich}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{reiseuebertragung_siebentagevergleich(
  reisebeginn_am = NULL,
  erklaerungszugang_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{reisebeginn_am}{Rechtlich auf Kalendertag normalisierter ReisebeginnYYYY-MM-DD.}
\item{erklaerungszugang_am}{Rechtlich auf Kalendertag normalisierter Zugang der Erklärung beim VeranstalterYYYY-MM-DD, nicht Absendedatum.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des651eI-Falls und der rechtlich zutreffenden taggenauen Normalisierung einschließlich gegebenenfalls relevanter Uhrzeiten/Zeitzonen.}
}
\details{Taggenau qualifizierten Abstand zwischen tatsächlichem Erklärungszugang und Reisebeginn bestimmen und mit sieben Kalendertagen vergleichen. §651eI2: nur Anzahl der qualifizierten Kalendertage zwischen Zugang und Reisebeginn und Vergleich mit sieben Tagen. Erreichen ist rechnerischer Nachweis der gesetzlichen Siebentage-Sicherheitsgrenze im taggenau qualifizierten Fall. Unterschreiten bedeutet nicht automatisch Unwirksamkeit oder Verspätung: angemessene kürzere Frist nachSatz1 bleibt rechtlich zu prüfen. Dauerhafter Datenträger, tatsächlicher Zugang und Eignung des Dritten extern. Keine pauschale Umrechnung in168Stunden, keine automatische Feiertagsverschiebung und kein untertägiges Zugangs-/Reisebeginnurteil. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.kalendertage_vorlauf als vorzeichenbehaftete ganze Zahl und wert.mindestens_sieben_kalendertage als Wahrheitswert. Einheit: tage_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_651e_T0001, BGB_651e_T0002}
\examples{
reiseuebertragung_siebentagevergleich(
  reisebeginn_am = "2024-03-10",
  erklaerungszugang_am = "2024-03-03",
  einordnungsnachweis = paste0(
    "§651eI2: nur Anzahl der qualifizierten Kalendertage zwischen",
    " Zugang und Reisebeginn und Vergleich mit sieben Tagen. Erre",
    "ichen ist rechnerischer Nachweis der gesetzlichen Siebentage",
    "-Sicherheitsgrenze im taggenau qualifizierten Fall. Untersch",
    "reiten bedeutet nicht automatisch Unwirksamkeit oder Verspät",
    "ung: angemessene kürzere Frist nachSatz1 bleibt rechtlich zu",
    " prüfen. Dauerhafter Datenträger, tatsächlicher Zugang und E",
    "ignung des Dritten extern. Keine pauschale Umrechnung in168S",
    "tunden, keine automatische Feiertagsverschiebung und kein un",
    "tertägiges Zugangs-/Reisebeginnurteil."
  )
)
}
