% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{betreuer_staatskassen_anspruchsuebergang}
\alias{betreuer_staatskassen_anspruchsuebergang}
\title{betreuer staatskassen anspruchsuebergang}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{betreuer_staatskassen_anspruchsuebergang(
  bestehender_betreueranspruch = NULL,
  staatskassenbefriedigung = NULL,
  zuordnungsnachweis = NULL
)}
\arguments{
\item{bestehender_betreueranspruch}{Nichtnegativer bestehender Anspruch des Betreuers gegen Betreuten vor betrachteter Zahlung in EUR, frühere Übergänge bereits abgezogen.}
\item{staatskassenbefriedigung}{Nichtnegative tatsächliche Staatskassenzahlung für genau diesen Anspruch in EUR.}
\item{zuordnungsnachweis}{Nichtleerer Nachweis des bestehenden Anspruchs und Zuordnung der Befriedigung ohne Doppelanrechnung.}
}
\details{Übergang=min(bestehender Anspruch,zugeordnete Staatskassenbefriedigung); verbleibender Anspruch=Anspruch-Übergang. §1881Satz1, ein rechtlich abgegrenzter bestehender Anspruch des Betreuers gegen den Betreuten unmittelbar vor der betrachteten Befriedigung. Zugeordnete Zahlung der Staatskasse für denselben Anspruch; frühere Zahlungen/Übergänge nicht nochmals einrechnen. Überschießende Zahlung erzeugt keinen zusätzlichen Anspruch gegen den Betreuten und keinen automatisch festgestellten Rückzahlungsanspruch. Entstehung/Höhe des Betreueranspruchs und Mittellosigkeit nicht geprüft. Die Erbenhaftung nachSatz2 wird in dieser Funktion nicht berechnet. Der separate Baustein betreuer_erbenhaftungsbetrag berechnet den BGB-Nachlasswertdeckel; externe102III/IV-SGB-XII-Ausnahmen bleiben ausdrücklich rechtlich vorzuqualifizieren. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält uebergegangener_anspruch und verbleibender_betreueranspruch als EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1881_T0001}
\examples{
betreuer_staatskassen_anspruchsuebergang(
  bestehender_betreueranspruch = "1000",
  staatskassenbefriedigung = "300",
  zuordnungsnachweis = paste0(
    "Bestehender Anspruch und zugeordnete tatsächliche Staatskass",
    "enleistung belegt."
  )
)
}
