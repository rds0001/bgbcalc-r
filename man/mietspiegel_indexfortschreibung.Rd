% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{mietspiegel_indexfortschreibung}
\alias{mietspiegel_indexfortschreibung}
\title{mietspiegel indexfortschreibung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{mietspiegel_indexfortschreibung(
  ausgangswert = NULL,
  ausgangsindex = NULL,
  neuer_index = NULL,
  indexnachweis = NULL
)}
\arguments{
\item{ausgangswert}{Nichtnegativer qualifizierter Mietspiegelwert in EUR je explizit belegter Bezugseinheit; passend zum Ausgangsindex.}
\item{ausgangsindex}{Positiver amtlicher Ausgangsindex derselben Reihe und Basis wie der neue Index, als exakter Dezimalwert oder Bruch.}
\item{neuer_index}{Positiver neuer amtlicher Indexstand; auch Senkungen zulässig.}
\item{indexnachweis}{Nichtleerer Nachweis qualifizierter Indexfortschreibung558dII, amtlicher Reihe, gleicher Basis, Bezugszeitpunkte und Einheit des Mietspiegelwerts.}
}
\details{Qualifizierten Mietspiegelwert mit dem Verhältnis vergleichbarer Indexstände fortschreiben. §558dII2: nur qualifizierte Indexanpassung, keine Stichprobenauswertung. Amtliche Indexreihe, identische Basis und rechtlich maßgebliche Bezugszeitpunkte vorgeben; Indexstände nicht selbst beschaffen oder schätzen. Ausgangswert und Ergebnis behalten dieselbe qualifizierte Mietspiegel-Bezugseinheit, beispielsweise EUR je Quadratmeter und Monat. Keine automatische Cent-Rundung, Gültigkeitsfeststellung oder konkrete Mieterhöhung; Anerkennung, Erstellungsmethode und einschlägige Verordnung gesondert. Indexsenkungen werden ebenfalls gerechnet; keine erneute Anwendung bereits berücksichtigter Änderungen. Exakte nichtnegative Basis und positive Indexstände; sichere Ganzzahlen nach NUMERIK.md. Kalenderdaten0001..9999 einschließlich Folgestichtagen.}
\value{wert: indexverhaeltnis dimensionslos, fortgeschriebener_wert und wertveraenderung als exakte EUR-Brüche je qualifizierter Bezugseinheit. Veränderung kann negativ sein. Einheit: EUR_je_qualifizierter_Bezugseinheit.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_558d_T0004, BGB_558d_T0005, BGB_558d_T0006, BGB_558d_T0007, BGB_558d_T0008}
\examples{
mietspiegel_indexfortschreibung(
  ausgangswert = "10",
  ausgangsindex = "100",
  neuer_index = "110",
  indexnachweis = paste0(
    "Vergleichbare amtliche Indexwerte; Basis EUR je Quadratmeter",
    " und Monat, qualifizierte Anpassung558dII."
  )
)
}
