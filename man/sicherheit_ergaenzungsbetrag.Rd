\name{sicherheit_ergaenzungsbetrag}
\alias{sicherheit_ergaenzungsbetrag}
\title{sicherheit ergaenzungsbetrag}
\description{Bei fehlendem Verschulden des Berechtigten max(erforderliche_sicherheit-vorhandener_sicherheitswert,0). Bei Verschulden NICHT_ANWENDBAR für diese Norm, keine Aussage zu anderen Anspruchsgrundlagen.}
\usage{
sicherheit_ergaenzungsbetrag(erforderliche_sicherheit = NULL,
  vorhandener_sicherheitswert = NULL,
  verschulden_berechtigter = NULL)
}
\arguments{
  \item{erforderliche_sicherheit}{Nichtnegative Dezimalzeichenfolge in EUR des erforderlichen Sicherungsbetrags. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
  \item{vorhandener_sicherheitswert}{Nichtnegative Dezimalzeichenfolge in EUR des bereits nach einschlägigen Regeln bewerteten Sicherungswerts; nicht ungeprüfter Nominalwert. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
  \item{verschulden_berechtigter}{Expliziter Wahrheitswert, ob der Berechtigte die unzureichende Sicherheit verschuldet hat. Bei wahr ist § 240 in diesem Vertrag nicht anwendbar.}
}
\details{Feste lokale BGB-Fassung. Entsprechender Sicherheitsleistungs- oder Sachschadensfall ist gewählt; keine Ermittlung einer nicht in dieser Betragsregel enthaltenen Anspruchsgrundlage. Keine pauschale Bewertung oder Gleichsetzung von Nutzereingabe mit gerichtlich festgestelltem Sachverhalt. NICHT_ANWENDBAR hat wert=null, nicht 0 EUR. Exakte rationale Zahlen innerhalb der gemeinsamen Grenze 9007199254740991 für Zähler und Nenner; Überlauf wird zurückgewiesen. Keine automatische Cent-Rundung.}
\value{S3-Objekt \code{bgb_ergebnis} mit wert (Liste aus Ganzzahlzeichenfolgen zaehler und nenner), einheit EUR, regel_id, regelversion, quellenfassung, eingaben, nutzervorgaben, rechenschritte, annahmen, hinweise und status. Bei NICHT_ANWENDBAR ist wert NULL. Fehlende/ungültige Eingaben erzeugen \code{bgb_berechnungsfehler} mit Status EINGABE_FEHLT oder EINGABE_UNGUELTIG.}
\examples{
sicherheit_ergaenzungsbetrag("100", "75", FALSE)
}
