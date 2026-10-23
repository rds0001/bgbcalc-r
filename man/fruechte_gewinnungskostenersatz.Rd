% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{fruechte_gewinnungskostenersatz}
\alias{fruechte_gewinnungskostenersatz}
\title{fruechte gewinnungskostenersatz}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{fruechte_gewinnungskostenersatz(
  ordnungsgemaesse_gewinnungskosten = NULL,
  wert_der_fruechte = NULL,
  herausgabepflicht_fruechte = NULL,
  kostennachweis = NULL
)}
\arguments{
\item{ordnungsgemaesse_gewinnungskosten}{Nichtnegativer in EUR bewerteter Teil tatsächlich auf die Gewinnung der konkreten Früchte verwendeter Kosten, der einer ordnungsmäßigen Wirtschaft entspricht. Ungeeignete/übermäßige/andere Kosten vorab ausscheiden; kein bloßes Gesamtbudget.}
\item{wert_der_fruechte}{Nichtnegativer rechtlich maßgeblicher Wert der betreffenden herauszugebenden Früchte in EUR, gleicher Bezugsfall wie Gewinnungskosten. Keine automatische Sachverständigenbewertung.}
\item{herausgabepflicht_fruechte}{Expliziter Wahrheitswert einer Pflicht zur Herausgabe der betreffenden Früchte. FALSE ergibt NICHT_ANWENDBAR für§102; andere Kostenersatzgrundlagen nicht beurteilt.}
\item{kostennachweis}{Nichtleere Beschreibung der tatsächlich verwendeten und rechtlich qualifizierten Gewinnungskosten, des Fruchtwerts und der Herausgabepflicht.}
}
\details{Bei Herausgabepflicht: Ersatz=min(ordnungsmäßige verwendete Gewinnungskosten,Fruchtwert). Sonst NICHT_ANWENDBAR. Kein Kostenersatz für beliebige Aufwendungen und keine automatische Rechtfertigung aller eingegebenen Kosten. Nur§102 im konkret abgegrenzten Fall. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter EUR-Kostenersatz, höchstens Fruchtwert. Ohne Herausgabepflicht null und NICHT_ANWENDBAR. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_102_T0001}
\examples{
fruechte_gewinnungskostenersatz(
  ordnungsgemaesse_gewinnungskosten = "0",
  wert_der_fruechte = "0",
  herausgabepflicht_fruechte = TRUE,
  kostennachweis = paste0(
    "Synthetische ordnungsmäßige tatsächliche Gewinnungskosten un",
    "d herauszugebende Früchte."
  )
)
}
