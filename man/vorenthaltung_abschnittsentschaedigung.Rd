% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{vorenthaltung_abschnittsentschaedigung}
\alias{vorenthaltung_abschnittsentschaedigung}
\title{vorenthaltung abschnittsentschaedigung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{vorenthaltung_abschnittsentschaedigung(
  regelfall = NULL,
  abschnittsentgelt = NULL,
  zeitanteil_zaehler = NULL,
  zeitanteil_nenner = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{regelfall}{Genau miete_vertrag, miete_ortsueblich oder landpacht_vertrag. Bei Miete546a nur eine alternativ gewählte Entgeltbasis; bei Landpacht597 vertragliche Pacht, keine automatisch übertragene ortsübliche Ersatzbasis.}
\item{abschnittsentgelt}{Nichtnegativer exakter EUR-Betrag für den vollständigen homogen bepreisten Abrechnungsabschnitt in der gewählten Entgeltbasis.}
\item{zeitanteil_zaehler}{Nichtnegative ganze Zahl des rechtlich bestimmten Vorenthaltungszeitanteils innerhalb dieses Abschnitts, höchstens Nenner und2^53-1.}
\item{zeitanteil_nenner}{Positive ganze Bezugsgröße des gesamten Abschnitts im selben Zeitmaßstab, höchstens2^53-1. Zeitanteil0..1. Bei wechselnden Preisen oder mehreren Monaten disjunkte Abschnitte einzeln berechnen; keine pauschale30Tage-Annahme.}
\item{einordnungsnachweis}{Nichtleerer Nachweis von Beendigung, Vorenthaltung, gewählter Entgeltbasis und zutreffendem Zeitanteil. Rückgabezeitpunkt und Tagesabgrenzung rechtlich bestimmen.}
}
\details{Gewähltes Miet- oder Landpachtentgelt des Abrechnungsabschnitts mit dem qualifizierten Vorenthaltungszeitanteil multiplizieren. §546aI: vereinbarte Miete ODER qualifizierte ortsübliche Miete vergleichbarer Sachen; Alternativen nicht addieren. §597: vereinbarte Landpacht für die Vorenthaltungsdauer, keine ungeprüfte Übertragung der Berechnungsweise584b. Nur ein homogener Abschnitt und dessen zutreffend bestimmter Zeitanteil; für mehrere Abschnitte disjunkte Ergebnisse addieren. Weitere ersatzfähige Schäden546aII/597Satz2 ohne Doppelzählung gesondert, ebenso geleistete Zahlungen. Keine automatische Entschädigung bloß wegen eines behaupteten Rückgabeverzugs; rechtliche Vorenthaltung und sonstige Voraussetzungen vorqualifiziert. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert: exakter EUR-Entschädigungsbruch für den Vorenthaltungsanteil des Abschnitts. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_546a_T0001, BGB_546a_T0002, BGB_597_T0001, BGB_597_T0002}
\examples{
vorenthaltung_abschnittsentschaedigung(
  regelfall = "miete_vertrag",
  abschnittsentgelt = "1000",
  zeitanteil_zaehler = 1,
  zeitanteil_nenner = 4,
  einordnungsnachweis = paste0(
    "§546aI: vereinbarte Miete ODER qualifizierte ortsübliche Mie",
    "te vergleichbarer Sachen; Alternativen nicht addieren. §597:",
    " vereinbarte Landpacht für die Vorenthaltungsdauer, keine un",
    "geprüfte Übertragung der Berechnungsweise584b. Nur ein homog",
    "ener Abschnitt und dessen zutreffend bestimmter Zeitanteil; ",
    "für mehrere Abschnitte disjunkte Ergebnisse addieren. Weiter",
    "e ersatzfähige Schäden546aII/597Satz2 ohne Doppelzählung ges",
    "ondert, ebenso geleistete Zahlungen. Keine automatische Ents",
    "chädigung bloß wegen eines behaupteten Rückgabeverzugs; rech",
    "tliche Vorenthaltung und sonstige Voraussetzungen vorqualifi",
    "ziert."
  )
)
}
