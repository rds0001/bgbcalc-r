% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{betreuer_pauschalenfristen}
\alias{betreuer_pauschalenfristen}
\title{betreuer pauschalenfristen}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{betreuer_pauschalenfristen(
  bestellung_am = NULL,
  anspruchsentstehung_am = NULL
)}
\arguments{
\item{bestellung_am}{ISO-Datum der wirksamen Bestellung als Ereignisbeginn erster Jahresfrist.}
\item{anspruchsentstehung_am}{Rechtlich qualifizierter ISO-Anspruchsentstehungstag, frühestens Bestellung. Bei Amtsende vor Jahresfrist kann Anspruch schon vorher entstehen; nicht automatisch als Jahresfristende setzen.}
}
\details{Erste Jahresfrist ab Bestellung und sechsmonatige Grundfrist ab Ende des qualifizierten Anspruchsentstehungsjahres berechnen. Keine automatische Bestimmung tatsächlicher Anspruchsentstehung, Geltendmachungswirkung oder§193-Verschiebung; kein Erlöschensurteil. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält erstes_jahresfristende und erloeschensgrundfristende. Einheit: daten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1878_T0006, BGB_1878_T0008}
\examples{
betreuer_pauschalenfristen(
  bestellung_am = "2030-01-31",
  anspruchsentstehung_am = "2031-01-31"
)
}
