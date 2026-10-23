\name{modernisierung_zinsermaessigung}
\alias{modernisierung_zinsermaessigung}
\title{Zinsvorteil bei Modernisierungsfinanzierung}
\description{Jahresbetrag der Zinsermäßigung = ursprünglicher Darlehensbetrag * (marktüblicher Jahreszinssatz minus ermäßigter Jahreszinssatz) / 100.}
\usage{
modernisierung_zinsermaessigung(darlehensursprungsbetrag = NULL,
  ermaessigter_zinssatz_prozent = NULL,
  marktueblicher_zinssatz_prozent = NULL,
  marktzinssatz_nachweis = NULL,
  beruecksichtigungsfaehiges_darlehen = NULL,
  vereinfachtes_verfahren = NULL)
}
\arguments{
\item{darlehensursprungsbetrag}{Nichtnegative EUR-Dezimalzeichenfolge des der Wohnung zugeordneten ursprünglichen Darlehensbetrags. Nicht durch die laufende Restschuld ersetzen. Die Zuordnung nach § 559a Abs. 4 gegebenenfalls vorher berechnen. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{ermaessigter_zinssatz_prozent}{Dezimalzeichenfolge des ermäßigten jährlichen Darlehenszinssatzes in Prozent. Bei zinslosem Darlehen "0". Darf den maßgeblichen Marktzinssatz nicht übersteigen. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{marktueblicher_zinssatz_prozent}{Dezimalzeichenfolge des marktüblichen jährlichen Zinssatzes für erstrangige Hypotheken zum Zeitpunkt der Beendigung der Modernisierungsmaßnahmen, in Prozent. Keine automatische aktuelle Zinsreihe. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{marktzinssatz_nachweis}{Nichtleere Herkunfts- und Stichtagsangabe des verwendeten Marktzinssatzes sowie erforderlichenfalls der Darlehenszuordnung.}
\item{beruecksichtigungsfaehiges_darlehen}{Expliziter Wahrheitswert zur rechtlichen Einordnung nach § 559a Abs. 2/3: entsprechendes öffentliches Darlehen oder gleichgestellte Finanzierung. Keine automatische Bewertung von Mieterdarlehen, Mietvorauszahlungen oder Drittleistungen.}
\item{vereinfachtes_verfahren}{Expliziter Wahrheitswert, ob § 559c anwendbar ist. Dort sind § 559a Abs. 2 Sätze 1 bis 3 nicht anzuwenden; die Funktion liefert deshalb NICHT_ANWENDBAR.}
}
\details{Teilstufe zur Anrechnung des Zinsvorteils nach § 559a Abs. 2/3, kein vollständiger Mieterhöhungsrechner und keine Tilgungsrechnung. Maßgeblich ist der ursprüngliche Darlehensbetrag, nicht eine sinkende Restschuld. Die Funktion berechnet weder öffentliche Kostenzuschüsse nach Absatz 1 noch Jahresbeträge von Zuschüssen oder Darlehen zur Deckung laufender Aufwendungen nach Absatz 2 Satz 4. Kostenverteilung auf Wohnungen, Kürzung des Erhöhungsbetrags, Kappungsgrenzen, Härte und Wirksamkeit sind gesonderte Schritte. Keine automatische Übertragung dieser Anrechnungsstufe in das abweichende Verfahren des § 559e. Negative eingegebene Zinssätze werden rechnerisch verarbeitet, sofern die ausdrückliche rechtliche Einordnung trägt und der Zinsabstand nicht negativ ist; keine Behauptung über tatsächliche Förderkonditionen.}
\value{S3-Objekt bgb_ergebnis. wert ist der exakte EUR-Bruch des jährlichen Zinsvorteils, nicht eines Monatsbetrags. Ergebnisobjekt mit Quellenfassung, Eingaben, Nutzervorgaben und Rechenschritten. Bei NICHT_ANWENDBAR ist wert null. Keine Cent-Rundung. Fehlende oder ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\examples{
modernisierung_zinsermaessigung("10000", "1", "4",
  "Synthetischer Marktzinssatz zum Maßnahmenabschluss", TRUE, FALSE)
}
