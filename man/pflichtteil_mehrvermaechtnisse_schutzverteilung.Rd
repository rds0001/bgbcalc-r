% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pflichtteil_mehrvermaechtnisse_schutzverteilung}
\alias{pflichtteil_mehrvermaechtnisse_schutzverteilung}
\title{pflichtteil mehrvermaechtnisse schutzverteilung}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{pflichtteil_mehrvermaechtnisse_schutzverteilung(
  erwerbswert_vor_vermaechtnissen = NULL,
  gesamte_pflichtteilslast = NULL,
  anderweitig_getragene_last_2323 = NULL,
  vermaechtnisse = NULL,
  erbenschutz_anwendbar = NULL,
  eigener_pflichtteilswert = NULL,
  konkurrenzmodell = NULL,
  methodennachweis = NULL
)}
\arguments{
\item{erwerbswert_vor_vermaechtnissen}{Erwerbswert nach sonstigen einschlägigen Verbindlichkeiten, vor diesen Beschwerungen/Pflichtteilslast.}
\item{gesamte_pflichtteilslast}{Gesamtlast auf gleicher Wertgrundlage, höchstens Erwerbswert.}
\item{anderweitig_getragene_last_2323}{Rechtlich nach2320–2322anderweitig getragene Last, höchstens Gesamtlast.}
\item{vermaechtnisse}{Liste1..1000: beschwerung_id, vermaechtniswert, pflichtteilsschutzwert, rang. Kleinere Rangzahl bedeutet rechtlich vorrangige Beschwerung; Kürzung nachrangiger zuerst.}
\item{erbenschutz_anwendbar}{Ob2318III-Schutz des Erben rechtlich anwendbar ist.}
\item{eigener_pflichtteilswert}{Eigener Pflichtteilswert, bei fehlendem Erbenschutz zwingend0; Schutz höchstens vorbestehender Erwerbsrest.}
\item{konkurrenzmodell}{Zwingend rechtlich begründet: erbe_vorrangig oder bedachte_vorrangig.}
\item{methodennachweis}{Gemeinsame2318-Lastbasis, Einzelwerte/Schutzrechte,2189-Ränge und konkrete Schutzkonkurrenz rechtlich qualifizieren. Gleicher Rang proportional nach Beschwerungswerten; keine2324-Sondergewichte.}
}
\details{Gemeinsame Pflichtteilskürzung und zusätzlichen Erbenschutz in getrennten Rangstufen unter individuellen Schutzgrenzen verteilen. Bedingtes Mehrbeschwerungsmodell2318/2189/2323: anderweitigeLast zuerst abziehen. Grundkürzung je Beschwerung anteiligLast*V_i/Erwerb, höchstens positiver Überschuss über individuellen Schutzwert; gemeinsame Grundkürzung rangweise auf nachrangige Beschwerungen zuerst verteilen, innerhalb eines Rangs wertproportional mit Obergrenzen. Zusätzlichen Erbenschutzbedarf zunächst vollständig aus noch ungeschützten Beschwerungsanteilen decken. Nur bei ausdrücklich qualifiziertem Erbenvorrang darf danach verbleibender Bedarf in geschützte Anteile eingreifen; Bedachtenvorrang lässt diesen Fehlbetrag offen. Keine vorbestehende Unterdeckung auf eigenen Pflichtteil auffüllen: SchutzErbe höchstens Erwerb-SummeV, SchutzBedachter höchstensV_i. Rang-/Schutzhierarchie ist eine zwingende rechtliche Modellvoraussetzung, keine allgemeine Lösung aller Auslegungsstreitigkeiten. Negative rechnerische Erbenreste sind offen ausgewiesene Belastung, kein automatisch neuer Anspruch. Keine automatischeGeldforderung beiSachvermächtnissen, keine doppelte Gesamtlastausübung pro Vermächtnis. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Je Beschwerung Kürzung/Rest; rechnerischer Erbenrest und ungedeckter qualifizierter Erbenschutz. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2189_T0001, BGB_2318_T0001, BGB_2318_T0002, BGB_2318_T0003, BGB_2318_T0004, BGB_2323_T0001}
\examples{
pflichtteil_mehrvermaechtnisse_schutzverteilung(
  erwerbswert_vor_vermaechtnissen = "100",
  gesamte_pflichtteilslast = "30",
  anderweitig_getragene_last_2323 = "0",
  vermaechtnisse = list(
    list(
    "beschwerung_id" = "A",
    "vermaechtniswert" = "60",
    "pflichtteilsschutzwert" = "50",
    "rang" = 1
  ),
    list(
    "beschwerung_id" = "B",
    "vermaechtniswert" = "20",
    "pflichtteilsschutzwert" = "0",
    "rang" = 1
  )
  ),
  erbenschutz_anwendbar = FALSE,
  eigener_pflichtteilswert = "0",
  konkurrenzmodell = "bedachte_vorrangig",
  methodennachweis = paste0(
    "Bedingtes Mehrbeschwerungsmodell2318/2189/2323: anderweitige",
    "Last zuerst abziehen. Grundkürzung je Beschwerung anteiligLa",
    "st*V_i/Erwerb, höchstens positiver Überschuss über individue",
    "llen Schutzwert; gemeinsame Grundkürzung rangweise auf nachr",
    "angige Beschwerungen zuerst verteilen, innerhalb eines Rangs",
    " wertproportional mit Obergrenzen. Zusätzlichen Erbenschutzb",
    "edarf zunächst vollständig aus noch ungeschützten Beschwerun",
    "gsanteilen decken. Nur bei ausdrücklich qualifiziertem Erben",
    "vorrang darf danach verbleibender Bedarf in geschützte Antei",
    "le eingreifen; Bedachtenvorrang lässt diesen Fehlbetrag offe",
    "n. Keine vorbestehende Unterdeckung auf eigenen Pflichtteil ",
    "auffüllen: SchutzErbe höchstens Erwerb-SummeV, SchutzBedacht",
    "er höchstensV_i. Rang-/Schutzhierarchie ist eine zwingende r",
    "echtliche Modellvoraussetzung, keine allgemeine Lösung aller",
    " Auslegungsstreitigkeiten. Negative rechnerische Erbenreste ",
    "sind offen ausgewiesene Belastung, kein automatisch neuer An",
    "spruch. Keine automatischeGeldforderung beiSachvermächtnisse",
    "n, keine doppelte Gesamtlastausübung pro Vermächtnis."
  )
)
}
