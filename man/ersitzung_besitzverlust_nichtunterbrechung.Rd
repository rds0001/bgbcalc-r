% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{ersitzung_besitzverlust_nichtunterbrechung}
\alias{ersitzung_besitzverlust_nichtunterbrechung}
\title{ersitzung besitzverlust nichtunterbrechung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{ersitzung_besitzverlust_nichtunterbrechung(
  eigenbesitzverlust_am = NULL,
  prueftag = NULL,
  massgebliches_jahresfristende = NULL,
  wiedererlangung_am = NULL,
  klageerhebung_am = NULL,
  eigenbesitz_ohne_willen_verloren = NULL,
  wiedererlangung_mittels_klage = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{eigenbesitzverlust_am}{ISO-Datum des qualifizierten Verlusts des Eigenbesitzes, nicht bloße Störung oder vorübergehendes tatsächliches Hindernis ohne Besitzverlust.}
\item{prueftag}{ISO-Datum ab Eigenbesitzverlust; tatsächliche Wiedererlangung und Klageerhebung dürfen nicht danach liegen.}
\item{massgebliches_jahresfristende}{ISO-Datum des rechtlich maßgeblichen Jahresfristendes, mindestens kalendarisches Ereignisfristende. Ohne gesondert begründete gesetzliche Korrektur genau dieses Ende eingeben. Keine automatische Feiertagsverlängerung.}
\item{wiedererlangung_am}{Optionales ISO-Datum tatsächlicher Wiedererlangung gerade des Eigenbesitzes zwischen Verlust und Prüftag. NULL bedeutet noch nicht eingetreten, nicht unbekannt.}
\item{klageerhebung_am}{Optionales rechtlich maßgebliches ISO-Datum wirksamer Klageerhebung zwischen Verlust und Prüftag. Nicht unbesehen Versand oder Eingang einsetzen; prozessuale Wirkungen gesondert beurteilen. NULL bedeutet noch nicht eingetreten.}
\item{eigenbesitz_ohne_willen_verloren}{Expliziter Wahrheitswert des unfreiwilligen Verlusts; freiwilliger Verlust erfüllt Absatz2 auch bei rascher Wiedererlangung nicht.}
\item{wiedererlangung_mittels_klage}{Expliziter Wahrheitswert, dass die tatsächliche Wiedererlangung mittels der eingegebenen Klage erfolgt ist. TRUE erfordert beide Ereignisse mit Klage spätestens bei Wiedererlangung; rechtzeitige Klage ohne Wiedererlangung genügt nicht.}
\item{einordnungsnachweis}{Nichtleere rechtliche Begründung von Eigenbesitz, Unfreiwilligkeit, Wiedererlangung, wirksamer Klage und maßgeblichem Jahresfristende; untertägige Ereignisreihenfolge bei gleichen Daten bestätigen.}
}
\details{Jahresfrist ab Eigenbesitzverlust als Ereignisfrist. Unfreiwilliger Verlust und entweder tatsächliche Wiedererlangung spätestens am maßgeblichen Fristende oder Wiedererlangung mittels spätestens dann erhobener Klage. Spätere Wiedererlangung auf rechtzeitige Klage möglich. Keine automatische Eigentumsbehauptung. Nur Ausnahme zur Besitzverlustunterbrechung§940; Hemmung§939, Vollstreckungsunterbrechung§941 und Folgen§942 sowie Voraussetzungen§937 separat. Fehlende bisherige Wiedererlangung kann künftig noch eintreten; FALSE ist keine abschließende Prognose. ISO-Daten und berechnete Grenzen0001..9999, explizite Wahrheitswerte und nichtleerer Nachweis.}
\value{wert enthält kalendarisches_jahresfristende, massgebliches_jahresfristende, wiedererlangung_binnen_jahresfrist, wiedererlangung_durch_rechtzeitige_klage, unterbrechung_gilt_als_nicht_erfolgt. Letzter Wert ist auf§940 Absatz2 und den aktuellen Ereignisstand begrenzt. Einheit: daten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_940_T0001, BGB_940_T0002}
\examples{
ersitzung_besitzverlust_nichtunterbrechung(
  eigenbesitzverlust_am = "2028-02-29",
  prueftag = "2030-03-01",
  massgebliches_jahresfristende = "2029-02-28",
  wiedererlangung_am = "2029-02-28",
  klageerhebung_am = "2028-03-01",
  eigenbesitz_ohne_willen_verloren = FALSE,
  wiedererlangung_mittels_klage = FALSE,
  einordnungsnachweis = paste0(
    "Synthetisch qualifizierter unfreiwilliger Eigenbesitzverlust",
    " und tatsächliche Wiedererlangung."
  )
)
}
