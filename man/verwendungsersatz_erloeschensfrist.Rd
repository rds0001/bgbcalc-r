% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{verwendungsersatz_erloeschensfrist}
\alias{verwendungsersatz_erloeschensfrist}
\title{verwendungsersatz erloeschensfrist}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{verwendungsersatz_erloeschensfrist(
  herausgabe_am = NULL,
  grundstueck = NULL,
  massgebliches_fristende = NULL,
  prueftag = NULL,
  gerichtliche_geltendmachung_am = NULL,
  genehmigung_verwendungen_am = NULL,
  anspruch_unterliegt_1002 = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{herausgabe_am}{ISO-Datum0001..9999 der rechtlich maßgeblichen Herausgabe an Eigentümer. Nicht bloß Aufforderung oder Besitzverlust an Dritten.}
\item{grundstueck}{Wahrheitswert: herausgegebene Sache ist Grundstück (sechs Monate), sonst ein Monat.}
\item{massgebliches_fristende}{ISO-Datum des rechtlich maßgeblichen letzten Tages einschließlich gesondert ermittelter zulässiger Fristkorrekturen, insbesondere§1002 Absatz2 mit§§206/210/211. Mindestens rechnerische Grundfrist; Verlängerung belegen, nicht frei wählen.}
\item{prueftag}{ISO-Datum der Prüfung nach Abschluss dieses Tages; frühestens Herausgabetag.}
\item{gerichtliche_geltendmachung_am}{Optionales ISO-Datum der wirksamen gerichtlichen Geltendmachung dieses Anspruchs, spätestens Prüftag. NULL bedeutet bis Prüftag nicht eingetreten, nicht unbekannt. Auch vor Herausgabe möglich. Keine bloße außergerichtliche Mahnung.}
\item{genehmigung_verwendungen_am}{Optionales ISO-Datum der rechtlich wirksamen Genehmigung dieser Verwendungen durch Eigentümer, spätestens Prüftag; auch vor Herausgabe möglich. NULL bedeutet nicht eingetreten, nicht ungeklärt.}
\item{anspruch_unterliegt_1002}{Wahrheitswert des geprüften Anspruchs- und Herausgaberegimes§1002. FALSE ergibt NICHT_ANWENDBAR; keine Aussage zum Erlöschen anderer Ansprüche.}
\item{einordnungsnachweis}{Nichtleere Begründung von Herausgabe, Sachtyp, Anspruchsregime, maßgeblichem Fristende samt Korrekturen sowie gerichtlicher Geltendmachung und Genehmigung.}
}
\details{Grundfrist ab Herausgabe: Grundstück sechs Monate, sonst ein Monat. Nach maßgeblichem Fristende erlischt Anspruch, wenn weder rechtzeitige gerichtliche Geltendmachung noch Genehmigung vorliegt. §§206/210/211 werden entsprechend angewandt, aber ihre Korrekturen hier als belegtes Fristende eingegeben. Anspruchsgrund/Betrag/Fälligkeit§1001 separat; verspätete Genehmigung begründet nicht automatisch Wiederaufleben. ISO-Daten und berechnete Grenzen0001..9999, explizite Wahrheitswerte und nichtleerer Nachweis.}
\value{wert enthält rechnerisches_fristende als ISO-Datum und gerichtliche_geltendmachung_rechtzeitig, genehmigung_rechtzeitig, anspruch_nach_1002_erloschen als Wahrheitswerte. Bei fehlendem Anwendungsbereich NICHT_ANWENDBAR/null. Einheit: daten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1002_T0001, BGB_1002_T0002}
\examples{
verwendungsersatz_erloeschensfrist(
  herausgabe_am = "2030-01-31",
  grundstueck = FALSE,
  massgebliches_fristende = "2030-02-28",
  prueftag = "2030-04-01",
  gerichtliche_geltendmachung_am = NULL,
  genehmigung_verwendungen_am = NULL,
  anspruch_unterliegt_1002 = TRUE,
  einordnungsnachweis = paste0(
    "Synthetisch qualifizierte Herausgabe und Ereignisse; keine K",
    "orrektur der Grundfrist."
  )
)
}
