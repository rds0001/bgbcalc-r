% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{hypothek_zinserweiterungsrahmen}
\alias{hypothek_zinserweiterungsrahmen}
\title{hypothek zinserweiterungsrahmen}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{hypothek_zinserweiterungsrahmen(
  bisheriger_zinssatz = NULL,
  vorgesehener_zinssatz = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{bisheriger_zinssatz}{Nichtnegativer exakter Prozentwert als Dezimalzeichenfolge/Bruchobjekt:5 bedeutet5Prozent; unverzinslich0.}
\item{vorgesehener_zinssatz}{Nichtnegativer exakter neuer Prozentwert derselben Forderung;5 bedeutet5Prozent.}
\item{einordnungsnachweis}{Nichtleere rechtliche Begründung der hypothekarisch gesicherten Forderung und Zinssätze; Änderungswirksamkeit separat.}
}
\details{Spielraum=max(5-bisheriger Zinssatz,0) Prozentpunkte; echte Erhöhung liegt bei bisher<neu<=5. Nur numerischer zustimmungsfreier Erweiterungsrahmen1119I, keine gesamte Änderungswirksamkeit. Keine Gleichsetzung mit gesetzlichem Zinssatz. Kalenderdaten/Ergebnisse0001..9999; Prozentwerte nichtnegative Dezimalzeichenfolge/exaktes Bruchobjekt, sichere Zwischenwerte höchstens2^53-1; Nachweis nichtleer.}
\value{wert enthält erweiterungsspielraum_prozentpunkte als exakten Bruch, zinssatz_wird_erhoeht und erhoehung_innerhalb_fuenfprozentrahmen. Einheit: prozentpunkte_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1119_T0001}
\examples{
hypothek_zinserweiterungsrahmen(
  bisheriger_zinssatz = "0",
  vorgesehener_zinssatz = "5",
  einordnungsnachweis = "Qualifizierte Forderungszinssätze in Prozent."
)
}
