% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{reiseuebertragung_mehrkostenbetrag}
\alias{reiseuebertragung_mehrkostenbetrag}
\title{reiseuebertragung mehrkostenbetrag}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{reiseuebertragung_mehrkostenbetrag(
  tatsaechliche_mehrkosten = NULL,
  angemessener_hoechstbetrag = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{tatsaechliche_mehrkosten}{Nachweislich durch Eintritt des Dritten tatsächlich entstandene zusätzliche Kosten in Euro; kein Reisepreis, keine bloße Pauschale.}
\item{angemessener_hoechstbetrag}{Rechtlich bewerteter angemessener Höchstbetrag für genau dieselben Mehrkosten in Euro; keine erfundene Tarifgrenze.}
\item{einordnungsnachweis}{Nichtleerer Nachweis von tatsächlichem Eintritt, Kausalität, Angemessenheit und betragsmäßigem Nachweis651eIV.}
}
\details{Tatsächlich entstandene Übertragungsmehrkosten auf rechtlich angemessenen Höchstbetrag begrenzen. §651eIII2/IV: nur kleinere Zahl aus tatsächlichen nachgewiesenen Mehrkosten und rechtlich angemessener Betragsgrenze. Keine Gebührentabelle oder automatische Angemessenheitsprüfung. Reisepreis nicht nochmals als Mehrkosten zählen. Gesamtschuld von Reisendem und Drittem rechtlich vorausgesetzt; Betrag nicht verdoppeln und nicht automatisch nach Köpfen aufteilen. Andere Zahlungs-/Erfüllungsvorgänge separat. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert als exakter nichtnegativer Eurobruch mit zaehler und nenner. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_651e_T0004, BGB_651e_T0005, BGB_651e_T0006}
\examples{
reiseuebertragung_mehrkostenbetrag(
  tatsaechliche_mehrkosten = "120",
  angemessener_hoechstbetrag = "80",
  einordnungsnachweis = paste0(
    "§651eIII2/IV: nur kleinere Zahl aus tatsächlichen nachgewies",
    "enen Mehrkosten und rechtlich angemessener Betragsgrenze. Ke",
    "ine Gebührentabelle oder automatische Angemessenheitsprüfung",
    ". Reisepreis nicht nochmals als Mehrkosten zählen. Gesamtsch",
    "uld von Reisendem und Drittem rechtlich vorausgesetzt; Betra",
    "g nicht verdoppeln und nicht automatisch nach Köpfen aufteil",
    "en. Andere Zahlungs-/Erfüllungsvorgänge separat."
  )
)
}
