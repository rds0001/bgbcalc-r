% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{darlehen_kuendigung_zum_sollzinsbindungsende}
\alias{darlehen_kuendigung_zum_sollzinsbindungsende}
\title{darlehen kuendigung zum sollzinsbindungsende}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{darlehen_kuendigung_zum_sollzinsbindungsende(
  kuendigungszugang_am = NULL,
  sollzinsbindung_endet_am = NULL,
  periodische_anpassung_bis_ein_jahr = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{kuendigungszugang_am}{Tatsächlicher rechtlich wirksamer Zugang der Kündigung YYYY-MM-DD.}
\item{sollzinsbindung_endet_am}{Letzter eingeschlossener Tag der rechtlich maßgeblichen Sollzinsbindung YYYY-MM-DD.}
\item{periodische_anpassung_bis_ein_jahr}{Wahrheitswert: rechtlich qualifizierte Sollzinsanpassung in Zeiträumen bis zu einem Jahr gemäß489I1Halbsatz2.}
\item{einordnungsnachweis}{Nichtleerer Nachweis489I1: Bindung endet vor bestimmter Rückzahlungszeit, keine neue Sollzinsvereinbarung, maßgebliche Periodeneinordnung und Zugang qualifiziert.}
}
\details{Einmonatige Kündigungsfrist mit Sollzinsbindungsende und gesetzlicher Periodenbeschränkung verbinden. §489I1: Einmonatsfrist ab Zugang mit Sollzinsbindungsende verbinden. Ohne Periodenbeschränkung ist der spätere dieser beiden Tage der rechnerisch früheste Beendigungstag. Bei qualifizierter Anpassung in Zeiträumen bis zu einem Jahr ist ausschließlich der vorgegebene Bindungsendtag erfasst; ist dafür die Monatsfrist nicht eingehalten, kein fristgerechter Termin in dieser Periode (null). Keine nächste Periode oder neue Zinsvereinbarung erfinden. Kündigungsrecht und formelle Wirksamkeit sind vorqualifiziert; keine Feiertagsverschiebung der Kündigungsfrist. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.einmonatige_kuendigungsfrist_letzter_tag alsDatum, monatsfrist_zum_bindungsende_eingehalten alsWahrheitswert, rechnerischer_beendigungstag alsDatum odernull bei verfehltem periodischem Endtermin. Einheit: daten_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_489_T0001, BGB_489_T0002, BGB_489_T0003}
\examples{
darlehen_kuendigung_zum_sollzinsbindungsende(
  kuendigungszugang_am = "2024-01-31",
  sollzinsbindung_endet_am = "2024-02-29",
  periodische_anpassung_bis_ein_jahr = FALSE,
  einordnungsnachweis = paste0(
    "§489I1: Einmonatsfrist ab Zugang mit Sollzinsbindungsende ve",
    "rbinden. Ohne Periodenbeschränkung ist der spätere dieser be",
    "iden Tage der rechnerisch früheste Beendigungstag. Bei quali",
    "fizierter Anpassung in Zeiträumen bis zu einem Jahr ist auss",
    "chließlich der vorgegebene Bindungsendtag erfasst; ist dafür",
    " die Monatsfrist nicht eingehalten, kein fristgerechter Term",
    "in in dieser Periode (null). Keine nächste Periode oder neue",
    " Zinsvereinbarung erfinden. Kündigungsrecht und formelle Wir",
    "ksamkeit sind vorqualifiziert; keine Feiertagsverschiebung d",
    "er Kündigungsfrist."
  )
)
}
