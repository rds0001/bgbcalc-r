% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{miete_zeitanteiliger_minderungsbetrag}
\alias{miete_zeitanteiliger_minderungsbetrag}
\title{miete zeitanteiliger minderungsbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{miete_zeitanteiliger_minderungsbetrag(
  miete_des_abrechnungsabschnitts = NULL,
  qualifizierte_gesamtminderungsquote = NULL,
  beruecksichtigungsfaehiger_mangelzeitanteil = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{miete_des_abrechnungsabschnitts}{Nichtnegativer exakter Dezimalwert/Bruch; Mietbetrag in EUR, Gesamtminderungsquote und Zeitanteile zwischen0und1. Homogen bepreister disjunkter Abrechnungsabschnitt.}
\item{qualifizierte_gesamtminderungsquote}{Nichtnegativer exakter Dezimalwert/Bruch; Mietbetrag in EUR, Gesamtminderungsquote und Zeitanteile zwischen0und1. Homogen bepreister disjunkter Abrechnungsabschnitt.}
\item{beruecksichtigungsfaehiger_mangelzeitanteil}{Nichtnegativer exakter Dezimalwert/Bruch; Mietbetrag in EUR, Gesamtminderungsquote und Zeitanteile zwischen0und1. Homogen bepreister disjunkter Abrechnungsabschnitt.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des qualifizierten536-/547-Falls und der extern bestimmten Quote/Zeit-/Zahlungszuordnung. Keine gesetzlich ausgeschlossenen Mangelanteile oder unbekannten Bereicherungsfolgen einrechnen.}
}
\details{Miete des homogenen Abrechnungsabschnitts mit qualifizierter Gesamtminderungsquote und berücksichtigungsfähigem Mangelzeitanteil multiplizieren Nur §536 bei rechtlich qualifizierter Mietminderung und homogener Mietpreis-/Minderungsbasis. Quote0..1 extern bestimmen; vollständige Gebrauchsunmöglichkeit gegebenenfalls1. Gleichzeitige Mängel zuerst zu rechtlich angemessener Gesamtquote zusammenführen, nicht einzelne Quoten blind addieren. Zeitanteil0..1 ohne unerhebliche/ausgeschlossene Beeinträchtigungen, insbesondere §536 Absatz1a und sonstige Ausschlüsse. Bei wechselnden Quoten/Mieten disjunkte Abschnitte getrennt berechnen. Keine Minderungstabelle, kein Marktwertverhältnis aus Kaufminderung, keine automatische Monatslänge oder Dreimonatsausnahmeberechnung. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist der exakte Minderungs- oder Vorauszahlungsrückbetrag in EUR als Bruch. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_536_T0001, BGB_536_T0002}
\examples{
miete_zeitanteiliger_minderungsbetrag(
  miete_des_abrechnungsabschnitts = "900",
  qualifizierte_gesamtminderungsquote = "0.2",
  beruecksichtigungsfaehiger_mangelzeitanteil = "0.5",
  einordnungsnachweis = paste0(
    "Qualifizierte Gesamtminderung und berücksichtigungsfähige di",
    "sjunkte Zeit bei homogener Miete."
  )
)
}
