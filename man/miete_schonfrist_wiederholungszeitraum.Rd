% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{miete_schonfrist_wiederholungszeitraum}
\alias{miete_schonfrist_wiederholungszeitraum}
\title{miete schonfrist wiederholungszeitraum}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{miete_schonfrist_wiederholungszeitraum(
  fruehere_geheilte_kuendigung_am = NULL,
  erneute_kuendigung_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{fruehere_geheilte_kuendigung_am}{DatumYYYY-MM-DD der früheren durch Schonfrist nach569III2Satz1 unwirksam gewordenen Kündigung. Datum der Kündigung, nicht Zahlungstag oder Rechtshängigkeit.}
\item{erneute_kuendigung_am}{DatumYYYY-MM-DD der nun betrachteten späteren Kündigung, strikt nach früherer Kündigung.}
\item{einordnungsnachweis}{Nichtleerer Nachweis der vorangegangenen Schonfristheilung und Zuordnung beider Kündigungen. Nur numerische Zweijahresgrenze, keine automatische Wirksamkeitsentscheidung.}
}
\details{Frühere geheilte Kündigung um zwei Jahre fortschreiben und erneute Kündigung einschließlich des Grenztags vergleichen. §569III2Satz2: erneute Kündigung innerhalb von einschließlich zwei Jahren nach früherer, durch Schonfrist unwirksam gewordener Kündigung. Eine bloß erfolgte Mietzahlung ohne diese frühere Heilung genügt nicht als Bezugsvorgang. Zeitraum keine Handlungsfrist; keine193Verschiebung. Ergebnis betrifft nur die Wiederholungsgrenze der Schonfrist, nicht jede Zahlung, Aufrechnung oder sonstige Unwirksamkeit der neuen Kündigung. Strikte ISO-Kalendertage0001..9999; keine automatische Feiertagsverschiebung.}
\value{wert: zweijahresgrenzeYYYY-MM-DD und innerhalb_wiederholungszeitraum als Wahrheitswert. Einheit: daten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_569_T0001, BGB_569_T0002, BGB_569_T0003, BGB_569_T0004, BGB_569_T0005, BGB_569_T0006, BGB_569_T0007, BGB_569_T0008, BGB_569_T0009, BGB_569_T0010, BGB_569_T0011, BGB_569_T0012, BGB_569_T0013, BGB_569_T0014, BGB_569_T0015, BGB_569_T0016}
\examples{
miete_schonfrist_wiederholungszeitraum(
  fruehere_geheilte_kuendigung_am = "2024-02-29",
  erneute_kuendigung_am = "2026-02-27",
  einordnungsnachweis = paste0(
    "§569III2Satz2: erneute Kündigung innerhalb von einschließlic",
    "h zwei Jahren nach früherer, durch Schonfrist unwirksam gewo",
    "rdener Kündigung. Eine bloß erfolgte Mietzahlung ohne diese ",
    "frühere Heilung genügt nicht als Bezugsvorgang. Zeitraum kei",
    "ne Handlungsfrist; keine193Verschiebung. Ergebnis betrifft n",
    "ur die Wiederholungsgrenze der Schonfrist, nicht jede Zahlun",
    "g, Aufrechnung oder sonstige Unwirksamkeit der neuen Kündigu",
    "ng."
  )
)
}
