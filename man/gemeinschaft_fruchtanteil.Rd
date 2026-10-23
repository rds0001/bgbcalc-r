% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{gemeinschaft_fruchtanteil}
\alias{gemeinschaft_fruchtanteil}
\title{gemeinschaft fruchtanteil}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{gemeinschaft_fruchtanteil(
  gesamtfruchtmenge = NULL,
  teilhaberanteil_zaehler = NULL,
  teilhaberanteil_nenner = NULL,
  fruchteinheit = NULL,
  zuordnungsnachweis = NULL
)}
\arguments{
\item{gesamtfruchtmenge}{Nichtnegative exakte gesamte Fruchtmenge oder Fruchtbetrag als Dezimaltext/Bruch in der angegebenen einheitlichen Einheit.}
\item{teilhaberanteil_zaehler}{Nichtnegative ganze Zahl des qualifizierten Teilhaberanteils, höchstens Nenner und2^53-1.}
\item{teilhaberanteil_nenner}{Positive ganze Bezugsgröße des Teilhaberanteils, höchstens2^53-1.}
\item{fruchteinheit}{Nichtleere qualifizierte Einheit, etwa kg oder EUR; keine automatische Einheitenumrechnung.}
\item{zuordnungsnachweis}{Nichtleerer Nachweis der Gemeinschaft, zugeordneten Früchte, Periode und Teilhaberquote; Kosten-/Lastenzuordnung separat.}
}
\details{Gesamte qualifizierte Früchte mit Teilhaberanteil multiplizieren; Einheit beibehalten. §743I: Früchte einer Bruchteilsgemeinschaft entsprechend qualifiziertem Teilhaberanteil. Gesamte Früchte und Betrachtungszeitraum vorab rechtlich bestimmen; notwendige Abgrenzungen101/102 sowie Kosten-/Lasten748 separat, keine automatische Netto-/Bruttoannahme. Einheit ausdrücklich vorgeben, etwa kg oder EUR; nicht unterschiedliche Einheiten addieren. Rechnerischer Bruchteil begründet keine automatische Zuweisung bestimmter unteilbarer Naturstücke. Bei mehreren Einzelaufrufen Teilhaberanteile ohne Doppelzählung verwenden; kein Ersatz für die Bestimmung der tatsächlichen Anteilsquoten. Nichtnegative exakte Gesamtmenge, Anteil0..1, sicherer gemeinsamer Zahlenbereich nach NUMERIK.md; keine Rundung.}
\value{wert: exakter Bruch des Fruchtanteils, einheit entspricht fruchteinheit. Einheit: qualifizierte_fruchteinheit.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_743_T0001}
\examples{
gemeinschaft_fruchtanteil(
  gesamtfruchtmenge = "100",
  teilhaberanteil_zaehler = 1,
  teilhaberanteil_nenner = 4,
  fruchteinheit = "kg",
  zuordnungsnachweis = paste0(
    "Qualifizierte gesamte Früchte derselben Periode und bekannte",
    " Teilhaberquote743I."
  )
)
}
