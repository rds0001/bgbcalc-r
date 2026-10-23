% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{waermepumpe_kostenansatz}
\alias{waermepumpe_kostenansatz}
\title{waermepumpe kostenansatz}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{waermepumpe_kostenansatz(
  kosten_wohnung = NULL,
  errichtungsjahr = NULL,
  jahresarbeitszahl = NULL,
  fachunternehmernachweis_ordnungsgemaess = NULL,
  waermeschutz_ausnahme_erfuellt = NULL,
  sanierungsstandard_erfuellt = NULL,
  vorlauftemperatur = NULL,
  beheizbarkeit_bei_normaussentemperatur = NULL,
  bewertungsnachweis = NULL,
  waermepumpenregel_anwendbar = NULL
)}
\arguments{
\item{kosten_wohnung}{Nichtnegative, der Wohnung zugeordnete Kosten des Einbaus oder der Aufstellung der Wärmepumpe in EUR. Noch keine Halbierung nach §559f; weitere Abzüge und deren Reihenfolge sind nicht Gegenstand dieser Funktion.}
\item{errichtungsjahr}{Ganzzahliges Jahr 1..9999 der Errichtung des Gebäudes. Nach 1996 bedeutet ab 1997; Jahr einer späteren Sanierung hier nicht einsetzen.}
\item{jahresarbeitszahl}{Nichtnegative dimensionslose exakte Zahl als Dezimalzeichenfolge/Bruchobjekt. NULL/None zulässig, wenn kein ordnungsgemäßer Fachunternehmernachweis vorliegt. Ab 2,5 ausreichend; Betriebs-Messwerte allein ersetzen den gesetzlichen Nachweis nicht. Auch eine freiwillig eingegebene Zahl wird validiert.}
\item{fachunternehmernachweis_ordnungsgemaess}{Wahrheitswert zur formellen und methodischen Ordnungsmäßigkeit des Fachunternehmernachweises nach Absatz1 Sätze3 und4, insbesondere VDI4650 Blatt1 Berichtigung2024-08 oder vergleichbares Verfahren. Bei TRUE ist jahresarbeitszahl erforderlich; dieser Wert wird gesondert mit2,5 verglichen.}
\item{waermeschutz_ausnahme_erfuellt}{Wahrheitswert zur fachlich geprüften Alternative Nummer2: Gebäude mindestens nach der genannten Wärmeschutzverordnung1994 in der bis31.01.2002 geltenden Fassung erbaut ODER entsprechender Jahres-Heizwärmebedarf vom Eigentümer nachgewiesen. Keine automatische Prüfung der externen Verordnung.}
\item{sanierungsstandard_erfuellt}{Wahrheitswert zu Nummer3: nach Sanierung mindestens Anforderungen des §38 Gebäudemodernisierungsgesetz erfüllt, gemäß lokalem BGB-Quelltext. Externe Anforderungen sind vorab zu prüfen.}
\item{vorlauftemperatur}{Exakte Grad-Celsius-Zahl als Dezimalzeichenfolge oder Bruchobjekt; darf auch negativ sein. Gemeint ist die Temperatur, bei der das Gebäude bei lokaler Norm-Außentemperatur beheizt werden kann. Optional bei beheizbarkeit_bei_normaussentemperatur=FALSE. Die 55-Grad-Grenze wird einschließlich Gleichheit berechnet.}
\item{beheizbarkeit_bei_normaussentemperatur}{Wahrheitswert, ob die Beheizbarkeit des Gebäudes gerade bei der angegebenen Vorlauftemperatur und lokaler Norm-Außentemperatur fachlich festgestellt ist. TRUE erfordert vorlauftemperatur; kein bloßer momentaner Betriebswert.}
\item{bewertungsnachweis}{Nichtleere Beschreibung der Herkunft von Gebäude-, Technik- und Nachweisdaten. Für geltend gemachte Ausnahmen die fachliche Beurteilung dokumentieren.}
\item{waermepumpenregel_anwendbar}{Wahrheitswert zum sachlichen und zeitlichen Anwendungsbereich des §559f bei einem Erhöhungsweg nach §559 Absatz1 oder §559e Absatz1. FALSE ergibt NICHT_ANWENDBAR; kein vollständiger Grundtatbestand des Erhöhungsanspruchs.}
}
\details{Ordnungsgemäßer Nachweis mit Jahresarbeitszahl mindestens2,5 ODER eine Gebäudeausnahme: Errichtung nach1996, Wärmeschutzalternative, Sanierungsalternative oder belegte Beheizbarkeit bei höchstens55 Grad. Dann Kostenfaktor1, sonst1/2; Kosten damit multiplizieren. Belege und technische Einordnung sind Nutzervorgaben. Eine Ausnahme befreit vom Jahresarbeitszahlnachweis; ein fehlender oder unter2,5 liegender Nachweis verhindert die Ausnahme nicht. Kein VDI-Rechenmodell, keine finale Erhöhung, keine automatische Kappung oder Fördermittelbereinigung. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält jahresarbeitszahlnachweis_ausreichend und gebaeudeausnahme_erfuellt als Wahrheitswerte, kostenfaktor als exakten Bruch und kostenansatz als exakten EUR-Bruch. NICHT_ANWENDBAR ergibt wert=null. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_559f_T0001, BGB_559f_T0002, BGB_559f_T0003, BGB_559f_T0004, BGB_559f_T0005, BGB_559f_T0006, BGB_559f_T0007, BGB_559f_T0008, BGB_559f_T0009}
\examples{
waermepumpe_kostenansatz(
  kosten_wohnung = "10001",
  errichtungsjahr = 1996,
  jahresarbeitszahl = "2.49",
  fachunternehmernachweis_ordnungsgemaess = FALSE,
  waermeschutz_ausnahme_erfuellt = FALSE,
  sanierungsstandard_erfuellt = FALSE,
  vorlauftemperatur = "55",
  beheizbarkeit_bei_normaussentemperatur = FALSE,
  bewertungsnachweis = "Synthetischer geprüfter Gebäude- und Technikfall.",
  waermepumpenregel_anwendbar = TRUE
)
}
