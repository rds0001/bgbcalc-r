\name{elternlinien_erbquoten}
\alias{elternlinien_erbquoten}
\title{Erbquoten der Elternlinien}
\description{Bei berufenen Verwandten erster Ordnung keine Anwendung. Sonst den Verwandtenanteil auf besetzte Elternlinien gleich verteilen; eintretende Eltern schließen ihre Abkömmlinge aus, sonst Stammteilung. Eine vollständig leere Elternlinie fällt der anderen zu. Mehrfachanteile derselben Person aus beiden Linien getrennt erhalten und summieren.}
\usage{
elternlinien_erbquoten(elternlinien = NULL,
  erste_ordnung_vorhanden = NULL,
  verwandtenanteil_zaehler = NULL,
  verwandtenanteil_nenner = NULL)
}
\arguments{
\item{elternlinien}{Genau zwei rekursive Knoten (je ein Elternteil), mit person_id, tritt_ein und abkoemmlinge entsprechend abkoemmlings_erbquoten. Fehlende berufene Personen als nicht eintretender Knoten ohne berufene Nachkommen darstellen. In R müssen die äußere Stammliste und sämtliche verschachtelten Abkömmlingslisten unbenannt sein; die einzelnen Knoten bleiben benannte Listen mit den angegebenen Feldern.}
\item{erste_ordnung_vorhanden}{Expliziter Wahrheitswert: Ist ein gesetzlich berufener Verwandter erster Ordnung vorhanden? Dann ist die zweite Ordnung ausgeschlossen.}
\item{verwandtenanteil_zaehler}{Nichtnegative ganze Zahl als Zähler des rechtlich bestimmten Verwandtenanteils am gesamten Nachlass.}
\item{verwandtenanteil_nenner}{Positive ganze Zahl als Nenner; der Verwandtenanteil darf 1 nicht überschreiten.}
}
\details{Gesetzliche zweite Ordnung. Rechtlich maßgebliche Elternschaft und Abkömmlingsbeziehungen vorgeben; insbesondere die Beziehungen mit Ausschluss nach § 1925 Abs. 4 i.V.m. § 1756 vorher abgrenzen. Erblasser selbst nicht als berufenen Abkömmling aufnehmen. Verwandtenanteil nach Ehegattenquote bereits bestimmt. Keine Feststellung von Adoption, Verzicht, Ausschlagung oder Erbunwürdigkeit. Fehlt erste Ordnung und ist auch zweite Ordnung leer, sind weitere Ordnungen gesondert zu prüfen.}
\value{S3-Objekt bgb_ergebnis. wert enthält erbteile (person_id, stammpfad, quote) und erbquoten (person_id, quote). Quoten exakte Brüche als Ganzzahlzeichenfolgen. Reihenfolge folgt Eingabestämmen, Zusammenfassung je Person nach erstem Auftreten. Ohne eintretende Personen NICHT_ANWENDBAR und wert null. Fehlende/ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\examples{
eltern <- list(
  list(person_id = "V", tritt_ein = TRUE, abkoemmlinge = list()),
  list(person_id = "M", tritt_ein = TRUE, abkoemmlinge = list()))
elternlinien_erbquoten(eltern, FALSE, 1, 1)
}
