\name{wertpapier_sicherheitswert}
\alias{wertpapier_sicherheitswert}
\title{wertpapier sicherheitswert}
\description{Bei zulässigem Inhaberpapier oder blankoindossiertem Orderpapier, zugelassener Gattung und mit hinterlegten zugehörigen Scheinen: Kurswert * 3/4. Andernfalls NICHT_ANWENDBAR ohne Wert.}
\usage{
wertpapier_sicherheitswert(kurswert = NULL,
  papierart = NULL,
  gattung_zulaessig = NULL,
  scheine_hinterlegt = NULL,
  gattungsnachweis = NULL)
}
\arguments{
  \item{kurswert}{Nichtnegative Dezimalzeichenfolge in EUR. Bei Buchforderung Kurswert der gegen Löschung auszuhändigenden Wertpapiere, nicht Forderungsnominalwert. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
  \item{papierart}{inhaberpapier, blanko_orderpapier oder sonstiges. Nur die ersten beiden Arten erfüllen die Papierartvoraussetzung.}
  \item{gattung_zulaessig}{Expliziter Wahrheitswert zur Zulässigkeit der Gattung nach der Verordnung zu § 240a. Diese externe Einordnung wird nicht von der Library ermittelt.}
  \item{scheine_hinterlegt}{Expliziter Wahrheitswert: zugehörige Zins-, Renten-, Gewinnanteil- und Erneuerungsscheine sind mit hinterlegt.}
  \item{gattungsnachweis}{Nichtleere Herkunfts-/Versionsangabe der externen Gattungseinordnung.}
}
\details{Feste lokale BGB-Fassung. Entsprechender Sicherheitsleistungs- oder Sachschadensfall ist gewählt; keine Ermittlung einer nicht in dieser Betragsregel enthaltenen Anspruchsgrundlage. Keine pauschale Bewertung oder Gleichsetzung von Nutzereingabe mit gerichtlich festgestelltem Sachverhalt. NICHT_ANWENDBAR hat wert=null, nicht 0 EUR. Exakte rationale Zahlen innerhalb der gemeinsamen Grenze 9007199254740991 für Zähler und Nenner; Überlauf wird zurückgewiesen. Keine automatische Cent-Rundung.}
\value{S3-Objekt \code{bgb_ergebnis} mit wert (Liste aus Ganzzahlzeichenfolgen zaehler und nenner), einheit EUR, regel_id, regelversion, quellenfassung, eingaben, nutzervorgaben, rechenschritte, annahmen, hinweise und status. Bei NICHT_ANWENDBAR ist wert NULL. Fehlende/ungültige Eingaben erzeugen \code{bgb_berechnungsfehler} mit Status EINGABE_FEHLT oder EINGABE_UNGUELTIG.}
\examples{
wertpapier_sicherheitswert("100", "inhaberpapier", TRUE, TRUE,
  "Synthetischer bestätigter Gattungsnachweis")
}
