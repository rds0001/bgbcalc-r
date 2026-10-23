% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{fortgesetzte_guetergemeinschaft_grundanteile}
\alias{fortgesetzte_guetergemeinschaft_grundanteile}
\title{fortgesetzte guetergemeinschaft grundanteile}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{fortgesetzte_guetergemeinschaft_grundanteile(
  teilungswert_gesamtgut = NULL,
  abkoemmlinge = NULL,
  quotennachweis = NULL
)}
\arguments{
\item{teilungswert_gesamtgut}{Nichtnegativer qualifizierter Gesamtgutswert nach vorrangiger Verbindlichkeiten-/Rückbehaltsbereinigung in EUR. Nur Grundverteilung, keine Abfindungs-/Vorempfangskorrekturen.}
\item{abkoemmlinge}{Vollständige Liste1..1000 anteilsberechtigter Abkömmlinge mit genau abkoemmling_id und hypothetischer_erbteil. ID nichtleer/eindeutig, Quote exakt positiv<=1, Summe<=1. Hypothetische gesetzliche Erbfolge beim gedachten Tod des verstorbenen Ehegatten erst bei Beendigung der fortgesetzten Gütergemeinschaft.}
\item{quotennachweis}{Nichtleerer Nachweis zur Vollständigkeit, hypothetischen gesetzlichen Erbfolge und qualifizierten Teilungsmasse; gegebenenfalls weitere Korrekturen gesondert.}
}
\details{Gesamtgut halbieren, Abkömmlingshälfte im Verhältnis hypothetischer Erbquoten verteilen; Pflichtteilswertbasis=Hälfte jedes Grundanteilswerts. Grundanteile nach§1503I und reine Wertbasis nach§1505. Vollständiger qualifizierter Kreis anteilsberechtigter Abkömmlinge; hypothetische gesetzliche Erbfolge beim gedachten Tod des verstorbenen Ehegatten erst zur Beendigung der fortgesetzten Gütergemeinschaft, nicht tatsächlicher ursprünglicher Erbfall. Relative Quoten können zusammen unter eins liegen und werden innerhalb der Abkömmlingsgruppe normalisiert. Teilungswert nach vorrangiger Verbindlichkeiten-/Rückbehaltsbereinigung vorgegeben. Abfindungseinrechnung§1501, Vorempfangsausgleich§1503II, Lastenzuordnung§1503III und abweichende Vereinbarungen nicht berechnet; bei deren Eingreifen keine abschließenden Auszahlungsbeträge. Pflichtteilswertbasis ist kein fertiger Ergänzungsanspruch; Schenkungshinzurechnungen, Abschmelzung und Anrechnungen gesondert. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält ehegattenhaelfte und abkoemmlingshaelfte als EUR-Brüche und abkoemmlingsanteile in Eingabereihenfolge mit ID, anteil_abkoemmlingshaelfte und anteil_gesamtgut als dimensionslosen Brüchen, grundanteilswert und pflichtteilswertbasis als EUR-Brüchen. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1503_T0001, BGB_1505_T0001}
\examples{
fortgesetzte_guetergemeinschaft_grundanteile(
  teilungswert_gesamtgut = "600",
  abkoemmlinge = list(
    list(
    "abkoemmling_id" = "A",
    "hypothetischer_erbteil" = list(
    "zaehler" = "1",
    "nenner" = "2"
  )
  ),
    list(
    "abkoemmling_id" = "B",
    "hypothetischer_erbteil" = list(
    "zaehler" = "1",
    "nenner" = "4"
  )
  )
  ),
  quotennachweis = paste0(
    "Vollständiger Kreis; gesetzliche hypothetische Erbfolge zum ",
    "Beendigungszeitpunkt belegt."
  )
)
}
