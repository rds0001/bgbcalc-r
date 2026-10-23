% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{gesamthypothek_regressanrechnung}
\alias{gesamthypothek_regressanrechnung}
\title{gesamthypothek regressanrechnung}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{gesamthypothek_regressanrechnung(
  verbleibender_gesamthypothekenbetrag = NULL,
  eigentuemerquote = NULL,
  uebergegangener_regressbetrag = NULL,
  anwendungsnachweis = NULL
)}
\arguments{
\item{verbleibender_gesamthypothekenbetrag}{Gemeinschaftlicher Restbetrag nach dem Teilübergang auf den persönlichen Schuldner; nicht der ursprüngliche Gesamtbetrag.}
\item{eigentuemerquote}{Nach1172 ermittelte Quote des ersatzpflichtigen Eigentümers zwischen0und1.}
\item{uebergegangener_regressbetrag}{Auf den persönlichen Schuldner übergegangener Teilbetrag nach1174II.}
\item{anwendungsnachweis}{Teilübergang und Quote rechtlich qualifizieren; Restbetrag bereits um den Übergang vermindert.}
}
\details{Restbetrag mit Eigentümerquote multiplizieren und übergegangenen Regressbetrag anrechnen; positiven Anteil und Überhang getrennt ausweisen. Unmittelbare Anrechnung gemäß1174II: Anteil am übrig bleibenden Betrag=Restbetrag*1172Quote. Davon den übergegangenen Regressbetrag abziehen. Negativen rechnerischen Saldo gesondert ausweisen; positiver verbleibender Anteil=max(Saldo,0), nicht am Anteil verrechenbarer Regress=max(-Saldo,0). Der übergegangene dingliche Regress wird durch diese Anrechnung nicht getilgt. Keine zusätzliche persönliche Zahlungspflicht aus negativem Saldo, keine erfundene Umverteilung an andere Eigentümer. Die Funktion berechnet ausschließlich die individuelle Anrechnung, nicht eine vollständige Neuverteilung oder Rangvollstreckung. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Anteil vor Anrechnung, vorzeichenbehafteter Saldo, nichtnegativer Restanteil und nicht verrechenbarer Regress. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1172_T0001, BGB_1172_T0002, BGB_1172_T0003, BGB_1174_T0001, BGB_1174_T0002}
\examples{
gesamthypothek_regressanrechnung(
  verbleibender_gesamthypothekenbetrag = "80",
  eigentuemerquote = "0.5",
  uebergegangener_regressbetrag = "20",
  anwendungsnachweis = paste0(
    "Unmittelbare Anrechnung gemäß1174II: Anteil am übrig bleiben",
    "den Betrag=Restbetrag*1172Quote. Davon den übergegangenen Re",
    "gressbetrag abziehen. Negativen rechnerischen Saldo gesonder",
    "t ausweisen; positiver verbleibender Anteil=max(Saldo,0), ni",
    "cht am Anteil verrechenbarer Regress=max(-Saldo,0). Der über",
    "gegangene dingliche Regress wird durch diese Anrechnung nich",
    "t getilgt. Keine zusätzliche persönliche Zahlungspflicht aus",
    " negativem Saldo, keine erfundene Umverteilung an andere Eig",
    "entümer. Die Funktion berechnet ausschließlich die individue",
    "lle Anrechnung, nicht eine vollständige Neuverteilung oder R",
    "angvollstreckung."
  )
)
}
