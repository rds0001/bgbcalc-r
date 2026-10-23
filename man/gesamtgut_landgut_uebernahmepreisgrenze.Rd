% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{gesamtgut_landgut_uebernahmepreisgrenze}
\alias{gesamtgut_landgut_uebernahmepreisgrenze}
\title{gesamtgut landgut uebernahmepreisgrenze}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{gesamtgut_landgut_uebernahmepreisgrenze(
  qualifizierter_ertragswert = NULL,
  angeordneter_uebernahmepreis = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{qualifizierter_ertragswert}{Nach1515II/2049 rechtlich festgestellter Ertragswert des Landguts in Euro; kein automatisch gleichgesetzter Verkehrswert.}
\item{angeordneter_uebernahmepreis}{Qualifizierter testamentarischer Übernahmepreis in Euro.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des1515II/III-Übernahmefalls und zutreffender Ertragswertermittlung.}
}
\details{Angeordneten Landgut-Übernahmepreis mit qualifiziertem Ertragswert als Untergrenze vergleichen. §1515II/III: angeordneten Landgut-Übernahmepreis mit qualifiziertem Ertragswert vergleichen; Gleichheit erreicht die Untergrenze. Ertragswert selbst ist Bewertungsinput nach2049, keine erfundene Kapitalisierungsformel. Keine automatische Anhebung eines unzulässigen Preises, keine Entscheidung über Testamentswirksamkeit, Übernahmeberechtigung oder Ausgleichszahlungsverteilung. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.ertragswertgrenze_eingehalten als Wahrheitswert; unterschreitungsbetrag als exakter Eurobruch. Einheit: EUR_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1515_T0002, BGB_1515_T0003, BGB_1515_T0004}
\examples{
gesamtgut_landgut_uebernahmepreisgrenze(
  qualifizierter_ertragswert = "200000",
  angeordneter_uebernahmepreis = "200000",
  einordnungsnachweis = paste0(
    "§1515II/III: angeordneten Landgut-Übernahmepreis mit qualifi",
    "ziertem Ertragswert vergleichen; Gleichheit erreicht die Unt",
    "ergrenze. Ertragswert selbst ist Bewertungsinput nach2049, k",
    "eine erfundene Kapitalisierungsformel. Keine automatische An",
    "hebung eines unzulässigen Preises, keine Entscheidung über T",
    "estamentswirksamkeit, Übernahmeberechtigung oder Ausgleichsz",
    "ahlungsverteilung."
  )
)
}
