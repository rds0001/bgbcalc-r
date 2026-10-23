% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{dienst_krankheitskosten_anrechnung}
\alias{dienst_krankheitskosten_anrechnung}
\title{dienst krankheitskosten anrechnung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{dienst_krankheitskosten_anrechnung(
  verguetung_erkrankungszeit = NULL,
  anrechenbare_fuersorgekosten = NULL,
  kostenanrechnung_nach_617_zulaessig = NULL,
  anrechnung_ausgeuebt = NULL,
  kostennachweis = NULL
)}
\arguments{
\item{verguetung_erkrankungszeit}{Nichtnegative exakte EUR-Zahl als Dezimalzeichenfolge oder Bruchobjekt der für den konkreten Erkrankungszeitraum tatsächlich geschuldeten Vergütung. Anspruch und Zeitraum vorher bestimmen, keine allgemeine Entgeltfortzahlung aus§617 ableiten.}
\item{anrechenbare_fuersorgekosten}{Nichtnegative exakte EUR-Zahl rechtlich anrechenbarer Kosten erforderlicher Verpflegung/ärztlicher Behandlung nach§617 im zugehörigen Zeitraum; keine unbereinigten Gesamtkosten oder schon anderweitig gedeckten Ausgaben.}
\item{kostenanrechnung_nach_617_zulaessig}{Wahrheitswert, dass die besondere Kostenanrechnung§617 Absatz1 Satz3 für diesen Dienst-/Fürsorgefall zulässig ist; Fürsorgevoraussetzungen und entgegenstehende Regeln vorab prüfen. FALSE ergibt NICHT_ANWENDBAR.}
\item{anrechnung_ausgeuebt}{Wahrheitswert der rechtlich ausgeübten Anrechnung. Gesetzliches Können ist keine automatische Lohnkürzung; bei FALSE Anrechnung0 und volle eingegebene Vergütung verbleibend.}
\item{kostennachweis}{Nichtleere Beschreibung der tatsächlichen/erforderlichen Kosten, deckungsgleichen Vergütungsperiode, konsistenten Brutto-/Nettobasis und Ausübung der Anrechnung. Keine Doppelanrechnung.}
}
\details{Zulässige ausgeübte Anrechnung=min(qualifizierte Kosten, zugehörige Vergütung); verbleibende Vergütung=Vergütung-Anrechnung. Ohne Ausübung Anrechnung0. Keine negative Vergütung oder eigenständige Erstattungspflicht aus übersteigenden Kosten; andere Rechtsgrundlagen separat. Anspruch auf Vergütung und Zulässigkeit der Fürsorgekosten vorab rechtlich bestimmen. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält angerechnete_kosten und verbleibende_verguetung als exakte EUR-Brüche. Ohne Anwendbarkeit NICHT_ANWENDBAR/null. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_617_T0003}
\examples{
dienst_krankheitskosten_anrechnung(
  verguetung_erkrankungszeit = "0",
  anrechenbare_fuersorgekosten = "0",
  kostenanrechnung_nach_617_zulaessig = TRUE,
  anrechnung_ausgeuebt = FALSE,
  kostennachweis = paste0(
    "Synthetisch zugehörige Vergütung und erforderliche anrechenb",
    "are Fürsorgekosten ohne Doppelanrechnung."
  )
)
}
