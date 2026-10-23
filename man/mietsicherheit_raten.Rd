\name{mietsicherheit_raten}
\alias{mietsicherheit_raten}
\title{Wohnraummietsicherheit: mietsicherheit raten}
\description{Die rechtlich geschuldete Geldsicherheit in drei exakt gleiche Teilbeträge teilen. Erster Ausgangstermin ist der Mietbeginn; die weiteren Termine sind die ausdrücklich vorgegebenen folgenden Mietfälligkeiten.}
\usage{
mietsicherheit_raten(geschuldete_geldsicherheit = NULL,
  mietbeginn = NULL,
  zweite_mietfaelligkeit = NULL,
  dritte_mietfaelligkeit = NULL,
  wohnraummietverhaeltnis = NULL,
  geldsicherheit_geschuldet = NULL)
}
\arguments{
\item{geschuldete_geldsicherheit}{Nichtnegative EUR-Dezimalzeichenfolge der rechtlich geschuldeten Geldsicherheit. Wirksame Vereinbarung und Höchstbetrag gesondert prüfen; kein ungeprüfter überhöhter Vertragsbetrag. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{mietbeginn}{Beginn des Mietverhältnisses als ISO-Zeichenfolge YYYY-MM-DD, zugleich gesetzlicher Ausgangstermin der ersten Teilzahlung.}
\item{zweite_mietfaelligkeit}{Rechtlich bestimmter Fälligkeitstermin der unmittelbar auf die erste Mietzahlung folgenden Mietzahlung als ISO-Zeichenfolge. Dies ist der Termin der zweiten Kautionsrate; keine automatische Ableitung aus einem Monatskalender.}
\item{dritte_mietfaelligkeit}{Rechtlich bestimmter Fälligkeitstermin der darauf folgenden Mietzahlung als ISO-Zeichenfolge; Termin der dritten Kautionsrate. Beide Folgetermine müssen nach Mietbeginn und in aufsteigender Reihenfolge liegen.}
\item{wohnraummietverhaeltnis}{Expliziter Wahrheitswert zur rechtlichen Einordnung als hier nach § 551 zu behandelndes Wohnraummietverhältnis. Ausnahmen des § 549 Abs. 2/3 schließen § 551 nicht pauschal aus.}
\item{geldsicherheit_geschuldet}{Expliziter Wahrheitswert, ob als Sicherheit eine Geldsumme bereitzustellen ist. Das Teilzahlungsrecht wird hier nicht auf andere Sicherungsarten übertragen.}
}
\details{Die Funktion bildet das Teilzahlungsrecht ab, verpflichtet aber nicht zur Ausübung dieses Rechts. Sie prüft weder die Wirksamkeit der Sicherheitsvereinbarung noch die Höhe anhand der Monatsmiete; dafür den Grundhöchstbetrag gesondert bestimmen. Nachfolgende Mietfälligkeiten müssen rechtlich passend ausgewählt sein; die Funktion prüft Datumsformat und Reihenfolge, nicht den zugrunde liegenden Mietvertrag. Keine automatische Feiertags-/Wochenendverschiebung; eine gegebenenfalls erforderliche Anwendung des § 193 gesondert berechnen. Keine stillschweigende Cent-Rundung oder Verteilung von Rundungsresten; exakte Drittel können von technisch ausführbaren Zahlungsbeträgen abweichen. Keine Verzugs- oder Kündigungsentscheidung.}
\value{S3-Objekt bgb_ergebnis. wert ist eine Liste von drei Einträgen mit nummer, faellig_am und betrag als exaktem EUR-Bruch. Bei NICHT_ANWENDBAR ist wert null. Ergebnisobjekt mit Quellenfassung, Eingaben, Nutzervorgaben und Rechenschritten. Fehlende oder ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\examples{
mietsicherheit_raten("2400", "2026-10-15", "2026-11-04", "2026-12-03", TRUE, TRUE)
}
