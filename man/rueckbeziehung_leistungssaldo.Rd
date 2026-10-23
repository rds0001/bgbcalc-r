% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{rueckbeziehung_leistungssaldo}
\alias{rueckbeziehung_leistungssaldo}
\title{rueckbeziehung leistungssaldo}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{rueckbeziehung_leistungssaldo(
  sollwert_bei_rueckbeziehung = NULL,
  bereits_erlangter_istwert = NULL,
  regelfall = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{sollwert_bei_rueckbeziehung}{Nichtnegativer rechtlich bewerteter kontrafaktischer LeistungswertEUR eines Beteiligten bei anfänglicher Gültigkeit/wirksamer Rückbeziehung.}
\item{bereits_erlangter_istwert}{Nichtnegativer bereits erlangter WertEUR desselben Leistungskreises, Zeitraum und Bewertungsbasis; tatsächliche Rückabwicklungen konsistent berücksichtigt.}
\item{regelfall}{vertragsbestaetigung_141 oder bedingungsrueckbeziehung_159.}
\item{bewertungsnachweis}{Nichtleere rechtliche Qualifikation und Bewertung beider Werte, Beteiligter und Stichtag; keine freie Wahl einer hypothetischen Rechtsfolge.}
}
\details{SignedSaldo=Soll-Ist; positiver Fehlbetrag und rechnerischer Mehrerhalt getrennt. Kein automatischer Rückgewähranspruch bei Mehrerhalt, keine Aufrechnung zwischen Beteiligten, keine Hypothesenbewertung.141II-Abweichungen und159-Bedingungseintritt/Rückbeziehungsvereinbarung vorqualifiziert. Nichtnegative EUR-Eingaben; rechnerischer Leistungssaldo darf negativ sein. Exakte Brüche innerhalb gemeinsamem sicheren Zahlenbereich.}
\value{wert enthält rechnerischer_leistungssaldo, fehlender_leistungswert und uebersteigender_istwert alsEUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_141_T0002, BGB_159_T0001}
\examples{
rueckbeziehung_leistungssaldo(
  sollwert_bei_rueckbeziehung = "100",
  bereits_erlangter_istwert = "30",
  regelfall = "vertragsbestaetigung_141",
  bewertungsnachweis = paste0(
    "Gleicher Beteiligter/Leistungskreis, qualifizierte gesetzlic",
    "he Rückbeziehung."
  )
)
}
