% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{erbrecht_anfechtungsgrundfrist}
\alias{erbrecht_anfechtungsgrundfrist}
\title{erbrecht anfechtungsgrundfrist}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{erbrecht_anfechtungsgrundfrist(
  anfechtungsfall = NULL,
  angefochtenes_ereignis_am = NULL,
  fristbeginn_am = NULL,
  erblasser_letzter_wohnsitz_nur_ausland = NULL,
  erbe_bei_fristbeginn_im_ausland = NULL,
  anfechtungsregel_anwendbar = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{anfechtungsfall}{Auswahl annahme, ausschlagung oder ausschlagungsfristversaeumung. Für Fristversäumung gilt§1956 entsprechend Annahme; kein allgemeiner§121/124-Fall.}
\item{angefochtenes_ereignis_am}{ISO-Datum0001..9999 der angefochtenen Annahme/Ausschlagung. Bei Fristversäumung rechtlich maßgeblichen Eintritt der Annahmefiktion aus§1943/§1956 bestimmen, nicht Erbfall oder spätere Kenntnis einsetzen. Ausgangspunkt der Dreißigjahresgrenze.}
\item{fristbeginn_am}{ISO-Datum0001..9999 des einschlägigen Anfechtungsfristbeginns: bei Drohung Ende der Zwangslage, sonst Kenntnis des Anfechtungsgrunds. Mindestens angefochtenes Ereignis. Kein automatischer Beginn mit Erbfall und keine pauschale Gleichsetzung mit Ausschlagungsfristbeginn.}
\item{erblasser_letzter_wohnsitz_nur_ausland}{Wahrheitswert, ob letzter Wohnsitz des Erblassers ausschließlich im Ausland lag, wie§1954 Absatz3 verlangt.}
\item{erbe_bei_fristbeginn_im_ausland}{Wahrheitswert des Auslandsaufenthalts gerade zu Beginn dieser Anfechtungsfrist. Zeitpunkt kann vom Beginn der ursprünglichen Ausschlagungsfrist abweichen.}
\item{anfechtungsregel_anwendbar}{Wahrheitswert, dass der angegebene erbrechtliche Fall anfechtbar ist und§1954/§1956 sachlich/zeitlich gilt. FALSE ergibt NICHT_ANWENDBAR; tatsächliche Anfechtungsgründe/Form nicht durch bloße Fristberechnung ersetzen.}
\item{einordnungsnachweis}{Nichtleere Begründung von Anfechtungsfall, angefochtenem Ereignis, Kenntnis beziehungsweise Zwangslageende und Auslandsverhältnissen am richtigen Fristbeginn.}
}
\details{Sechs Wochen, bei einer gesetzlichen Auslandsalternative sechs Monate ab einschlägigem Anfechtungsfristbeginn. Zusätzlich absolute Dreißigjahresgrenze ab Annahme/Ausschlagung beziehungsweise gleichgestelltem Ereignis; früheres Datum auswählen. Nur Grundfrist und Höchstgrenze. §§206/210/211 sowie zulässige Kalenderkorrekturen können relative Frist verändern, nicht automatisch absolute Höchstgrenze. Diese danach weiter prüfen; keine allgemeinen Zehnjahresgrenzen§121/124 importieren. ISO-Daten und berechnete Fristgrenzen0001..9999, explizite Auswahl/Wahrheitswerte und nichtleerer Nachweis. Optionale Bekanntgabe nur im beschriebenen Fall.}
\value{wert enthält fristdauer=6, fristeinheit wochen/monate und rechnerisches_grundfristende, dreissigjahresgrenze, rechnerischer_letzter_tag als ISO-Daten. Ohne Anwendbarkeit NICHT_ANWENDBAR/null. Einheit: fristdaten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1954_T0001, BGB_1954_T0002, BGB_1954_T0003, BGB_1954_T0004, BGB_1954_T0005, BGB_1956_T0001}
\examples{
erbrecht_anfechtungsgrundfrist(
  anfechtungsfall = "annahme",
  angefochtenes_ereignis_am = "2000-01-01",
  fristbeginn_am = "2024-02-29",
  erblasser_letzter_wohnsitz_nur_ausland = FALSE,
  erbe_bei_fristbeginn_im_ausland = FALSE,
  anfechtungsregel_anwendbar = TRUE,
  einordnungsnachweis = paste0(
    "Synthetisch rechtlich bestimmter erbrechtlicher Anfechtungsf",
    "all und Kenntnis/Ende der Zwangslage; Auslandsverhältnisse z",
    "um Beginn."
  )
)
}
