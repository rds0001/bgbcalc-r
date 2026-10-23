% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{auslobung_belohnungsanteil}
\alias{auslobung_belohnungsanteil}
\title{auslobung belohnungsanteil}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{auslobung_belohnungsanteil(
  gesamtbelohnung = NULL,
  verteilungsart = NULL,
  anzahl_berechtigte = NULL,
  anteil_zaehler = NULL,
  anteil_nenner = NULL,
  verteilungsnachweis = NULL
)}
\arguments{
\item{gesamtbelohnung}{Nichtnegative teilbare Geldbelohnung in EUR.}
\item{verteilungsart}{gleichzeitige_handlung nach659II, gleiche_preiswuerdigkeit nach661III oder mitwirkungsanteil nach660I; Rechtsgrund vorqualifiziert.}
\item{anzahl_berechtigte}{Nur Gleichverteilung: ganze Zahl mindestens2, höchstens2^53-1. Bei Mitwirkungsquote null.}
\item{anteil_zaehler}{Nur Mitwirkungsquote: nichtnegative ganze Zahl höchstens Nenner und2^53-1. Bei Gleichverteilung null.}
\item{anteil_nenner}{Nur Mitwirkungsquote: positive ganze Zahl höchstens2^53-1. Bei Gleichverteilung null.}
\item{verteilungsnachweis}{Nichtleerer Nachweis des Verteilungsfalls, der Teilbarkeit und des fehlenden Einzelempfängervorbehalts beziehungsweise der verbindlich festgestellten Mitwirkungsquote; Gesamtquoten müssen eins ergeben.}
}
\details{Geldbelohnung durch Anzahl gleichberechtigter Personen teilen oder mit qualifizierter Mitwirkungsquote multiplizieren. §659II/661III: rechtlich festgestellte Gleichzeitigkeit beziehungsweise gleiche Preiswürdigkeit, teilbare Geldbelohnung und kein Vorbehalt nur eines Empfängers. Losentscheid bei Unteilbarkeit/Einzelempfängervorbehalt außerhalb dieser Berechnung. §660I: verbindlich festgestellter billiger Mitwirkungsanteil; Funktion bewertet Beiträge nicht. Bei mehreren Einzelaufrufen müssen sämtliche qualifizierten Mitwirkungsquoten zusammen eins ergeben, keine mehrfachen Vollbelohnungen. Streitbedingtes Leistungsverweigerungsrecht660II, Hinterlegung und Preisvergabewirksamkeit gesondert. Keine Rundung oder Abrechnung bereits gezahlter Teilbeträge. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert: exakter EUR-Bruch des Anteils der betrachteten Person; keine Aussage über sofortige Durchsetzbarkeit. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_659_T0002, BGB_659_T0003, BGB_660_T0001, BGB_660_T0002, BGB_661_T0004}
\examples{
auslobung_belohnungsanteil(
  gesamtbelohnung = "100",
  verteilungsart = "gleichzeitige_handlung",
  anzahl_berechtigte = 2,
  anteil_zaehler = NULL,
  anteil_nenner = NULL,
  verteilungsnachweis = paste0(
    "§659II/661III: rechtlich festgestellte Gleichzeitigkeit bezi",
    "ehungsweise gleiche Preiswürdigkeit, teilbare Geldbelohnung ",
    "und kein Vorbehalt nur eines Empfängers. Losentscheid bei Un",
    "teilbarkeit/Einzelempfängervorbehalt außerhalb dieser Berech",
    "nung. §660I: verbindlich festgestellter billiger Mitwirkungs",
    "anteil; Funktion bewertet Beiträge nicht. Bei mehreren Einze",
    "laufrufen müssen sämtliche qualifizierten Mitwirkungsquoten ",
    "zusammen eins ergeben, keine mehrfachen Vollbelohnungen. Str",
    "eitbedingtes Leistungsverweigerungsrecht660II, Hinterlegung ",
    "und Preisvergabewirksamkeit gesondert. Keine Rundung oder Ab",
    "rechnung bereits gezahlter Teilbeträge."
  )
)
}
