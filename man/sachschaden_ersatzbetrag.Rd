\name{sachschaden_ersatzbetrag}
\alias{sachschaden_ersatzbetrag}
\title{sachschaden ersatzbetrag}
\description{(erforderlicher_nettobetrag + ersatzfaehige_angefallene_umsatzsteuer) * (1-mitverschuldensquote). Nettobetrag und Umsatzsteuer müssen überschneidungsfrei sein; Steuer nur soweit tatsächlich angefallen und vom erforderlichen Herstellungsaufwand umfasst. Quote als rechtlich bewertete Eingabe, keine eigene Abwägungsformel.}
\usage{
sachschaden_ersatzbetrag(erforderlicher_nettobetrag = NULL,
  ersatzfaehige_angefallene_umsatzsteuer = NULL,
  mitverschuldensquote = NULL)
}
\arguments{
  \item{erforderlicher_nettobetrag}{Nichtnegative Dezimalzeichenfolge in EUR des als erforderlich bewerteten Herstellungsaufwands ohne Umsatzsteuer, keine doppelte Erfassung derselben Position. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
  \item{ersatzfaehige_angefallene_umsatzsteuer}{Nichtnegative Dezimalzeichenfolge in EUR ausschließlich der tatsächlich angefallenen und vom erforderlichen Herstellungsaufwand umfassten Umsatzsteuer; bei fiktiver Abrechnung null. Keine automatische Steuerermittlung. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
  \item{mitverschuldensquote}{Rechtlich bewertete Dezimalzeichenfolge von 0 bis 1. 0.25 bedeutet 25 Prozent; die Library führt keine eigene Abwägung nach § 254 durch. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
}
\details{Feste lokale BGB-Fassung. Entsprechender Sicherheitsleistungs- oder Sachschadensfall ist gewählt; keine Ermittlung einer nicht in dieser Betragsregel enthaltenen Anspruchsgrundlage. Keine pauschale Bewertung oder Gleichsetzung von Nutzereingabe mit gerichtlich festgestelltem Sachverhalt. NICHT_ANWENDBAR hat wert=null, nicht 0 EUR. Exakte rationale Zahlen innerhalb der gemeinsamen Grenze 9007199254740991 für Zähler und Nenner; Überlauf wird zurückgewiesen. Keine automatische Cent-Rundung.}
\value{S3-Objekt \code{bgb_ergebnis} mit wert (Liste aus Ganzzahlzeichenfolgen zaehler und nenner), einheit EUR, regel_id, regelversion, quellenfassung, eingaben, nutzervorgaben, rechenschritte, annahmen, hinweise und status. Bei NICHT_ANWENDBAR ist wert NULL. Fehlende/ungültige Eingaben erzeugen \code{bgb_berechnungsfehler} mit Status EINGABE_FEHLT oder EINGABE_UNGUELTIG.}
\examples{
sachschaden_ersatzbetrag("100", "19", "0.25")
}
