\name{sach_sicherheitswert}
\alias{sach_sicherheitswert}
\title{sach sicherheitswert}
\description{Schätzungswert * 2/3. Verderbsbesorgnis oder schwierige Aufbewahrung ermöglichen Zurückweisung, bewirken sie nicht automatisch. Bei darauf gestützter erklärter Zurückweisung NICHT_ANWENDBAR; Zurückweisung ohne angegebenen gesetzlichen Grund EINGABE_UNGUELTIG.}
\usage{
sach_sicherheitswert(schaetzungswert = NULL,
  verderb_zu_besorgen = NULL,
  aufbewahrung_schwierig = NULL,
  zurueckweisung_erklaert = NULL)
}
\arguments{
  \item{schaetzungswert}{Nichtnegative Dezimalzeichenfolge in EUR, vom Nutzer bereitgestellter Schätzungswert; keine automatische Schätzung. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
  \item{verderb_zu_besorgen}{Expliziter Wahrheitswert einer rechtlich bewerteten Verderbsbesorgnis.}
  \item{aufbewahrung_schwierig}{Expliziter Wahrheitswert besonderer Aufbewahrungsschwierigkeiten, nicht beliebiger Lagerkosten.}
  \item{zurueckweisung_erklaert}{Expliziter Wahrheitswert der tatsächlichen Zurückweisung aus einem der beiden genannten gesetzlichen Gründe. Ein Grund allein bewirkt noch keine Zurückweisung.}
}
\details{Feste lokale BGB-Fassung. Entsprechender Sicherheitsleistungs- oder Sachschadensfall ist gewählt; keine Ermittlung einer nicht in dieser Betragsregel enthaltenen Anspruchsgrundlage. Keine pauschale Bewertung oder Gleichsetzung von Nutzereingabe mit gerichtlich festgestelltem Sachverhalt. NICHT_ANWENDBAR hat wert=null, nicht 0 EUR. Exakte rationale Zahlen innerhalb der gemeinsamen Grenze 9007199254740991 für Zähler und Nenner; Überlauf wird zurückgewiesen. Keine automatische Cent-Rundung.}
\value{S3-Objekt \code{bgb_ergebnis} mit wert (Liste aus Ganzzahlzeichenfolgen zaehler und nenner), einheit EUR, regel_id, regelversion, quellenfassung, eingaben, nutzervorgaben, rechenschritte, annahmen, hinweise und status. Bei NICHT_ANWENDBAR ist wert NULL. Fehlende/ungültige Eingaben erzeugen \code{bgb_berechnungsfehler} mit Status EINGABE_FEHLT oder EINGABE_UNGUELTIG.}
\examples{
sach_sicherheitswert("100", FALSE, FALSE, FALSE)
}
