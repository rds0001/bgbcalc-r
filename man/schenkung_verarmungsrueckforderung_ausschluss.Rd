% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{schenkung_verarmungsrueckforderung_ausschluss}
\alias{schenkung_verarmungsrueckforderung_ausschluss}
\title{schenkung verarmungsrueckforderung ausschluss}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{schenkung_verarmungsrueckforderung_ausschluss(
  geschenk_geleistet_am = NULL,
  beduerftigkeit_eingetreten_am = NULL,
  beduerftigkeit_vorsaetzlich_oder_grob_fahrlaessig = NULL,
  pflicht_oder_anstandsschenkung = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{geschenk_geleistet_am}{ISO-Datum0001..9999 der rechtlich fristauslösenden Leistung des geschenkten Gegenstands. Nicht bloß Schenkungsversprechen oder ungeprüfter Grundbuch-/Vertragstag. Mehrere Leistungen separat beurteilen.}
\item{beduerftigkeit_eingetreten_am}{ISO-Datum0001..9999 des rechtlich relevanten Eintritts der Bedürftigkeit des Schenkers, nicht Datum der späteren Rückforderung oder Klage. Vor Leistung liegende Bedürftigkeit führt hier nur zu keinem zeitlichen Ausschluss; Anspruchsvoraussetzungen§528 gesondert.}
\item{beduerftigkeit_vorsaetzlich_oder_grob_fahrlaessig}{Wahrheitswert, dass Schenker gerade seine Bedürftigkeit vorsätzlich oder grob fahrlässig herbeigeführt hat. Einfache Fahrlässigkeit oder allein freiwillige Schenkung nicht automatisch gleichsetzen.}
\item{pflicht_oder_anstandsschenkung}{Wahrheitswert der rechtlichen Privilegierung§534; sittliche Pflicht/Anstand bewerten, keine feste Betragsgrenze erfinden.}
\item{einordnungsnachweis}{Nichtleere Begründung von Schenkungsleistung, maßgeblichem Bedürftigkeitseintritt, schwerer Eigenverursachung und Schenkungsprivilegierung.}
}
\details{Zehnjahresereignisfrist ab Leistung. Bedürftigkeitseintritt nach Fristablauf ODER vorsätzliche/grob fahrlässige Herbeiführung ODER§534-Privilegierung schließt betrachtete Rückforderung aus. Nur§529 Absatz1/§534; Schutz des Beschenkten§529 Absatz2, Anspruchsvoraussetzungen§528, Bereicherungsrecht und Mehrbeschenktenrangfolge nicht mitberechnet. Keine Schenkungsabschmelzung§2325 und keine Verjährungsprüfung der Rückforderung. ISO-Daten und berechnete Grenzen0001..9999, explizite Wahrheitswerte und nichtleerer Nachweis.}
\value{wert enthält zehnjahreszeitraum_ende als ISO-Datum und zehnjahresfrist_bei_beduerftigkeit_abgelaufen sowie rueckforderung_nach_529_absatz_eins_oder_534_ausgeschlossen als Wahrheitswerte. FALSE bestätigt keinen Anspruch. Einheit: daten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_529_T0001, BGB_534_T0001}
\examples{
schenkung_verarmungsrueckforderung_ausschluss(
  geschenk_geleistet_am = "2014-02-28",
  beduerftigkeit_eingetreten_am = "2014-02-27",
  beduerftigkeit_vorsaetzlich_oder_grob_fahrlaessig = FALSE,
  pflicht_oder_anstandsschenkung = FALSE,
  einordnungsnachweis = paste0(
    "Synthetisch fristauslösende Leistung und rechtlich maßgeblic",
    "her Bedürftigkeitseintritt, nicht spätere Anspruchserhebung."
  )
)
}
