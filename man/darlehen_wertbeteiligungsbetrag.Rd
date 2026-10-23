% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{darlehen_wertbeteiligungsbetrag}
\alias{darlehen_wertbeteiligungsbetrag}
\title{darlehen wertbeteiligungsbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{darlehen_wertbeteiligungsbetrag(
  immobilienwert_bei_rueckzahlung = NULL,
  vertraglicher_wertanteil = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{immobilienwert_bei_rueckzahlung}{Nichtnegativer exakter qualifizierter Dezimalwert/Bruch; Beträge in EUR, vertragliche Wertbeteiligung/Zinsen als Quote (0.05=5Prozent).}
\item{vertraglicher_wertanteil}{Nichtnegativer exakter qualifizierter Dezimalwert/Bruch; Beträge in EUR, vertragliche Wertbeteiligung/Zinsen als Quote (0.05=5Prozent).}
\item{einordnungsnachweis}{Nichtleerer Nachweis des jeweiligen Darlehens-/Vermittlungs-/Teilzahlungsfalls und rechtlich qualifizierter Wert-, Kosten- oder Zinsgrundlage.}
}
\details{Qualifizierten Immobilienwert bei Rückzahlung mit vertraglich festgelegter Wertbeteiligungsquote multiplizieren Nur Wertbeteiligungsdarlehen im Sinne §492b Absatz1 Nummer3. Immobilienwert für den maßgeblichen Rückzahlungszeitpunkt und vertraglichen Umfang extern bewerten; Quote als Jahres-unabhängiger Anteil (0.2=20Prozent), kein Zinssatz. Keine Bestimmung der Zulässigkeit des Kopplungsgeschäfts oder automatisches Hinzufügen einer ursprünglichen Darlehenssumme. Mehrere Rückzahlungen nach jeweils rechtlich bestimmtem Anteil/Umfang separat, keine Doppelzählung. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist der exakt berechnete EUR-Betrag als Bruchobjekt. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_492b_T0009}
\examples{
darlehen_wertbeteiligungsbetrag(
  immobilienwert_bei_rueckzahlung = "500000",
  vertraglicher_wertanteil = "0.2",
  einordnungsnachweis = paste0(
    "Qualifiziertes Wertbeteiligungsdarlehen und Immobilienwert b",
    "ei Rückzahlung."
  )
)
}
