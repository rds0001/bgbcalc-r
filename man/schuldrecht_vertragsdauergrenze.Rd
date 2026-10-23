% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{schuldrecht_vertragsdauergrenze}
\alias{schuldrecht_vertragsdauergrenze}
\title{schuldrecht vertragsdauergrenze}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{schuldrecht_vertragsdauergrenze(
  regelfall = NULL,
  vertragsbeginn_am = NULL,
  vertragsende_am = NULL,
  dauernachweis = NULL
)}
\arguments{
\item{regelfall}{teilzeitwohnrecht_481, urlaubsprodukt_481a, landpacht_textform_585a oder landpacht_fortsetzung_594.}
\item{vertragsbeginn_am}{Qualifizierter Vertragsbeginn ab Tagesbeginn als ISO-Datum.}
\item{vertragsende_am}{Inklusiver letzter Vertragstag als ISO-Datum einschliesslich aller Optionen; nur481/481a alternativ unbegrenzt_verlaengerbar bei rechtlich qualifizierten ohne endliche Gesamtgrenze wiederholbaren Verlaengerungen. Kein Ersatz fuer unbekannte Daten.}
\item{dauernachweis}{Nichtleerer Nachweis des vollständigen betrachteten Zeitraums, einschließlich Verlängerungsoptionen; keine automatische Ermittlung aus Vertragstext.}
}
\details{Qualifizierte feste Vertragsdauer mit Ein-, Zwei- oder Dreijahresgrenze vergleichen. Nur numerischer Dauervergleich, keine vollstaendige Vertragsqualifikation oder Formentscheidung. Beginn als rechtlich massgeblicher Tagesbeginn und endlichen letzten Vertragstag einschliesslich Tagesablauf vorgeben. Bei481/481a saemtliche rechtlich vorgesehenen Verlaengerungsmoeglichkeiten beruecksichtigen. Ein endlich bestimmbares maximales Enddatum kann auch aus gestaffelten oder alternativen Optionen stammen; kein automatisches Lesen beliebiger Vertragsklauseln. Nur bei481/481a bezeichnet vertragsende_am=unbegrenzt_verlaengerbar eine rechtlich qualifizierte ohne endliche Gesamtgrenze wiederholbare Verlaengerungsmoeglichkeit: die Einjahresgrenze ist dann ueberschreitbar und damit erfuellt, ohne ein fiktives Enddatum zu erfinden. Nicht gleichbedeutend mit unbekanntem Enddatum oder blosser Unklarheit der Vertragsauslegung. Bei585aTextform und bei594Anfrage/Ablehnungsfrist gesondert. Untertaegige Laufzeiten gesondert qualifizieren. Kalenderdaten0001..9999 einschließlich Grenz- und Folgedaten; keine Rundung.}
\value{wert: grenzdauer_jahre, ende_der_grenzdauer, vergleich (mehr_als oder mindestens) und dauergrenze_erfuellt. Einheit: datum_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_481_T0001, BGB_481_T0002, BGB_481a_T0001, BGB_481a_T0002, BGB_585a_T0001, BGB_594_T0001, BGB_594_T0002, BGB_594_T0003, BGB_594_T0004}
\examples{
schuldrecht_vertragsdauergrenze(
  regelfall = "teilzeitwohnrecht_481",
  vertragsbeginn_am = "2024-01-01",
  vertragsende_am = "2024-12-30",
  dauernachweis = paste0(
    "Nur numerischer Dauervergleich, keine vollständige Vertragsq",
    "ualifikation oder Form-/Verlängerungsentscheidung. Beginn al",
    "s rechtlich maßgeblicher Tagesbeginn und Ende einschließlich",
    " Tagesablauf vorgeben; untertägige Laufzeiten nicht automati",
    "sch normalisieren. Für481/481a sämtliche vertraglichen Verlä",
    "ngerungsmöglichkeiten im qualifizierten Enddatum berücksicht",
    "igen, nicht nur die anfängliche Mindestbindung. Nur endlich ",
    "bestimmbarer Gesamtzeitraum; unbestimmte oder anderweitig st",
    "rukturierte Optionen nicht durch ein erfundenes Enddatum ers",
    "etzen. Bei585a Textform gesondert, bei594 wirksame Anfrage i",
    "m drittletzten Pachtjahr und Ablehnungsfrist gesondert."
  )
)
}
