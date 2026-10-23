% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{billigkeitshaftung_mittelbegrenzter_betrag}
\alias{billigkeitshaftung_mittelbegrenzter_betrag}
\title{billigkeitshaftung mittelbegrenzter betrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{billigkeitshaftung_mittelbegrenzter_betrag(
  billig_erforderlicher_ersatzbetrag = NULL,
  verfuegbare_mittel = NULL,
  geschuetzter_unterhaltsbedarf = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{billig_erforderlicher_ersatzbetrag}{Vorqualifizierter nach Billigkeit erforderlicher Schadloshaltungsbetrag in EUR; nicht automatisch voller Schaden.}
\item{verfuegbare_mittel}{Rechtlich festgestellte für den betrachteten Ausgleich verfügbare Mittel in EUR, zeitlich und wirtschaftlich konsistent bewertet.}
\item{geschuetzter_unterhaltsbedarf}{Davon benötigte Mittel für angemessenen eigenen Unterhalt und gesetzliche Unterhaltspflichten in EUR; ohne Doppelzählung.}
\item{einordnungsnachweis}{Nachweis des Anwendungsbereichs829 und der Billigkeitsbewertung sowie konsistenter Mittel-/Unterhaltsbewertung; kein Ersatz durch aufsichtspflichtigen Dritten erlangbar.}
}
\details{Vom verfügbaren Mittelbestand geschützten Unterhaltsbedarf abziehen, mindestens null; Billigkeitsersatz auf diesen verbleibenden Betrag begrenzen. §829: nur numerische Mittelgrenze eines bereits nach Billigkeit qualifizierten Ersatzbetrags. Keine automatische Billigkeitsentscheidung aus Vermögenszahlen und keine Tabelle für angemessenen Unterhalt. Haftungsvoraussetzungen827/828, fehlende Erlangbarkeit von Ersatz durch einen aufsichtspflichtigen Dritten und Verhältnisse der Beteiligten extern feststellen. Keine Entscheidung über zeitliche Streckung, künftige Einkünfte oder Vollstreckbarkeit. Nichtnegative Eingangswerte, exakter nichtnegativer EUR-Bruch im sicheren gemeinsamen Zahlenbereich.}
\value{wert ist der exakte EUR-Bruch. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_829_T0001}
\examples{
billigkeitshaftung_mittelbegrenzter_betrag(
  billig_erforderlicher_ersatzbetrag = "1000",
  verfuegbare_mittel = "1200",
  geschuetzter_unterhaltsbedarf = "500",
  einordnungsnachweis = paste0(
    "§829: nur numerische Mittelgrenze eines bereits nach Billigk",
    "eit qualifizierten Ersatzbetrags. Keine automatische Billigk",
    "eitsentscheidung aus Vermögenszahlen und keine Tabelle für a",
    "ngemessenen Unterhalt. Haftungsvoraussetzungen827/828, fehle",
    "nde Erlangbarkeit von Ersatz durch einen aufsichtspflichtige",
    "n Dritten und Verhältnisse der Beteiligten extern feststelle",
    "n. Keine Entscheidung über zeitliche Streckung, künftige Ein",
    "künfte oder Vollstreckbarkeit."
  )
)
}
