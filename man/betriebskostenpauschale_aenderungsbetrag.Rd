% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{betriebskostenpauschale_aenderungsbetrag}
\alias{betriebskostenpauschale_aenderungsbetrag}
\title{betriebskostenpauschale aenderungsbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{betriebskostenpauschale_aenderungsbetrag(
  bisherige_betriebskosten = NULL,
  neue_betriebskosten = NULL,
  umlageanteil_zaehler = NULL,
  umlageanteil_nenner = NULL,
  erhoehungsumlage_vertraglich_vereinbart = NULL,
  erhoehungserklaerung_ordnungsgemaess = NULL,
  pauschalenanpassung_anwendbar = NULL,
  kostennachweis = NULL
)}
\arguments{
\item{bisherige_betriebskosten}{Nichtnegative rechtlich und wirtschaftlich bereinigte bisherige Betriebskosten in EUR für einen ausdrücklich abgegrenzten Bezugszeitraum und Kostenkreis. Nur von der Pauschale erfasste Kosten; keine Vorauszahlungen oder Abrechnungssalden.}
\item{neue_betriebskosten}{Nichtnegative neue berücksichtigungsfähige Betriebskosten in EUR für denselben Bezugszeitraum, Umfang und Preismaßstab wie bisherige Kosten. Grundsatz der Wirtschaftlichkeit und zulässige Kostenpositionen bereits berücksichtigt.}
\item{umlageanteil_zaehler}{Nichtnegative ganze Zahl des rechtlich maßgeblichen Umlageanteils, höchstens Nenner und2^53-1. Keine pauschale Gleichverteilung erfinden; wirksamen Schlüssel für den betrachteten Kostenkreis verwenden.}
\item{umlageanteil_nenner}{Positive ganze Bezugsgröße im selben Maßstab, höchstens2^53-1. Quote0..1. Bei verschiedenen Schlüsseln Kostenkreise getrennt rechnen.}
\item{erhoehungsumlage_vertraglich_vereinbart}{Wahrheitswert, ob die Umlage von Erhöhungen der Betriebskostenpauschale im Mietvertrag wirksam vereinbart ist. Bei positiver Kostendifferenz erforderlich; gesetzliche Ermäßigung nicht davon abhängig.}
\item{erhoehungserklaerung_ordnungsgemaess}{Wahrheitswert einer wirksamen Erhöhungserklärung in Textform mit bezeichnetem und erläutertem Umlagegrund. Bei positiver Kostendifferenz erforderlich; Ermäßigungsmitteilung ist eigenständige Pflicht.}
\item{pauschalenanpassung_anwendbar}{Wahrheitswert des einschlägigen§560 Absatz1/3 bei Betriebskostenpauschale, ohne entgegenstehende andere Regelungen. FALSE ergibt NICHT_ANWENDBAR; nicht auf VorauszahlungenAbsatz4 übertragen.}
\item{kostennachweis}{Nichtleere Beschreibung von Kostenkreis, identischem Bezugszeitraum, wirtschaftlich bereinigtem Alt-/Neuwert, Umlageschlüssel und Vertrags-/Erklärungsvoraussetzungen. Änderungen verschiedener Zeitabschnitte getrennt bewerten.}
}
\details{Differenz=neue-bisherige Betriebskosten. Anteilige Änderung=Differenz×Umlagequote. Bei positiver Differenz nur mit vereinbarter Erhöhungsumlage und ordnungsgemäßer Erklärung; Ermäßigung hängt nicht von diesen Erhöhungsvoraussetzungen ab. Keine Vorauszahlungsanpassung oder Betriebskostenabrechnung. Vorzeichenbehafteter Änderungsbetrag für denselben Bezugszeitraum, keine automatische Monatsumrechnung. Erhöhungsbeginn/Rückwirkung nachAbsatz2 und Ermäßigungszeitpunkt/Mitteilung gesondert. Keine erfundene Wirtschaftlichkeitsgrenze. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter EUR-Änderungsbetrag: positiv bei Erhöhung, negativ bei Ermäßigung, null als0/1 bei unveränderten Kosten. Fehlender Anwendungsfall oder bei Erhöhung fehlende Voraussetzungen: NICHT_ANWENDBAR mit null. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_560_T0001, BGB_560_T0002, BGB_560_T0005, BGB_560_T0006, BGB_560_T0008}
\examples{
betriebskostenpauschale_aenderungsbetrag(
  bisherige_betriebskosten = "1000",
  neue_betriebskosten = "700",
  umlageanteil_zaehler = 1,
  umlageanteil_nenner = 3,
  erhoehungsumlage_vertraglich_vereinbart = FALSE,
  erhoehungserklaerung_ordnungsgemaess = FALSE,
  pauschalenanpassung_anwendbar = TRUE,
  kostennachweis = paste0(
    "Synthetische wirtschaftliche vergleichbare Kosten im selben ",
    "Bezugszeitraum."
  )
)
}
