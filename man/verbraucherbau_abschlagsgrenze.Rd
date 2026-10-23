\name{verbraucherbau_abschlagsgrenze}
\alias{verbraucherbau_abschlagsgrenze}
\title{Verbraucherbau: verbraucherbau abschlagsgrenze}
\description{Gesamtgrenze = 90 Prozent der vereinbarten Gesamtvergütung einschließlich Nachtragsleistungen. Verbleibender Rahmen = max(Gesamtgrenze - bisherige Abschläge, 0).}
\usage{
verbraucherbau_abschlagsgrenze(gesamtverguetung = NULL,
  bisherige_abschlaege = NULL,
  verbraucherbauvertrag = NULL,
  bautraegervertrag = NULL,
  abschlag_nach_632a = NULL)
}
\arguments{
\item{gesamtverguetung}{Nichtnegative EUR-Dezimalzeichenfolge der vereinbarten Gesamtvergütung einschließlich Nachtragsleistungen nach § 650c. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{bisherige_abschlaege}{Nichtnegative EUR-Dezimalzeichenfolge der bereits in Anspruch genommenen Abschläge, die bei der Gesamtgrenze anzurechnen sind. Keine doppelte Zählung bereits in einer weiteren Forderung enthaltener Beträge. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{verbraucherbauvertrag}{Expliziter Wahrheitswert zur rechtlichen Einordnung nach § 650i, gegebenenfalls in Verbindung mit § 650u.}
\item{bautraegervertrag}{Expliziter Wahrheitswert zur Einordnung als Bauträgervertrag nach § 650u. Dessen Absatz 2 schließt die 90-Prozent-Grenze aus.}
\item{abschlag_nach_632a}{Expliziter Wahrheitswert: Der Unternehmer verlangt eine Abschlagszahlung nach § 632a.}
}
\details{Gilt nur im Verbraucherbauvertrag für verlangte Abschläge nach § 632a; Bauträgervertrag nach § 650u Abs. 2 ausgeschlossen. Der verbleibende Rahmen ist keine automatisch fällige Abschlagsforderung: Leistungswert, Nachweis, Eigentumsübertragung oder Materialsicherheit, Mängelrechte und Sicherheitseinbehalt nach § 650m Abs. 2 sind gesondert zu prüfen. Keine Berechnung eines Rückzahlungsanspruchs bei bereits überschrittener Grenze. Abweichende Vertragsregelungen werden nicht ausgewertet.}
\value{S3-Objekt bgb_ergebnis. wert enthält gesamtgrenze und verbleibender_rahmen als exakte EUR-Brüche. Ergebnisobjekt mit Regel- und Quellenfassung, Eingaben, Nutzervorgaben und Rechenschritten; NICHT_ANWENDBAR mit wert null außerhalb des Tatbestands. Fehlende oder ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\examples{
verbraucherbau_abschlagsgrenze("100000", "20000", TRUE, FALSE, TRUE)
}
