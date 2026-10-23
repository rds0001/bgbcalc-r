% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{schenkungsauflage_rueckforderungsbetrag}
\alias{schenkungsauflage_rueckforderungsbetrag}
\title{schenkungsauflage rueckforderungsbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{schenkungsauflage_rueckforderungsbetrag(
  bereicherungsrechtlicher_geschenkwert = NULL,
  fuer_auflage_einzusetzender_geschenkwert = NULL,
  auflage_nicht_vollzogen = NULL,
  ruecktrittsvoraussetzungen_erfuellt = NULL,
  dritter_zur_vollziehung_berechtigt = NULL,
  pflicht_oder_anstandsschenkung = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{bereicherungsrechtlicher_geschenkwert}{Nichtnegative exakte EUR-Zahl als Dezimalzeichenfolge/Bruchobjekt des nach Bereicherungsrecht herauszugebenden Geschenkswerts. Bereicherung, Entreicherung und etwaige Sachherausgabe vorher rechtlich bewerten; kein automatischer ursprünglicher Kaufpreis.}
\item{fuer_auflage_einzusetzender_geschenkwert}{Nichtnegative exakte EUR-Zahl des Teils des Geschenks, der zur Vollziehung gerade der nicht vollzogenen Auflage hätte verwendet werden müssen. Nicht beliebige gesamte Auflagenkosten oder Sanktionspauschale verwenden.}
\item{auflage_nicht_vollzogen}{Wahrheitswert des Unterbleibens der konkreten Auflage. Bei Teilvollziehung den betroffenen verbleibenden Gegenstand/Wert rechtlich abgrenzen.}
\item{ruecktrittsvoraussetzungen_erfuellt}{Wahrheitswert der nach§527 erforderlichen Voraussetzungen des Rücktrittsrechts gegenseitiger Verträge, einschließlich erforderlicher Fristsetzung/Entbehrlichkeit und Beachtung rechtmäßiger Verweigerung§526. Nicht bloß Nichtvollziehung gleichsetzen.}
\item{dritter_zur_vollziehung_berechtigt}{Wahrheitswert eines Vollziehungsanspruchs eines Dritten im Sinne§527 Absatz2; dann dieser Rückforderungsweg ausgeschlossen.}
\item{pflicht_oder_anstandsschenkung}{Wahrheitswert einer Schenkung zur Erfüllung sittlicher Pflicht oder aus einer auf Anstand zu nehmenden Rücksicht§534. Dann keine Rückforderung in diesem Modell.}
\item{einordnungsnachweis}{Nichtleere Begründung der Auflage, Nichtvollziehung, rechtlichen Rücktrittsvoraussetzungen, Drittberechtigung, Schenkungseinordnung und beider Wertgrenzen.}
}
\details{Bei Nichtvollziehung und Rücktrittsvoraussetzungen ohne Drittrecht/§534-Ausschluss: Minimum aus bereicherungsrechtlichem Geschenkwert und für Auflage einzusetzendem Geschenkwert. Geldmäßiger Bewertungsrahmen, keine automatische Umwandlung von Sachherausgabe in Geld. §526, Bereicherungsrecht und sonstige rechtliche Voraussetzungen vorher prüfen; nicht gesamtes Geschenk automatisch fordern. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter EUR-Bruch. Bei fehlenden Voraussetzungen/Ausschluss NICHT_ANWENDBAR/null, kein abschließendes Urteil über andere Anspruchsgrundlagen. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_527_T0001, BGB_527_T0002, BGB_534_T0001}
\examples{
schenkungsauflage_rueckforderungsbetrag(
  bereicherungsrechtlicher_geschenkwert = "1000",
  fuer_auflage_einzusetzender_geschenkwert = "300",
  auflage_nicht_vollzogen = TRUE,
  ruecktrittsvoraussetzungen_erfuellt = TRUE,
  dritter_zur_vollziehung_berechtigt = FALSE,
  pflicht_oder_anstandsschenkung = FALSE,
  einordnungsnachweis = paste0(
    "Synthetisch rechtlich abgegrenzte nicht vollzogene Auflage u",
    "nd bewertete Herausgabe-/Verwendungsgrenzen."
  )
)
}
