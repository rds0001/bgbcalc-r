% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{gesellschaft_gewinn_verlust_stimmquoten}
\alias{gesellschaft_gewinn_verlust_stimmquoten}
\title{gesellschaft gewinn verlust stimmquoten}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{gesellschaft_gewinn_verlust_stimmquoten(
  gesellschafter = NULL,
  quotenbasis = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{gesellschafter}{Vollständige Liste2..1000 Objekte mit eindeutiger gesellschafter_id und gewicht. Bei Beteiligungsverhältnis/Beitragswert nichtnegative exakte Dezimalzeichenfolge/Bruch, Summe positiv; bei gleiche_anteile ausdrücklich null.}
\item{quotenbasis}{beteiligungsverhaeltnisse, beitragswerte oder gleiche_anteile; gesetzliche Vorrangfolge rechtlich qualifiziert auswählen.}
\item{einordnungsnachweis}{Nichtleerer Nachweis der vereinbarten Verhältnisse/Werte beziehungsweise deren Fehlens und desselben vollständigen Gesellschafterkreises.}
}
\details{Vereinbarte Beteiligungsverhältnisse, sonst vereinbarte Beitragswerte durch ihre Summe normieren; sonst1/Anzahl. §709 Absatz3: vereinbarte Beteiligungsverhältnisse gehen vor vereinbarten Beitragswerten; nur wenn beides fehlt Gleichanteile. quotenbasis ist rechtlich qualifiziert auszuwählen, kein freies Wahlrecht zur günstigeren Quote. Beteiligungsgewichte sind relative Verhältnisse, Beitragswerte vertraglich vereinbarte gleichartige Werte, keine von der Bibliothek geschätzten tatsächlichen Leistungen. Vollständiger identischer Gesellschafterkreis; individuelle Sondervereinbarungen über Gewinn/Verlust/Stimmkraft gesondert behandeln. Bei fehlender Wertevereinbarung ausdrücklich gewicht=null, nicht unbekannte Aktenlage. Beitragsleistungspflichten nach Absatz2 und Ausschüttungsbetrag nicht berechnet. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist Liste gesellschafter_id/quote, Quoten exakte Bruchobjekte mit Summe1. Einheit: quoten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_709_T0003, BGB_709_T0004, BGB_709_T0005}
\examples{
gesellschaft_gewinn_verlust_stimmquoten(
  gesellschafter = list(
    list(
    "gesellschafter_id" = "A",
    "gewicht" = "2"
  ),
    list(
    "gesellschafter_id" = "B",
    "gewicht" = "3"
  )
  ),
  quotenbasis = "beteiligungsverhaeltnisse",
  einordnungsnachweis = paste0(
    "Qualifizierter709III-Vorrangfall und vollständiger Gesellsch",
    "afterkreis."
  )
)
}
