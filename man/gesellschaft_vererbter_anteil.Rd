% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{gesellschaft_vererbter_anteil}
\alias{gesellschaft_vererbter_anteil}
\title{gesellschaft vererbter anteil}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{gesellschaft_vererbter_anteil(
  gesellschaftsanteil_zaehler = NULL,
  gesellschaftsanteil_nenner = NULL,
  erbquote_zaehler = NULL,
  erbquote_nenner = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{gesellschaftsanteil_zaehler}{Nichtnegative ganze Zahl des bisherigen Gesellschaftsanteils, höchstens Nenner und2^53-1.}
\item{gesellschaftsanteil_nenner}{Positive ganze Bezugsgröße des bisherigen Gesellschaftsanteils, höchstens2^53-1.}
\item{erbquote_zaehler}{Nichtnegative ganze Zahl der qualifizierten individuellen Erbquote, höchstens Nenner und2^53-1.}
\item{erbquote_nenner}{Positive ganze Bezugsgröße der Erbquote, höchstens2^53-1.}
\item{einordnungsnachweis}{Nichtleerer Nachweis der Fortsetzung mit Erben nach711II, des bisherigen Gesellschaftsanteils und der individuellen Erbquote.}
}
\details{Gesellschaftsanteil des Erblassers mit qualifizierter individueller Erbquote multiplizieren. §711II: qualifizierte gesellschaftsvertragliche Fortsetzung mit Erben und maßgebliche Erbquote vorausgesetzt. Bei mehreren Erben fällt jedem ein entsprechender Anteil zu; keine Umdeutung in einen einzigen ungeteilten Erbengemeinschaftsanteil. Für mehrere Einzelaufrufe müssen die verwendeten Erbquoten den Erbfall vollständig und ohne Doppelzählung abbilden. Kein EUR-Wert, keine Vertragsauslegung, kein Abfindungsanspruch und keine Berechnung der Erbquote selbst. Exakte nichtnegative Anteile/Stimmgewichte beziehungsweise ganze Personenzahlen nach NUMERIK.md; Nenner positiv, Zustimmung höchstens Bezugsgröße. Keine Rundung.}
\value{wert: dimensionsloser exakter Bruch des vererbten Gesellschaftsanteils. Einheit: anteil.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_711_T0003, BGB_711_T0004, BGB_711_T0005}
\examples{
gesellschaft_vererbter_anteil(
  gesellschaftsanteil_zaehler = 1,
  gesellschaftsanteil_nenner = 2,
  erbquote_zaehler = 1,
  erbquote_nenner = 3,
  einordnungsnachweis = paste0(
    "Rechtlich qualifizierter Anteil beziehungsweise eindeutiger ",
    "Stimm-/Personenkreis mit zutreffender Bezugsbasis; keine aut",
    "omatische Beschlusswirksamkeit."
  )
)
}
