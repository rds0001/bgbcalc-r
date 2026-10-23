% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pflichtteilsergaenzung_personenbegrenzte_schenkungen}
\alias{pflichtteilsergaenzung_personenbegrenzte_schenkungen}
\title{pflichtteilsergaenzung personenbegrenzte schenkungen}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{pflichtteilsergaenzung_personenbegrenzte_schenkungen(
  fehlbetrag = NULL,
  schenkungen = NULL,
  personenrahmen = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{fehlbetrag}{Rechtlich gegenüber Beschenkten zu deckender Ergänzungsfehlbetrag in Euro; nicht bloß vom Erben unbezahlter Betrag.}
\item{schenkungen}{Liste1..1000 mit genau schenkung_id, beschenkter_id, schenkungsrang(1..1000, eindeutig, höher=später) und haftungsgrenze. Vorgangsbezogene Grenzen vor gemeinsamer personenbezogener Begrenzung.}
\item{personenrahmen}{Liste1..1000 mit genau beschenkter_id und gemeinsame_haftungsgrenze. Jede vorkommende Person genau einmal; rechtlich belegter überschneidungsfreier gemeinsamer Rahmen für sämtliche hier betrachteten Geschenke.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des2329-Falls, eindeutiger Rangfolge, Vorgangsgrenzen und zusätzlicher tatsächlich einschlägiger gemeinsamer Personenrahmen. Keine Zahlungsunfähigkeit als rechtliche Haftungsgrenze verwenden.}
}
\details{Gemeinsamen Personenrahmen einmalig in absteigender Schenkungsrangfolge auf Vorgangsgrenzen verteilen und vorhandenen2329-Rangkern auf begrenzte Vorgänge anwenden. §2329III: zeitlich eindeutig geordnete Schenkungen, gegebenenfalls mehrfach an dieselbe Person. Gemeinsamen rechtlich bestimmten Personenrahmen nur einmal verwenden und späteren Schenkungen vorrangig zuordnen; anschließend vorhandenen Schenkungsrang-/Empfängersummenkern anwenden. Rahmen müssen für diesen Ergänzungsanspruch tatsächlich rechtlich gelten, etwa nach vorqualifizierter Bereicherungs-/Einwendungsbewertung; keine automatisch erfundene Gesamtvermögens-, Selbstbehalts- oder Zahlungsfähigkeitsgrenze. Einzelgrenzen und gemeinsamer Rahmen dürfen nicht dieselbe Kürzung doppelt enthalten. Bereits geleistete Erfüllung und weitere konkurrierende Berechtigte gesondert. Gleichzeitige Schenkungen weiterhin außerhalb, keine erfundene Gleichquote oder Gesamtschuld. Ausgabe numerische Haftungs-/Befriedigungsgrenzen, kein automatischer gewöhnlicher Geldanspruch aus Sachherausgabe. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert mit haftung_je_schenkung, haftung_je_beschenktem und nicht_gedeckter_fehlbetrag wie vorhandener Schenkungsvorgangskern. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2329_T0001, BGB_2329_T0002, BGB_2329_T0003, BGB_2329_T0004}
\examples{
pflichtteilsergaenzung_personenbegrenzte_schenkungen(
  fehlbetrag = "100",
  schenkungen = list(
    list(
    "schenkung_id" = "A_spaet",
    "beschenkter_id" = "Anna",
    "schenkungsrang" = 3,
    "haftungsgrenze" = "80"
  ),
    list(
    "schenkung_id" = "B_mitte",
    "beschenkter_id" = "Bert",
    "schenkungsrang" = 2,
    "haftungsgrenze" = "80"
  ),
    list(
    "schenkung_id" = "A_frueh",
    "beschenkter_id" = "Anna",
    "schenkungsrang" = 1,
    "haftungsgrenze" = "80"
  )
  ),
  personenrahmen = list(
    list(
    "beschenkter_id" = "Anna",
    "gemeinsame_haftungsgrenze" = "50"
  ),
    list(
    "beschenkter_id" = "Bert",
    "gemeinsame_haftungsgrenze" = "30"
  )
  ),
  einordnungsnachweis = paste0(
    "§2329III: zeitlich eindeutig geordnete Schenkungen, gegebene",
    "nfalls mehrfach an dieselbe Person. Gemeinsamen rechtlich be",
    "stimmten Personenrahmen nur einmal verwenden und späteren Sc",
    "henkungen vorrangig zuordnen; anschließend vorhandenen Schen",
    "kungsrang-/Empfängersummenkern anwenden. Rahmen müssen für d",
    "iesen Ergänzungsanspruch tatsächlich rechtlich gelten, etwa ",
    "nach vorqualifizierter Bereicherungs-/Einwendungsbewertung; ",
    "keine automatisch erfundene Gesamtvermögens-, Selbstbehalts-",
    " oder Zahlungsfähigkeitsgrenze. Einzelgrenzen und gemeinsame",
    "r Rahmen dürfen nicht dieselbe Kürzung doppelt enthalten. Be",
    "reits geleistete Erfüllung und weitere konkurrierende Berech",
    "tigte gesondert. Gleichzeitige Schenkungen weiterhin außerha",
    "lb, keine erfundene Gleichquote oder Gesamtschuld. Ausgabe n",
    "umerische Haftungs-/Befriedigungsgrenzen, kein automatischer",
    " gewöhnlicher Geldanspruch aus Sachherausgabe."
  )
)
}
