\name{werk_bestellerkuendigung_verguetung}
\alias{werk_bestellerkuendigung_verguetung}
\title{Vergütung bei freier Bestellerkündigung}
\description{Bei unentkräfteter Vermutung: Vergütung für erbrachte Leistungen plus 5 Prozent der vereinbarten Vergütung für nicht erbrachte Leistungen. Bei konkreter Abrechnung: vereinbarte Gesamtvergütung minus ersparte Aufwendungen, anderweitigen Erwerb und böswillig unterlassenen Erwerb; Vergütungsanspruch mindestens null.}
\usage{
werk_bestellerkuendigung_verguetung(erbrachte_verguetung = NULL,
  nicht_erbrachte_verguetung = NULL,
  abrechnungsart = NULL,
  ersparte_aufwendungen = NULL,
  anderweitiger_erwerb = NULL,
  boeswillig_unterlassener_erwerb = NULL,
  bestellerkuendigung_wirksam = NULL,
  werk_vollendet = NULL,
  bautraegervertrag = NULL)
}
\arguments{
\item{erbrachte_verguetung}{Nichtnegative EUR-Dezimalzeichenfolge der vereinbarten Vergütung für den bis zur Kündigung erbrachten Teil. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{nicht_erbrachte_verguetung}{Nichtnegative EUR-Dezimalzeichenfolge der vereinbarten Vergütung für den bei Kündigung noch nicht erbrachten Teil. Zusammen mit erbrachte_verguetung ergibt sich die maßgebliche Gesamtvergütung. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{abrechnungsart}{vermutung für die unentkräftete gesetzliche Fünfprozentvermutung oder konkret für eine Abrechnung mit rechtlich zurechenbaren Abzügen. Keine automatische Beweiswürdigung.}
\item{ersparte_aufwendungen}{Nichtnegative EUR-Dezimalzeichenfolge der infolge Vertragsaufhebung ersparten Aufwendungen. Bei vermutung ausdrücklich "0". Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{anderweitiger_erwerb}{Nichtnegative EUR-Dezimalzeichenfolge des durch anderweitige Verwendung der Arbeitskraft erzielten, dieser Kündigung rechtlich zurechenbaren Erwerbs. Bei vermutung ausdrücklich "0". Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{boeswillig_unterlassener_erwerb}{Nichtnegative EUR-Dezimalzeichenfolge des rechtlich festgestellten böswillig unterlassenen Erwerbs. Bei vermutung ausdrücklich "0". Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{bestellerkuendigung_wirksam}{Expliziter Wahrheitswert: wirksame freie Bestellerkündigung nach § 648, einschließlich Erklärung, Zugang und gegebenenfalls Schriftform nach § 650h. Keine automatische Prüfung dieser Tatsachen.}
\item{werk_vollendet}{Expliziter Wahrheitswert zur Vollendung im maßgeblichen Kündigungszeitpunkt; § 648 gilt nur vor Vollendung.}
\item{bautraegervertrag}{Expliziter Wahrheitswert: § 650u Abs. 2 schließt § 648 beim Bauträgervertrag aus.}
}
\details{Ausschließlich freie Bestellerkündigung nach § 648 vor Vollendung; keine Kündigung aus wichtigem Grund nach § 648a oder Unternehmerkündigung nach § 650f. Bauträgerverträge ausgeschlossen. Die Fünfprozentvermutung ist widerlegbar, keine feste Ober- oder Untergrenze. Die Funktion wählt keinen günstigeren Rechenweg, sondern verwendet die ausdrücklich ausgewählte, rechtlich zulässige Abrechnungsart. Konkrete Abzüge müssen der Aufhebung zurechenbar und ohne Doppelzählung ermittelt sein. Keine automatische Bewertung, Umsatzsteuerentscheidung, Fälligkeitsprüfung, Anrechnung geleisteter Abschläge oder Berechnung gesonderter Schadensersatz- und Rückzahlungsansprüche.}
\value{S3-Objekt bgb_ergebnis. Ergebnisobjekt mit wert als zaehler/nenner-Ganzzahlzeichenfolgen, einheit EUR, Regel- und Quellenfassung, Eingaben, Nutzervorgaben und Rechenschritten. Bei NICHT_ANWENDBAR ist wert null. Fehlende oder ungültige Eingaben erzeugen einen strukturierten Berechnungsfehler.}
\examples{
werk_bestellerkuendigung_verguetung("20000", "80000", "vermutung",
  "0", "0", "0", TRUE, FALSE, FALSE)
}
