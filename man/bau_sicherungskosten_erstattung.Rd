\name{bau_sicherungskosten_erstattung}
\alias{bau_sicherungskosten_erstattung}
\title{Kosten der Bauhandwerkersicherung}
\description{Höchstbetrag = Sicherheitsbetrag * 2/100 * ausdrücklich bestimmter Jahresanteil. Erstattungsbetrag = Minimum aus tatsächlichen Kosten, üblichen Kosten und Höchstbetrag.}
\usage{
bau_sicherungskosten_erstattung(sicherheitsbetrag = NULL,
  tatsaechliche_kosten = NULL,
  uebliche_kosten = NULL,
  zeitanteil_zaehler = NULL,
  zeitanteil_nenner = NULL,
  zeitanteil_nachweis = NULL,
  sicherheit_nach_650f = NULL,
  aufrechterhaltung_wegen_unbegruendeter_einwendungen = NULL,
  bestellerart = NULL,
  baubetreuer_bevollmaechtigt = NULL)
}
\arguments{
\item{sicherheitsbetrag}{Nichtnegative EUR-Dezimalzeichenfolge des über den gesamten ausgewerteten Zeitraum gleichbleibenden Sicherheitsbetrags. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{tatsaechliche_kosten}{Nichtnegative EUR-Dezimalzeichenfolge der für diesen Zeitraum tatsächlich entstandenen Sicherungskosten. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{uebliche_kosten}{Nichtnegative EUR-Dezimalzeichenfolge der rechtlich bewerteten üblichen Sicherungskosten für genau denselben Zeitraum und Sicherheitsumfang. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{zeitanteil_zaehler}{Nichtnegative ganze Zahl als Zähler des ausdrücklich bestimmten Jahresanteils.}
\item{zeitanteil_nenner}{Positive ganze Zahl als Nenner des Jahresanteils; gemeinsame technische Grenzen gemäß NUMERIK.md.}
\item{zeitanteil_nachweis}{Nichtleere Beschreibung des Zeitraums und der maßgeblichen Zeitkonvention. Keine stillschweigende 365-Tage- oder 30/360-Annahme.}
\item{sicherheit_nach_650f}{Expliziter Wahrheitswert zur Einordnung als Sicherheitsleistung nach § 650f.}
\item{aufrechterhaltung_wegen_unbegruendeter_einwendungen}{Expliziter Wahrheitswert: Die Sicherheit muss für den gesamten ausgewerteten Teilzeitraum wegen Einwendungen des Bestellers gegen den Vergütungsanspruch aufrechterhalten werden, die sich als unbegründet erweisen. Nur dann greift die Ausnahme des Absatzes 3 Satz 2.}
\item{bestellerart}{sonstiger, oeffentlich_insolvenzunfaehig, verbraucherbau oder bautraeger_verbraucher. Die öffentlich-rechtliche Kategorie setzt gesetzliche Insolvenzunfähigkeit voraus.}
\item{baubetreuer_bevollmaechtigt}{Expliziter Wahrheitswert zur Betreuung durch einen zur Verfügung über die Finanzierungsmittel des Bestellers ermächtigten Baubetreuer. Hebt nur die Verbraucherausnahme auf, nicht die öffentlich-rechtliche Ausnahme.}
}
\details{Ausnahmen nach § 650f Abs. 6 und die Rückausnahme für den bevollmächtigten Baubetreuer werden ausgewertet. Keine Erstattung nach Absatz 3 für einen Teilzeitraum, in dem die Sicherheit wegen Einwendungen gegen den Vergütungsanspruch aufrechterhalten werden muss und diese sich als unbegründet erweisen. Bloßes Bestehen von Einwendungen genügt nicht. Bei wechselnder Sicherheitshöhe oder nur teilweisem Eingreifen dieser Ausnahme getrennte, überschneidungsfreie Zeit-/Kostenabschnitte bilden. Kosten jedem Abschnitt nur einmal zuordnen. Die Funktion bestimmt weder übliche Bankgebühren noch die rechtliche Berechtigung der Einwendungen selbst. Keine automatische Erstattung sonstiger Sicherheiten außerhalb § 650f.}
\value{S3-Objekt bgb_ergebnis. Ergebnisobjekt mit wert als zaehler/nenner-Ganzzahlzeichenfolgen, einheit EUR, Regel- und Quellenfassung, Eingaben, Nutzervorgaben und Rechenschritten. Bei NICHT_ANWENDBAR ist wert null. Fehlende oder ungültige Eingaben erzeugen einen strukturierten Berechnungsfehler.}
\examples{
bau_sicherungskosten_erstattung("100000", "3000", "2500", 1, 1,
  "Ein volles Jahr unveränderte Sicherheit", TRUE, FALSE, "sonstiger", FALSE)
}
