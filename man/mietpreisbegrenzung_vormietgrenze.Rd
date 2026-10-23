% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{mietpreisbegrenzung_vormietgrenze}
\alias{mietpreisbegrenzung_vormietgrenze}
\title{mietpreisbegrenzung vormietgrenze}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{mietpreisbegrenzung_vormietgrenze(
  grundbetrag_556d = NULL,
  beruecksichtigungsfaehige_vormiete = NULL,
  vormietprivileg_nutzbar = NULL,
  vormietnachweis = NULL
)}
\arguments{
\item{grundbetrag_556d}{Nichtnegativer exakter EUR-Monatsbetrag nach§556d Absatz1 im konkreten Anwendungsfall. Kann aus mietpreisbegrenzung_grundbetrag stammen; deren NICHT_ANWENDBAR-Ergebnis nicht durch null EUR ersetzen.}
\item{beruecksichtigungsfaehige_vormiete}{Nichtnegative, rechtlich geschuldete letzte Vormiete in EUR pro Monat, bereits um die Nichtberücksichtigung von Mietminderungen und im letzten Jahr vor Beendigung vereinbarten Mieterhöhungen nach§556e Absatz1 Satz2 bereinigt. Tatsächlich gezahlter Betrag kann abweichen; keine automatische Vertrags-/Zeitreihenprüfung.}
\item{vormietprivileg_nutzbar}{Wahrheitswert, ob die bereinigte Vormiete im konkreten Anwendungsfall berücksichtigt werden darf, einschließlich Auskunftsvoraussetzungen§556g Absatz1a und Übergangsrecht. FALSE belässt den Grundbetrag; diese Funktion modelliert ausschließlich Grundbetrag versus Vormietweg, keine anderen Erhöhungstatbestände.}
\item{vormietnachweis}{Nichtleere Beschreibung der zuletzt geschuldeten Vormiete, Bereinigung und rechtlichen Nutzbarkeit einschließlich Auskunftslage. Die Höhe darf nicht frei gewählt werden.}
}
\details{Bei nutzbarem Vormietprivileg: höherer Betrag aus Grundbetrag und berücksichtigungsfähiger Vormiete; sonst Grundbetrag. Vormiete wird nicht zum Grundbetrag addiert. Nur Absatz1. Modernisierungsweg nach Absatz2 separat; keine Addition eines Modernisierungsbetrags auf die Vormietgrenze. Bereinigung der Vormiete und Auskunftsvoraussetzungen sind explizite Nutzervorgaben, nicht hier automatisch geprüfte Teilregeln. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist der exakte EUR-Monatsbetrag für den Grund-/Vormietweg. BERECHNET ist kein abschließender Nachweis eines wirksamen Mietpreises. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_556e_T0001, BGB_556e_T0002, BGB_556e_T0005}
\examples{
mietpreisbegrenzung_vormietgrenze(
  grundbetrag_556d = "880",
  beruecksichtigungsfaehige_vormiete = "0",
  vormietprivileg_nutzbar = FALSE,
  vormietnachweis = paste0(
    "Synthetische bereinigte rechtlich geschuldete Vormiete; Ausk",
    "ünfte geprüft."
  )
)
}
