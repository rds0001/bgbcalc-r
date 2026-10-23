% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{gesellschaft_anteil_nach_bestandswechsel}
\alias{gesellschaft_anteil_nach_bestandswechsel}
\title{gesellschaft anteil nach bestandswechsel}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{gesellschaft_anteil_nach_bestandswechsel(
  bisheriger_anteil = NULL,
  wechselanteil = NULL,
  wechselart = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{bisheriger_anteil}{Bisheriger normierter Anteil eines verbleibenden Gesellschafters zwischen0und1 als Dezimalzeichenfolge/Bruchobjekt.}
\item{wechselanteil}{Bei Ausscheiden bisheriger Anteil des Ausscheidenden kleiner1, zusammen mit Einzelanteil höchstens1; bei Eintritt neuer Endanteil des Eintretenden zwischen0und1.}
\item{wechselart}{ausscheiden oder eintritt; ein rechtlich bestimmter Bestandswechsel.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des gesetzlichen Zweifelsfalls ohne abweichende Vereinbarung und zuvor vollständig normierter Anteile.}
}
\details{Ausscheiden alter Anteil/(1-ausscheidender Anteil); Eintritt alter Anteil*(1-neuer Endanteil). Nur qualifizierter Zweifelsfall des §712 ohne abweichende Vereinbarung. Ergebnis betrifft einen verbleibenden bisherigen Gesellschafter. wechselanteil bei Ausscheiden ist bisheriger Anteil des ausscheidenden Gesellschafters; bei Eintritt der rechtlich bestimmte neue Endanteil des Eintretenden. Alte Anteile zuvor vollständig auf eins normieren. Ein Wechsel je Rechnung; gleichzeitige Ein-/Austritte rechtlich ordnen, nicht blind nacheinander fortschreiben. Ausscheiden des alleinigen Inhabers und rechtlicher Übergang auf einen letzten Gesellschafter nach §712a gesondert prüfen; keine Aussage zum Fortbestand der Gesellschaft. Nicht Abfindung oder persönliche Haftung. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist der neue Einzelanteil des verbleibenden bisherigen Gesellschafters als exaktes Bruchobjekt. Einheit: quote.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_712_T0001, BGB_712_T0002}
\examples{
gesellschaft_anteil_nach_bestandswechsel(
  bisheriger_anteil = "0.25",
  wechselanteil = "0.25",
  wechselart = "ausscheiden",
  einordnungsnachweis = paste0(
    "Qualifizierter712-Zweifelsfall, vollständige alte normierte ",
    "Anteile."
  )
)
}
