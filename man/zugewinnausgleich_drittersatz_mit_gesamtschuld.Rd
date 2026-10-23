% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{zugewinnausgleich_drittersatz_mit_gesamtschuld}
\alias{zugewinnausgleich_drittersatz_mit_gesamtschuld}
\title{zugewinnausgleich drittersatz mit gesamtschuld}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{zugewinnausgleich_drittersatz_mit_gesamtschuld(
  ausgleichsforderung = NULL,
  endnettovermoegen = NULL,
  bereicherungsrechtlicher_zuwendungswert = NULL,
  anrechenbare_entreicherung = NULL,
  erfuellung_ehegatte = NULL,
  erfuellung_dritter = NULL,
  begrenzungsmodell = NULL,
  methodennachweis = NULL
)}
\arguments{
\item{ausgleichsforderung}{Ursprüngliche rechtlich bestimmte Ausgleichsforderung vor den hier erfassten Erfüllungen.}
\item{endnettovermoegen}{Vorzeichenbehafteter Wert nach Verbindlichkeitsabzug bei Beendigung des Güterstands; Tatbestandsvergleich, nicht Zahlungshöchstbetrag.}
\item{bereicherungsrechtlicher_zuwendungswert}{Nach818qualifizierter Geldherausgabewert vor dem getrennt eingegebenen Entreicherungsabzug.}
\item{anrechenbare_entreicherung}{Rechtlich zulässiger Entreicherungsabzug; verschärfte Haftung vorher beurteilen.}
\item{erfuellung_ehegatte}{Bereits schuldbefreiend auf dieselbe Ausgleichsforderung geleisteter Betrag des Ehegatten.}
\item{erfuellung_dritter}{Bereits schuldbefreiend auf dieselbe Ausgleichsforderung geleisteter Betrag des Dritten; keine zusätzliche zweite Forderung.}
\item{begrenzungsmodell}{Zwingend rechtlich qualifiziert: ausgleichsforderung_als_obergrenze. Keine stillschweigende Begrenzung auf bloßen Vermögensfehlbetrag.}
\item{methodennachweis}{1390I/II-Benachteiligungs-/Kenntnisvoraussetzungen, bereicherungsrechtliche Bewertung, Forderungsobergrenze und Erfüllungswirkung ausdrücklich belegen.}
}
\details{Vermögensfehlbetrag als Tatbestandsvergleich bestimmen, qualifizierten Bereicherungsrest auf Forderung begrenzen und gemeinsame Erfüllungen ohne Doppelabzug verrechnen. Bedingtes1390-Geldersatzmodell mit ausdrücklich qualifizierter Forderungsobergrenze: Tatbestandsmerkmal ursprünglicheAusgleichsforderung>Endnettovermögen selbst vergleichen. Bereicherungsrest durch vorhandenen818-Kern. Drittgrundbetrag bei erfülltem Betragsmerkmal=min(Bereicherungsrest,ursprünglicheAusgleichsforderung), nicht min(...,Vermögensfehlbetrag). Rechtliche Geltung dieser Forderungsobergrenze wird als Voraussetzung verlangt, nicht abschließend aus der Reformbegründung2009 behauptet. Beide Erfüllungsbeträge einmal von der gemeinsamen Forderung abziehen; Drittrest=min(noch offener gemeinsamer Forderung,Drittgrundbetrag-Dritterfüllung). Ehegattenzahlung verkleinert die gemeinsame Restforderung, ist aber nicht zusätzlich nochmals vom individuellen Drittrahmen abzuziehen. Ursprüngliches Betragsmerkmal nicht nachträglich anhand der bereits getilgten Forderung neu prüfen. Keine über den ursprünglichen Anspruch hinausgehenden Nebenforderungen; Sachherausgabe zur Abwendung nur bei rechtlich bestimmter Erfüllungsbewertung als Erfüllungsbetrag erfassen. §1390III-Verjährungsbeginn bleibt separate Kalenderbindung. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Betragsmerkmal, Vermögensfehlbetrag, Bereicherungsrest, bedingter Drittgrundbetrag, gemeinsame Restforderung und verbleibender Drittersatz. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_422_T0001, BGB_422_T0002, BGB_422_T0003, BGB_818_T0001, BGB_818_T0002, BGB_818_T0003, BGB_818_T0004, BGB_1390_T0001, BGB_1390_T0002, BGB_1390_T0003, BGB_1390_T0004, BGB_1390_T0005, BGB_1390_T0006, BGB_1390_T0007, BGB_1390_T0008, BGB_1390_T0009, BGB_1390_T0010}
\examples{
zugewinnausgleich_drittersatz_mit_gesamtschuld(
  ausgleichsforderung = "100",
  endnettovermoegen = "80",
  bereicherungsrechtlicher_zuwendungswert = "50",
  anrechenbare_entreicherung = "0",
  erfuellung_ehegatte = "0",
  erfuellung_dritter = "0",
  begrenzungsmodell = "ausgleichsforderung_als_obergrenze",
  methodennachweis = paste0(
    "Bedingtes1390-Geldersatzmodell mit ausdrücklich qualifiziert",
    "er Forderungsobergrenze: Tatbestandsmerkmal ursprünglicheAus",
    "gleichsforderung>Endnettovermögen selbst vergleichen. Bereic",
    "herungsrest durch vorhandenen818-Kern. Drittgrundbetrag bei ",
    "erfülltem Betragsmerkmal=min(Bereicherungsrest,ursprüngliche",
    "Ausgleichsforderung), nicht min(...,Vermögensfehlbetrag). Re",
    "chtliche Geltung dieser Forderungsobergrenze wird als Voraus",
    "setzung verlangt, nicht abschließend aus der Reformbegründun",
    "g2009 behauptet. Beide Erfüllungsbeträge einmal von der geme",
    "insamen Forderung abziehen; Drittrest=min(noch offener gemei",
    "nsamer Forderung,Drittgrundbetrag-Dritterfüllung). Ehegatten",
    "zahlung verkleinert die gemeinsame Restforderung, ist aber n",
    "icht zusätzlich nochmals vom individuellen Drittrahmen abzuz",
    "iehen. Ursprüngliches Betragsmerkmal nicht nachträglich anha",
    "nd der bereits getilgten Forderung neu prüfen. Keine über de",
    "n ursprünglichen Anspruch hinausgehenden Nebenforderungen; S",
    "achherausgabe zur Abwendung nur bei rechtlich bestimmter Erf",
    "üllungsbewertung als Erfüllungsbetrag erfassen. §1390III-Ver",
    "jährungsbeginn bleibt separate Kalenderbindung."
  )
)
}
