\name{bgb_eingabestrukturen}
\alias{bgb_eingabestrukturen}
\title{Geordnete Sammlungen und benannte Eingabeobjekte}
\description{
Geordnete Sammlungen werden als unbenannte Listen übergeben. Einzelne
Datensätze sind dagegen benannte Listen mit den im Funktionsvertrag
angegebenen Feldern. Diese Unterscheidung gilt auch für leere und
verschachtelte Strukturen.
}
\details{
Beispielsweise ist eine Teilhabersammlung eine unbenannte Liste von
benannten Teilhaberdatensätzen. Kennungen gehören in die angegebenen
Felder, nicht in Namen der äußeren Liste.
Bei Erbstämmen müssen auch alle Abkömmlingslisten unbenannt sein.
Bei Großelternpaaren bleibt das äußere Objekt mit den Feldern
\code{vaeterlich} und \code{muetterlich} benannt; die Paarlisten darin
sind unbenannt.

Für \code{feiertage} und \code{abweichende_reihenfolge} sind gemäß den
jeweiligen Funktionsverträgen auch unbenannte Zeichenvektoren zulässig.
Ein Zeichenvektor der Länge eins ist in R eine einzelne Zeichenfolge.
Gemeinsame JSON-Referenzen stellen Folgen immer als Arrays dar.
}
\seealso{\code{\link{gemeinschaft_lastenanteile}},
\code{\link{abkoemmlings_erbquoten}}, \code{\link{bgb_zahleneingaben}}}
\examples{
teilhaber <- list(
  list(person_id = "A", anteil_zaehler = 1, anteil_nenner = 3),
  list(person_id = "B", anteil_zaehler = 2, anteil_nenner = 3))
gemeinschaft_lastenanteile("120", teilhaber, FALSE, TRUE)
}
