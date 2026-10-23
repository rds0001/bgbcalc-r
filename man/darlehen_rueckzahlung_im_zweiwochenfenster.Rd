% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{darlehen_rueckzahlung_im_zweiwochenfenster}
\alias{darlehen_rueckzahlung_im_zweiwochenfenster}
\title{darlehen rueckzahlung im zweiwochenfenster}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{darlehen_rueckzahlung_im_zweiwochenfenster(
  kuendigung_wirksam_am = NULL,
  geschuldeter_betrag = NULL,
  rueckzahlungen = NULL,
  feiertagskalender = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{kuendigung_wirksam_am}{Rechtlich bestimmter Tag des Wirksamwerdens YYYY-MM-DD, nicht früherer Zugang.}
\item{geschuldeter_betrag}{Nichtnegativer geschuldeter Rückzahlungsbetrag inEUR zum Wirksamwerden, nach vorherigen Zahlungen bereits bereinigt.}
\item{rueckzahlungen}{Liste0..1000 mit genau zahlung_id, rueckzahlung_am, betrag. Eindeutige tatsächlich bewirkte, rechtlich zugeordnete Rückzahlungen ab Wirksamwerden; Datum bedeutet qualifizierten Erfüllungstag, nicht bloß Überweisungsauftrag.}
\item{feiertagskalender}{Objekt mit genau feiertage(ListeISO-Daten),ort,kalenderquelle,kalender_von,kalender_bis. Vollständiger bestätigter örtlicher Kalender für193 einschließlich nächstem Werktag.}
\item{einordnungsnachweis}{Nichtleerer Nachweis489III: tatsächliches Wirksamwerden, geschuldeter Betrag, erfüllungswirksame Zahlungen und vollständiger193Kalender. Gleichdatierte Zahlung nur bei qualifiziertem zeitlichem Zusammenhang.}
}
\details{Zweiwochenrückzahlungsfrist mit193 korrigieren und rechtzeitige Rückzahlungen mit geschuldetem Betrag vergleichen. §489III: Zweiwochengrundfrist ab Wirksamwerden der Kündigung, anschließend193-Leistungsfristkorrektur mit vorhandenem Kalenderkern. Nur bis einschließlich korrigiertem Ende erfüllungswirksame Rückzahlungen summieren; Deckung und positiven Fehlbetrag vergleichen. Spätere Zahlungen getrennt summieren, sie heilen die Frist nicht automatisch. Keine automatische Kündigungswirksamkeitsentscheidung; geschuldete Summe und Erfüllung rechtlich vorqualifiziert. Kalenderdatum einer Zahlung reicht nur bei rechtlich eindeutig normalisiertem Erfüllungszeitpunkt. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält Grund-/korrigiertes Fristende, rechtzeitige/spätere Zahlungssumme und positiven Fehlbetrag als Eurobrüche sowie numerischen Deckungswahrheitswert. Einheit: daten_EUR_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_489_T0005, BGB_193_T0001}
\examples{
darlehen_rueckzahlung_im_zweiwochenfenster(
  kuendigung_wirksam_am = "2024-08-01",
  geschuldeter_betrag = "1000",
  rueckzahlungen = list(
    list(
    "zahlung_id" = "A",
    "rueckzahlung_am" = "2024-08-15",
    "betrag" = "1000"
  )
  ),
  feiertagskalender = list(
    "feiertage" = list(
    
  ),
    "ort" = "Testort",
    "kalenderquelle" = "Vollständiger ausdrücklich qualifizierter Beispielkalender",
    "kalender_von" = "2024-01-01",
    "kalender_bis" = "2025-12-31"
  ),
  einordnungsnachweis = paste0(
    "§489III: Zweiwochengrundfrist ab Wirksamwerden der Kündigung",
    ", anschließend193-Leistungsfristkorrektur mit vorhandenem Ka",
    "lenderkern. Nur bis einschließlich korrigiertem Ende erfüllu",
    "ngswirksame Rückzahlungen summieren; Deckung und positiven F",
    "ehlbetrag vergleichen. Spätere Zahlungen getrennt summieren,",
    " sie heilen die Frist nicht automatisch. Keine automatische ",
    "Kündigungswirksamkeitsentscheidung; geschuldete Summe und Er",
    "füllung rechtlich vorqualifiziert. Kalenderdatum einer Zahlu",
    "ng reicht nur bei rechtlich eindeutig normalisiertem Erfüllu",
    "ngszeitpunkt."
  )
)
}
