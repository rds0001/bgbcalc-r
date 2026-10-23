% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{stimmgewichts_mehrheitsgrenze}
\alias{stimmgewichts_mehrheitsgrenze}
\title{stimmgewichts mehrheitsgrenze}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{stimmgewichts_mehrheitsgrenze(
  regelfall = NULL,
  zustimmendes_stimmgewicht = NULL,
  massgebliches_gesamtgewicht = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{regelfall}{gesellschaft_aufloesung_732, gesellschaft_fortsetzung_734 oder gemeinschaft_verwaltung_745.}
\item{zustimmendes_stimmgewicht}{Nichtnegativer exakter Dezimaltext/Bruch des qualifizierten Zustimmungsgewichts in einheitlicher Stimm-/Anteilseinheit, höchstens Gesamtgewicht.}
\item{massgebliches_gesamtgewicht}{Strikt positives exaktes Gesamtgewicht. Bei732/734 maßgebliche abgegebene Stimmen; bei745 gesamte maßgebliche Gemeinschaftsanteile einschließlich nicht zustimmender/nicht abgegebener Anteile.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des gesetzlichen Mehrheitsfalls, der passenden Stimmgewichtung/Nennerbasis und gegebenenfalls gesellschaftsvertraglicher Mehrheitsentscheidung.}
}
\details{Zustimmungsgewicht mit Dreiviertelmehrheit oder strikter Anteilsmehrheit vergleichen. §732/734II: nur bei gesellschaftsvertraglicher Mehrheitsentscheidung; Nenner sind rechtlich maßgebliche abgegebene Stimmen, Stimmgewicht und Behandlung von Enthaltungen/Ungültigkeit vorqualifizieren. §745I: Mehrheit nach Größe sämtlicher maßgeblicher Gemeinschaftsanteile, nicht bloß nach Kopfzahl oder abgegebenen Stimmen; Nenner umfasst die gesamte Anteilsbasis. Keine automatische Beschlusswirksamkeit, Quorums-, Kompetenz- oder Vertragsprüfung.736V und736dI enthalten keine pauschale Dreiviertelregel und sind hier nicht einbezogen. Gleichheit genügt bei drei Vierteln, nicht bei der Hälfte. Exakte nichtnegative Anteile/Stimmgewichte beziehungsweise ganze Personenzahlen nach NUMERIK.md; Nenner positiv, Zustimmung höchstens Bezugsgröße. Keine Rundung.}
\value{wert: zustimmungsquote, grenzquote als exakte Brüche, vergleich (mehr_als oder mindestens), mehrheitsgrenze_erreicht. Einheit: anteile_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_732_T0001, BGB_734_T0002, BGB_745_T0001, BGB_745_T0002}
\examples{
stimmgewichts_mehrheitsgrenze(
  regelfall = "gesellschaft_aufloesung_732",
  zustimmendes_stimmgewicht = "0",
  massgebliches_gesamtgewicht = "4",
  einordnungsnachweis = paste0(
    "Rechtlich qualifizierter Anteil beziehungsweise eindeutiger ",
    "Stimm-/Personenkreis mit zutreffender Bezugsbasis; keine aut",
    "omatische Beschlusswirksamkeit."
  )
)
}
