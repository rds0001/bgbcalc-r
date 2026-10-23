% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{zahlungsinstrument_ersatzentgelt_grenze}
\alias{zahlungsinstrument_ersatzentgelt_grenze}
\title{zahlungsinstrument ersatzentgelt grenze}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{zahlungsinstrument_ersatzentgelt_grenze(
  vereinbartes_ersatzentgelt = NULL,
  unmittelbare_ersatzkosten = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{vereinbartes_ersatzentgelt}{Vereinbartes nichtnegatives Ersatzentgelt in EUR, ohne Aussage über die Wirksamkeit eines überschießenden Vertragsbestandteils.}
\item{unmittelbare_ersatzkosten}{Ausschließlich und unmittelbar mit dem qualifizierten Ersatz verbundene Kosten in EUR; keine allgemeinen Betriebskosten oder Gewinnmarge.}
\item{einordnungsnachweis}{Nachweis des Ersatzfalls675lI, der Entgeltvereinbarung und der unmittelbar zugeordneten Kosten.}
}
\details{Numerisch auf die ausschließlich unmittelbaren Ersatzkosten begrenztes Entgelt: Minimum aus vereinbartem Entgelt und Kosten. §675lI: ausschließlich numerische Entgeltobergrenze für Ersatz nach Verlust, Diebstahl, Missbrauch oder sonst nicht autorisierter Nutzung. Das Minimum heilt keine unwirksame Entgeltvereinbarung und entscheidet keinen Zahlungsanspruch; Wirksamkeit und Rechtsfolgen einer überschießenden Klausel gesondert. Kosten müssen dem konkreten Ersatz unmittelbar und ausschließlich zurechenbar sein; kein allgemeines Entgelt für Sperrung oder Anzeige. Nichtnegative Eingangswerte, exakter nichtnegativer EUR-Bruch im sicheren gemeinsamen Zahlenbereich.}
\value{wert ist der exakte EUR-Bruch. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_675l_T0001, BGB_675l_T0002, BGB_675l_T0003}
\examples{
zahlungsinstrument_ersatzentgelt_grenze(
  vereinbartes_ersatzentgelt = "100",
  unmittelbare_ersatzkosten = "80",
  einordnungsnachweis = paste0(
    "§675lI: ausschließlich numerische Entgeltobergrenze für Ersa",
    "tz nach Verlust, Diebstahl, Missbrauch oder sonst nicht auto",
    "risierter Nutzung. Das Minimum heilt keine unwirksame Entgel",
    "tvereinbarung und entscheidet keinen Zahlungsanspruch; Wirks",
    "amkeit und Rechtsfolgen einer überschießenden Klausel gesond",
    "ert. Kosten müssen dem konkreten Ersatz unmittelbar und auss",
    "chließlich zurechenbar sein; kein allgemeines Entgelt für Sp",
    "errung oder Anzeige."
  )
)
}
