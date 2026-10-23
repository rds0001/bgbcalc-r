% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{inventarfrist_neubestimmungsantrag}
\alias{inventarfrist_neubestimmungsantrag}
\title{inventarfrist neubestimmungsantrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{inventarfrist_neubestimmungsantrag(
  hindernis_beseitigt_am = NULL,
  ende_zuerst_bestimmter_inventarfrist = NULL,
  massgebliches_zweiwochenfristende = NULL,
  massgebliche_jahreshoechstgrenze = NULL,
  antrag_massgeblich_gestellt_am = NULL,
  unverschuldete_verhinderung = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{hindernis_beseitigt_am}{ISO-Datum0001..9999 der rechtlich maßgeblichen Beseitigung des unverschuldeten Hindernisses.}
\item{ende_zuerst_bestimmter_inventarfrist}{ISO-Datum des Endes der zuerst bestimmten Inventarfrist als Bezugsereignis der Jahresgrenze; nicht durch späteren Antrag beliebig erneuern.}
\item{massgebliches_zweiwochenfristende}{ISO-Datum des rechtlich maßgeblichen Zweiwochenendes einschließlich zulässiger Korrekturen und entsprechender Anwendung§210 über§1997. Mindestens berechnete Zweiwochengrundfrist; Verlängerung belegen.}
\item{massgebliche_jahreshoechstgrenze}{ISO-Datum der gesondert bestimmten Jahresgrenze einschließlich ausschließlich rechtlich zulässiger Kalenderkorrekturen. Mindestens rechnerische Jahresgrundgrenze. Verweisung§1997 auf§210 betrifft nicht diese Jahresgrenze; keine frei wählbare Verlängerung.}
\item{antrag_massgeblich_gestellt_am}{ISO-Datum des rechtlich maßgeblichen Antrags, nicht bloß Versand. In diesem Modell frühestens Hindernisbeseitigung.}
\item{unverschuldete_verhinderung}{Wahrheitswert: ohne Verschulden an rechtzeitiger Inventarerrichtung, gerechtfertigtem Verlängerungsantrag oder Einhaltung der Zweiwochenfrist verhindert (§1996 Absatz1). Keine automatische Verschuldensbewertung.}
\item{einordnungsnachweis}{Nichtleere Begründung von Hindernis/Beseitigung, zuerst bestimmter Frist, beiden korrigierten Grenzen und rechtlichem Antragstag.}
}
\details{Zwei Wochen nach Hindernisbeseitigung und ein Jahr nach Ende zuerst bestimmter Inventarfrist berechnen; qualifizierte Enden durch Minimum verbinden. Antrag bis Ende und unverschuldete Verhinderung getrennt prüfen. Keine automatische gerichtliche Neubestimmung; Anhörung Absatz3 gesondert. §210-Verweisung über§1997 betrifft Zweiwochenfrist, nicht Jahresgrenze. Keine freie Fristverlängerung oder Erneuerung durch weitere Anträge. ISO-Daten und berechnete Grenzen0001..9999, explizite Wahrheitswerte und nichtleerer Nachweis.}
\value{wert enthält rechnerisches_zweiwochenfristende, jahreshoechstgrenze (rechnerisch), massgeblicher_letzter_antragstag sowie antragsfrist_eingehalten/verhinderung_und_frist_erfuellt. FALSE ist negatives Prüfergebnis, Status BERECHNET. Einheit: daten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1996_T0001, BGB_1996_T0002, BGB_1996_T0003, BGB_1997_T0001}
\examples{
inventarfrist_neubestimmungsantrag(
  hindernis_beseitigt_am = "2030-12-20",
  ende_zuerst_bestimmter_inventarfrist = "2030-01-01",
  massgebliches_zweiwochenfristende = "2031-01-03",
  massgebliche_jahreshoechstgrenze = "2031-01-01",
  antrag_massgeblich_gestellt_am = "2030-12-20",
  unverschuldete_verhinderung = FALSE,
  einordnungsnachweis = paste0(
    "Synthetisch Ende zuerst bestimmter Frist und Hindernis quali",
    "fiziert; keine Korrekturen."
  )
)
}
