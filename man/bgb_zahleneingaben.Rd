\name{bgb_zahleneingaben}
\alias{bgb_zahleneingaben}
\title{Exakte Zahleneingaben und Weiterverwendung von Ergebnissen}
\description{
Fachliche Eingaben, die als Dezimaltexte beschrieben sind, können alternativ
als exakte Bruchobjekte eingegeben werden. Dadurch lassen sich passende
Betragsresultate ohne vorherige Dezimalrundung weiterverwenden.
}
\details{
Ein Bruchobjekt ist eine Liste mit genau den beiden Zeichenfolgenfeldern
\code{zaehler} und \code{nenner}, beispielsweise
\code{list(zaehler = "1", nenner = "3")}.
Der Nenner ist positiv; der Zähler darf null oder negativ sein, soweit der
fachliche Wertebereich dies erlaubt. Beide Zahlen müssen als kanonische
Ganzzahlzeichenfolgen ohne Pluszeichen, führende Nullen, negatives Nullzeichen,
Leerzeichen, Dezimalpunkt oder Exponent vorliegen. Der Betrag des Zählers und
der Nenner dürfen jeweils 9007199254740991 nicht überschreiten.
Nicht gekürzte Brüche sind zulässig; intern wird gekürzt.

Die fachlichen Grenzen gelten unverändert. Ein negativer exakter Bruch ist
beispielsweise keine zulässige Eingabe für einen nichtnegativen Geldbetrag.
Einheiten, Bezugszeiträume und rechtliche Voraussetzungen der verknüpften
Funktionen sind gesondert zu prüfen. Bei strukturierten Ergebnissen das passende
Betragsfeld auswählen; das gesamte Ergebnisobjekt ist keine Zahleneingabe.

Als Ganzzahlen bezeichnete Parameter, insbesondere getrennte Quotenzähler
und Quotennenner, Anzahlen und Altersstufen, behalten ihre bisherigen Typen.
Datums- und Nachweiszeichenfolgen sind keine Zahleneingaben.
Es gibt keine automatische Cent-Rundung und keine implizite Umwandlung
binärer Fließkomma-Geldwerte.
}
\seealso{\code{\link{pflichtteil_betrag}}, \code{\link{zusatzpflichtteil_betrag}}}
\examples{
pflichtteil <- pflichtteil_betrag(
  "1", 1, 3, "0", FALSE, TRUE, "Synthetischer bewerteter Nachlass")
# Der Pflichtteil beträgt exakt 1/6; ein hinterlassener Wert von 1/12
# lässt einen Zusatzpflichtteil von exakt 1/12.
zusatzpflichtteil_betrag(
  pflichtteil$wert, list(zaehler = "1", nenner = "12"), TRUE)
}
