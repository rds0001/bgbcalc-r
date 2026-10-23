\name{grosselternlinien_erbquoten}
\alias{grosselternlinien_erbquoten}
\title{Erbquoten der Großelternlinien}
\description{Zunächst Verwandtenanteil zwischen besetzten Großelternpaaren teilen, danach innerhalb jedes Paars auf besetzte Großelternstämme. Eintretende Großeltern schließen ihre Nachkommen aus; andernfalls rekursive Stammteilung. Vollständig leere Paare entfallen. Besondere Erbteile und Personenquoten sowie unmittelbar eintretenden Großeltern und deren Abkömmlingen zugeordnete Quoten getrennt ausweisen.}
\usage{
grosselternlinien_erbquoten(grosselternpaare = NULL,
  vorrangige_ordnung_vorhanden = NULL,
  verwandtenanteil_zaehler = NULL,
  verwandtenanteil_nenner = NULL)
}
\arguments{
\item{grosselternpaare}{Objekt mit genau vaeterlich und muetterlich. Jeder Eintrag enthält genau zwei rekursive Knoten mit person_id, tritt_ein und abkoemmlinge entsprechend abkoemmlings_erbquoten. Innerhalb eines Paars keine doppelten Personen; dieselbe Person in beiden Paaren zulässig, sofern ihre rechtliche Erbenstellung konsistent ist. Das äußere R-Objekt bleibt nach vaeterlich und muetterlich benannt. Die beiden Paarlisten und alle verschachtelten Abkömmlingslisten müssen unbenannte Listen sein; die Knoten bleiben benannte Datensätze.}
\item{vorrangige_ordnung_vorhanden}{Expliziter Wahrheitswert: Gibt es berufene Verwandte erster oder zweiter Ordnung? Dann ist die dritte Ordnung ausgeschlossen.}
\item{verwandtenanteil_zaehler}{Nichtnegative ganze Zahl als Zähler des zu verteilenden Verwandtenanteils am gesamten Nachlass.}
\item{verwandtenanteil_nenner}{Positive ganze Zahl als Nenner; Anteil höchstens 1.}
}
\details{Gesetzliche dritte Ordnung, bei erster oder zweiter Ordnung nicht anwendbar. Rechtlich maßgebliche Abstammung und Erbenstellungen vorgegeben, keine automatische Feststellung von Adoption oder Ausschlüssen. § 1931 über Ehegatten und Großelternabkömmlinge noch nicht angewandt: diese Funktion verteilt den eingegebenen Anteil nach § 1926, sie entscheidet keine Ehegattenansprüche. Gleiche Person darf beiden Paaren angehören; besondere Anteile werden nach Großelternlinie unterschieden. Erblasser und vorrangig berufene Personen nicht widersprüchlich als berufene Nachkommen eintragen.}
\value{S3-Objekt bgb_ergebnis. wert enthält erbteile mit person_id, grosselternlinie, stammpfad, quote; erbquoten summiert je Person; grosselternquote und abkoemmlingsquote summieren die beiden Personengruppen. Alle Quoten beziehen sich auf gesamten Nachlass und sind exakte Brüche. Feste Reihenfolge vaeterlich, dann muetterlich. Ohne besetzte dritte Ordnung oder bei Vorrang NICHT_ANWENDBAR. Fehlende/ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\examples{
knoten <- function(kennung) list(person_id = kennung, tritt_ein = TRUE,
  abkoemmlinge = list())
paare <- list(vaeterlich = list(knoten("V1"), knoten("V2")),
  muetterlich = list(knoten("M1"), knoten("M2")))
grosselternlinien_erbquoten(paare, FALSE, 1, 1)
}
