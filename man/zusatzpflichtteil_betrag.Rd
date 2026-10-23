\name{zusatzpflichtteil_betrag}
\alias{zusatzpflichtteil_betrag}
\title{Pflichtteilsberechnung: zusatzpflichtteil betrag}
\description{Zusatzpflichtteil = max(Pflichtteilsbetrag - Wert des hinterlassenen Erbteils, 0).}
\usage{
zusatzpflichtteil_betrag(pflichtteilsbetrag = NULL,
  unbeschwerter_erbteilwert = NULL,
  pflichtteilsberechtigt = NULL)
}
\arguments{
\item{pflichtteilsbetrag}{Nichtnegative EUR-Dezimalzeichenfolge des nach den einschlägigen Vorschriften bereits bestimmten Pflichtteilsbetrags. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{unbeschwerter_erbteilwert}{Nichtnegative EUR-Dezimalzeichenfolge des hinterlassenen Erbteilwerts ohne Abzug der Beschränkungen und Beschwerungen nach § 2306. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{pflichtteilsberechtigt}{Expliziter Wahrheitswert für die rechtlich vorab geprüfte Berechtigung im gewählten Fall. FALSE ergibt NICHT_ANWENDBAR.}
}
\details{Berechnungsstufe bei hinterlassenem Erbteil nach § 2305 bzw. § 2316 Abs. 2. Pflichtteilsbetrag muss bereits nach den einschlägigen Regeln einschließlich gegebenenfalls Ausgleichungen bestimmt sein. Beschränkungen/Beschwerungen nach § 2306 beim Erbteilwert nicht abziehen. Kein automatisches Ausschlagungsrecht, keine Ausschlagungsfrist und keine Entscheidung über gleichzeitige Vermächtnisse.}
\value{S3-Objekt bgb_ergebnis. Ergebnisobjekt mit wert als zaehler/nenner-Ganzzahlzeichenfolgen, einheit EUR, Regel- und Quellenfassung, Eingaben, Nutzervorgaben und Rechenschritten. Bei NICHT_ANWENDBAR ist wert null. Fehlende oder ungültige Eingaben erzeugen einen strukturierten Berechnungsfehler.}
\examples{
zusatzpflichtteil_betrag("10000", "7500", TRUE)
}
