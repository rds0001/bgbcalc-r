% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{nachbarrecht_kostengleichanteil}
\alias{nachbarrecht_kostengleichanteil}
\title{nachbarrecht kostengleichanteil}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{nachbarrecht_kostengleichanteil(
  gesamtkosten = NULL,
  kostenart = NULL,
  beteiligtenzahl = NULL,
  abweichendes_rechtsverhaeltnis = NULL,
  gesetzlicher_kostenfall = NULL,
  kostennachweis = NULL
)}
\arguments{
\item{gesamtkosten}{Nichtnegative rechtlich zu verteilende tatsächliche Gesamtkosten in EUR für Abmarkung beziehungsweise Unterhaltung der Grenzeinrichtung. Nicht Herstellung, beliebige Erneuerung oder andere Maßnahmen ungeprüft als Unterhaltung einordnen.}
\item{kostenart}{Auswahl abmarkung (§919 Absatz3) oder grenzeinrichtung_unterhaltung (§922 Satz2). Abmarkung meint gesetzlich einschlägige Grenzzeichenerrichtung/-wiederherstellung; landesrechtliche Verfahrensvorgaben zuvor prüfen.}
\item{beteiligtenzahl}{Ganze Zahl2..2^53-1 der beteiligten Kostenseiten. Bei Unterhaltung einer Einrichtung zwischen zwei Grundstücken genau2. Miteigentümer innerhalb einer Grundstücksseite nicht ungeprüft als zusätzliche Nachbarn zählen; interne Verteilung separat.}
\item{abweichendes_rechtsverhaeltnis}{Wahrheitswert einer rechtlich wirksamen abweichenden Kostenverteilung. TRUE führt aus gesetzlichem Gleichteilungsmodell; Ersatzquote nicht erfinden. Bei Abmarkung ausdrücklicher Vorbehalt§919 Absatz3.}
\item{gesetzlicher_kostenfall}{Wahrheitswert des rechtlich einschlägigen gesetzlichen Kostenfalls. Bei§922 gemeinschaftliche Benutzungsberechtigung an Einrichtung§921 erforderlich; nicht bloß Grenznähe. Andere spezielle Regelungen vorab prüfen.}
\item{kostennachweis}{Nichtleere Beschreibung von Maßnahme, rechtlichem Kostenfall, Kostenträgern/Grundstücksseiten, Kostenhöhe und gegebenenfalls abweichendem Rechtsverhältnis.}
}
\details{Gesetzlichen Kostenfall ohne abweichende Kostenverteilung auswählen. Gesamtkosten durch Zahl der beteiligten Kostenseiten teilen; bei Unterhaltung zwischen zwei Nachbargrundstücken genau zwei. Kein automatischer Abmarkungs-/Unterhaltungsanspruch und keine Aussage zum zulässigen Verfahren nach Landesrecht. Keine gleiche Verteilung auf sämtliche natürlichen Miteigentümer unabhängig von Grundstücksseiten. Abweichendes Rechtsverhältnis gesondert. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter EUR-Kostenanteil je gesetzlicher Kostenseite. Fehlender Kostenfall oder abweichende Verteilung ergibt NICHT_ANWENDBAR mit null. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_919_T0001, BGB_919_T0002, BGB_919_T0003, BGB_922_T0001, BGB_922_T0002}
\examples{
nachbarrecht_kostengleichanteil(
  gesamtkosten = "0",
  kostenart = "abmarkung",
  beteiligtenzahl = 2,
  abweichendes_rechtsverhaeltnis = FALSE,
  gesetzlicher_kostenfall = TRUE,
  kostennachweis = paste0(
    "Synthetischer gesetzlicher Kostenfall mit zutreffenden Grund",
    "stücksseiten."
  )
)
}
