\name{werk_maengeleinbehalt}
\alias{werk_maengeleinbehalt}
\title{Mängelbedingter Zahlungseinbehalt}
\description{Im Regelfall das Doppelte der erforderlichen Mangelbeseitigungskosten. Ein ausdrücklich begründeter abweichender angemessener Betrag ersetzt den Regeldoppelbetrag. Tatsächlich verweigerbare Zahlung = Minimum aus diesem Betrag und der noch zu zahlenden fälligen Vergütung.}
\usage{
werk_maengeleinbehalt(faellige_verguetung = NULL,
  mangelbeseitigungskosten = NULL,
  mangelbeseitigungsanspruch = NULL,
  abweichender_angemessener_betrag = NULL,
  abweichungsbegruendung = NULL)
}
\arguments{
\item{faellige_verguetung}{Nichtnegative EUR-Dezimalzeichenfolge der noch zu zahlenden fälligen Vergütung beziehungsweise des nach § 632a berechtigten Abschlags. Fälligkeit, Leistungswert und Nachweis werden außerhalb dieser Funktion festgestellt. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{mangelbeseitigungskosten}{Nichtnegative EUR-Dezimalzeichenfolge der erforderlichen Mangelbeseitigungskosten. Bewertung ausdrücklich vorgeben. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{mangelbeseitigungsanspruch}{Expliziter Wahrheitswert zum Anspruch des Bestellers auf Mangelbeseitigung im geprüften Fall.}
\item{abweichender_angemessener_betrag}{Optional: nichtnegative EUR-Dezimalzeichenfolge eines im Einzelfall rechtlich begründeten angemessenen Einbehalts anstelle des Regeldoppelbetrags. Ohne Abweichung NULL in R beziehungsweise None in Python. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{abweichungsbegruendung}{Bei abweichendem Betrag erforderliche nichtleere Beschreibung der Einzelfallbewertung. Ohne abweichenden Betrag NULL in R beziehungsweise None in Python.}
}
\details{§ 641 Abs. 3 setzt einen Anspruch auf Mangelbeseitigung voraus; § 632a Abs. 1 verweist für Abschläge entsprechend hierauf. Die Funktion bestimmt den betragsmäßigen Rahmen des Einbehalts, erklärt aber kein Zurückbehaltungsrecht für den Nutzer. Die doppelte Kostenhöhe gilt nur in der Regel und ist keine starre Obergrenze. Abweichungen müssen rechtlich begründet vorgegeben werden; die Funktion bewertet ihre Angemessenheit nicht selbst. Kein Schadensersatz- oder Kostenvorschussrechner; keine Entscheidung über andere Leistungsverweigerungsrechte. Bei mehreren Einbehalten keine doppelte Anrechnung derselben Vergütung oder Mängelkosten.}
\value{S3-Objekt bgb_ergebnis. Ergebnisobjekt mit wert als zaehler/nenner-Ganzzahlzeichenfolgen, einheit EUR, Regel- und Quellenfassung, Eingaben, Nutzervorgaben und Rechenschritten. Bei NICHT_ANWENDBAR ist wert null. Fehlende oder ungültige Eingaben erzeugen einen strukturierten Berechnungsfehler.}
\examples{
werk_maengeleinbehalt("10000", "1000", TRUE)
werk_maengeleinbehalt("10000", "1000", TRUE, "1500", "Einzelfallbewertung")
}
