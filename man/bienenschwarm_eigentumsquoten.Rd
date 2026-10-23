% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{bienenschwarm_eigentumsquoten}
\alias{bienenschwarm_eigentumsquoten}
\title{bienenschwarm eigentumsquoten}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{bienenschwarm_eigentumsquoten(
  eigentuemer_schwaerme = NULL,
  ausgezogene_schwaerme_vereinigt = NULL,
  gesamtschwarm_eingefangen = NULL,
  einzug_in_fremde_besetzte_wohnung = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{eigentuemer_schwaerme}{Unbenannte Liste mit2..1000 Einträgen, jeweils genau eigentuemer_id (nichtleere eindeutige Zeichenfolge) und verfolgte_schwaerme (positive ganze Zahl bis2^53-1). Auch Gesamtsumme höchstens2^53-1. Pro Eigentümer zusammenfassen. Nur ausgezogene, vereinigte, eigentumserhaltend nach§961 verfolgte Schwärme zählen; keine Bienenzahlen, Gewichte oder Werte. Einzelberechtigter und vorbestehendes Miteigentum eines Schwarms außerhalb dieses Modells.}
\item{ausgezogene_schwaerme_vereinigt}{Wahrheitswert der Vereinigung der ausgezogenen Schwärme der erfassten berechtigten Eigentümer. Bloß benachbarte getrennte Schwärme erfüllen den Tatbestand nicht.}
\item{gesamtschwarm_eingefangen}{Wahrheitswert, dass der vereinigte Gesamtschwarm eingefangen ist. Vorheriges bloßes Verfolgen allein nicht mit abgeschlossenem Erwerb gleichsetzen.}
\item{einzug_in_fremde_besetzte_wohnung}{Wahrheitswert des Sonderfalls§964 einer fremden bereits besetzten Bienenwohnung. TRUE ergibt hier NICHT_ANWENDBAR; dessen andere Eigentumsfolge nicht als§963-Quote berechnen.}
\item{einordnungsnachweis}{Nichtleere Begründung von Eigentümerzuordnung, eigentumserhaltender Verfolgung, Anzahl jedes Schwarms, Vereinigung/Einfangen und Abgrenzung§964.}
}
\details{Bei vereinigtem eingefangenem Gesamtschwarm außerhalb§964: verfolgte Schwarmzahl jedes berechtigten Eigentümers durch Gesamtzahl teilen. Keine Wert-/Bienenzahlgewichtung. Eigentumsverlust durch fehlende/aufgegebene Verfolgung§961 vorab einordnen; keine komplette Eigentumskette. Einzelberechtigter und Miteigentum einzelner Schwärme nicht in diesem Modell. Nichtleere Personenkennungen, explizite Wahrheitswerte und Nachweis; bei Schwärmen2..1000 Eigentümer, positive ganze Schwarmzahlen und Gesamtsumme höchstens2^53-1.}
\value{wert ist Liste in Eingabereihenfolge mit eigentuemer_id und eigentumsquote als exaktem dimensionslosem Bruch; Summe1. Ohne Tatbestand NICHT_ANWENDBAR/null. Einheit: eigentumsquoten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_961_T0001, BGB_963_T0001, BGB_964_T0001, BGB_964_T0002}
\examples{
bienenschwarm_eigentumsquoten(
  eigentuemer_schwaerme = list(
    list(
    "eigentuemer_id" = "A",
    "verfolgte_schwaerme" = 2
  ),
    list(
    "eigentuemer_id" = "B",
    "verfolgte_schwaerme" = 1
  )
  ),
  ausgezogene_schwaerme_vereinigt = TRUE,
  gesamtschwarm_eingefangen = TRUE,
  einzug_in_fremde_besetzte_wohnung = FALSE,
  einordnungsnachweis = paste0(
    "Synthetisch verschiedene Eigentümer mit rechtzeitig fortgefü",
    "hrter Verfolgung ihrer vereinigten Schwärme."
  )
)
}
