% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{leistungsbestimmung_durchschnittssumme}
\alias{leistungsbestimmung_durchschnittssumme}
\title{leistungsbestimmung durchschnittssumme}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{leistungsbestimmung_durchschnittssumme(
  bestimmte_summen = NULL,
  zweifelsregel_nach_317_anwendbar = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{bestimmte_summen}{Liste von2 bis1000 Objekten mit eindeutigem dritter_id und nichtnegativer summe in EUR. Sämtliche rechtlich maßgeblichen Bestimmungen vollständig angeben.}
\item{zweifelsregel_nach_317_anwendbar}{Fachlich geprüfte Anwendung der gesetzlichen Durchschnittsregel; FALSE ergibt NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleerer Nachweis der vollständigen Bestimmungen, ihrer Gültigkeit und einheitlichen Währung.}
}
\details{Summen sämtlicher bestimmender Dritter gleichgewichtet addieren und durch deren Anzahl teilen. Nur die Zweifelsregel für eine durch mehrere Dritte bestimmte Geldsumme in einheitlicher Währung EUR. Abweichende Vereinbarungen, rechtlich unwirksame Bestimmungen oder nichtmonetäre Leistungen nicht erfasst. Jede Person genau einmal einbeziehen; keine Mehrheitsabstimmung und keine Entfernung von Ausreißern. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist gleichgewichteter Durchschnitt als exakter EUR-Bruch, ohne Cent-Rundung. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_317_T0002}
\examples{
leistungsbestimmung_durchschnittssumme(
  bestimmte_summen = list(
    list(
    "dritter_id" = "0",
    "summe" = "100"
  ),
    list(
    "dritter_id" = "1",
    "summe" = "200"
  )
  ),
  zweifelsregel_nach_317_anwendbar = TRUE,
  bewertungsnachweis = paste0(
    "Synthetische vollständige Bestimmungen in EUR, gesetzliche Z",
    "weifelsregel."
  )
)
}
