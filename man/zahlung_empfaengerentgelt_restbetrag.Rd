% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{zahlung_empfaengerentgelt_restbetrag}
\alias{zahlung_empfaengerentgelt_restbetrag}
\title{zahlung empfaengerentgelt restbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{zahlung_empfaengerentgelt_restbetrag(
  vollstaendiger_zahlungsbetrag = NULL,
  vereinbartes_empfaengerentgelt = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{vollstaendiger_zahlungsbetrag}{Vollständiger übermittelter Zahlungsbetrag in EUR; vor einem zulässigen Empfängerentgeltabzug.}
\item{vereinbartes_empfaengerentgelt}{Rechtlich zustehendes vereinbartes Empfängerentgelt in EUR, höchstens der übermittelte Betrag.}
\item{einordnungsnachweis}{Nichtleerer Nachweis der wirksamen Abzugsvereinbarung nach675qII und des Anwendungsbereichs ohne abweichenden675qIV-Fall.}
}
\details{Vollständigen Zahlungsbetrag um das zulässige vereinbarte Empfängerentgelt vermindern. §675qII-Grundfall, vor Erteilung der Gutschrift vereinbarter Abzug eines zustehenden Entgelts. Vollständiger Zahlungsbetrag und Entgelt bleiben in eingaben und nutzervorgaben getrennt dokumentiert; gesetzliche Zahlungsinformationen müssen sie separat ausweisen. Keine Kürzung durch zwischengeschaltete Stellen nachAbsatz1, keine Entgeltberechnung und keine Abweichung nachAbsatz4. Entgelt über Zahlungsbetrag und gesonderte Kontobelastungen außerhalb dieses Modells. Nichtnegative Eingangswerte, exakter nichtnegativer EUR-Bruch im sicheren gemeinsamen Zahlenbereich.}
\value{wert ist der exakte EUR-Bruch. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_675q_T0002, BGB_675q_T0003}
\examples{
zahlung_empfaengerentgelt_restbetrag(
  vollstaendiger_zahlungsbetrag = "100",
  vereinbartes_empfaengerentgelt = "3",
  einordnungsnachweis = paste0(
    "§675qII-Grundfall, vor Erteilung der Gutschrift vereinbarter",
    " Abzug eines zustehenden Entgelts. Vollständiger Zahlungsbet",
    "rag und Entgelt bleiben in eingaben und nutzervorgaben getre",
    "nnt dokumentiert; gesetzliche Zahlungsinformationen müssen s",
    "ie separat ausweisen. Keine Kürzung durch zwischengeschaltet",
    "e Stellen nachAbsatz1, keine Entgeltberechnung und keine Abw",
    "eichung nachAbsatz4. Entgelt über Zahlungsbetrag und gesonde",
    "rte Kontobelastungen außerhalb dieses Modells."
  )
)
}
