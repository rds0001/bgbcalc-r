% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{verbraucher_informierte_nebenkosten}
\alias{verbraucher_informierte_nebenkosten}
\title{verbraucher informierte nebenkosten}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{verbraucher_informierte_nebenkosten(
  kostenpositionen = NULL,
  regelfall = NULL,
  kostenregel_anwendbar = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{kostenpositionen}{Liste bis1000 eindeutiger Objekte mit position_id, nichtnegativem EUR-betrag und Wahrheitswert ordnungsgemaess_informiert. Nur rechtlich zugehörige und sonst beanspruchbare Positionen; bei teilweiser Information rechtlich zutreffend aufteilen.}
\item{regelfall}{praesenz_312a_absatz_2 oder fernabsatz_aussergeschaeftlich_312e; gesetzlichen Anwendungsbereich vorher qualifizieren.}
\item{kostenregel_anwendbar}{Explizite Bestätigung des Kostenregel-Anwendungsfalls ohne speziellere Ausschlüsse; FALSE ergibt NICHT_ANWENDBAR.}
\item{einordnungsnachweis}{Nichtleere Herkunft/Begründung von Positionen, Vereinbarung, Kostenhöhe und gesetzeskonformer Information.}
}
\details{Ordnungsgemäß informierte zugehörige Kosten auswählen und exakt addieren. Keine neue qualitative Informationsprüfung.312a Absatz2 ausgenommen Fernabsatz/außergeschäftliche/Finanzdienstleistungsverträge. Hauptpreis und andere Entgeltverbote separat. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist Summe der eingeschlossenen Kosten in EUR; leer oder vollständig ausgeschlossen ergibt0. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_312a_T0004, BGB_312a_T0005, BGB_312e_T0001}
\examples{
verbraucher_informierte_nebenkosten(
  kostenpositionen = list(
    list(
    "position_id" = "a",
    "betrag" = "10",
    "ordnungsgemaess_informiert" = TRUE
  ),
    list(
    "position_id" = "b",
    "betrag" = "20",
    "ordnungsgemaess_informiert" = FALSE
  ),
    list(
    "position_id" = "c",
    "betrag" = "0.25",
    "ordnungsgemaess_informiert" = TRUE
  )
  ),
  regelfall = "praesenz_312a_absatz_2",
  kostenregel_anwendbar = TRUE,
  einordnungsnachweis = paste0(
    "Synthetische qualifizierte Kosten, Information gemäß einschl",
    "ägigem EGBGB-Verweis."
  )
)
}
