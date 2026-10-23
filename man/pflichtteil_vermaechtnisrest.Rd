\name{pflichtteil_vermaechtnisrest}
\alias{pflichtteil_vermaechtnisrest}
\title{Pflichtteilsberechnung: pflichtteil vermaechtnisrest}
\description{Bei rechtlich wirksamer Ausschlagung des Vermächtnisses voller vorgegebener Pflichtteilsbetrag; sonst max(Pflichtteilsbetrag - Vermächtniswert, 0).}
\usage{
pflichtteil_vermaechtnisrest(pflichtteilsbetrag = NULL,
  unbeschwerter_vermaechtniswert = NULL,
  vermaechtnis_ausgeschlagen = NULL,
  pflichtteilsberechtigt = NULL)
}
\arguments{
\item{pflichtteilsbetrag}{Nichtnegative EUR-Dezimalzeichenfolge des nach den einschlägigen Vorschriften bereits bestimmten Pflichtteilsbetrags. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{unbeschwerter_vermaechtniswert}{Nichtnegative EUR-Dezimalzeichenfolge des Vermächtniswerts ohne Abzug der Beschränkungen und Beschwerungen nach § 2306. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{vermaechtnis_ausgeschlagen}{Expliziter Wahrheitswert zur rechtlich wirksamen Ausschlagung des Vermächtnisses einschließlich gegebenenfalls der Fiktion nach § 2307 Abs. 2.}
\item{pflichtteilsberechtigt}{Expliziter Wahrheitswert für die rechtlich vorab geprüfte Berechtigung im gewählten Fall. FALSE ergibt NICHT_ANWENDBAR.}
}
\details{Ausschlagungsstatus einschließlich möglicher Fiktion nach § 2307 Abs. 2 vorab rechtlich feststellen; Funktion berechnet keine Fristen. Vermächtniswert ohne Beschränkungen/Beschwerungen der in § 2306 bezeichneten Art. Kein universeller Rechner für gleichzeitige Erbeinsetzung und Vermächtnisse, keine Ausschlagung der Erbschaft unterstellen.}
\value{S3-Objekt bgb_ergebnis. Ergebnisobjekt mit wert als zaehler/nenner-Ganzzahlzeichenfolgen, einheit EUR, Regel- und Quellenfassung, Eingaben, Nutzervorgaben und Rechenschritten. Bei NICHT_ANWENDBAR ist wert null. Fehlende oder ungültige Eingaben erzeugen einen strukturierten Berechnungsfehler.}
\examples{
pflichtteil_vermaechtnisrest("10000", "7500", FALSE, TRUE)
}
