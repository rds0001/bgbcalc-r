% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{besitzer_landwirtschaftlicher_verwendungsersatz}
\alias{besitzer_landwirtschaftlicher_verwendungsersatz}
\title{besitzer landwirtschaftlicher verwendungsersatz}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{besitzer_landwirtschaftlicher_verwendungsersatz(
  ordnungsgemaesse_fruchtkosten = NULL,
  wert_noch_ungetrennter_fruechte = NULL,
  landwirtschaftliches_grundstueck_herauszugeben = NULL,
  fruechte_noch_ungetrennt = NULL,
  trennung_vor_wirtschaftsjahresende_ordnungsgemaess = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{ordnungsgemaesse_fruchtkosten}{Nichtnegative Kosten in EUR der konkret betrachteten noch ungetrennten Früchte, soweit ordnungsmäßiger Wirtschaft entsprechend; keine erfundene Kürzungsquote.}
\item{wert_noch_ungetrennter_fruechte}{Nichtnegativer Wert in EUR derselben noch ungetrennten Früchte. Keine automatische Gleichsetzung mit prognostiziertem Umsatz.}
\item{landwirtschaftliches_grundstueck_herauszugeben}{Wahrheitswert: landwirtschaftliches Grundstück ist herauszugeben.}
\item{fruechte_noch_ungetrennt}{Wahrheitswert: die betrachteten Früchte sind noch nicht getrennt.}
\item{trennung_vor_wirtschaftsjahresende_ordnungsgemaess}{Wahrheitswert: Früchte sind nach Regeln ordnungsmäßiger Wirtschaft vor Ende des Wirtschaftsjahrs zu trennen. Wirtschaftsjahr nicht automatisch Kalenderjahr; fachliche Einordnung erforderlich.}
\item{bewertungsnachweis}{Nichtleere Begründung von Kosten-/Fruchtzuordnung, Wert und ordnungsmäßiger Wirtschaft einschließlich Trennbarkeit vor Wirtschaftsjahresende.}
}
\details{Bei kumulativ erfüllten Voraussetzungen Minimum aus qualifizierten Verwendungskosten und gesetzlicher Wertgrenze bilden. Andere Anspruchsgrundlagen, Geltendmachung nach§1001 und Erlöschen nach§1002 gesondert prüfen. Keine doppelte Erstattung desselben Aufwands. Bewertungen sind belegte Nutzervorgaben. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter EUR-Bruch des begrenzten Ersatzbetrags; bei nicht erfülltem Anwendungsbereich NICHT_ANWENDBAR/null. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_998_T0001}
\examples{
besitzer_landwirtschaftlicher_verwendungsersatz(
  ordnungsgemaesse_fruchtkosten = "80",
  wert_noch_ungetrennter_fruechte = "100",
  landwirtschaftliches_grundstueck_herauszugeben = TRUE,
  fruechte_noch_ungetrennt = TRUE,
  trennung_vor_wirtschaftsjahresende_ordnungsgemaess = TRUE,
  bewertungsnachweis = paste0(
    "Synthetisch rechtlich und wirtschaftlich eingeordnete Verwen",
    "dungen mit belegtem Wert."
  )
)
}
