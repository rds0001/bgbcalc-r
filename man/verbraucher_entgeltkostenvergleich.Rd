% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{verbraucher_entgeltkostenvergleich}
\alias{verbraucher_entgeltkostenvergleich}
\title{verbraucher entgeltkostenvergleich}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{verbraucher_entgeltkostenvergleich(
  vereinbartes_entgelt = NULL,
  massgebliche_kosten = NULL,
  regelfall = NULL,
  vergleich_anwendbar = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{vereinbartes_entgelt}{Nichtnegatives vereinbartes Entgelt in EUR für die konkrete Nutzung.}
\item{massgebliche_kosten}{Nichtnegative rechtlich qualifizierte Kosten dieser Zahlungsmittelnutzung für den Unternehmer oder das Entgelt für bloße Telekommunikationsnutzung. Konsistente Abrechnungseinheit.}
\item{regelfall}{zahlungsmittel_312a_absatz_4 oder vertragsanruf_312a_absatz_5.}
\item{vergleich_anwendbar}{Bestätigung des Kostenvergleichs-Anwendungsfalls. Keine Bestätigung, dass alle übrigen Zulässigkeitsvoraussetzungen erfüllt sind. FALSE ergibt NICHT_ANWENDBAR.}
\item{einordnungsnachweis}{Nichtleerer Nachweis der Entgelte, tatsächlichen Kostenbasis, Abrechnungseinheit und Fallwahl.}
}
\details{Positive Differenz des vereinbarten Entgelts gegenüber maßgeblichen Kosten; strikte Kostenüberschreitung. KEIN auf Kostengrenze reduzierter Zahlungsanspruch; überschreitende Vereinbarung ist unwirksam. Gängige zumutbare unentgeltliche Zahlungsmöglichkeit und speziellere Entgeltverbote nicht automatisch geprüft. Telekommunikations-Erstattungsanspruch gesondert. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert: kostenobergrenze und entgeltueberhang als EUR-Brüche, kostengrenze_ueberschritten als Wahrheitswert. Einheit: EUR_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_312a_T0008, BGB_312a_T0009, BGB_312a_T0010, BGB_312a_T0011, BGB_312a_T0012, BGB_312a_T0013}
\examples{
verbraucher_entgeltkostenvergleich(
  vereinbartes_entgelt = "10",
  massgebliche_kosten = "3",
  regelfall = "zahlungsmittel_312a_absatz_4",
  vergleich_anwendbar = TRUE,
  einordnungsnachweis = paste0(
    "Synthetischer Entgelt-/Kostenvergleich für einheitliche Nutz",
    "ung."
  )
)
}
