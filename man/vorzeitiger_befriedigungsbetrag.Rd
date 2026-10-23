\name{vorzeitiger_befriedigungsbetrag}
\alias{vorzeitiger_befriedigungsbetrag}
\title{Vorzeitiger Befriedigungsbetrag}
\description{Bei erfüllten Voraussetzungen und unverzinslicher noch nicht fälliger Forderung: Auszahlungsbetrag = Forderungsbetrag / (1 + 4/100 * Jahresanteil bis Fälligkeit).}
\usage{
vorzeitiger_befriedigungsbetrag(forderungsbetrag = NULL,
  zeitanteil_zaehler = NULL,
  zeitanteil_nenner = NULL,
  zeitanteil_nachweis = NULL,
  unverzinslich = NULL,
  noch_nicht_faellig = NULL,
  befriedigungsgrund = NULL,
  voraussetzungen_erfuellt = NULL)
}
\arguments{
\item{forderungsbetrag}{Nichtnegative Dezimalzeichenfolge des Forderungsbetrags in EUR. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{zeitanteil_zaehler}{Nichtnegative ganze Zahl des belegten Jahresanteils von Zahlung bis Fälligkeit.}
\item{zeitanteil_nenner}{Positive ganze Zahl als Nenner des Jahresanteils.}
\item{zeitanteil_nachweis}{Nichtleere Beschreibung des maßgeblichen Zeitraums und der Zeitkonvention.}
\item{unverzinslich}{Expliziter Wahrheitswert, ob die Forderung unverzinslich ist.}
\item{noch_nicht_faellig}{Expliziter Wahrheitswert, ob die Forderung bei Zahlung noch nicht fällig ist.}
\item{befriedigungsgrund}{hypothek_gefaehrdung für § 1133 oder pfand_rueckgabe für § 1217 Abs. 2.}
\item{voraussetzungen_erfuellt}{Expliziter Wahrheitswert zur rechtlichen Bewertung der nachfolgend erläuterten Voraussetzungen des ausgewählten Befriedigungsgrundes.}
}
\details{§ 1133: hypothekarische Sicherheit durch Grundstücksverschlechterung gefährdet, angemessene Abhilfefrist abgelaufen und Gefährdung nicht beseitigt. § 1217 Abs. 2: erhebliche fortgesetzte Rechtsverletzung trotz Abmahnung nach Abs. 1 und Rückgabe gegen Befriedigung statt Hinterlegung/Verwahrung verlangt. Diese Voraussetzungen werden in voraussetzungen_erfuellt bewertet eingegeben. Bei fehlender Voraussetzung NICHT_ANWENDBAR, nicht eine Berechnung anderer Ansprüche. Gesetzlicher Satz § 246 von 4 Prozent; kein Verzugszins oder Zinseszins.}
\value{S3-Objekt bgb_ergebnis mit exaktem EUR-Bruch in wert (zaehler und nenner als Ganzzahlzeichenfolgen). Bei Nichtanwendbarkeit wert NULL und status NICHT_ANWENDBAR; bei fehlenden/ungültigen Eingaben bgb_berechnungsfehler. Keine Rundung.}
\examples{
vorzeitiger_befriedigungsbetrag("1040", 1, 1, "Ein voller Jahresanteil",
  TRUE, TRUE, "hypothek_gefaehrdung", TRUE)
}
