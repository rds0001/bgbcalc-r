% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{zahlung_sonstiger_schadenbetrag}
\alias{zahlung_sonstiger_schadenbetrag}
\title{zahlung sonstiger schadenbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{zahlung_sonstiger_schadenbetrag(
  begrenzbarer_schaden = NULL,
  nicht_begrenzbarer_schaden = NULL,
  vereinbarte_haftungsgrenze = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{begrenzbarer_schaden}{Nichtnegativer EUR-Schaden außerhalb675y, der rechtlich einer wirksamen Haftungsbegrenzung unterliegen darf.}
\item{nicht_begrenzbarer_schaden}{Nichtnegativer EUR-Anteil außerhalb675y, für den keine Begrenzung gilt, etwa Zinsschaden, Vorsatz/grobe Fahrlässigkeit oder besonders übernommene Gefahr; ohne Überschneidung mit begrenzbarem Anteil.}
\item{vereinbarte_haftungsgrenze}{Optionaler wirksam vereinbarter EUR-Höchstbetrag mindestens12500; null bedeutet keine Begrenzungsvereinbarung und damit keine automatische Kappung.}
\item{einordnungsnachweis}{Nichtleerer Nachweis675z, der haftungsrechtlichen Zuordnung, Ausschlüsse und gegebenenfalls wirksamen Vereinbarung.}
}
\details{Qualifizierten sonstigen Zahlungsschaden begrenzen und nicht begrenzbare Anteile ungekürzt addieren. §675z: nur sonstiger Schaden außerhalb bereits von675y erfasster Ansprüche. Keine Doppelzählung mit Zahlungsbetrag, Entgelten oder Zinsen nach675y. Vereinbarte Grenze optional; null bedeutet keine Begrenzungsvereinbarung, nicht automatisch12500EUR. Vorsatz, grobe Fahrlässigkeit, Zinsschaden und besonders übernommene Gefahren dürfen nicht in den begrenzbaren Anteil eingehen. Bei insgesamt vorsätzlicher/grob fahrlässiger Ausführung gesamten qualifizierten Schaden als nicht begrenzbar zuordnen. Wirksamkeit der Vereinbarung, Haftungszurechnung, fehlerhafte Kundenkennung und Sonderrecht extern bestimmen. Exakte EUR-Dezimaltexte oder Brüche nach NUMERIK.md; Kontostände vorzeichenbehaftet, Betragspositionen nichtnegativ. Keine Rundung.}
\value{wert: exakter EUR-Bruch des begrenzten und ungekürzten sonstigen Schadens zusammen. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_675z_T0001, BGB_675z_T0002, BGB_675z_T0003, BGB_675z_T0004, BGB_675z_T0005, BGB_675z_T0006}
\examples{
zahlung_sonstiger_schadenbetrag(
  begrenzbarer_schaden = "20000",
  nicht_begrenzbarer_schaden = "500",
  vereinbarte_haftungsgrenze = "12500",
  einordnungsnachweis = paste0(
    "Qualifizierter Normfall mit widerspruchsfreier Betragszuordn",
    "ung; Voraussetzungen und Einwendungen vorab festgestellt."
  )
)
}
