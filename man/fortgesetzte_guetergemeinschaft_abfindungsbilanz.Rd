% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{fortgesetzte_guetergemeinschaft_abfindungsbilanz}
\alias{fortgesetzte_guetergemeinschaft_abfindungsbilanz}
\title{fortgesetzte guetergemeinschaft abfindungsbilanz}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{fortgesetzte_guetergemeinschaft_abfindungsbilanz(
  bereinigte_restmasse_ohne_abfindungen = NULL,
  qualifizierte_abfindungen = NULL,
  bilanznachweis = NULL
)}
\arguments{
\item{bereinigte_restmasse_ohne_abfindungen}{Nichtnegative nach vorrangiger Berichtigung/Rückbehalten verbleibende Masse in EUR, OHNE bereits abgeflossene gesondert einzurechnende Abfindungen.}
\item{qualifizierte_abfindungen}{Nichtnegative rechtlich bewertete Summe aus Gesamtgut tatsächlich gewährter Abfindungen für Anteilsverzicht nach§1501I in EUR.}
\item{bilanznachweis}{Nichtleerer Nachweis der Massenabgrenzung, gewährten einrechenbaren Abfindungen und fehlenden abweichenden Vereinbarung; andere Korrekturen getrennt.}
}
\details{Rechenmasse=Restmasse+Abfindungen; Halbteil=Rechenmasse/2; Abkömmlingssaldo=Halbteil-Abfindungen. §1501I-Bilanz ohne abweichende Vereinbarung nachAbsatz2; entsprechend§1511III für tatsächlich aus Gesamtgut gezahlte Ausschlussbeträge. Ein bloß berechneter, noch nicht gezahlter Anspruch ist keine gewährte Abfindung und darf nicht als bereits abgeflossen hinzugerechnet werden. Nur tatsächlich aus Gesamtgut gewährte, rechtlich einrechenbare Abfindungen für Anteilsverzicht oder entsprechende gezahlte Ausschlussbeträge1511III; qualifizierte Summe und maßgebliche Werte vorgeben. Restmasse enthält diese bereits abgeflossenen Beträge gerade nicht und ist nach vorrangigen Verbindlichkeiten/Rückbehalten bereinigt. Andere Ersatzforderungen/Lasten nach§§1498bis1500 sowie Vorempfänge nach§1503II sind getrennt abzugrenzen; dies ist keine vollständige Schlussauseinandersetzung. §1503III belastet im Innenverhältnis nur begünstigte Abkömmlinge, keine automatische Gleichverteilung der Abfindung. Negativer Abkömmlingssaldo bleibt ausdrücklich bloße Rechengröße und begründet keinen ausgegebenen Nachschuss-/Rückzahlungsanspruch;§1498 beschränkt die überschießende§1476II2-Ersatzpflicht auf den überlebenden Ehegatten. Rechnerischer Ehegattenhalbteil ist kein Nachweis sofort verfügbarer Barauszahlung. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält rechenmasse_mit_abfindung, rechnerischer_ehegattenhalbteil, abkoemmlingshalbteil_vor_anrechnung und abkoemmlingssaldo_nach_anrechnung als EUR-Brüche. Letzterer kann negativ sein, ist aber kein festgestellter Nachschussanspruch. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1501_T0001, BGB_1511_T0004, BGB_1511_T0005}
\examples{
fortgesetzte_guetergemeinschaft_abfindungsbilanz(
  bereinigte_restmasse_ohne_abfindungen = "800",
  qualifizierte_abfindungen = "200",
  bilanznachweis = paste0(
    "Nach Abfindung verbleibende bereinigte Masse800; gewährte ei",
    "nrechenbare Abfindung200, kein abweichender Vertrag."
  )
)
}
