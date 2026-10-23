% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{nachbesserung_fehlgeschlagen}
\alias{nachbesserung_fehlgeschlagen}
\title{nachbesserung fehlgeschlagen}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{nachbesserung_fehlgeschlagen(
  erfolglose_versuche = NULL,
  abweichende_umstaende = NULL,
  fehlgeschlagen_nach_einzelfall = NULL,
  regel_440_anwendbar = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{erfolglose_versuche}{Ganze Zahl0..2^53-1 rechtlich zusammengehöriger erfolgloser Nachbesserungsversuche am konkreten Mangel. Nicht beliebige Werkstattkontakte oder Nachlieferungen mitzählen.}
\item{abweichende_umstaende}{Wahrheitswert, ob Art der Sache, Art des Mangels oder sonstige Umstände ein Abweichen von der Zweitversuchsregel rechtfertigen. Keine automatische Bewertung aus Preis, Lebensdauer oder einer erfundenen Skala.}
\item{fehlgeschlagen_nach_einzelfall}{Wahrheitswert der dokumentierten Einzelfallentscheidung bei abweichenden Umständen; kann früheres oder späteres Fehlschlagen bedeuten. Wird nur bei abweichende_umstaende=TRUE für das Ergebnis verwendet, ansonsten validiert und von der gesetzlichen Versuchszahlregel verdrängt.}
\item{regel_440_anwendbar}{Wahrheitswert der Anwendbarkeit der kaufrechtlichen Nachbesserungsregel. Insbesondere FALSE, wenn§475d im konkreten Verbrauchsgüterfall abweichend gilt; dann NICHT_ANWENDBAR.}
\item{einordnungsnachweis}{Nichtleere Begründung von Nachbesserung, zusammengehörigen erfolglosen Versuchen und etwaiger abweichender Einzelfallbewertung; Vorrang des Verbrauchsgüterrechts prüfen.}
}
\details{Ohne abweichende Umstände mindestens zwei erfolglose Nachbesserungsversuche; bei belegter Ausnahme rechtliche Einzelfallbewertung verwenden. Einzelfallbewertung ist Nutzervorgabe, keine selbständige implementierte Bewertungsformel. Nicht auf Nachlieferung oder vorrangig abweichende Verbrauchsgüterfälle übertragen. Andere Fristsetzungsausnahmen separat. Explizite Auswahl/Wahrheitswerte und nichtleerer Nachweis; Versuchszahl ganzzahlig0..2^53-1; Kalenderdaten und berechnete Grenzen0001..9999, sofern jeweiliger Parameter einschlägig.}
\value{wert ist Wahrheitswert des Fehlschlagens in dieser Regel; NICHT_ANWENDBAR/null bei fehlendem Anwendungsbereich. Einheit: wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_440_T0002}
\examples{
nachbesserung_fehlgeschlagen(
  erfolglose_versuche = 0,
  abweichende_umstaende = FALSE,
  fehlgeschlagen_nach_einzelfall = FALSE,
  regel_440_anwendbar = TRUE,
  einordnungsnachweis = paste0(
    "Synthetische zusammengehörige erfolglose Nachbesserungsversu",
    "che; begründete Einzelfalleinordnung."
  )
)
}
