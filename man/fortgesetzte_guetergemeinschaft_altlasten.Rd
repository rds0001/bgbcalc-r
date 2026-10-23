% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{fortgesetzte_guetergemeinschaft_altlasten}
\alias{fortgesetzte_guetergemeinschaft_altlasten}
\title{fortgesetzte guetergemeinschaft altlasten}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{fortgesetzte_guetergemeinschaft_altlasten(
  persoenliche_altverbindlichkeiten = NULL,
  altverbindlichkeiten_erbendeckung = NULL,
  ersatzpflicht_zum_gesamtgut = NULL,
  ersatzpflicht_erbendeckung = NULL,
  zuordnungsnachweis = NULL
)}
\arguments{
\item{persoenliche_altverbindlichkeiten}{Nichtnegativer exakter EUR-Betrag, getrennt zugeordnet und ohne Doppelanrechnung.}
\item{altverbindlichkeiten_erbendeckung}{Nichtnegativer exakter EUR-Betrag, getrennt zugeordnet und ohne Doppelanrechnung.}
\item{ersatzpflicht_zum_gesamtgut}{Nichtnegativer exakter EUR-Betrag, getrennt zugeordnet und ohne Doppelanrechnung.}
\item{ersatzpflicht_erbendeckung}{Nichtnegativer exakter EUR-Betrag, getrennt zugeordnet und ohne Doppelanrechnung.}
\item{zuordnungsnachweis}{Nichtleerer Nachweis der persönlichen Innenlast, Ersatzpflicht und fehlenden weiter erlangbaren Erbendeckung; qualifizierte Ausgangsposten, keine Doppelzählung.}
}
\details{Je Ausgangsposten die ihm zugeordnete Erbendeckung abziehen; beide ungedeckten Anrechnungsposten addieren. §1500I/II: reine Ermittlung der ungedeckten Anrechnungsposten vor der Auseinandersetzungsbilanz. Ausgangsposten rechtlich getrennt und ohne Überschneidung: persönliche Verbindlichkeiten des Verstorbenen im Innenverhältnis sowie dessen Ersatzpflicht zum Gesamtgut. Erbendeckung umfasst die rechtlich erlangbare Deckung, nicht lediglich bisher tatsächlich eingegangene Zahlung; deren Uneinbringlichkeit/Erreichbarkeit ist qualifiziert. Keine doppelte Deckungszuordnung. Nicht bereits bereinigte Restposten nochmals vermindern. Kein zusätzlicher Geldanspruch gegen Abkömmlinge und keine individuelle Verteilung; nach§1498 besteht die überschießende persönliche Ersatzpflicht des§1476II2 nur für den überlebenden Ehegatten. Gesamtgutsbereinigung, Einrechnung vor Halbteilung, Anrechnung auf die Abkömmlingshälfte sowie§1501/1503 sind nachgelagerte Bilanzschritte, hier nicht als vollständige Teilung ausgegeben. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält ungedeckte_altverbindlichkeiten, ungedeckte_ersatzpflicht und anrechnungspostensumme als exakte EUR-Brüche. Noch keine vollständige Teilungsbilanz. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1500_T0001, BGB_1500_T0002}
\examples{
fortgesetzte_guetergemeinschaft_altlasten(
  persoenliche_altverbindlichkeiten = "100",
  altverbindlichkeiten_erbendeckung = "30",
  ersatzpflicht_zum_gesamtgut = "80",
  ersatzpflicht_erbendeckung = "50",
  zuordnungsnachweis = paste0(
    "Getrennte qualifizierte Ausgangslasten, zugeordnete Erbendec",
    "kung ausgeschöpft, keine Doppelzählung."
  )
)
}
