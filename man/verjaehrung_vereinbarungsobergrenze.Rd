% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{verjaehrung_vereinbarungsobergrenze}
\alias{verjaehrung_vereinbarungsobergrenze}
\title{verjaehrung vereinbarungsobergrenze}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{verjaehrung_vereinbarungsobergrenze(
  gesetzlicher_verjaehrungsbeginn = NULL,
  vereinbartes_fristende = NULL,
  beginnart = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{gesetzlicher_verjaehrungsbeginn}{Rechtlich maßgebliches ISO-Datum des gesetzlichen Verjährungsbeginns, nicht Vertragsabschluss oder vereinbart verschobener Beginn.}
\item{vereinbartes_fristende}{ISO-Datum des vereinbarten letzten Fristtags einschließlich, nicht vor angegebenem Beginn.}
\item{beginnart}{ereignis oder tagesbeginn nach rechtlicher Bestimmung des gesetzlichen Beginns. Bei Jahresschluss das Schlussdatum mit ereignis eingeben.}
\item{einordnungsnachweis}{Nichtleere Begründung des gesetzlichen Beginns/Beginnart und der zu prüfenden Verjährungsvereinbarung.}
}
\details{Gesetzlicher Beginn+30 Jahre; vereinbartes Ende höchstens diese Grenze. Nur quantitative Obergrenze202II; Vorsatzverbot202I/andere Unwirksamkeit separat. Keine automatische Heilung/Kürzung einer unzulässigen Vereinbarung; kein vollständiger Verjährungsablauf. Kalenderdaten/Ergebnisse0001..9999; Prozentwerte nichtnegative Dezimalzeichenfolge/exaktes Bruchobjekt, sichere Zwischenwerte höchstens2^53-1; Nachweis nichtleer.}
\value{wert enthält dreissigjahres_vereinbarungsgrenze und vereinbartes_ende_innerhalb_grenze. Einheit: daten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_202_T0001, BGB_202_T0002}
\examples{
verjaehrung_vereinbarungsobergrenze(
  gesetzlicher_verjaehrungsbeginn = "2028-02-29",
  vereinbartes_fristende = "2058-02-28",
  beginnart = "ereignis",
  einordnungsnachweis = "Qualifizierter gesetzlicher Beginn und vorgeschlagenes Ende."
)
}
