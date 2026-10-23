% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{zinsscheine_zurueckbehaltungsbetrag}
\alias{zinsscheine_zurueckbehaltungsbetrag}
\title{zinsscheine zurueckbehaltungsbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{zinsscheine_zurueckbehaltungsbetrag(
  zinsscheine = NULL,
  einloesung_der_hauptschuldverschreibung = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{zinsscheine}{Liste0..1000 eindeutiger Zinsscheine derselben Hauptschuldverschreibung. Je exakt schein_id (nichtleerer eindeutiger Text), zahlbetrag (nichtnegative exakte EUR-Dezimalzeichenfolge/Bruchobjekt), zurueckgegeben (expliziter Wahrheitswert), zahlungspflicht_nach_803_absatz_1 (qualifizierter Wahrheitswert). Letzterer umfasst weiterbestehende Zahlungspflicht nach Prüfung entgegenstehender Scheinbestimmungen/Einwendungen; keine automatische Ableitung allein aus Status Hauptforderung. Auch ausgeschlossene Beträge werden validiert.}
\item{einloesung_der_hauptschuldverschreibung}{Expliziter Wahrheitswert, dass die Einlösung gerade der zugehörigen Hauptschuldverschreibung vorliegt; FALSE ergibt NICHT_ANWENDBAR.}
\item{einordnungsnachweis}{Nichtleere Begründung der Zuordnung, Rückgabe, fortbestehenden Zahlungspflicht und tatsächlich geschuldeten Beträge aller Scheine.}
}
\details{Bei Einlösung der Hauptschuldverschreibung Summe der tatsächlichen Zahlbeträge genau jener Zinsscheine, die nicht zurückgegeben wurden und für die Zahlungspflicht nach Absatz1 fortbesteht. Nur Rückbehaltungsberechtigung, keine automatische Ausübung, endgültige Forderungskürzung oder zusätzliche Zahlungspflicht. Zahlungspflicht und entgegenstehende Scheinbestimmungen qualifiziert; keine Risiko-/Abzinsungsformel. Keine anderen Scheinarten. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakte EUR-Summe als zaehler/nenner; leere Liste oder keine einschlägigen Scheine0/1, fehlender Einlösungsanwendungsfall null/NICHT_ANWENDBAR. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_803_T0001, BGB_803_T0002}
\examples{
zinsscheine_zurueckbehaltungsbetrag(
  zinsscheine = list(
    list(
    "schein_id" = "A",
    "zahlbetrag" = "10.25",
    "zurueckgegeben" = FALSE,
    "zahlungspflicht_nach_803_absatz_1" = TRUE
  )
  ),
  einloesung_der_hauptschuldverschreibung = TRUE,
  einordnungsnachweis = paste0(
    "Synthetisch qualifizierte Zinsscheine derselben Haupturkunde",
    "."
  )
)
}
