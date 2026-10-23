% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{arbeitsverhaeltnis_kuendigungstermin}
\alias{arbeitsverhaeltnis_kuendigungstermin}
\title{arbeitsverhaeltnis kuendigungstermin}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{arbeitsverhaeltnis_kuendigungstermin(
  beschaeftigungsbeginn = NULL,
  zugang_kuendigung = NULL,
  kuendigende_partei = NULL,
  probezeit_vereinbart = NULL,
  vereinbartes_probezeitende = NULL,
  gesetzliche_standardregel_anwendbar = NULL,
  fristnachweis = NULL
)}
\arguments{
\item{beschaeftigungsbeginn}{ISO-Datum0001..9999 des rechtlich maßgeblichen Beschäftigungsbeginns ab Tagesbeginn. Muss die anrechenbare Zugehörigkeit zum Betrieb/Unternehmen korrekt abbilden; Unterbrechungen, Vorbeschäftigungen oder Betriebsübergang vorab einordnen. Kein beliebig rückdatiertes Datum zur Erhöhung der Frist.}
\item{zugang_kuendigung}{Rechtlich festgestelltes ISO-Zugangsdatum der Kündigung, mindestens Beschäftigungsbeginn. Beschäftigungsdauer und Probezeit werden zum Zugang geprüft. Kündigung vor Beschäftigungsbeginn ist außerhalb dieses Modells; Versand- oder Unterschriftsdatum genügt nicht.}
\item{kuendigende_partei}{Auswahl arbeitnehmer oder arbeitgeber. Die Staffel des Absatz2 gilt in dieser gesetzlichen Standardprüfung nur für den Arbeitgeber; eine vertragliche beiderseitige Verlängerung erfordert eine andere Fristprüfung.}
\item{probezeit_vereinbart}{Expliziter Wahrheitswert zur vereinbarten Probezeit. TRUE erfordert vereinbartes_probezeitende; die Funktion begrenzt die verkürzte Frist zusätzlich auf höchstens sechs Monate ab Beschäftigungsbeginn.}
\item{vereinbartes_probezeitende}{ISO-Datum des einschließlich geltenden letzten Tages der vereinbarten Probezeit, nicht vor Beschäftigungsbeginn. Optional bei probezeit_vereinbart=FALSE; falls angegeben dennoch validiert. Ein später als sechs Monate liegendes Vertragsdatum verlängert die gesetzliche Zweiwochenfrist nicht.}
\item{gesetzliche_standardregel_anwendbar}{Wahrheitswert, ob für die konkrete Frist die gesetzlichen Standardregeln§622 Absätze1–3 maßgeblich sind. Abweichende Tarif-/Vertragsfristen, Sondergesetze und sonstige Vorrangregeln vorab prüfen. FALSE ergibt NICHT_ANWENDBAR, nicht etwa keine Kündigungsfrist.}
\item{fristnachweis}{Nichtleere Beschreibung der Beschäftigungszugehörigkeit, Zugangsfeststellung, Probezeit und Auswahl des gesetzlichen Fristenregimes. Keine automatische Prüfung von Kündigungsgrund, Schriftform oder Sonderkündigungsschutz.}
}
\details{Beschäftigungsjahre am Zugang und rechtlich vereinbarte Probezeit bestimmen. Innerhalb vereinbarter Probezeit und höchstens sechs Monaten:2Wochen ohne Terminbindung. Sonst Arbeitgeber ab2/5/8/10/12/15/20Jahren:1/2/3/4/5/6/7Monate zum Monatsende. Sonst4Wochen zum15.oder Monatsende. Ereignisfrist ab Zugang berechnen und den ersten erlaubten Beendigungstermin wählen. Nur gesetzliche Standardfrist, kein vollständiges Kündigungsrecht. Tarif-/Vertragsabweichungen und sonstige Wirksamkeitsfragen als Regimevoraussetzung extern prüfen. Zugehörigkeit ab Tagesbeginn; taggenaue Frist. Kein Zugang vor Arbeitsbeginn; keine §193-Verschiebung des Beendigungstags. Vorzeitige Probezeitvereinbarung wird nicht automatisch auf sechs Monate verlängert. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält vollendete_beschaeftigungsjahre, probezeitfrist_anwendbar, fristanzahl, fristeinheit, terminbindung, rechnerisches_mindestende und fruehester_beendigungstag. Termine bezeichnen Ablauf des jeweiligen Tages. NICHT_ANWENDBAR ergibt wert=null. Einheit: kuendigungsfrist_und_datum.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_622_T0001, BGB_622_T0002, BGB_622_T0003, BGB_622_T0004, BGB_622_T0005, BGB_622_T0006, BGB_622_T0007, BGB_622_T0008, BGB_622_T0009, BGB_622_T0010, BGB_622_T0011, BGB_622_T0012, BGB_622_T0013, BGB_622_T0014, BGB_622_T0015, BGB_622_T0016, BGB_622_T0017, BGB_622_T0018, BGB_187_T0001, BGB_187_T0002, BGB_188_T0002, BGB_188_T0003}
\examples{
arbeitsverhaeltnis_kuendigungstermin(
  beschaeftigungsbeginn = "2000-10-20",
  zugang_kuendigung = "2000-10-20",
  kuendigende_partei = "arbeitgeber",
  probezeit_vereinbart = FALSE,
  vereinbartes_probezeitende = NULL,
  gesetzliche_standardregel_anwendbar = TRUE,
  fristnachweis = paste0(
    "Synthetischer ununterbrochener Bestand ab Tagesbeginn; keine",
    " abweichende Frist."
  )
)
}
