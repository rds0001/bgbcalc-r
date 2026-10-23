% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{genehmigung_aufforderungsfrist}
\alias{genehmigung_aufforderungsfrist}
\title{genehmigung aufforderungsfrist}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{genehmigung_aufforderungsfrist(
  regelbereich = NULL,
  aufforderungszugang_am = NULL,
  massgebliches_fristende = NULL,
  prueftag = NULL,
  genehmigung_erklaert_am = NULL,
  gegenueber_aufforderndem = NULL,
  genehmigung_durch_berechtigten = NULL,
  aufforderung_wirksam = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{regelbereich}{Auswahl minderjaehrigenvertrag (§108 Absatz2) oder vertretung_ohne_vertretungsmacht (§177 Absatz2); gesetzliche Grundtatbestände gesondert feststellen.}
\item{aufforderungszugang_am}{ISO-Datum0001..9999 des Empfangs der wirksamen Aufforderung zur Genehmigungserklärung beim rechtlich zuständigen Empfänger. Nicht Absendung oder Vertragsschluss verwenden.}
\item{massgebliches_fristende}{ISO-Datum0001..9999 des rechtlich maßgeblichen letzten Genehmigungstags einschließlich erforderlicher Kalenderkorrekturen. Die Funktion prüft mindestens zwei Wochen ab Empfang; ein späteres Ende muss rechtlich begründet sein, keine beliebige Verlängerung.}
\item{prueftag}{ISO-Datum0001..9999, mindestens Aufforderungsempfang; Prüfung bis zum Tagesschluss. Am letzten Fristtag ist die Frist noch nicht abgelaufen.}
\item{genehmigung_erklaert_am}{ISO-Datum0001..9999 einer nach Aufforderung tatsächlich erklärten Genehmigung, zwischen Empfang und Prüftag, oder NULL/None, wenn keine solche Erklärung vorliegt. Tag des rechtlich maßgeblichen Zugangs, nicht bloßen Versands. Vor der Aufforderung abgegebene Erklärungen gesondert einordnen, hier nicht als spätere Genehmigung eingeben.}
\item{gegenueber_aufforderndem}{Wahrheitswert, dass die geprüfte Genehmigung gegenüber dem auffordernden anderen Vertragsteil erklärt wurde. Nach Aufforderung reicht Erklärung nur gegenüber Minderjährigem/Vertreter nicht.}
\item{genehmigung_durch_berechtigten}{Wahrheitswert der Berechtigung des Genehmigenden. Im Minderjährigenfall bei eingetretener unbeschränkter Geschäftsfähigkeit §108 Absatz3 berücksichtigen; nicht automatisch weiter den gesetzlichen Vertreter verwenden.}
\item{aufforderung_wirksam}{Wahrheitswert der wirksamen gesetzlichen Aufforderung im konkreten genehmigungsbedürftigen Vertrag. Bereits wirksam gegenüber anderem Vertragsteil genehmigten Vertrag nicht automatisch wieder schwebend unwirksam stellen. FALSE ergibt NICHT_ANWENDBAR.}
\item{einordnungsnachweis}{Nichtleere Begründung von Vertragsfall, Aufforderung, Berechtigung, Empfänger, maßgeblichem Fristende und abgegebener Genehmigung. Vorherige Erklärungen, tatsächliche Verweigerung und Widerruf gesondert prüfen.}
}
\details{Zweiwochenmindestfrist ab Empfang; innerhalb maßgeblicher Frist durch Berechtigten gegenüber aufforderndem Teil erklärte Genehmigung prüfen. Nach Fristablauf ohne solche Genehmigung gesetzliche Verweigerungsfiktion. Nur Frist-/Empfängerprüfung; ausdrückliche Verweigerung, Widerruf und sonstige Wirksamkeitsgründe separat. Vorherige Erklärungen gegenüber Minderjährigem/Vertreter werden nicht als spätere Genehmigung gezählt. Tatsächliche Berechtigung§108 Absatz3 bewertet vorgegeben. Explizite Auswahl/Wahrheitswerte und nichtleerer Nachweis; Datumsparameter und berechnete Grenzen0001..9999, sofern einschlägig.}
\value{wert enthält rechnerisches_zweiwochenende als ISO-Datum, frist_abgelaufen, genehmigung_rechtzeitig_erklaert und genehmigung_gilt_verweigert als Wahrheitswerte. Letzteres bezeichnet nur gesetzliche Fiktion, nicht jede mögliche ausdrückliche Verweigerung. Ohne wirksame Aufforderung NICHT_ANWENDBAR/null. Einheit: daten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_108_T0001, BGB_108_T0002, BGB_108_T0003, BGB_108_T0004, BGB_177_T0001, BGB_177_T0002, BGB_177_T0003}
\examples{
genehmigung_aufforderungsfrist(
  regelbereich = "minderjaehrigenvertrag",
  aufforderungszugang_am = "2025-04-01",
  massgebliches_fristende = "2025-04-15",
  prueftag = "2025-04-16",
  genehmigung_erklaert_am = NULL,
  gegenueber_aufforderndem = FALSE,
  genehmigung_durch_berechtigten = FALSE,
  aufforderung_wirksam = TRUE,
  einordnungsnachweis = paste0(
    "Synthetisch wirksame Aufforderung und rechtlich maßgebliches",
    " Fristende; Genehmigungsempfänger und Berechtigung geprüft."
  )
)
}
