% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{gesamthypothek_wertanteile}
\alias{gesamthypothek_wertanteile}
\title{gesamthypothek wertanteile}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{gesamthypothek_wertanteile(
  zu_verteilender_hypothekenbetrag = NULL,
  grundstuecke = NULL,
  verteilungsnachweis = NULL
)}
\arguments{
\item{zu_verteilender_hypothekenbetrag}{Nichtnegativer gemeinschaftlich zu verteilender HypothekenbetragEUR, ohne konkurrierende Gläubiger-/Regressanteile.}
\item{grundstuecke}{Vollständige Liste1..1000 mit genau grundstueck_id, grundstueckswert und vorrangige_belastungen. Eindeutige IDs, nichtnegative EUR-Beträge; Belastungen dürfen hier den Wert nicht übersteigen. Summe aller Nettowerte strikt positiv.}
\item{verteilungsnachweis}{Nichtleerer Nachweis des Grundfalls§1172II oder1175, keine abweichende Vereinbarung und keine eingreifende1174-Verrechnung. Qualifizierte Werte und Rangbelastungen.}
}
\details{Nettowert=Grundstückswert-vorrangige Belastungen; Quote=Nettowert/Summe; Hypothekenanteil=Betrag×Quote. Grundfall§1172Absatz2, ebenso§1175: keine abweichende Vereinbarung; alle gemeinschaftlich berechtigten belasteten Grundstücke vollständig erfassen. Maßgebliche Werte und vorrangige Belastungen rechtlich bewertet, keine bloßen Nominalbeträge ohne Zuordnung. Diese Grundrechnung setzt nichtnegative Nettowerte und positive Nettowertsumme voraus; Überbelastung und ausschließlich wertlose Grundstücke benötigen gesonderte rechtliche Behandlung. Teilübergang mit Schuldnerregress§1174, Konkurrenz§1176 und bestehende Gläubigervorränge nicht durch diese Quotenrechnung entschieden. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert: je grundstueck_id, anteilsquote und hypothekenanteil als exakte EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1172_T0001, BGB_1172_T0002, BGB_1172_T0003, BGB_1175_T0001, BGB_1175_T0003}
\examples{
gesamthypothek_wertanteile(
  zu_verteilender_hypothekenbetrag = "900",
  grundstuecke = list(
    list(
    "grundstueck_id" = "A",
    "grundstueckswert" = "300",
    "vorrangige_belastungen" = "100"
  ),
    list(
    "grundstueck_id" = "B",
    "grundstueckswert" = "300",
    "vorrangige_belastungen" = "200"
  )
  ),
  verteilungsnachweis = paste0(
    "Nettowerte200:100, keine abweichende Vereinbarung oder konku",
    "rrierenden Teilansprüche."
  )
)
}
