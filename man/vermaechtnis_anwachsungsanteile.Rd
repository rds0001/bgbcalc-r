% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{vermaechtnis_anwachsungsanteile}
\alias{vermaechtnis_anwachsungsanteile}
\title{vermaechtnis anwachsungsanteile}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{vermaechtnis_anwachsungsanteile(
  bedachte = NULL,
  weggefallener_bedachter_id = NULL,
  anwachsung_testamentarisch_ausgeschlossen = NULL,
  vorrangiges_ersatzvermaechtnis = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{bedachte}{Liste2..1000 Bedachter desselben Gegenstands. Genau bedachter_id,vermaechtnisanteil (positive exakte Quote<=1),gemeinschaft_id (nichtleere Gruppenkennung oder NULL). Originalanteile summieren sich auf1 am vermachten Gegenstand; Kennungen eindeutig.}
\item{weggefallener_bedachter_id}{Nichtleere ID eines rechtlich weggefallenen Bedachten aus der Originalliste.}
\item{anwachsung_testamentarisch_ausgeschlossen}{Pflichtwahrheitswert zum Ausschluss der gesamten untersuchten Anwachsung2158II.}
\item{vorrangiges_ersatzvermaechtnis}{Pflichtwahrheitswert zu rechtlich vorrangigem Ersatzvermächtnis2190/2099.}
\item{einordnungsnachweis}{Nichtleerer Nachweis desselben Gegenstands, Wegfalls, Originalquoten und einfacher Gruppenzuordnung. Keine Voraussetzung ausgeschlossener gesetzlicher Erbfolge.}
}
\details{Wegfallquote proportional unter verbleibenden Gruppenmitgliedern, sonst allen übrigen Bedachten verteilen; Ausschluss/Ersatzvorrang beachten; Sonderanteil getrennt. Ein Wegfall, einfache Gruppe. Kein gesetzlicher Erbfolgeausschluss nötig; vollständige Anteile nur am vermachten Gegenstand. Keine Kaskaden oder Gleichsetzung Tod nach Erwerb mit Wegfall. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält anwachsung_erfolgt, vermaechtnisanteile mit ursprünglichem/angewachsenem/gesamtem Anteil und nicht_angewachsener_wegfallender_anteil. Einheit: vermaechtnisquoten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2158_T0001, BGB_2158_T0002, BGB_2158_T0003, BGB_2158_T0004, BGB_2159_T0001, BGB_2190_T0001}
\examples{
vermaechtnis_anwachsungsanteile(
  bedachte = list(
    list(
    "bedachter_id" = "A",
    "vermaechtnisanteil" = "0.25",
    "gemeinschaft_id" = NULL
  ),
    list(
    "bedachter_id" = "B",
    "vermaechtnisanteil" = "0.25",
    "gemeinschaft_id" = NULL
  ),
    list(
    "bedachter_id" = "C",
    "vermaechtnisanteil" = "0.5",
    "gemeinschaft_id" = NULL
  )
  ),
  weggefallener_bedachter_id = "A",
  anwachsung_testamentarisch_ausgeschlossen = FALSE,
  vorrangiges_ersatzvermaechtnis = FALSE,
  einordnungsnachweis = "Synthetischer Einzelwegfall am selben Gegenstand."
)
}
