% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{seetestament_reise_neustart}
\alias{seetestament_reise_neustart}
\title{seetestament reise neustart}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{seetestament_reise_neustart(
  bisheriges_fristende = NULL,
  neue_seereise_beginn = NULL,
  neue_seereise_ende = NULL,
  seetestament_nach_2251_qualifiziert = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{bisheriges_fristende}{ISO-Datum des bereits rechtlich korrigierten bisherigen Endes einschließlich aller bisherigen Hemmungen/Unterbrechungen.}
\item{neue_seereise_beginn}{ISO-Datum des Antritts einer neuen Seereise; bis einschließlich bisherigem Endtag rechtzeitig.}
\item{neue_seereise_ende}{ISO-Datum des Reiseendes, nicht vor Antritt. Ab diesem Ereignis neue volle Dreimonatsgrundfrist.}
\item{seetestament_nach_2251_qualifiziert}{Pflichtwahrheitswert zum rechtlich qualifizierten2251-Fall; FALSE ergibt NICHT_ANWENDBAR.}
\item{einordnungsnachweis}{Nichtleerer Nachweis bisheriger Fristkorrekturen und neuer Seereise.}
}
\details{Bei2251 und Reisebeginn spätestens am bisherigen Fristendtag neue volle Dreimonatsgrundfrist ab Reiseende. Verspäteter Antritt keine Wiederbelebung. Weitere Hemmung2252II/erneute Reisen extra. Keine Gültigkeitsentscheidung2252I/IV. Kalenderdaten ISO YYYY-MM-DD im Bereich0001..9999, Pflichtwahrheitswerte und nichtleerer Nachweis. Fehlende Pflichteingabe EINGABE_FEHLT; ungültige Eingabe oder Datumsüberlauf EINGABE_UNGUELTIG.}
\value{wert ist ISO-Datum der neuen rohen Grundfrist; bei fehlendem Tatbestand NICHT_ANWENDBAR mit NULL. Einheit: datum.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2252_T0003}
\examples{
seetestament_reise_neustart(
  bisheriges_fristende = "2024-01-31",
  neue_seereise_beginn = "2024-01-30",
  neue_seereise_ende = "2024-02-20",
  seetestament_nach_2251_qualifiziert = TRUE,
  einordnungsnachweis = paste0(
    "Synthetisch korrigiertes bisheriges Fristende und neue Reise",
    "."
  )
)
}
