% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{besitz_notwendiger_verwendungsersatz}
\alias{besitz_notwendiger_verwendungsersatz}
\title{besitz notwendiger verwendungsersatz}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{besitz_notwendiger_verwendungsersatz(
  notwendige_eigene_verwendungen = NULL,
  ausgeschlossene_erhaltungskosten = NULL,
  ausgeschlossene_lasten = NULL,
  ersatzfaehige_vorgaengerverwendungen = NULL,
  zuordnungsnachweis = NULL
)}
\arguments{
\item{notwendige_eigene_verwendungen}{Nichtnegative eigene notwendige BruttoverwendungenEUR einschließlich Lasten nach995, ohne Vorgängerbetrag.}
\item{ausgeschlossene_erhaltungskosten}{In eigener Bruttosumme enthaltene gewöhnliche Erhaltungskosten für Zeit verbleibender Nutzungen.}
\item{ausgeschlossene_lasten}{Nicht ersatzfähige Lasten für Zeit verbleibender Nutzungen, nicht außergewöhnliche auf Stammwert gelegte Lasten. Keine Überschneidung mit Erhaltungskosten.}
\item{ersatzfaehige_vorgaengerverwendungen}{Separater rechtlich bereinigter ersatzfähiger Vorgängerbetrag nach999; nicht nochmals in eigenen Kosten enthalten.}
\item{zuordnungsnachweis}{Nichtleerer Nachweis994I-Fall, notwendige Verwendung, Zeitzuordnung/Lastenart und etwaige Rechtsnachfolge.}
}
\details{EigeneVerwendungen-ausgeschlosseneErhaltung-ausgeschlosseneLasten+bereinigteVorgängeransprüche. Ausgeschlossene Posten müssen überschneidungsfreie Teile eigener Verwendungen sein.994II-GoA separat, keine automatische Prüfung997–1003 oder Fälligkeit. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist bereinigter Ersatzbetrag als exakterEUR-Bruch. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_994_T0001, BGB_994_T0002, BGB_994_T0003, BGB_995_T0001, BGB_995_T0002, BGB_999_T0001, BGB_999_T0002}
\examples{
besitz_notwendiger_verwendungsersatz(
  notwendige_eigene_verwendungen = "100",
  ausgeschlossene_erhaltungskosten = "20",
  ausgeschlossene_lasten = "10",
  ersatzfaehige_vorgaengerverwendungen = "40",
  zuordnungsnachweis = paste0(
    "Qualifizierte994I-Verwendungen und separat bereinigter999-Vo",
    "rgängeranspruch."
  )
)
}
