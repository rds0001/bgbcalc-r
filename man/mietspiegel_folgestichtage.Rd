% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{mietspiegel_folgestichtage}
\alias{mietspiegel_folgestichtage}
\title{mietspiegel folgestichtage}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{mietspiegel_folgestichtage(
  datenerhebungsstichtag = NULL,
  stichtagsnachweis = NULL
)}
\arguments{
\item{datenerhebungsstichtag}{ISO-Datum des maßgeblichen ursprünglichen Datenerhebungsstichtags des qualifizierten Mietspiegels; nicht späteres Anerkennungs-/Veröffentlichungsdatum.}
\item{stichtagsnachweis}{Nichtleerer Nachweis des ursprünglichen Erhebungsstichtags und des Anwendungsbereichs558dII; zwischenzeitliche Anpassung setzt die Vierjahresfrist nicht neu in Gang.}
}
\details{Erste Anpassung und Neuerstellung zwei beziehungsweise vier Jahre nach Erhebungsstichtag. §558dII: erste Zweijahresanpassung und Vierjahresneuerstellung eines qualifizierten Mietspiegels, ausgehend vom Datenerhebungsstichtag der ursprünglichen Erstellung. Eine zwischenzeitliche Indexanpassung setzt die Vierjahresneuerstellung nicht neu in Gang; nicht deren Veröffentlichungsdatum als neuen Ausgangspunkt einsetzen. Keine automatische Feiertagsverschiebung, Gültigkeitsvermutung oder Aussage über verspätete Veröffentlichung. Veröffentlichung und wissenschaftliche/formelle Voraussetzungen gesondert prüfen; keine Fristberechnung aus einem beliebig ausgewählten Indexmonat. Exakte nichtnegative Basis und positive Indexstände; sichere Ganzzahlen nach NUMERIK.md. Kalenderdaten0001..9999 einschließlich Folgestichtagen.}
\value{wert: anpassung_stichtag und neuerstellung_stichtag als ISO-Daten. Einheit: daten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_558d_T0004, BGB_558d_T0005, BGB_558d_T0006, BGB_558d_T0007, BGB_558d_T0008}
\examples{
mietspiegel_folgestichtage(
  datenerhebungsstichtag = "2024-01-31",
  stichtagsnachweis = paste0(
    "Ursprünglicher Erhebungsstichtag des qualifizierten Mietspie",
    "gels."
  )
)
}
