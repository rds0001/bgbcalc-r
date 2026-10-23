% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{staffelmiete_mindestabstaende}
\alias{staffelmiete_mindestabstaende}
\title{staffelmiete mindestabstaende}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{staffelmiete_mindestabstaende(
  staffeln = NULL,
  vereinbarungsnachweis = NULL
)}
\arguments{
\item{staffeln}{Unbenannte Liste von2..1000 ISO-Daten0001..9999 der ab Tagesbeginn geltenden Staffelbeginne in streng aufsteigender Reihenfolge. Jede Erhöhung/Änderung der vorgegebenen Staffelabfolge einbeziehen; keine Staffeln weglassen. Bei R eine unbenannte list, kein benannter Vektor. Für jeden vorausgehenden Beginn muss das berechnete Folgejahr im unterstützten Kalender liegen.}
\item{vereinbarungsnachweis}{Nichtleere Beschreibung der maßgeblichen Staffelmietvereinbarung und der Vollständigkeit der Staffelbeginne. Die rechtliche Einordnung als Staffelmiete, Schriftform und konkrete Beträge werden nicht aus dem Text extrahiert.}
}
\details{Für jedes benachbarte Paar ein volles Jahr unveränderter Miete ab Tagesbeginn des früheren Staffelbeginns nach§§187/188 berechnen. Frühester neuer Beginn am Tag nach dem Fristende. Jede Staffel muss diesen Beginn erreichen; Gesamtprädikat ist UND aller Einzelprüfungen. Nur zeitlicher Mindestabstand§557a Absatz2 Satz1. Keine automatische Heilung oder Verschiebung einer verfrühten Staffel und keine Bestimmung der Rechtsfolgen. Monatsmieten, Schriftform, Kündigungsausschluss, sonstige Erhöhungsverbote und Mietpreisbegrenzung bleiben eigenständige Prüfungen. Keine§193-Verschiebung des Staffelbeginns. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält alle_jahresabstaende_eingehalten und staffelpruefungen. Jede Einzelprüfung enthält staffelnummer ab2, fruehester_beginn als ISO-Datum und jahresabstand_eingehalten. Auch FALSE hat Status BERECHNET; falsch geordnete Liste ist EINGABE_UNGUELTIG. Einheit: kalenderpruefungen.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_557a_T0002, BGB_187_T0002, BGB_188_T0002, BGB_188_T0003}
\examples{
staffelmiete_mindestabstaende(
  staffeln = list(
    "2026-01-01",
    "2027-01-01"
  ),
  vereinbarungsnachweis = "Synthetische vollständige Staffelabfolge ab Tagesbeginn."
)
}
