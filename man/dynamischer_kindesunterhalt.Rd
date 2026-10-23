\name{dynamischer_kindesunterhalt}
\alias{dynamischer_kindesunterhalt}
\title{dynamischer kindesunterhalt}
\description{Prozentsatz nach einer Dezimalstelle abschneiden, Mindestunterhalt mit diesem Satz/100 multiplizieren, Ergebnis auf volle EUR aufrunden.}
\usage{
dynamischer_kindesunterhalt(mindestunterhalt = NULL,
  prozentsatz = NULL,
  mindestunterhaltsnachweis = NULL)
}
\arguments{
\item{mindestunterhalt}{Positive volle EUR als Dezimalzeichenfolge des einschlägigen Mindestunterhalts für Altersstufe und Zeitraum. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{prozentsatz}{Nichtnegative Dezimalzeichenfolge in Prozent des Mindestunterhalts; wird nach einer Dezimalstelle abgeschnitten. Keine automatische Einkommensgruppenzuordnung. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{mindestunterhaltsnachweis}{Nichtleere Beschreibung der maßgeblichen Mindestunterhaltsverordnung, Fassung, Altersstufe und Gültigkeit. Synthetische Beispiele entsprechend kennzeichnen.}
}
\details{Gesetzliche Voraussetzungen und maßgeblicher Prozentsatz bereits rechtlich bestimmt. Null als Prozentsatz rechnerisch erlaubt, bestätigt keinen Verzicht oder rechtliche Wirksamkeit. Keine automatische Düsseldorfer Tabelle, Leistungsfähigkeitsprüfung oder Kindergeldanrechnung. Mindestunterhaltsquelle ausdrücklich vorgeben.}
\value{S3-Objekt bgb_ergebnis. wert enthält den auf volle EUR aufgerundeten Betrag als Bruch mit zaehler und nenner als Ganzzahlzeichenfolgen; nenner ist 1. Fehlende/ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\examples{
dynamischer_kindesunterhalt("500", "100.19", "Synthetischer Mindestunterhalt")
}
