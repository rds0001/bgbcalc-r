% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{unterhalt_anteile_mit_leistungsgrenzen}
\alias{unterhalt_anteile_mit_leistungsgrenzen}
\title{unterhalt anteile mit leistungsgrenzen}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{unterhalt_anteile_mit_leistungsgrenzen(
  verteilbarer_barunterhalt = NULL,
  unterhaltspflichtige = NULL,
  verteilungsnachweis = NULL
)}
\arguments{
\item{verteilbarer_barunterhalt}{Barunterhaltsbedarf eines Berechtigten für einen einheitlichen Zeitraum in Euro; keine Mischung mehrerer Rangstufen.}
\item{unterhaltspflichtige}{Liste1..1000 rechtlich gleich naher Barunterhaltspflichtiger, je genau person_id, verteilungsgewicht(positiv) und leistungsfaehiger_hoechstbetrag(nichtnegativer Gesamtbetrag für diesen Bedarf/Zeitraum). Gewichte müssen auch für rechtlich zulässige proportionale Nachverteilung gelten.}
\item{verteilungsnachweis}{Nichtleerer Nachweis des1606III1-Falls,1603-Leistungsgrenzen, maßgeblicher Erwerbs-/Vermögensgewichte und Zulässigkeit ihrer proportionalen Nachverteilung im konkreten Fall.}
}
\details{Qualifizierten Barunterhalt mit vorhandenem begrenztem Quotenkern nach Gewichten unter individuellen Leistungsgrenzen verteilen und ungedeckten Rest ausweisen. §1606III1 mit rechtlich bestimmten1603-Leistungsgrenzen: proportionaler Barunterhaltsanteil für einen Berechtigten; bei Begrenzung verbleibenden Bedarf im ausdrücklich qualifizierten Modell nach relativen Gewichten der übrigen Pflichtigen nachverteilen. Keine automatisch vorausgesetzte einheitliche Methode für sämtliche Unterhalts-Mangelfälle. Eingaben enthalten bereits passende Selbstbehalte, Belastungen, Rang- und Bewertungsentscheidungen; keine Tabelle oder Einkommensbereinigung erfinden. Gewichte/Grenzen müssen für diesen Bedarf und sämtliche Nachverteilungsschritte rechtlich gelten. Ändert sich dadurch die rechtliche Berechnungsbasis, ist diese außerhalb neu zu bestimmen. Mehrere Berechtigte, konkurrierende1609-Ränge, gesteigerte1603II-Gesamtmittelaufteilung, Wechselmodell, Naturalunterhalt und subsidiäre1607-Haftung nicht automatisch kombiniert. Ergebnis ungedeckter Bedarf ist kein Erlass oder automatischer Anspruch gegen weitere Personen. Keine Cent-Rundung. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.verteilung mit ungekuerzter_anteil und beibringbarer_unterhaltsbetrag je Person sowie gesamt_beibringbar und ungedeckter_barunterhalt, jeweils exakte Eurobrüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1603_T0001, BGB_1603_T0002, BGB_1603_T0003, BGB_1603_T0004, BGB_1606_T0001, BGB_1606_T0002, BGB_1606_T0003, BGB_1606_T0004}
\examples{
unterhalt_anteile_mit_leistungsgrenzen(
  verteilbarer_barunterhalt = "1200",
  unterhaltspflichtige = list(
    list(
    "person_id" = "Anna",
    "verteilungsgewicht" = "2",
    "leistungsfaehiger_hoechstbetrag" = "500"
  ),
    list(
    "person_id" = "Bert",
    "verteilungsgewicht" = "1",
    "leistungsfaehiger_hoechstbetrag" = "1000"
  )
  ),
  verteilungsnachweis = paste0(
    "§1606III1 mit rechtlich bestimmten1603-Leistungsgrenzen: pro",
    "portionaler Barunterhaltsanteil für einen Berechtigten; bei ",
    "Begrenzung verbleibenden Bedarf im ausdrücklich qualifiziert",
    "en Modell nach relativen Gewichten der übrigen Pflichtigen n",
    "achverteilen. Keine automatisch vorausgesetzte einheitliche ",
    "Methode für sämtliche Unterhalts-Mangelfälle. Eingaben entha",
    "lten bereits passende Selbstbehalte, Belastungen, Rang- und ",
    "Bewertungsentscheidungen; keine Tabelle oder Einkommensberei",
    "nigung erfinden. Gewichte/Grenzen müssen für diesen Bedarf u",
    "nd sämtliche Nachverteilungsschritte rechtlich gelten. Änder",
    "t sich dadurch die rechtliche Berechnungsbasis, ist diese au",
    "ßerhalb neu zu bestimmen. Mehrere Berechtigte, konkurrierend",
    "e1609-Ränge, gesteigerte1603II-Gesamtmittelaufteilung, Wechs",
    "elmodell, Naturalunterhalt und subsidiäre1607-Haftung nicht ",
    "automatisch kombiniert. Ergebnis ungedeckter Bedarf ist kein",
    " Erlass oder automatischer Anspruch gegen weitere Personen. ",
    "Keine Cent-Rundung."
  )
)
}
