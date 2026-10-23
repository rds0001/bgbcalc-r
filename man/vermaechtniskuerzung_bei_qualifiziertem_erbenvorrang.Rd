% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{vermaechtniskuerzung_bei_qualifiziertem_erbenvorrang}
\alias{vermaechtniskuerzung_bei_qualifiziertem_erbenvorrang}
\title{vermaechtniskuerzung bei qualifiziertem erbenvorrang}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{vermaechtniskuerzung_bei_qualifiziertem_erbenvorrang(
  erwerbswert_vor_vermaechtnis = NULL,
  vermaechtniswert = NULL,
  gesamte_pflichtteilslast = NULL,
  anderweitig_getragene_last_2323 = NULL,
  pflichtteilswert_erbe = NULL,
  pflichtteilswert_vermaechtnisnehmer = NULL,
  erbenvorrang_und_einzelfall_qualifiziert = NULL,
  rechts_und_bewertungsnachweis = NULL
)}
\arguments{
\item{erwerbswert_vor_vermaechtnis}{Nichtnegativer Erwerbswert nach sonstigen Verbindlichkeiten vor Vermächtnis/Pflichtteilslast.}
\item{vermaechtniswert}{Nichtnegativer Wert höchstens Erwerb.}
\item{gesamte_pflichtteilslast}{Nichtnegative Last höchstens Erwerb.}
\item{anderweitig_getragene_last_2323}{Rechtlich anderweitig getragene Last0..gesamteLast.}
\item{pflichtteilswert_erbe}{Nichtnegativer rechtlich bestimmter eigener Pflichtteil; Schutz bleibt auf vorbestehenden Erwerbsrest begrenzt.}
\item{pflichtteilswert_vermaechtnisnehmer}{Nichtnegativer rechtlich bestimmter Schutzwert des Bedachten.}
\item{erbenvorrang_und_einzelfall_qualifiziert}{Pflichtwahrheitswert: konkrete Anwendung der Erbenvorrangvariante in2318II/III-Konkurrenz fachlich begründet, einErbe/einVermächtnis; FALSE NICHT_ANWENDBAR.}
\item{rechts_und_bewertungsnachweis}{Nichtleere dokumentierte rechtliche Zuordnung gerade zur Erbenvorrangvariante einschließlich Begründung/Quelle und vergleichbarer Bewertungen. Keine beliebige Methodenwahl.}
}
\details{L=Gesamtlast-2323Last;K_B=min(L×V/N,max(V-P_B,0)); geschützterEigenwert=min(P_E,N-V);Bedarf=min(V,max(geschützterEigenwert-(N-V-L),0));K=max(K_B,Bedarf). Explizite extern rechtlich begründete Erbenvorrangvariante, keine universell gelöste2318Konkurrenz. Vorbeeinträchtigung durchVermächtnis nicht reparieren. KeinMehrvermächtnisfall oder freie Methodenwahl. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{Grundkürzung,vorbestehenderErbenschutz,Bedachtenschutzkürzung,Erbenbedarf,Kürzung und verbleibende Werte als EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2318_T0001, BGB_2318_T0003, BGB_2318_T0004, BGB_2323_T0001}
\examples{
vermaechtniskuerzung_bei_qualifiziertem_erbenvorrang(
  erwerbswert_vor_vermaechtnis = "100",
  vermaechtniswert = "60",
  gesamte_pflichtteilslast = "30",
  anderweitig_getragene_last_2323 = "0",
  pflichtteilswert_erbe = "25",
  pflichtteilswert_vermaechtnisnehmer = "30",
  erbenvorrang_und_einzelfall_qualifiziert = TRUE,
  rechts_und_bewertungsnachweis = paste0(
    "Synthetisch fachlich begründete Erbenvorrangvariante2318; re",
    "chtliche Zuordnung und Werte qualifiziert."
  )
)
}
