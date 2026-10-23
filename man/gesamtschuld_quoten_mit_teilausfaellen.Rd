% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{gesamtschuld_quoten_mit_teilausfaellen}
\alias{gesamtschuld_quoten_mit_teilausfaellen}
\title{gesamtschuld quoten mit teilausfaellen}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{gesamtschuld_quoten_mit_teilausfaellen(
  gesamtbetrag = NULL,
  gesamtschuldner = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{gesamtbetrag}{Für denselben Innenausgleich zu verteilender Gesamtbetrag in Euro, nicht nochmals bereits abgerechnete Zahlungen.}
\item{gesamtschuldner}{Liste2..1000, je genau schuldner_id, innenquote(0..1, Summe1), einbringlicher_gesamtbeitrag geleisteter_beitrag und ausfallgewicht(nichtnegativ). Der Gesamtbeitrag ist der rechtlich/tatsächlich insgesamt erlangbare Betrag einschließlich Grund-/Zusatzlast. Ausfallgewichte sind rechtlich qualifizierte relative Tragungsgewichte; null bedeutet keine zusätzliche Ausfalltragung. geleisteter_beitrag ist der dieser Abrechnung eindeutig zugeordnete bereits erbrachte Betrag; ausdrücklich0 falls keiner. Summe höchstens Gesamtbetrag; Überzahlungen an den Gläubiger separat.}
\item{einordnungsnachweis}{Nichtleerer Nachweis von426I-Innenquoten, tatsächlicher Nichterlangbarkeit, gemeinsamen Abrechnungsgrundlagen und rechtlich maßgeblicher relativer Ausfalltragung einschließlich wiederholter Teilausfälle.}
}
\details{Grundanteile mit vollständigen Innenquoten berechnen; Teilausfall nach qualifizierten Gewichten unter verbleibenden Gesamtgrenzen wiederholt nachverteilen. §426I: zunächst Gesamtbetrag nach rechtlich bestimmten Innenquoten, daraus nur erlangbare Grundbeiträge. Nicht erlangbaren Rest nach ausdrücklich qualifizierten Ausfallgewichten auf übrige noch verfügbare Beiträge verteilen, bei weiterer Begrenzung wiederholt proportional nachverteilen. Vorhandener begrenzter Quotenkern wird wiederverwendet. Gesetzlicher Gleichanteilsfall mit gleichen Quoten/Gewichten; abweichende Bestimmung muss rechtlich belegt sein. Keine automatische Annahme, dass beliebige Innenquote stets dieselbe Ausfallquote vorgibt. Grenzen sind tatsächlich/rechtlich erlangbare Gesamtbeiträge und keine bloßen Zahlungsangebote. Ursprüngliche Beitragspflicht ausgefallener Schuldner wird nicht erlassen. Keine Begrenzung der Außenhaftung, kein automatischer Forderungsübergang426II oder individueller Anspruchszuordnung zwischen bereits leistenden Schuldnern. Kein Gesamtvermögens- oder Insolvenzmodell und keine Cent-Rundung. Bereits erbrachte, auf diese Abrechnung zugeordnete Beiträge werden mit der rechnerischen Gesamtlast verglichen. Über-/Restbeitrag sind Rechensalden, keine automatisch fälligen Einzelansprüche gegen bestimmte Mitschuldner. Teilbefriedigung lässt einen gesondert ausgewiesenen Gläubigerrest; Gesamtüberzahlung an den Gläubiger außerhalb. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.verteilung mit Grund-/Zusatz-/Gesamtbeiträgen sowie urspruenglicher_ausfall und ungedeckter_ausfall, alle Beträge als exakte Eurobrüche. Je Schuldner zusätzlich rechnerischer_ueberbeitrag und rechnerischer_beitragsrest; insgesamt gesamt_gezahlter_beitrag und gegenueber_glaeubiger_noch_offen. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_426_T0001, BGB_426_T0002}
\examples{
gesamtschuld_quoten_mit_teilausfaellen(
  gesamtbetrag = "120",
  gesamtschuldner = list(
    list(
    "schuldner_id" = "Anna",
    "innenquote" = list(
    "zaehler" = "1",
    "nenner" = "2"
  ),
    "einbringlicher_gesamtbeitrag" = "20",
    "ausfallgewicht" = "0",
    "geleisteter_beitrag" = "0"
  ),
    list(
    "schuldner_id" = "Bert",
    "innenquote" = list(
    "zaehler" = "1",
    "nenner" = "3"
  ),
    "einbringlicher_gesamtbeitrag" = "100",
    "ausfallgewicht" = "2",
    "geleisteter_beitrag" = "0"
  ),
    list(
    "schuldner_id" = "Clara",
    "innenquote" = list(
    "zaehler" = "1",
    "nenner" = "6"
  ),
    "einbringlicher_gesamtbeitrag" = "100",
    "ausfallgewicht" = "1",
    "geleisteter_beitrag" = "0"
  )
  ),
  einordnungsnachweis = paste0(
    "§426I: zunächst Gesamtbetrag nach rechtlich bestimmten Innen",
    "quoten, daraus nur erlangbare Grundbeiträge. Nicht erlangbar",
    "en Rest nach ausdrücklich qualifizierten Ausfallgewichten au",
    "f übrige noch verfügbare Beiträge verteilen, bei weiterer Be",
    "grenzung wiederholt proportional nachverteilen. Vorhandener ",
    "begrenzter Quotenkern wird wiederverwendet. Gesetzlicher Gle",
    "ichanteilsfall mit gleichen Quoten/Gewichten; abweichende Be",
    "stimmung muss rechtlich belegt sein. Keine automatische Anna",
    "hme, dass beliebige Innenquote stets dieselbe Ausfallquote v",
    "orgibt. Grenzen sind tatsächlich/rechtlich erlangbare Gesamt",
    "beiträge und keine bloßen Zahlungsangebote. Ursprüngliche Be",
    "itragspflicht ausgefallener Schuldner wird nicht erlassen. K",
    "eine Begrenzung der Außenhaftung, kein automatischer Forderu",
    "ngsübergang426II oder Zahlungssaldo zwischen bereits leisten",
    "den Schuldnern. Kein Gesamtvermögens- oder Insolvenzmodell u",
    "nd keine Cent-Rundung."
  )
)
}
