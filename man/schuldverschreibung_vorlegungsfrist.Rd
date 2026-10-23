% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{schuldverschreibung_vorlegungsfrist}
\alias{schuldverschreibung_vorlegungsfrist}
\title{schuldverschreibung vorlegungsfrist}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{schuldverschreibung_vorlegungsfrist(
  urkundenart = NULL,
  leistungszeit_am = NULL,
  leistungszeit_beginnart = NULL,
  prueftag = NULL,
  vorlegung_am = NULL,
  gerichtliche_geltendmachung_am = NULL,
  gesetzlicher_unveraenderter_fristenlauf = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{urkundenart}{hauptschuldverschreibung, zinsschein, rentenschein oder gewinnanteilschein; rechtlich qualifizierte Urkunde im Anwendungsbereich§801.}
\item{leistungszeit_am}{ISO-Datum des Eintritts der für die Leistung bestimmten Zeit; nicht automatisch Ausgabe oder Erwerb der Urkunde.}
\item{leistungszeit_beginnart}{ereignis oder tagesbeginn: rechtliche Einordnung der bestimmten Leistungszeit bei Hauptschuldverschreibung nach§187. Ein festgelegter Tagesbeginn zählt mit. Bei Scheinen ohne Einfluss auf den gesetzlichen Jahresschlussbeginn; Eingabe wird dennoch validiert.}
\item{prueftag}{ISO-Datum ab Eintritt der Leistungszeit. Prüfung zum Ende des Prüftags: Ablauf/Erlöschen ab Ablauf des Endtags; tatsächliche rechtzeitige Wahrung am Endtag wird berücksichtigt.}
\item{vorlegung_am}{Optionales ISO-Datum qualifizierter Vorlegung gerade beim Aussteller zur Einlösung, zwischen Leistungszeit und Prüftag. NULL bedeutet nicht erfolgt, nicht unbekannt. Frühere Handlungen außerhalb dieses Modells.}
\item{gerichtliche_geltendmachung_am}{Optionales rechtlich maßgebliches ISO-Datum gerichtlicher Geltendmachung gerade des Anspruchs aus der Urkunde, zwischen Leistungszeit und Prüftag. NULL bedeutet nicht erfolgt. Bloße Mahnung/Verlustanzeige ist kein Ersatz.}
\item{gesetzlicher_unveraenderter_fristenlauf}{Expliziter Wahrheitswert: gesetzliche Fristen ohne abweichende Urkundenbestimmung§801 Absatz3, ohne Zahlungssperrenhemmung§802, sonstige Hemmung/Neubeginn oder Kalenderkorrekturen. FALSE ergibt NICHT_ANWENDBAR; solche Änderungen nicht als Standardsachverhalt berechnen.}
\item{einordnungsnachweis}{Nichtleere Begründung von Urkundenart, Leistungszeit/Beginnart, Vorlegung/Geltendmachung und unverändertem Fristenlauf.}
}
\details{Hauptschuldverschreibung30 Jahre ab bestimmter Leistungszeit; Scheine4 Jahre ab Ende des Leistungsjahrs. Vorlegung oder gerichtliche Geltendmachung spätestens am Fristende wahrt. Ohne Wahrung Erlöschen zum Ablauf des Endtags; bei Wahrung zweijährige Verjährungsgrundfrist ab Vorlegungsfristende, nicht ab tatsächlicher Vorlegung. Abweichende Urkundenfristen und sonstige Friständerungen einschließlich§802 nicht im Standardmodell. Keine Gleichsetzung Verjährung/Erlöschen. Eigenständige Verlustansprüche§804 und Selbständigkeit der Zinsscheine§803 separat. ISO-Daten und Grenzen0001..9999, geschlossene Urkunden-/Beginnartauswahl, expliziter Wahrheitswert und nichtleerer Nachweis.}
\value{wert enthält vorlegungsfristende, vorlegungsfrist_gewahrt, anspruch_nach_801_erloschen, verjaehrungsgrundfristende (nur bei Wahrung, sonst null), verjaehrungsgrundfrist_abgelaufen. Keine automatische Ausübung einer Verjährungseinrede. Einheit: daten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_801_T0001, BGB_801_T0002, BGB_801_T0003, BGB_801_T0004, BGB_801_T0005, BGB_801_T0006}
\examples{
schuldverschreibung_vorlegungsfrist(
  urkundenart = "hauptschuldverschreibung",
  leistungszeit_am = "2000-01-15",
  leistungszeit_beginnart = "tagesbeginn",
  prueftag = "2030-01-14",
  vorlegung_am = NULL,
  gerichtliche_geltendmachung_am = NULL,
  gesetzlicher_unveraenderter_fristenlauf = TRUE,
  einordnungsnachweis = paste0(
    "Synthetisch qualifizierte Inhaberschuldverschreibung; Leistu",
    "ng ab Tagesbeginn, keine Friständerung."
  )
)
}
