% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{wohnraum_umwandlung_sperrfrist}
\alias{wohnraum_umwandlung_sperrfrist}
\title{wohnraum umwandlung sperrfrist}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{wohnraum_umwandlung_sperrfrist(
  massgeblicher_erwerb_am = NULL,
  sperrfrist_monate = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{massgeblicher_erwerb_am}{Rechtlich maßgeblicher Tag der Veräußerung beziehungsweise Belastung577aI/IaYYYY-MM-DD. Nicht ungeprüft Datum des Kaufvertrags; maßgeblichen Erwerbsvorgang extern bestimmen.}
\item{sperrfrist_monate}{Ganze Zahl36..120: gesetzliche Grunddauer36Monate oder tatsächlich einschlägige längere landesrechtliche Dauer bis120Monate. Keine automatische Suche einer örtlichen Rechtsverordnung.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des qualifizierten577a-Falls, maßgeblichen Erwerbsvorgangs und einschlägiger Dauer. Ausnahmen und räumlich/zeitlich geltende Verordnung vorqualifizieren.}
}
\details{Qualifizierte Sperrfrist von36bis120Monaten ab maßgeblichem Erwerb berechnen und ersten Tag nach Fristablauf ausweisen. §577aI/Ia/II/IIa: nur Ende der qualifizierten Kündigungsbeschränkung. Bei späterer Begründung von Wohnungseigentum nachVeräußerung/BelastungIa läuft die Frist bereits ab dem VorgangIa, nicht erneut ab Umwandlung. Nach Ablauf kann erst diese Sperre entfallen; keine automatische Kündigungsberechtigung, kein Mietende und keine Verkürzung gesetzlicher Kündigungsfristen. Einschlägige verlängerte Dauer ausdrücklich eingeben; nicht pauschal zehn Jahre für sämtliche Orte. Keine193Verschiebung, da Schutzzeitraum. Kalenderbereich0001..9999 und ausdrücklich qualifizierte Dauer; keine automatische Feiertagsverschiebung.}
\value{wert: sperrfristende und erster_tag_nach_sperrfrist alsYYYY-MM-DD. Einheit: daten_und_zahlen.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_577a_T0001, BGB_577a_T0002, BGB_577a_T0003, BGB_577a_T0004, BGB_577a_T0005, BGB_577a_T0006, BGB_577a_T0007, BGB_577a_T0008, BGB_577a_T0009}
\examples{
wohnraum_umwandlung_sperrfrist(
  massgeblicher_erwerb_am = "2024-02-29",
  sperrfrist_monate = 36,
  einordnungsnachweis = paste0(
    "§577aI/Ia/II/IIa: nur Ende der qualifizierten Kündigungsbesc",
    "hränkung. Bei späterer Begründung von Wohnungseigentum nachV",
    "eräußerung/BelastungIa läuft die Frist bereits ab dem Vorgan",
    "gIa, nicht erneut ab Umwandlung. Nach Ablauf kann erst diese",
    " Sperre entfallen; keine automatische Kündigungsberechtigung",
    ", kein Mietende und keine Verkürzung gesetzlicher Kündigungs",
    "fristen. Einschlägige verlängerte Dauer ausdrücklich eingebe",
    "n; nicht pauschal zehn Jahre für sämtliche Orte. Keine193Ver",
    "schiebung, da Schutzzeitraum."
  )
)
}
