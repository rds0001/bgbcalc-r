% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pflichtteilsergaenzung_schenkungsvorgaenge}
\alias{pflichtteilsergaenzung_schenkungsvorgaenge}
\title{pflichtteilsergaenzung schenkungsvorgaenge}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{pflichtteilsergaenzung_schenkungsvorgaenge(
  fehlbetrag = NULL,
  schenkungen = NULL,
  vorgangsgrenzen_qualifiziert = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{fehlbetrag}{Nichtnegative ergänzungsrechtliche EUR-Lücke.}
\item{schenkungen}{Liste1..1000: schenkung_id eindeutig,beschenkter_id mehrfach zulässig,schenkungsrang eindeutig höher=später,haftungsgrenze nichtnegative überschneidungsfreie rechtlich qualifizierte Vorgangsgrenze.}
\item{vorgangsgrenzen_qualifiziert}{Pflichtwahrheitswert: alle Vorgangsgrenzen bereits rechtlich qualifiziert; gemeinsame Personengrenzen dürfen nicht mehrfach angesetzt werden.}
\item{einordnungsnachweis}{Nichtleerer Nachweis von Rangfolge und Haftungsgrenzen.}
}
\details{Spätere Schenkungsvorgänge zuerst bis zu ihrer jeweiligen Grenze; verbleibende Lücke an vorherigen Vorgang. Danach Vorgangshaftung je tatsächlichem Empfänger summieren. Keine simultanen Ränge, keine automatische Aufteilung einer gemeinsamen personenbezogenen Haftungsgrenze; rechtlich nicht verpflichtet ist nicht bloß zahlungsunfähig. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{Haftung je Schenkung, aggregierte Haftung je Beschenktem und ungedeckte Lücke als exakte EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2329_T0003}
\examples{
pflichtteilsergaenzung_schenkungsvorgaenge(
  fehlbetrag = "70",
  schenkungen = list(
    list(
    "schenkung_id" = "A1",
    "beschenkter_id" = "A",
    "schenkungsrang" = 1,
    "haftungsgrenze" = "40"
  ),
    list(
    "schenkung_id" = "B",
    "beschenkter_id" = "B",
    "schenkungsrang" = 2,
    "haftungsgrenze" = "30"
  ),
    list(
    "schenkung_id" = "A2",
    "beschenkter_id" = "A",
    "schenkungsrang" = 3,
    "haftungsgrenze" = "20"
  )
  ),
  vorgangsgrenzen_qualifiziert = TRUE,
  einordnungsnachweis = "Synthetische überschneidungsfreie Vorgangsgrenzen."
)
}
