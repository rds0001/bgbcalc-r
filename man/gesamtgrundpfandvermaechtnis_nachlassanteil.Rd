% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{gesamtgrundpfandvermaechtnis_nachlassanteil}
\alias{gesamtgrundpfandvermaechtnis_nachlassanteil}
\title{gesamtgrundpfandvermaechtnis nachlassanteil}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{gesamtgrundpfandvermaechtnis_nachlassanteil(
  gesamtbelastungsbetrag = NULL,
  grundpfandart = NULL,
  grundstuecke = NULL,
  vermachtes_grundstueck_id = NULL,
  ausschliesslich_nachlassgrundstuecke = NULL,
  zweifelsregel_anwendbar = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{gesamtbelastungsbetrag}{Nichtnegativer exakter EUR-Bezugsbetrag der betrachteten Gesamtgrund-/Gesamtrentenschuld. Bei Rente rechtlich qualifizierter einheitlicher Zeitraum; keine automatische Kapitalisierung/Wahl der Ablösungssumme. Dieser Betrag wird proportional zugeordnet, nicht mit einer persönlichen Schuld verwechselt.}
\item{grundpfandart}{gesamtgrundschuld oder gesamtrentenschuld; keine Hypothek.}
\item{grundstuecke}{Vollständige Liste2..1000 mithaftender Grundstücke, je genau grundstueck_id (eindeutiger Text), grundstueckswert und vorrangige_belastungen (nichtnegative exakte EUR-Werte). Werte zum Eigentumsübergang auf Vermächtnisnehmer. Nur rangvorrangige Lasten, nicht die betrachtete Gesamtbelastung. Negative Wertdeckung wird null; Gesamtdeckung muss positiv sein.}
\item{vermachtes_grundstueck_id}{Nichtleere Kennung des einen vermachten Grundstücks in der vollständigen Liste.}
\item{ausschliesslich_nachlassgrundstuecke}{Expliziter Wahrheitswert: sämtliche mithaftenden Grundstücke gehören zum Nachlass. FALSE führt zu NICHT_ANWENDBAR, Absatz2 separat.}
\item{zweifelsregel_anwendbar}{Expliziter Wahrheitswert: keine abweichende maßgebliche Anordnung des Erblassers; rechtlich einschlägige Zweifelsregel.}
\item{bewertungsnachweis}{Nichtleerer Nachweis zu Eigentumsübergangszeitpunkt, Werten, Ranglasten, Grundpfandart und einheitlichem Betragsbezug.}
}
\details{Nichtnegative bereinigte Grundstückswerte bilden; Wertquote des vermachten Grundstücks an Summe bestimmen; Gesamtbelastung mit dieser Quote multiplizieren. §2168I verweist allein auf Wertbestimmung§2166I2. Kein zusätzlicher Grundstückswert-/persönlicher Schulddeckel, kein Drittleistungsabzug2166II. Kein Fremdgrundstücksfall oder dingliches Außenhaftungslimit. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält bereinigter_wert_vermachtes_grundstueck, bereinigter_gesamtwert, wertquote und zugeordneter_belastungsteil als exakte Brüche; negative Anwendbarkeit NULL. Einheit: EUR_und_quote.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2168_T0001, BGB_2168_T0002, BGB_2166_T0002}
\examples{
gesamtgrundpfandvermaechtnis_nachlassanteil(
  gesamtbelastungsbetrag = "800",
  grundpfandart = "gesamtgrundschuld",
  grundstuecke = list(
    list(
    "grundstueck_id" = "A",
    "grundstueckswert" = "100",
    "vorrangige_belastungen" = "0"
  ),
    list(
    "grundstueck_id" = "B",
    "grundstueckswert" = "300",
    "vorrangige_belastungen" = "0"
  )
  ),
  vermachtes_grundstueck_id = "A",
  ausschliesslich_nachlassgrundstuecke = TRUE,
  zweifelsregel_anwendbar = TRUE,
  bewertungsnachweis = paste0(
    "Synthetische vergleichbare Werte bei Eigentumsübergang; Rang",
    "lasten geprüft."
  )
)
}
