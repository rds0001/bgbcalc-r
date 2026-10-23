% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{teilzahlung_gesamtbetragskorrektur}
\alias{teilzahlung_gesamtbetragskorrektur}
\title{teilzahlung gesamtbetragskorrektur}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{teilzahlung_gesamtbetragskorrektur(
  vertraglicher_gesamtbetrag = NULL,
  angegebener_effektiver_jahreszins = NULL,
  tatsaechlicher_effektiver_jahreszins = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{vertraglicher_gesamtbetrag}{Nichtnegativer exakter qualifizierter Dezimalwert/Bruch; Beträge in EUR, vertragliche Wertbeteiligung/Zinsen als Quote (0.05=5Prozent).}
\item{angegebener_effektiver_jahreszins}{Nichtnegativer exakter qualifizierter Dezimalwert/Bruch; Beträge in EUR, vertragliche Wertbeteiligung/Zinsen als Quote (0.05=5Prozent).}
\item{tatsaechlicher_effektiver_jahreszins}{Nichtnegativer exakter qualifizierter Dezimalwert/Bruch; Beträge in EUR, vertragliche Wertbeteiligung/Zinsen als Quote (0.05=5Prozent).}
\item{einordnungsnachweis}{Nichtleerer Nachweis des jeweiligen Darlehens-/Vermittlungs-/Teilzahlungsfalls und rechtlich qualifizierter Wert-, Kosten- oder Zinsgrundlage.}
}
\details{Gesamtbetrag mit eins minus der absoluten Effektivzins-Unterangabe als Zinsquote multiplizieren Nur §507 Absatz2 letzter Satz bei qualifiziertem Teilzahlungsgeschäft und zu niedrig angegebenem Effektivzins. Eingaben als Jahresquoten,0.05=5Prozent. Beispielsweise Unterangabe8\%-6\%=2Prozentpunkte vermindert Gesamtbetrag um2Prozent. Nicht §494III-Sollzinskorrektur; nicht fehlende Zins-/Gesamtbetragsangabe. Sichere Rechendomäne: Unterangabe zwischen0und1 einschließlich; größere Differenzen erfordern gesonderte rechtliche Behandlung und werden nicht automatisch zu negativem Zahlungsanspruch. Tatsächlicher Effektivzins/Vertragsgesamtbetrag extern bestimmen; keine automatische Ratenneuberechnung. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist der exakt berechnete EUR-Betrag als Bruchobjekt. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_507_T0007}
\examples{
teilzahlung_gesamtbetragskorrektur(
  vertraglicher_gesamtbetrag = "10000",
  angegebener_effektiver_jahreszins = "0.06",
  tatsaechlicher_effektiver_jahreszins = "0.08",
  einordnungsnachweis = paste0(
    "Qualifiziertes Teilzahlungsgeschäft mit zwei Prozentpunkten ",
    "Effektivzins-Unterangabe."
  )
)
}
