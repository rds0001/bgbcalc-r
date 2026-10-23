% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{gemeinschaft_aufhebungsanteil}
\alias{gemeinschaft_aufhebungsanteil}
\title{gemeinschaft aufhebungsanteil}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{gemeinschaft_aufhebungsanteil(
  gemeinschaftlicher_erloes = NULL,
  zu_berichtigende_gemeinsame_schulden = NULL,
  teilhaberquote = NULL,
  gemeinschaftsbezogene_teilhaberschuld = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{gemeinschaftlicher_erloes}{Nichtnegativer exakter EUR-Betrag als Dezimalzeichenfolge/Bruchobjekt; rechtlich qualifiziert und gleiche Abrechnung ohne Doppelzählung.}
\item{zu_berichtigende_gemeinsame_schulden}{Nichtnegativer exakter EUR-Betrag als Dezimalzeichenfolge/Bruchobjekt; rechtlich qualifiziert und gleiche Abrechnung ohne Doppelzählung.}
\item{teilhaberquote}{Rechtlich bestimmter Einzelanteil zwischen0und1 als exakter Dezimalwert/Bruchobjekt.}
\item{gemeinschaftsbezogene_teilhaberschuld}{Nichtnegativer exakter EUR-Betrag als Dezimalzeichenfolge/Bruchobjekt; rechtlich qualifiziert und gleiche Abrechnung ohne Doppelzählung.}
\item{einordnungsnachweis}{Nichtleerer Nachweis der Gemeinschaftsaufhebung, gesetzlichen Schuldqualifikation und verlangten Berichtigung nach §755/756; konkurrierende Forderungen vorher klären.}
}
\details{Erlös minus gemeinsame Schulden, mindestens null, mal Einzelquote; davon qualifizierte Teilhaberschuld bis zum Anteilsbetrag berichtigen. Nur §§753/755/756 bei rechtlich qualifizierter Erlösaufteilung. Gemeinsame Schuld muss §755 erfüllen und ihre Berichtigung verlangt sein; individuelle Schuld muss gemeinschaftsbezogener Anspruch eines anderen Teilhabers nach §756 sein und ihre Berichtigung verlangt sein. Beträge auf gleiche Abrechnung beziehen, keine Doppelzählung bereits abgezogener Kosten/Schulden. Einzelanteil des Schuldner-Teilhabers; Berichtigungsbetrag ist dem qualifizierten Gläubiger zusätzlich zu dessen eigenem Erlösanteil zuzuordnen. Mehrere konkurrierende Forderungen, wechselseitige Forderungsnetze und Vorränge zuvor rechtlich bestimmen, nicht unbesehen saldieren. Ungedeckte gemeinsame Schuld ist Gesamtrest, keine automatische persönliche Quote. Keine Wertbewertung, Naturteilung/Losentscheidung oder zusätzliche Haftungsentscheidung. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält verteilbare Erlösmasse, Anteil vor Teilhaberschuld, Berichtigungsbetrag, verbleibenden Einzelanteil und ungedeckte individuelle/gemeinsame Schulden als EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_753_T0001, BGB_755_T0001, BGB_756_T0001}
\examples{
gemeinschaft_aufhebungsanteil(
  gemeinschaftlicher_erloes = "1000",
  zu_berichtigende_gemeinsame_schulden = "200",
  teilhaberquote = "0.25",
  gemeinschaftsbezogene_teilhaberschuld = "50",
  einordnungsnachweis = paste0(
    "Qualifizierte gemeinsame und individuelle Gemeinschaftsschul",
    "d, Berichtigung verlangt."
  )
)
}
