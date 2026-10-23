% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{vermaechtnis_lastenanteile}
\alias{vermaechtnis_lastenanteile}
\title{vermaechtnis lastenanteile}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{vermaechtnis_lastenanteile(
  gesamtbelastung = NULL,
  beschwerte = NULL,
  beschwertenart = NULL,
  beschwerungsart = NULL,
  zweifelsregel_anwendbar = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{gesamtbelastung}{Nichtnegative EUR-Gesamtlast desselben Vermächtnisses oder derselben Auflage, die unter den eingegebenen Beschwerten zu verteilen ist; rechtliche Bewertung von Sachleistungen nicht automatisiert.}
\item{beschwerte}{Unbenannte Liste mit2..1000 eindeutigen Beschwerten. Je Objekt genau beschwerter_id (nichtleere Zeichenfolge) und gewicht (exakte Dezimalzeichenfolge/Bruchobjekt). Bei Erben tatsächliche positive Erbquote höchstens1, Summe der ausgewählten beschwerten Erbquoten höchstens1. Bei Vermächtnisnehmern nichtnegative konsistent bestimmte Vermächtniswerte in EUR. Positive Gewichtssumme erforderlich. Nur tatsächlich mit derselben Last Beschwerte aufnehmen.}
\item{beschwertenart}{Genau erben oder vermaechtnisnehmer. Bestimmt Bedeutung der Gewichte; gemischte ungeklärte Gruppen nicht unterstützt.}
\item{beschwerungsart}{Genau vermaechtnis oder auflage; bei Auflage gilt§2148 entsprechend über§2192.}
\item{zweifelsregel_anwendbar}{Wahrheitswert der rechtlich geprüften Anwendbarkeit der Zweifelsregel. Abweichender Wille oder andere rechtliche Verteilungsregel bedeutet FALSE/NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleere Begründung von Beschwerung, Personenauswahl, Gewichten, Bewertungsbasis und Zweifelsregel.}
}
\details{Gewichte der tatsächlich Beschwerten summieren; jeder erhält Lastquote Gewicht/Gewichtssumme und Lastbetrag Gesamtbelastung mal Lastquote. Keine automatische Auslegung abweichenden Willens, keine ungeklärte Mischung von Erben/Vermächtnisnehmern. Erbquoten beziehen sich auf Gesamtnachlass, werden innerhalb tatsächlich beschwerter Auswahl normiert. Außenhaftung und Kürzungsrechte separat. 2..1000 eindeutige Beschwerte, exakte Gewichte nach beschwertenart und positive Summe. EUR-Gesamtlast nichtnegativ; alle exakten Ganzzahl-Zwischenwerte höchstens2^53-1.}
\value{wert ist Liste in Eingabereihenfolge mit beschwerter_id, dimensionsloser lastquote und lastbetrag in EUR als exakte Brüche; Summe der Lastbeträge entspricht Gesamtlast. Ohne Zweifelsregel NICHT_ANWENDBAR/null. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2148_T0001, BGB_2192_T0001}
\examples{
vermaechtnis_lastenanteile(
  gesamtbelastung = "0",
  beschwerte = list(
    list(
    "beschwerter_id" = "A",
    "gewicht" = "0.25"
  ),
    list(
    "beschwerter_id" = "B",
    "gewicht" = "0.5"
  )
  ),
  beschwertenart = "erben",
  beschwerungsart = "vermaechtnis",
  zweifelsregel_anwendbar = TRUE,
  bewertungsnachweis = paste0(
    "Synthetisch nur A und B mit derselben Last beschwert; übrige",
    " Erben tragen diese nicht."
  )
)
}
