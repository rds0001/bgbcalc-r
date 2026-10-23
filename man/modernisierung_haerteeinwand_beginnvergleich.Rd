% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{modernisierung_haerteeinwand_beginnvergleich}
\alias{modernisierung_haerteeinwand_beginnvergleich}
\title{modernisierung haerteeinwand beginnvergleich}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{modernisierung_haerteeinwand_beginnvergleich(
  mitteilungseingang_utc = NULL,
  massnahmenbeginn_utc = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{mitteilungseingang_utc}{Rechtlich qualifizierter tatsaechlicher Mitteilungszugang als sekundengenauer UTC-Zeitpunkt.}
\item{massnahmenbeginn_utc}{Tatsaechlicher rechtlich massgeblicher Beginn der Modernisierung als sekundengenauer UTC-Zeitpunkt.}
\item{einordnungsnachweis}{Anwendbarkeit555dIV2 beziehungsweiseV2 auf wirtschaftliche Haerte qualifizieren. BeiIV unverschuldete Verhinderung und unverzuegliche Mitteilung mit Gruenden, beiV fehlenden Form-/Fristhinweis gesondert feststellen.}
}
\details{Mitteilungszugang mit tatsaechlichem Massnahmenbeginn einschliesslich Grenzzeitpunkt vergleichen. §555dIV2/V2: wirtschaftliche Haerte spaetestens bis zum Beginn der Modernisierung mitteilen. Zeitvergleich einschliesslich des Beginnzeitpunkts; keine pauschale Frist bis Tagesende, wenn Arbeiten schon morgens beginnen. Ausschliesslich diese zusaetzliche aeusserste Zeitgrenze. Der regulaere Monatsendtermin555dIII wird durch miete_erklaerungs_monatsendtermin berechnet; ordnungsgemaesse Ankuendigung, Hinweis-/Formausnahmen und unverschuldete unverzuegliche Nachholung sind rechtliche Voraussetzungen ohne feste zusaetzliche BGB-Tageszahl. Keine fixe Frist fuer unverzueglich erfinden und keine Uebertragung der wirtschaftlichen Ausschlussgrenze auf jeden Duldungshaertegrund. UTC-Zeitpunkte vorab normalisieren; keine lokalen Zeitzonen raten. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Ein Zeitgrenzenvergleich, keine vollstaendige Haerteberuecksichtigungsentscheidung. Einheit: wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_555d_T0006, BGB_555d_T0007, BGB_555d_T0008, BGB_555d_T0009}
\examples{
modernisierung_haerteeinwand_beginnvergleich(
  mitteilungseingang_utc = "2026-05-01T07:59:59Z",
  massnahmenbeginn_utc = "2026-05-01T08:00:00Z",
  einordnungsnachweis = paste0(
    "§555dIV2/V2: wirtschaftliche Haerte spaetestens bis zum Begi",
    "nn der Modernisierung mitteilen. Zeitvergleich einschliessli",
    "ch des Beginnzeitpunkts; keine pauschale Frist bis Tagesende",
    ", wenn Arbeiten schon morgens beginnen. Ausschliesslich dies",
    "e zusaetzliche aeusserste Zeitgrenze. Der regulaere Monatsen",
    "dtermin555dIII wird durch miete_erklaerungs_monatsendtermin ",
    "berechnet; ordnungsgemaesse Ankuendigung, Hinweis-/Formausna",
    "hmen und unverschuldete unverzuegliche Nachholung sind recht",
    "liche Voraussetzungen ohne feste zusaetzliche BGB-Tageszahl.",
    " Keine fixe Frist fuer unverzueglich erfinden und keine Uebe",
    "rtragung der wirtschaftlichen Ausschlussgrenze auf jeden Dul",
    "dungshaertegrund. UTC-Zeitpunkte vorab normalisieren; keine ",
    "lokalen Zeitzonen raten."
  )
)
}
