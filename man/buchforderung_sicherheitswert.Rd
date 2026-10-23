\name{buchforderung_sicherheitswert}
\alias{buchforderung_sicherheitswert}
\title{buchforderung sicherheitswert}
\description{Kurswert der gegen Löschung auszuhändigenden Papiere * 3/4. Nur Schuldbuchforderung gegen Bund oder Land; sonst NICHT_ANWENDBAR.}
\usage{
buchforderung_sicherheitswert(kurswert = NULL,
  schuldnerart = NULL)
}
\arguments{
  \item{kurswert}{Nichtnegative Dezimalzeichenfolge in EUR. Bei Buchforderung Kurswert der gegen Löschung auszuhändigenden Wertpapiere, nicht Forderungsnominalwert. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
  \item{schuldnerart}{bund, land oder sonstiges. Die Funktion setzt eine Schuldbuchforderung der bezeichneten Art voraus.}
}
\details{Feste lokale BGB-Fassung. Entsprechender Sicherheitsleistungs- oder Sachschadensfall ist gewählt; keine Ermittlung einer nicht in dieser Betragsregel enthaltenen Anspruchsgrundlage. Keine pauschale Bewertung oder Gleichsetzung von Nutzereingabe mit gerichtlich festgestelltem Sachverhalt. NICHT_ANWENDBAR hat wert=null, nicht 0 EUR. Exakte rationale Zahlen innerhalb der gemeinsamen Grenze 9007199254740991 für Zähler und Nenner; Überlauf wird zurückgewiesen. Keine automatische Cent-Rundung.}
\value{S3-Objekt \code{bgb_ergebnis} mit wert (Liste aus Ganzzahlzeichenfolgen zaehler und nenner), einheit EUR, regel_id, regelversion, quellenfassung, eingaben, nutzervorgaben, rechenschritte, annahmen, hinweise und status. Bei NICHT_ANWENDBAR ist wert NULL. Fehlende/ungültige Eingaben erzeugen \code{bgb_berechnungsfehler} mit Status EINGABE_FEHLT oder EINGABE_UNGUELTIG.}
\examples{
buchforderung_sicherheitswert("200", "bund")
}
