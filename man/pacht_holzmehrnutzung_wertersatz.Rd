% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pacht_holzmehrnutzung_wertersatz}
\alias{pacht_holzmehrnutzung_wertersatz}
\title{pacht holzmehrnutzung wertersatz}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{pacht_holzmehrnutzung_wertersatz(
  eingeschlagene_holzmenge = NULL,
  ordnungsgemaess_zulaessige_holzmenge = NULL,
  wert_je_mengeneinheit = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{eingeschlagene_holzmenge}{Nichtnegativer exakter Dezimalwert/Bruch; Inventarwerte in EUR zu einheitlichen Endpreisen, Holzmengen in identischer Einheit/Qualität, Einheitswert in EUR je Mengeneinheit.}
\item{ordnungsgemaess_zulaessige_holzmenge}{Nichtnegativer exakter Dezimalwert/Bruch; Inventarwerte in EUR zu einheitlichen Endpreisen, Holzmengen in identischer Einheit/Qualität, Einheitswert in EUR je Mengeneinheit.}
\item{wert_je_mengeneinheit}{Nichtnegativer exakter Dezimalwert/Bruch; Inventarwerte in EUR zu einheitlichen Endpreisen, Holzmengen in identischer Einheit/Qualität, Einheitswert in EUR je Mengeneinheit.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des gesetzlichen Pachtfalls, rechtlich qualifizierter Bestände/Mengen und vergleichbarer Bewertung.}
}
\details{Positive Mehrmenge des Holzeinschlags gegenüber ordnungsgemäß zulässiger Menge mit qualifiziertem Wert je gleicher Mengeneinheit multiplizieren Nur §596a Absatz3 Satz2. Mengen beziehen sich auf denselben rechtlich maßgeblichen Nutzungsumfang, Zeitraum und dieselbe Holzeinheit/-qualität; zulässige ordnungsgemäße Nutzung und Wert extern qualifizieren. Bei verschiedenen Sortimenten oder Wertstufen getrennte überschneidungsfreie Positionen rechnen, keine pauschale Preisannahme. Weiterer Schaden gesondert ohne Doppelzählung. Nicht Ernte-/Holzwertersatz für noch nicht getrennte Früchte nach Absatz1–3Satz1. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter EUR-Bruch. Bei Inventardifferenz positiv=Pächter zahlt Verpächter, negativ=umgekehrte Richtung; Holzwertersatz nichtnegativ. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_596a_T0005}
\examples{
pacht_holzmehrnutzung_wertersatz(
  eingeschlagene_holzmenge = "120",
  ordnungsgemaess_zulaessige_holzmenge = "100",
  wert_je_mengeneinheit = "50",
  einordnungsnachweis = paste0(
    "Qualifizierter Mehrholzeinschlag bei vergleichbaren Mengen/S",
    "ortimenten und Werten."
  )
)
}
