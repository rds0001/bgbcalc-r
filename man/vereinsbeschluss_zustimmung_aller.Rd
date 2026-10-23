% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{vereinsbeschluss_zustimmung_aller}
\alias{vereinsbeschluss_zustimmung_aller}
\title{vereinsbeschluss zustimmung aller}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{vereinsbeschluss_zustimmung_aller(
  beschlussart = NULL,
  mitgliederzahl = NULL,
  zustimmende_mitglieder = NULL,
  erforderliche_textform_gewahrt = NULL,
  abweichende_satzungsregel = NULL,
  zustimmungsnachweis = NULL
)}
\arguments{
\item{beschlussart}{ohne_versammlung (§32 Absatz3) oder zweckaenderung (§33 Absatz1 Satz2). Maßstab ist Zustimmung sämtlicher rechtlich maßgeblicher Mitglieder, nicht nur der Anwesenden.}
\item{mitgliederzahl}{Positive ganze Zahl bis2^53-1 sämtlicher für diesen gesetzlichen Zustimmungsmaßstab maßgeblicher Mitglieder. Keine unbegründete Reduktion auf Anwesende oder Antwortende; Stimmrechtsfragen vorab rechtlich bestimmen.}
\item{zustimmende_mitglieder}{Ganze Zahl0..mitgliederzahl der Mitglieder, deren Zustimmung zum identischen Beschlussinhalt wirksam erklärt wurde.}
\item{erforderliche_textform_gewahrt}{Wahrheitswert: beim Beschluss ohne Versammlung sämtliche Zustimmungen in Textform; bei Zweckänderung die Zustimmungen der nicht erschienenen Mitglieder in Textform. Bei keiner erforderlichen nachträglichen Zustimmung und sonst erfülltem Formmaßstab TRUE vorgeben.}
\item{abweichende_satzungsregel}{Wahrheitswert, ob eine nach§40 wirksame maßgebliche Satzungsabweichung den gesetzlichen Standard ersetzt. TRUE ergibt NICHT_ANWENDBAR; abweichender Beschlussmodus eigenständig prüfen.}
\item{zustimmungsnachweis}{Nichtleere Beschreibung des vollständigen Mitgliederbestands, identischen Beschlussinhalts, der Zustimmungen, Anwesenheit und erforderlichen Textform.}
}
\details{Alle-Zustimmung nur, wenn Anzahl zustimmender Mitglieder gleich vollständiger Mitgliederzahl. Zusätzliche Erfüllung der erforderlichen Textform notwendig. Wirksame Satzungsabweichung führt aus Standardmodell. Keine bloße Einstimmigkeit einer Teilversammlung. Sonstige Wirksamkeit, Sonderrechte§35 und gegebenenfalls Genehmigung§33 Absatz2 gesondert prüfen. Keine automatische Prüfung eingereichter Erklärungen. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält zustimmung_aller_erreicht und zustimmungs_und_textformvoraussetzungen_erfuellt. Satzungsabweichung ergibt NICHT_ANWENDBAR und null. Einheit: stimmen_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_32_T0007, BGB_33_T0002, BGB_40_T0001}
\examples{
vereinsbeschluss_zustimmung_aller(
  beschlussart = "ohne_versammlung",
  mitgliederzahl = 7,
  zustimmende_mitglieder = 0,
  erforderliche_textform_gewahrt = FALSE,
  abweichende_satzungsregel = FALSE,
  zustimmungsnachweis = paste0(
    "Synthetischer vollständiger Bestand und geprüfte Zustimmungs",
    "erklärungen."
  )
)
}
