% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{gesamthypothek_nichtnegative_nettowertanteile}
\alias{gesamthypothek_nichtnegative_nettowertanteile}
\title{gesamthypothek nichtnegative nettowertanteile}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{gesamthypothek_nichtnegative_nettowertanteile(
  zu_verteilender_hypothekenbetrag = NULL,
  grundstuecke = NULL,
  gewichtsmethode = NULL,
  verteilungsnachweis = NULL
)}
\arguments{
\item{zu_verteilender_hypothekenbetrag}{Nichtnegativer gemeinschaftlich zu verteilender Betrag nach1172/1175.}
\item{grundstuecke}{Liste1..1000: grundstueck_id, grundstueckswert, vorrangige_belastungen; dieselbe Wertgrundlage und vollständige Gemeinschaft.}
\item{gewichtsmethode}{Zwingend rechtlich qualifiziert: positive_nettowerte. Negative Rohdifferenz ergibt dabei Nullgewicht, keine negative dingliche Zuteilung.}
\item{verteilungsnachweis}{1172II/1175-Anwendbarkeit und rechtliche Verwendung nichtnegativer Verwertungsgewichte ausdrücklich qualifizieren; keine abweichende Vereinbarung unterstellen.}
}
\details{Rohnettowerte und nichtnegative qualifizierte Gewichte bestimmen; vorhandenen Quotenkern nur bei positiver Gewichtssumme anwenden. Bedingte Nettowertrechnung: ursprünglichen Wert minus qualifizierte vorrangige Belastungen ausweisen; unter ausdrücklich vorgegebener Methode positive_nettowerte Verteilungsgewicht=max(Rohsaldo,0). Bestehenden1172-Quotenkern mit diesen abgeleiteten Gewichten verwenden, Vorrang nicht doppelt abziehen. Bei Gewichtssumme0keine Division/keine künstliche Kopfquote: quoten_bestimmbar=false, anteile=None/NULL; die Rohsalden bleiben ausgewiesen. Gesetzliche Vorschrift liefert für0/0keine feste Ersatzquote. Keine automatische Bewertung der Vorranglast, Verwertung oder rechtliche Freigabe des Nullgewichtsmodells in jedem Streitfall.1174-Regress und1176/1182-Rangschutz gesondert. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Rohnettowerte/Gewichte, Bestimmbarkeitsmerkmal und optionale vollständige Quotenverteilung. Einheit: EUR_und_Quoten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1172_T0001, BGB_1172_T0002, BGB_1172_T0003, BGB_1175_T0001, BGB_1175_T0002, BGB_1175_T0003}
\examples{
gesamthypothek_nichtnegative_nettowertanteile(
  zu_verteilender_hypothekenbetrag = "100",
  grundstuecke = list(
    list(
    "grundstueck_id" = "A",
    "grundstueckswert" = "50",
    "vorrangige_belastungen" = "70"
  ),
    list(
    "grundstueck_id" = "B",
    "grundstueckswert" = "100",
    "vorrangige_belastungen" = "20"
  )
  ),
  gewichtsmethode = "positive_nettowerte",
  verteilungsnachweis = paste0(
    "Bedingte Nettowertrechnung: ursprünglichen Wert minus qualif",
    "izierte vorrangige Belastungen ausweisen; unter ausdrücklich",
    " vorgegebener Methode positive_nettowerte Verteilungsgewicht",
    "=max(Rohsaldo,0). Bestehenden1172-Quotenkern mit diesen abge",
    "leiteten Gewichten verwenden, Vorrang nicht doppelt abziehen",
    ". Bei Gewichtssumme0keine Division/keine künstliche Kopfquot",
    "e: quoten_bestimmbar=false, anteile=None/NULL; die Rohsalden",
    " bleiben ausgewiesen. Gesetzliche Vorschrift liefert für0/0k",
    "eine feste Ersatzquote. Keine automatische Bewertung der Vor",
    "ranglast, Verwertung oder rechtliche Freigabe des Nullgewich",
    "tsmodells in jedem Streitfall.1174-Regress und1176/1182-Rang",
    "schutz gesondert."
  )
)
}
