% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{vaterschaftsanfechtung_vertretergrundfrist}
\alias{vaterschaftsanfechtung_vertretergrundfrist}
\title{vaterschaftsanfechtung vertretergrundfrist}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{vaterschaftsanfechtung_vertretergrundfrist(
  vertreterkenntnis_am = NULL,
  kind_geboren_am = NULL,
  berechtigter_geboren_am = NULL,
  anerkennung_wirksam_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{vertreterkenntnis_am}{Tag der rechtlich maßgeblichen Kenntnis des gesetzlichen Vertreters.}
\item{kind_geboren_am}{Geburt des Kindes, dessen Vaterschaft angefochten wird.}
\item{berechtigter_geboren_am}{Geburt des minderjährigen Anfechtungsberechtigten; nicht zwingend identisch mit Kindesgeburt.}
\item{anerkennung_wirksam_am}{Wirksame maßgebliche Anerkennung, sonst None/NULL.}
\item{einordnungsnachweis}{Vertreteranfechtung nach1600bII4 der festen lokalen Fassung ausdrücklich rechtlich qualifizieren; keine eigene Anfechtung des Minderjährigen.}
}
\details{Vorhandene allgemeine Zweijahresgrundfrist mit Mindestablauf Vollendung21 kombinieren; kein Volljährigkeitsaufschub bei Vertreteranfechtung. 1600bII4 nimmt für Vertreteranfechtung nur Satz2 aus, nicht Satz3. Deshalb Zweijahresgrundfrist aus Vertreterkenntnis/Geburt/Anerkennung ohne Volljährigkeitsaufschub, aber Mindestablauf Vollendung21 des Berechtigten. Rechtliche Vertretungsbefugnis und zeitlich anwendbare Fassung sind vorqualifiziert. Keine automatische Hemmung1600bIV,193-Korrektur oder Zulässigkeitsprüfung. Bestehenden Kalenderkern verwenden. Vollendung21 bedeutet Ablauf des nach187II berechneten Vortags, nicht einen zusätzlichen Tag. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Zweijahresgrundfristende, Mindestablauf Vollendung21 und späteres kombiniertes Grundfristende; ISO-Daten. Einheit: daten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1600b_T0001, BGB_1600b_T0002, BGB_1600b_T0003, BGB_1600b_T0004, BGB_1600b_T0005, BGB_1600b_T0006, BGB_1600b_T0007, BGB_1600b_T0008, BGB_1600b_T0009, BGB_1600b_T0010, BGB_1600b_T0011, BGB_1600b_T0012, BGB_1600b_T0013}
\examples{
vaterschaftsanfechtung_vertretergrundfrist(
  vertreterkenntnis_am = "2020-02-01",
  kind_geboren_am = "2020-01-01",
  berechtigter_geboren_am = "2005-03-15",
  anerkennung_wirksam_am = NULL,
  einordnungsnachweis = paste0(
    "1600bII4 nimmt für Vertreteranfechtung nur Satz2 aus, nicht ",
    "Satz3. Deshalb Zweijahresgrundfrist aus Vertreterkenntnis/Ge",
    "burt/Anerkennung ohne Volljährigkeitsaufschub, aber Mindesta",
    "blauf Vollendung21 des Berechtigten. Rechtliche Vertretungsb",
    "efugnis und zeitlich anwendbare Fassung sind vorqualifiziert",
    ". Keine automatische Hemmung1600bIV,193-Korrektur oder Zuläs",
    "sigkeitsprüfung. Bestehenden Kalenderkern verwenden. Vollend",
    "ung21 bedeutet Ablauf des nach187II berechneten Vortags, nic",
    "ht einen zusätzlichen Tag."
  )
)
}
