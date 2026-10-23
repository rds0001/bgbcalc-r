% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{kindeseinkuenfte_verwendungsbetraege}
\alias{kindeseinkuenfte_verwendungsbetraege}
\title{kindeseinkuenfte verwendungsbetraege}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{kindeseinkuenfte_verwendungsbetraege(
  vermoegenseinkuenfte = NULL,
  verwaltungsbedarf = NULL,
  kindesunterhalt = NULL,
  erwerbseinkuenfte = NULL,
  billiger_familienbedarf = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{vermoegenseinkuenfte}{Nichtnegative Vermögenseinkünfte des Kindes in EUR, kein Vermögensstamm.}
\item{verwaltungsbedarf}{Nichtnegativer für ordnungsgemäße Vermögensverwaltung benötigter Betrag in EUR.}
\item{kindesunterhalt}{Nichtnegativer qualifizierter Kindesunterhalt in EUR.}
\item{erwerbseinkuenfte}{Nichtnegative Erwerbseinkünfte aus Arbeit oder nach§112 gestattetem Geschäft in EUR.}
\item{billiger_familienbedarf}{Nichtnegativer bereits rechtlich als billig qualifizierter Gesamtbedarf der Eltern/minderjährigen Geschwister in EUR. Keine automatische Billigkeitsprüfung.}
\item{bewertungsnachweis}{Nichtleerer Nachweis zu qualifizierten Einkünften, Bedarfen und identischem Bezugszeitraum.}
}
\details{Verfügbare Vermögenseinkünfte=max(Vermögenseinkünfte-Verwaltungsbedarf,0); davon Kindesbedarf decken. Erwerbseinkünfte nur bis Restkindesbedarf einsetzbar. Nur verbliebene Vermögenseinkünfte bis qualifiziertem billigem Familienbedarf einsetzbar. Keine automatische Einkünfte-/Bedarfsbewertung, Billigkeitsprüfung oder Personenverteilung. Einsetzbare Beträge sind rechnerische Höchstbeträge; Restwerte unterstellen deren tatsächliche Verwendung. Kein Erwerbseinsatz für Verwaltung oder Familie. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält verfuegbare_vermoegenseinkuenfte, vermoegenseinkuenfte_fuer_kind, erwerbseinkuenfte_fuer_kind_einsetzbar, ungedeckter_kindesbedarf, vermoegenseinkuenfte_fuer_familie_einsetzbar, verbleibende_vermoegenseinkuenfte, verbleibende_erwerbseinkuenfte als exakte EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1649_T0001, BGB_1649_T0002, BGB_1649_T0003}
\examples{
kindeseinkuenfte_verwendungsbetraege(
  vermoegenseinkuenfte = "1000",
  verwaltungsbedarf = "100",
  kindesunterhalt = "500",
  erwerbseinkuenfte = "300",
  billiger_familienbedarf = "200",
  bewertungsnachweis = paste0(
    "Qualifizierte Beträge gleicher Monatsperiode, Familienbedarf",
    " billig."
  )
)
}
