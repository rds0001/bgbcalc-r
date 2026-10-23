\name{mietsicherheit_hoechstbetrag}
\alias{mietsicherheit_hoechstbetrag}
\title{Wohnraummietsicherheit: mietsicherheit hoechstbetrag}
\description{Dreifache Monatsmiete nach Abzug der als Pauschale oder Vorauszahlung ausgewiesenen Betriebskosten.}
\usage{
mietsicherheit_hoechstbetrag(monatsmiete = NULL,
  ausgewiesene_betriebskosten = NULL,
  wohnraummietverhaeltnis = NULL)
}
\arguments{
\item{monatsmiete}{Nichtnegative EUR-Dezimalzeichenfolge der für die Sicherheitsvereinbarung rechtlich maßgeblichen Monatsmiete einschließlich der darin enthaltenen ausgewiesenen Betriebskosten. Nicht automatisch die heutige erhöhte Miete verwenden. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{ausgewiesene_betriebskosten}{Nichtnegative EUR-Dezimalzeichenfolge der in der Monatsmiete enthaltenen, als Pauschale oder Vorauszahlung ausgewiesenen Betriebskosten. Höchstens die Monatsmiete; ohne ausgewiesene Kosten ausdrücklich "0". Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{wohnraummietverhaeltnis}{Expliziter Wahrheitswert zur rechtlichen Einordnung als hier nach § 551 zu behandelndes Wohnraummietverhältnis. Ausnahmen des § 549 Abs. 2/3 schließen § 551 nicht pauschal aus.}
}
\details{Grundhöchstbetrag nach § 551 Abs. 1. Tatsächliche Erträge erhöhen die Sicherheit nach Absatz 3 Satz 4 zusätzlich und werden hier weder berechnet noch auf diesen Grundhöchstbetrag gekappt. Kein pauschaler Abzug geschätzter Betriebskosten aus einer undifferenzierten Inklusivmiete. Keine Aussage über zusätzliche freiwillige Dritt-Sicherheiten, keine automatische Erhöhung einer bestehenden Sicherheit bei Mietänderung. Vereinbarungen und weitere rechtliche Besonderheiten gesondert prüfen.}
\value{S3-Objekt bgb_ergebnis. wert ist der exakte EUR-Bruch des Grundhöchstbetrags. Bei NICHT_ANWENDBAR ist wert null. Ergebnisobjekt mit Quellenfassung, Eingaben, Nutzervorgaben und Rechenschritten. Fehlende oder ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\examples{
mietsicherheit_hoechstbetrag("1000", "200", TRUE)
}
