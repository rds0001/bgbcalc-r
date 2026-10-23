\name{pflichtteil_betrag}
\alias{pflichtteil_betrag}
\title{Pflichtteilsberechnung: pflichtteil betrag}
\description{Pflichtteilsquote = gesetzliche Erbquote/2. Ohne Anrechnung max(Nettopflichtteilsnachlass,0)*Pflichtteilsquote. Bei wirksamer Bestimmung nach § 2315 erst Anrechnungswert zum Nachlass addieren, dann Pflichtteilsquote anwenden, danach gesamten Anrechnungswert abziehen; Ergebnis mindestens null.}
\usage{
pflichtteil_betrag(pflichtteilsnachlass = NULL,
  gesetzliche_erbquote_zaehler = NULL,
  gesetzliche_erbquote_nenner = NULL,
  anrechnungswert = NULL,
  anrechnungsbestimmung = NULL,
  pflichtteilsberechtigt = NULL,
  bewertungsnachweis = NULL)
}
\arguments{
\item{pflichtteilsnachlass}{Signierte EUR-Dezimalzeichenfolge des bewerteten Nettopflichtteilsnachlasses zum Erbfall; keine automatische Bewertung oder Ermittlung abzugsfähiger Verbindlichkeiten. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{gesetzliche_erbquote_zaehler}{Nichtnegative ganze Zahl, Zähler der für Pflichtteilszwecke nach § 2310 gesondert bestimmten gesetzlichen Erbquote.}
\item{gesetzliche_erbquote_nenner}{Positive ganze Zahl, Nenner der gesetzlichen Erbquote. Quote zwischen 0 und 1; technische Grenzen gemäß NUMERIK.md.}
\item{anrechnungswert}{Nichtnegative EUR-Dezimalzeichenfolge der nach § 2315 bewerteten Zuwendung; ohne Zuwendung ausdrücklich "0" eingeben. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{anrechnungsbestimmung}{Expliziter Wahrheitswert, ob eine rechtlich wirksame Anrechnungsbestimmung vorliegt. Bei FALSE wird der eingegebene Anrechnungswert nicht berücksichtigt.}
\item{pflichtteilsberechtigt}{Expliziter Wahrheitswert für die rechtlich vorab geprüfte Berechtigung im gewählten Fall. FALSE ergibt NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleere Zeichenfolge mit Nachweis der verwendeten Nachlass- und Zuwendungsbewertungen sowie der maßgeblichen Quote.}
}
\details{Gesetzliche Erbquote für Pflichtteilszwecke gesondert nach § 2310 bestimmen: Ausgeschlossene, Ausschlagende und Erbunwürdige mitzählen, Erbverzichtende nicht. Tatsächliche Erbquote ist nicht ohne Weiteres maßgebend. Berechtigung umfasst Stellung nach § 2303 und Ausschluss nach § 2309 sowie weitere rechtliche Ausschlüsse. Nachlasswerte zum Erbfall; für Abkömmlinge/Eltern gebührenden Voraus außer Ansatz lassen. Anrechnungswerte zum Zuwendungszeitpunkt einschließlich erforderlicher Bewertungsbereinigung vorgeben; Bestimmung muss rechtlich wirksam sein. Mehrere Zuwendungen und § 2315 Abs. 3/§ 2051-Zurechnung vorab rechtlich abgrenzen. Kombination mit Ausgleichung § 2316 und Pflichtteilsergänzung §§ 2325 ff. sind gesonderte Rechenregeln; insbesondere § 2316 Abs. 4 nicht mit vollem §-2315-Abzug behandeln.}
\value{S3-Objekt bgb_ergebnis. Ergebnisobjekt mit wert als zaehler/nenner-Ganzzahlzeichenfolgen, einheit EUR, Regel- und Quellenfassung, Eingaben, Nutzervorgaben und Rechenschritten. Bei NICHT_ANWENDBAR ist wert null. Fehlende oder ungültige Eingaben erzeugen einen strukturierten Berechnungsfehler.}
\examples{
pflichtteil_betrag("100000", 1, 2, "10000", TRUE, TRUE,
  "Bewerteter Nachlass; wirksame Anrechnung")
}
