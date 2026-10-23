% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{schuldverschreibung_zahlungssperre_intervall}
\alias{schuldverschreibung_zahlungssperre_intervall}
\title{schuldverschreibung zahlungssperre intervall}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{schuldverschreibung_zahlungssperre_intervall(
  antrag_zahlungssperre_am = NULL,
  zahlungssperre_vor_verfahrenseinleitung = NULL,
  sechsmonatsfrist_letzter_tag = NULL,
  einleitungsantrag_am = NULL,
  verfahren_erledigt_am = NULL,
  beobachtung_bis = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{antrag_zahlungssperre_am}{Tag des rechtlich wirksamen Antrags auf die tatsächlich einschlägige Zahlungssperre; erster normalisierter Hemmungstag.}
\item{zahlungssperre_vor_verfahrenseinleitung}{Wahrheitswert des802Satz2-Sonderfalls vor Verfahrenseinleitung.}
\item{sechsmonatsfrist_letzter_tag}{Nur bei Sonderfall: aus Hindernisbeseitigung und206/210/211berechneter letzter Sechsmonatsfristtag. Sonst zwingend None/NULL.}
\item{einleitungsantrag_am}{Tatsächlich erfolgter rechtlich wirksamer Einleitungsantrag; None/NULL bedeutet bis Beobachtung nicht erfolgt, nicht unbekannt.}
\item{verfahren_erledigt_am}{Tatsächliche rechtlich maßgebliche Erledigung; None/NULL bedeutet bis Beobachtung nicht erfolgt, nicht bloß unbekannt.}
\item{beobachtung_bis}{Letzter betrachteter ganzer Tag; ohne feststehendes Ende nur beobachtetes Intervall, kein fiktiver endgültiger Fristablauf.}
\item{einordnungsnachweis}{802Anwendbarkeit und wirksame Zahlungssperre, vollständige Antrags-/Erledigungsdaten und auf ganze Tage normalisierte Hemmung qualifizieren.}
}
\details{Tatsächliche Erledigung und gegebenenfalls unwahrte Sechsmonatsfrist vergleichen; frühestes bekanntes Hemmungsende oder ausdrücklich begrenztes Beobachtungsintervall bilden. 802: Beginn mit Zahlungssperrenantrag. Ende mit tatsächlicher Verfahrenserledigung; im qualifizierten Vorverfahren zusätzlich Ablauf der korrigierten Sechsmonatsfrist, sofern bis dahin kein wirksamer Einleitungsantrag gestellt war. Früheres Endereignis maßgeblich. Einleitungsantrag am letzten Fristtag wahrt; späterer Antrag belebt bereits beendete Hemmung nicht rückwirkend wieder. Bei laufender Hemmung nur bis Beobachtung rechnen und Abschluss ausdrücklich verneinen. Keine künstliche Verfahrenserledigung. Hemmung beeinflusst auch Beginn der Vorlegungsfrist; entsprechende Weiterrechnung mit209unter rechtlicher Qualifikation und ohne doppelte Tage. Sechsmonatsgrundfrist/206/210/211werden vorgelagert mit vorhandenen Kernen berechnet. Datumstage sind rechtlich normalisierte eingeschlossene Hemmungstage; untertägige Sonderfälle nicht pauschal runden. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Optionales feststehendes Hemmungsende, Abschlussmerkmal und ein auf Beobachtung begrenztes Hemmungsintervall für209-Kern. Einheit: daten_und_intervalle.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_802_T0001, BGB_802_T0002, BGB_802_T0003}
\examples{
schuldverschreibung_zahlungssperre_intervall(
  antrag_zahlungssperre_am = "2024-01-01",
  zahlungssperre_vor_verfahrenseinleitung = TRUE,
  sechsmonatsfrist_letzter_tag = "2024-07-01",
  einleitungsantrag_am = NULL,
  verfahren_erledigt_am = NULL,
  beobachtung_bis = "2024-08-01",
  einordnungsnachweis = paste0(
    "802: Beginn mit Zahlungssperrenantrag. Ende mit tatsächliche",
    "r Verfahrenserledigung; im qualifizierten Vorverfahren zusät",
    "zlich Ablauf der korrigierten Sechsmonatsfrist, sofern bis d",
    "ahin kein wirksamer Einleitungsantrag gestellt war. Früheres",
    " Endereignis maßgeblich. Einleitungsantrag am letzten Fristt",
    "ag wahrt; späterer Antrag belebt bereits beendete Hemmung ni",
    "cht rückwirkend wieder. Bei laufender Hemmung nur bis Beobac",
    "htung rechnen und Abschluss ausdrücklich verneinen. Keine kü",
    "nstliche Verfahrenserledigung. Hemmung beeinflusst auch Begi",
    "nn der Vorlegungsfrist; entsprechende Weiterrechnung mit209u",
    "nter rechtlicher Qualifikation und ohne doppelte Tage. Sechs",
    "monatsgrundfrist/206/210/211werden vorgelagert mit vorhanden",
    "en Kernen berechnet. Datumstage sind rechtlich normalisierte",
    " eingeschlossene Hemmungstage; untertägige Sonderfälle nicht",
    " pauschal runden."
  )
)
}
