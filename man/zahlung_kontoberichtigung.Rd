% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{zahlung_kontoberichtigung}
\alias{zahlung_kontoberichtigung}
\title{zahlung kontoberichtigung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{zahlung_kontoberichtigung(
  regelfall = NULL,
  aktueller_kontostand = NULL,
  fehlerhafte_belastung = NULL,
  bereits_korrigierter_betrag = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{regelfall}{nichtautorisiert_675u oder ausfuehrungsfehler_675y; Korrekturanspruch rechtlich festgestellt.}
\item{aktueller_kontostand}{Exakter EUR-Kontostand einschließlich bisheriger Teilkorrekturen; darf negativ sein.}
\item{fehlerhafte_belastung}{Nichtnegative ursprüngliche qualifizierte Fehlbelastung in EUR; keine doppelt enthaltenen Zusatzentgelte.}
\item{bereits_korrigierter_betrag}{Nichtnegative bereits im aktuellen Kontostand enthaltene Korrektur dieser Belastung, höchstens Fehlbelastung.}
\item{einordnungsnachweis}{Nichtleerer Nachweis der Fehlbelastung, Korrekturberechtigung und bereits enthaltenen Teilkorrekturen; weitere Wertstellungs-/Zinsfolgen separat.}
}
\details{Noch nicht korrigierten Fehlbelastungsbetrag zum aktuellen Kontostand addieren. §675u beziehungsweise675yI/II/IV: isolierte rechnerische Rückgängigmachung der qualifizierten Fehlbelastung. Aktueller Kontostand darf negativ sein und muss bereits_korrigierter_betrag bereits enthalten; andere Kontobewegungen bleiben unberührt. Kein mehrfaches Erstatten derselben Belastung. Anspruchsvoraussetzungen, Haftungsausnahmen und675u-Betrugsverdachtsfall extern klären. Wertstellung, gesonderte Entgelte/Zinsen675yVI und Folgeschäden675z separat; diese Rechnung allein bildet noch keine vollständige rückwirkende Kontorekonstruktion. Exakte EUR-Dezimaltexte oder Brüche nach NUMERIK.md; Kontostände vorzeichenbehaftet, Betragspositionen nichtnegativ. Keine Rundung.}
\value{wert: noch_zu_korrigierender_betrag (nichtnegativ) und berichtigter_kontostand (vorzeichenbehaftet) als EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_675u_T0001, BGB_675u_T0002, BGB_675u_T0003, BGB_675u_T0004, BGB_675u_T0005, BGB_675y_T0001, BGB_675y_T0002, BGB_675y_T0003, BGB_675y_T0004, BGB_675y_T0005, BGB_675y_T0006, BGB_675y_T0007, BGB_675y_T0008, BGB_675y_T0013, BGB_675y_T0014, BGB_675y_T0015, BGB_675y_T0016}
\examples{
zahlung_kontoberichtigung(
  regelfall = "nichtautorisiert_675u",
  aktueller_kontostand = "-200",
  fehlerhafte_belastung = "100",
  bereits_korrigierter_betrag = "20",
  einordnungsnachweis = paste0(
    "Qualifizierter Normfall mit widerspruchsfreier Betragszuordn",
    "ung; Voraussetzungen und Einwendungen vorab festgestellt."
  )
)
}
