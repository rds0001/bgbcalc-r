% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{fortgesetzte_guetergemeinschaft_vorempfangsausgleich}
\alias{fortgesetzte_guetergemeinschaft_vorempfangsausgleich}
\title{fortgesetzte guetergemeinschaft vorempfangsausgleich}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{fortgesetzte_guetergemeinschaft_vorempfangsausgleich(
  abkoemmlings_teilungsmasse = NULL,
  abkoemmlinge = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{abkoemmlings_teilungsmasse}{Nichtnegative exakte EUR-Masse allein der qualifizierten Abkömmlings-Ausgleichungsgruppe nach vorangehender Bilanzbereinigung, nicht gesamtes Gesamtgut.}
\item{abkoemmlinge}{Liste1..1000 mit genau person_id, erbquote_zaehler, erbquote_nenner (positive ganze Zahlen, relative Gruppenquoten summieren sich zu eins), vorempfangswert und bereits_ausgeglichener_vorempfangswert (nichtnegative exakte EUR-Beträge, bereits ausgeglichener Teil höchstens Gesamtwert). Beide Werte auf identischer qualifizierter Bewertungsbasis; kein früherer Zahlungsbetrag.}
\item{bewertungsnachweis}{Nichtleerer Nachweis der Ausgleichungsgruppe, hypothetischen Quoten, Teilungsmasse, Vorempfangswerte und bereits erfolgter Nachlassausgleichung.}
}
\details{Bereits ausgeglichenen Vorempfangsteil abziehen; vorhandenen Ausgleichungskern2055/2056 einschließlich iterativen Überempfangausschlusses auf verbleibende Vorempfänge anwenden. §1503II mit§§2055/2056: vollständige rechtlich qualifizierte Ausgleichungsgruppe und relative positive Quoten innerhalb dieser Gruppe mit Summe eins. Teilungsmasse ist ausschließlich der dieser Gruppe zufallende bereinigte Abkömmlingsbetrag, nicht das gesamte Gesamtgut; Halbierung und andere Lasten davor gesondert bestimmen. Vorempfangswert und bereits bei der Nachlassteilung ausgeglichener Teil auf identischer maßgeblicher Bewertungsbasis vorgeben; bereits ausgeglichener Teil ist kein früherer Auszahlungsbetrag und kein nach freier Wahl verrechneter Vorteil. Die rechtliche Ausgleichungspflicht und wertmäßige Abgrenzung/Indexierung werden nicht ermittelt. Keine erneute Anrechnung desselben Vorempfangs. Qualifizierte einfache Ausgleichungsgruppe; Stämme, Nachfolgezuordnungen, Leistungsausgleich§2057a und abweichende Anordnungen nicht automatisch modelliert. §1503III begünstigtenbezogene Abfindungslasten sind hier nicht verteilt. Ausgeschlossene Überempfänger zahlen nach§2056 den Mehrbetrag nicht zurück. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält verbleibende_vorempfaenge (person_id/verbleibender_ausgleichungswert), verteilung (person_id/betrag/ausser_ansatz) und ausser_ansatz (ausgeschlossene Kennungen). Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1503_T0002, BGB_2055_T0001, BGB_2055_T0002, BGB_2055_T0003, BGB_2056_T0001, BGB_2056_T0002}
\examples{
fortgesetzte_guetergemeinschaft_vorempfangsausgleich(
  abkoemmlings_teilungsmasse = "100",
  abkoemmlinge = list(
    list(
    "person_id" = "A",
    "erbquote_zaehler" = 1,
    "erbquote_nenner" = 2,
    "vorempfangswert" = "60",
    "bereits_ausgeglichener_vorempfangswert" = "20"
  ),
    list(
    "person_id" = "B",
    "erbquote_zaehler" = 1,
    "erbquote_nenner" = 2,
    "vorempfangswert" = "0",
    "bereits_ausgeglichener_vorempfangswert" = "0"
  )
  ),
  bewertungsnachweis = paste0(
    "Qualifizierte Abkömmlingshälfte, relative Ausgleichungsquote",
    "n, bereits ausgeglichene Vorempfangsteile auf derselben Wert",
    "basis."
  )
)
}
