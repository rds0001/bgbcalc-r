% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{dinglicher_haftungsumfang}
\alias{dinglicher_haftungsumfang}
\title{dinglicher haftungsumfang}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{dinglicher_haftungsumfang(
  regelfall = NULL,
  forderungsbestandteile = NULL,
  zuordnungsnachweis = NULL
)}
\arguments{
\item{regelfall}{hypothek_1118 oder pfand_1210.}
\item{forderungsbestandteile}{Objekt mit genau den folgenden nichtnegativen EUR-Komponenten. \{'hypothek_1118': ['forderung', 'gesetzliche_zinsen', 'kuendigungskosten', 'rechtsverfolgungskosten'], 'pfand_1210': ['forderung', 'zinsen', 'vertragsstrafen', 'verwendungsersatz', 'kuendigungskosten', 'rechtsverfolgungskosten', 'pfandverkaufskosten']\} Nicht bestehende Beträge ausdrücklich mit0, nichtNULL. Hauptforderung ohne getrennt erfasste Nebenbeträge.}
\item{zuordnungsnachweis}{Nichtleere rechtliche Zuordnung zu gedeckten Komponenten, ohne doppelte Erfassung. Bei1210Absatz1Satz2 keine ausgeschlossenen rechtsgeschäftlichen Erweiterungen.}
}
\details{Addition der rechtlich gedeckten Forderungskomponenten. Nur Umfang bereits rechtlich zugeordneter, nicht überlappender gedeckter Forderungsbestandteile.1118 enthält gesetzliche Zinsen sowie Kündigung und Rechtsverfolgung zur Befriedigung aus dem Grundstück.1210: nachträgliche rechtsgeschäftliche Erweiterungen des persönlichen Schuldners bei abweichendem Pfandeigentümer ausgeschlossen. Forderung ohne nochmals getrennt erfasste Nebenbeträge angeben. Keine Ermittlung von Zinslauf, Rang, Verwertungserlös oder tatsächlicher Deckung; externe Sonderbegrenzungen gesondert. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist der nominale gedeckte Gesamtbetrag als exakter EUR-Bruch; keine tatsächliche Erlösdeckung. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1118_T0001, BGB_1210_T0001, BGB_1210_T0002, BGB_1210_T0003}
\examples{
dinglicher_haftungsumfang(
  regelfall = "hypothek_1118",
  forderungsbestandteile = list(
    "forderung" = "100",
    "gesetzliche_zinsen" = "3",
    "kuendigungskosten" = "2",
    "rechtsverfolgungskosten" = "5"
  ),
  zuordnungsnachweis = paste0(
    "Qualifizierte gedeckte Forderungsbestandteile ohne Doppelzäh",
    "lung."
  )
)
}
