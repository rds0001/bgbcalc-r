% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{inventarfrist_grundrahmen}
\alias{inventarfrist_grundrahmen}
\title{inventarfrist grundrahmen}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{inventarfrist_grundrahmen(
  zustellung_fristbeschluss_am = NULL,
  annahme_erbschaft_am = NULL,
  bestimmtes_grundfristende = NULL,
  erstmalige_inventarfrist = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{zustellung_fristbeschluss_am}{ISO-Datum0001..9999 der wirksamen Zustellung des fristbestimmenden Beschlusses, nicht bloß Beschlussdatum.}
\item{annahme_erbschaft_am}{ISO-Datum der wirksamen Erbschaftsannahme; tatsächliche oder rechtlich zugerechnete Annahme qualifizieren. Nicht pauschal Erbfalltag. Nur Fall bereits feststehender Annahme.}
\item{bestimmtes_grundfristende}{ISO-Datum der gerichtlichen erstmaligen Grundfristgrenze, vergleichbar vor gesonderten Hemmungs-/Ablaufhemmungs- und Kalenderkorrekturen. Frühestens späterer Tag von Zustellung/Annahme.}
\item{erstmalige_inventarfrist}{Wahrheitswert: erstmalige Grundfristbestimmung, keine gerichtliche Verlängerung oder anderweitige Sonderfrist. FALSE ergibt NICHT_ANWENDBAR für diesen Sollrahmenvergleich.}
\item{einordnungsnachweis}{Nichtleere Begründung von Zustellung, wirksamer Annahme und Charakter der bestimmten Grundfrist.}
}
\details{Späteres Ereignis von Zustellung und Annahme als Beginn; ein und drei Monate berechnen und gerichtliches Grundende auf Einschluss in Sollrahmen prüfen. Sollrahmen ist kein pauschales Wirksamkeitsurteil. Gerichtliche Verlängerung nicht auf drei Monate kappen. Ablaufhemmung§1997/210, Ehegatten§2008 und Kalenderkorrekturen separat. ISO-Daten und berechnete Grenzen0001..9999, explizite Wahrheitswerte und nichtleerer Nachweis.}
\value{wert enthält fristbeginnereignis_am, einmonatsgrenze, dreimonatsgrenze und bestimmtes_ende_im_sollrahmen. Außerhalb Erstbestimmung NICHT_ANWENDBAR/null. Einheit: daten_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1995_T0001, BGB_1995_T0002, BGB_1995_T0003, BGB_1995_T0004, BGB_1997_T0001}
\examples{
inventarfrist_grundrahmen(
  zustellung_fristbeschluss_am = "2030-01-31",
  annahme_erbschaft_am = "2030-01-01",
  bestimmtes_grundfristende = "2030-01-31",
  erstmalige_inventarfrist = TRUE,
  einordnungsnachweis = paste0(
    "Synthetisch erstmalige Grundfrist ohne Korrekturen; Zustellu",
    "ng und Annahme rechtlich bestimmt."
  )
)
}
