% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{landpacht_erzeugnisse_mehrwert}
\alias{landpacht_erzeugnisse_mehrwert}
\title{landpacht erzeugnisse mehrwert}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{landpacht_erzeugnisse_mehrwert(
  wert_erforderlicher_endbestand = NULL,
  vergleichswert_uebernommener_anfangsbestand = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{wert_erforderlicher_endbestand}{Nichtnegativer exakter EUR-Wert der nach596bI tatsächlich zurückzulassenden erforderlichen Erzeugnisse, zum rechtlich maßgeblichen einheitlichen Bewertungsstichtag.}
\item{vergleichswert_uebernommener_anfangsbestand}{Nichtnegativer exakter EUR-Vergleichswert der bei Beginn übernommenen Menge und Beschaffenheit derselben Erzeugnisse, auf gleicher Bewertungsbasis wie Endbestand; nicht historischer Kaufpreis mit späteren Preisänderungen vermischt.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des qualifizierten Betriebspachtfalls, Erforderlichkeit bis zur nächsten Ernte, ursprünglicher Menge/Beschaffenheit und konsistenter Werte. Getrennte Erzeugnisgruppen ohne ungeprüfte Verlustverrechnung behandeln.}
}
\details{Wert erforderlicher zurückzulassender Erzeugnisse abzüglich gleichartig bewerteten übernommenen Anfangsbestands, mindestens null. §596bII: Ersatz nur für den rechtlich qualifizierten Mehrbestand beziehungsweise bessere Beschaffenheit der nachAbsatz1 zurückzulassenden Erzeugnisse. Werte müssen den Unterschied in Menge/Beschaffenheit abbilden, nicht bloße allgemeine Preissteigerung. Über die erforderlichen Erzeugnisse hinaus freiwillig zurückgelassene Mengen nicht einrechnen; Pflicht nachAbsatz1 kann auch ohne Anfangsübernahme bestehen, dann Vergleichswert0. Bei verschiedenen Produktgruppen gesondert qualifizieren; keine pauschale Verrechnung fremder Minderbestände. Kein automatischer Anspruch wegen Bestandsangaben allein; Zahlungen separat. Nichtnegative Eingangswerte, exakter nichtnegativer EUR-Bruch im sicheren gemeinsamen Zahlenbereich.}
\value{wert ist der exakte EUR-Bruch. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_596b_T0002}
\examples{
landpacht_erzeugnisse_mehrwert(
  wert_erforderlicher_endbestand = "150",
  vergleichswert_uebernommener_anfangsbestand = "100",
  einordnungsnachweis = paste0(
    "§596bII: Ersatz nur für den rechtlich qualifizierten Mehrbes",
    "tand beziehungsweise bessere Beschaffenheit der nachAbsatz1 ",
    "zurückzulassenden Erzeugnisse. Werte müssen den Unterschied ",
    "in Menge/Beschaffenheit abbilden, nicht bloße allgemeine Pre",
    "issteigerung. Über die erforderlichen Erzeugnisse hinaus fre",
    "iwillig zurückgelassene Mengen nicht einrechnen; Pflicht nac",
    "hAbsatz1 kann auch ohne Anfangsübernahme bestehen, dann Verg",
    "leichswert0. Bei verschiedenen Produktgruppen gesondert qual",
    "ifizieren; keine pauschale Verrechnung fremder Minderbeständ",
    "e. Kein automatischer Anspruch wegen Bestandsangaben allein;",
    " Zahlungen separat."
  )
)
}
