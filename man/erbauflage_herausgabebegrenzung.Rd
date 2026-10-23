% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{erbauflage_herausgabebegrenzung}
\alias{erbauflage_herausgabebegrenzung}
\title{erbauflage herausgabebegrenzung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{erbauflage_herausgabebegrenzung(
  bereicherungsrechtlicher_zuwendungswert = NULL,
  zur_auflagenvollziehung_erforderlicher_zuwendungsanteil = NULL,
  herausgabevoraussetzungen_2196_erfuellt = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{bereicherungsrechtlicher_zuwendungswert}{Nichtnegativer exakter EUR-Wert der rechtlich herauszugebenden Bereicherung aus der Zuwendung, einschließlich einschlägiger Einwendungen vorbewertet.}
\item{zur_auflagenvollziehung_erforderlicher_zuwendungsanteil}{Nichtnegativer exakter EUR-Wert gerade des Zuwendungsanteils, der zur Auflagenvollziehung hätte eingesetzt werden müssen; kein beliebiger Auflagen-/Schadenspauschalbetrag.}
\item{herausgabevoraussetzungen_2196_erfuellt}{Expliziter Wahrheitswert: Berechtigung und entweder schuldhafte Unmöglichkeit2196I oder erfolglose zulässige Zwangsmittel nach rechtskräftigem Urteil bei nicht durch Dritte vollziehbarer Auflage2196II. Bloße Nichtvollziehung genügt nicht.}
\item{bewertungsnachweis}{Nichtleerer Nachweis zu Bereicherung, zweckgebundenem Zuwendungsanteil und rechtlichem Herausgabegrund.}
}
\details{Minimum aus bereicherungsrechtlichem Zuwendungswert und zur Auflagenvollziehung erforderlichem Zuwendungsanteil. Wertmäßige Begrenzung, keine automatische Umwandlung von Sachherausgabe in Geldzahlung. Keine Bereicherungs-/Auflagenbewertung, Frist- oder Vollstreckungsprüfung erfinden. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter EUR-Herausgabebegrenzungswert, negative Anwendbarkeit NULL. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2196_T0001, BGB_2196_T0002}
\examples{
erbauflage_herausgabebegrenzung(
  bereicherungsrechtlicher_zuwendungswert = "100",
  zur_auflagenvollziehung_erforderlicher_zuwendungsanteil = "30",
  herausgabevoraussetzungen_2196_erfuellt = TRUE,
  bewertungsnachweis = paste0(
    "Synthetisch qualifizierte2196-Herausgabe und bewerteter zwec",
    "kgebundener Anteil."
  )
)
}
