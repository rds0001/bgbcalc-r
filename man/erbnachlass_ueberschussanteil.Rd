% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{erbnachlass_ueberschussanteil}
\alias{erbnachlass_ueberschussanteil}
\title{erbnachlass ueberschussanteil}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{erbnachlass_ueberschussanteil(
  nachlasswert = NULL,
  gemeinsame_verbindlichkeiten = NULL,
  erforderlicher_rueckbehalt = NULL,
  erbquote_zaehler = NULL,
  erbquote_nenner = NULL,
  einfaches_teilungsmodell_qualifiziert = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{nachlasswert}{Nichtnegativer exakter EUR-Nachlasswert vor den eingegebenen Abzügen.}
\item{gemeinsame_verbindlichkeiten}{Nichtnegative gemeinsame zu berichtigende Lasten; bereits aus Nachlass bezahlte Lasten nicht erneut erfassen. Nur einigen Erben obliegende Lasten2046II ausschließen.}
\item{erforderlicher_rueckbehalt}{Nichtnegative rechtlich bewertete Reserve für nicht fällige/streitige gemeinsame Verbindlichkeiten, überschneidungsfrei zu gemeinsamen_verbindlichkeiten.}
\item{erbquote_zaehler}{Ganzzahl0..Nenner, Anteil des betrachteten Erben.}
\item{erbquote_nenner}{Ganzzahl1..2^53-1.}
\item{einfaches_teilungsmodell_qualifiziert}{Pflichtwahrheitswert: vollständige gemeinsame Lasten/Reserve und einfache Quotenverteilung ohne Ausgleichung oder abweichende Teilungsanordnungen. FALSE ergibt NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleerer Nachweis der rechtlichen Bewertungen und Abgrenzung.}
}
\details{Nachlass minus gemeinsame Lasten minus Reserve; positiver Rest mal Erbquote. Signierten Nettobetrag getrennt ausweisen. Kein voller Teilungsplan, keine Insolvenzfeststellung, keine Verteilung nur einigen Erben obliegender Lasten2046II oder Ausgleichung2050ff. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält nettobetrag_nach_lasten_und_reserve (signed), verteilbarer_ueberschuss und anteil_am_ueberschuss als exakte EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2046_T0001, BGB_2046_T0002, BGB_2047_T0001}
\examples{
erbnachlass_ueberschussanteil(
  nachlasswert = "100",
  gemeinsame_verbindlichkeiten = "20",
  erforderlicher_rueckbehalt = "10",
  erbquote_zaehler = 1,
  erbquote_nenner = 2,
  einfaches_teilungsmodell_qualifiziert = TRUE,
  bewertungsnachweis = "Synthetisch qualifizierte Lasten und Reserve."
)
}
