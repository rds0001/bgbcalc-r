\name{erb_zuwendungen_ausgleichen}
\alias{erb_zuwendungen_ausgleichen}
\title{Erbrechtliche Zuwendungsausgleichung}
\description{Zuwendungswerte zum Gruppennachlass hinzufügen und die Rechenmasse nach Gruppenquoten aufteilen. Ist bei einem Miterben der Zuwendungswert strikt größer als sein rechnerischer Anteil, diesen Miterben samt Zuwendung und Quote nach § 2056 herausnehmen. Mit den verbleibenden Quoten und Zuwendungen erneut rechnen, bis kein Überempfänger verbleibt. Dann jeweilige Zuwendung vom rechnerischen Anteil abziehen. Ausgeschlossene erhalten aus dieser Verteilung null; keine Herauszahlung des Mehrbetrags.}
\usage{
erb_zuwendungen_ausgleichen(gruppennachlass = NULL,
  miterben = NULL,
  ausgleichung_anwendbar = NULL,
  bewertungsnachweis = NULL)
}
\arguments{
\item{gruppennachlass}{Nichtnegative EUR-Dezimalzeichenfolge des nach Berichtigung der Verbindlichkeiten verbleibenden Nachlasswerts, soweit er der Ausgleichungsgruppe zukommt. Anteile nicht beteiligter Erben vorher abgrenzen. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{miterben}{Liste mit 1 bis 1000 Objekten mit genau person_id, erbquote_zaehler, erbquote_nenner und ausgleichungswert. person_id ist eine nichtleere eindeutige Zeichenfolge. Zähler und Nenner sind positive ganze Zahlen innerhalb NUMERIK.md; die Quoten beziehen sich auf die Ausgleichungsgruppe und müssen zusammen 1 ergeben. ausgleichungswert ist eine nichtnegative EUR-Dezimalzeichenfolge der dieser Person rechtlich zuzurechnenden, bewerteten ausgleichungspflichtigen Zuwendungen. In R eine Liste benannter Listen verwenden. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt. R-Sammlungen müssen unbenannte Listen sein; enthaltene Datensätze behalten ihre ausdrücklich benannten Felder. Benannte Objekte sind auch bei Leerheit kein Ersatz für eine Sammlung. Siehe EINGABESTRUKTUREN.md.}
\item{ausgleichung_anwendbar}{Expliziter Wahrheitswert zur rechtlich bestimmten Ausgleichungspflicht der Gruppe nach §§ 2050 ff., einschließlich gegebenenfalls des testamentarischen Falls nach § 2052.}
\item{bewertungsnachweis}{Nichtleere Beschreibung der Gruppenabgrenzung, Quoten, Zurechnung und Zuwendungsbewertung nach § 2055 Abs. 2 einschließlich erforderlicher Wertbereinigung.}
}
\details{Die Funktion berechnet nur die Verteilung nach §§ 2055/2056 für bereits rechtlich bestimmte und bewertete Zuwendungen. Ausstattung, übermäßige Zuschüsse/Ausbildungskosten, ausdrückliche Ausgleichungsanordnung sowie Ausnahmen nach §§ 2050 bis 2054 sind vorab zu prüfen. Bei eintretenden Abkömmlingen muss insbesondere die Zurechnung nach § 2051 richtig bestimmt sein; nicht einfach denselben vollen Zuwendungsbetrag mehrfach eingeben. Gruppenquoten sind innerhalb der Gruppe normiert und nicht ohne Umrechnung mit den Gesamt-Erbquoten gleichzusetzen. Nicht beteiligte Ehegatten oder andere Erben werden nicht in die Gruppe aufgenommen. Keine kombinierte Ausgleichung besonderer Leistungen nach § 2057a, keine Pflichtteilsberechnung nach § 2316, keine Pflichtteilsergänzung und keine Rückforderung von Schenkungen. Technische Gruppengrenze 1000, keine gesetzliche Erbenobergrenze. Keine Rundung.}
\value{S3-Objekt bgb_ergebnis. wert enthält verteilung mit person_id, exaktem EUR-Bruch betrag und Wahrheitswert ausser_ansatz für jeden eingegebenen Miterben. Die zusätzliche Liste ausser_ansatz enthält die ausgeschlossenen Kennungen. Beide Listen folgen der Eingabereihenfolge; die Rechenschritte dokumentieren die tatsächlichen Ausschlussrunden. Die Summe der ausgezahlten Beträge entspricht exakt dem Gruppennachlass. NICHT_ANWENDBAR mit wert null bei fehlendem Ausgleichungstatbestand. Fehlende oder ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\examples{
erb_zuwendungen_ausgleichen("100", list(
  list(person_id = "A", erbquote_zaehler = 1, erbquote_nenner = 2,
       ausgleichungswert = "20"),
  list(person_id = "B", erbquote_zaehler = 1, erbquote_nenner = 2,
       ausgleichungswert = "0")), TRUE, "Bewertete Zuwendung A: 20")
}
