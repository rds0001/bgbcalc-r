% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{geburtsunterhalt_zeitgrenzen}
\alias{geburtsunterhalt_zeitgrenzen}
\title{geburtsunterhalt zeitgrenzen}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{geburtsunterhalt_zeitgrenzen(
  geburt_am = NULL
)}
\arguments{
\item{geburt_am}{Tatsächliches ISO-Geburtsdatum. Nur zeitliche Grundgrenzen; Voraussetzungen von erweitertem Unterhalt und Verlängerung separat qualifizieren.}
}
\details{Regelbeginn Geburt-42Tage; Regelende Geburt+56Tage; früheste Erweiterung Geburt-4Monate; Dreijahresgrundgrenze Geburt+3Jahre. Nur gesetzliche Zeitgrenzen nach§1615lI1/II3, kein automatischer Anspruch für den gesamten erweiterten Zeitraum. Schwangerschaft/Krankheit oder Betreuung, fehlende Erwerbserwartung und tatsächlicher Beginn/Umfang rechtlich qualifizieren. Billigkeitsverlängerungen nachAbsatz2 sind nicht auf drei Jahre begrenzt. Schwangerschafts-/Entbindungskosten können nachAbsatz1Satz2 auch außerhalb des Regelzeitraums entstehen. Absatz4-Verweis für betreuenden Vater gesondert qualifizieren. Keine Unterhaltshöhe, Tagesproration oder medizinische Berechnung. Ereignisbezogene Enddaten sind Ablaufdaten, keine Altersbeginnberechnung nach§187II2. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält regelzeitraum_beginn, regelzeitraum_ende, erweiterung_fruehester_beginn und dreijahresgrundgrenze als ISO-Daten. Einheit: daten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1615l_T0001, BGB_1615l_T0005}
\examples{
geburtsunterhalt_zeitgrenzen(
  geburt_am = "2030-01-01"
)
}
