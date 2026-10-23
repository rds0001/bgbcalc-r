\name{abkoemmlings_erbquoten}
\alias{abkoemmlings_erbquoten}
\title{Erbfolge nach Stämmen}
\description{Jeder mit einer eintretenden Person besetzte Stamm erhält gleichen Anteil; ohne eigene eintretende Person wird der Anteil rekursiv auf seine besetzten Unterstämme verteilt. Eintretende Vorfahren schließen ihre über diesen Pfad verwandten Nachkommen aus. Leere Stämme fallen weg. Erbteile einer Person aus mehreren Stämmen bleiben separat nachgewiesen und werden zusätzlich zur Gesamtquote addiert.}
\usage{
abkoemmlings_erbquoten(kinderstaemme = NULL,
  verwandtenanteil_zaehler = NULL,
  verwandtenanteil_nenner = NULL)
}
\arguments{
\item{kinderstaemme}{Liste rekursiver Knoten mit genau person_id (nichtleere Zeichenfolge), tritt_ein (expliziter Wahrheitswert zur rechtlich bestimmten Erbenstellung) und abkoemmlinge (Liste gleicher Knotenstruktur). Leere Liste erlaubt. Höchstens 64 Ebenen und 10000 Knoten. Keine doppelte Person in derselben Geschwistergruppe oder entlang eines Abstammungspfads; Mehrfachzugehörigkeit in verschiedenen Stämmen ist erlaubt. In R müssen die äußere Stammliste und sämtliche verschachtelten Abkömmlingslisten unbenannt sein; die einzelnen Knoten bleiben benannte Listen mit den angegebenen Feldern.}
\item{verwandtenanteil_zaehler}{Nichtnegative ganze Zahl als Zähler des bereits rechtlich bestimmten Verwandtenanteils am gesamten Nachlass.}
\item{verwandtenanteil_nenner}{Positive ganze Zahl als Nenner des Verwandtenanteils. Anteil darf 1 nicht überschreiten.}
}
\details{Rechnerische Erbfolge erster Ordnung bei vorab rechtlich bestimmter Abstammung und Erbenstellung. tritt_ein bildet die maßgebliche rechtliche Stellung ab, einschließlich § 1923 Abs. 2 und einschlägiger Vertretungsfolgen; keine automatische Feststellung von Abstammung, Adoption, Erbunwürdigkeit, Ausschlagung oder testamentarischem Ausschluss. Gesetzlicher Übergang in andere Ordnungen, Ehegattenquote, Ausgleichungen und Pflichtteile gesondert. Verwandtenanteil ist bereits rechtlich ausgewählter Anteil des Nachlasses; Ausgabequoten beziehen sich auf gesamten Nachlass. Daten auch in ausgeschlossenen Unterzweigen validieren, damit Widersprüche nicht still verborgen bleiben.}
\value{S3-Objekt bgb_ergebnis. wert enthält erbteile (person_id, stammpfad, quote) und erbquoten (person_id, quote). Quoten exakte Brüche als Ganzzahlzeichenfolgen. Reihenfolge folgt Eingabestämmen, Zusammenfassung je Person nach erstem Auftreten. Ohne eintretende Personen NICHT_ANWENDBAR und wert null. Fehlende/ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\examples{
kinder <- list(
  list(person_id = "A", tritt_ein = TRUE, abkoemmlinge = list()),
  list(person_id = "B", tritt_ein = FALSE, abkoemmlinge = list(
    list(person_id = "B1", tritt_ein = TRUE, abkoemmlinge = list()),
    list(person_id = "B2", tritt_ein = TRUE, abkoemmlinge = list()))))
abkoemmlings_erbquoten(kinder, 1, 1)
}
