% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{anweisung_schuldrest_nach_leistung}
\alias{anweisung_schuldrest_nach_leistung}
\title{anweisung schuldrest nach leistung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{anweisung_schuldrest_nach_leistung(
  schuld_vor_leistung = NULL,
  tatsaechlich_geleisteter_betrag = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{schuld_vor_leistung}{Offene Schuld des Angewiesenen gegenüber dem Anweisenden vor tatsächlicher Leistung, in EUR.}
\item{tatsaechlich_geleisteter_betrag}{Tatsächlich bewirkte und dieser Anweisungsschuld zugeordnete Leistung in EUR; bloße Annahme der Anweisung zählt nicht.}
\item{einordnungsnachweis}{Nichtleerer Nachweis der Anweisung auf Schuld nach787I und tatsächlicher schuldbefreiender Leistung; eindeutige Zuordnung ohne Doppeltilgung.}
}
\details{Offene Anweisungsschuld um tatsächlich bewirkte zugeordnete Leistung mindern, mindestens null. §787I: nur Betrag der Schuld des Angewiesenen gegenüber dem Anweisenden im qualifizierten Deckungsverhältnis. §788 trennt bloße Annahme von tatsächlicher Leistung im Valutaverhältnis; die Annahme allein wird nicht als Zahlung eingestellt. Andere Schuldverhältnisse nicht vermischen. Überschießende Zahlung begründet hier weder negative Schuld noch automatisch einen Rückforderungsanspruch. Nichtnegative Eingangswerte, exakter nichtnegativer EUR-Bruch im sicheren gemeinsamen Zahlenbereich.}
\value{wert ist der exakte EUR-Bruch. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_787_T0001}
\examples{
anweisung_schuldrest_nach_leistung(
  schuld_vor_leistung = "100",
  tatsaechlich_geleisteter_betrag = "40",
  einordnungsnachweis = paste0(
    "§787I: nur Betrag der Schuld des Angewiesenen gegenüber dem ",
    "Anweisenden im qualifizierten Deckungsverhältnis. §788 trenn",
    "t bloße Annahme von tatsächlicher Leistung im Valutaverhältn",
    "is; die Annahme allein wird nicht als Zahlung eingestellt. A",
    "ndere Schuldverhältnisse nicht vermischen. Überschießende Za",
    "hlung begründet hier weder negative Schuld noch automatisch ",
    "einen Rückforderungsanspruch."
  )
)
}
