\name{kindbezogene_leistung_anrechnen}
\alias{kindbezogene_leistung_anrechnen}
\title{kindbezogene leistung anrechnen}
\description{Leistung um Erhöhung wegen nicht gemeinschaftlichen Kindes vermindern, bei Erfüllung durch Betreuung Hälfte, sonst volle Summe auf Barbedarf anrechnen. Bedarf mindestens null. Ersatzleistung nur bei regelmäßigem Wiederkehren und Ausschluss von Kindergeld.}
\usage{
kindbezogene_leistung_anrechnen(barbedarf = NULL,
  leistungsbetrag = NULL,
  erhoehung_nichtgemeinschaftliches_kind = NULL,
  betreuung_durch_elternteil = NULL,
  leistungsart = NULL,
  regelmaessig_wiederkehrend = NULL,
  kindergeld_ausgeschlossen = NULL)
}
\arguments{
\item{barbedarf}{Nichtnegative Dezimalzeichenfolge des bewerteten Barbedarfs vor dieser Anrechnung in EUR. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{leistungsbetrag}{Nichtnegative Dezimalzeichenfolge des auf das Kind entfallenden Kindergelds oder der einschlägigen Ersatzleistung in EUR. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{erhoehung_nichtgemeinschaftliches_kind}{Nichtnegative Dezimalzeichenfolge des Erhöhungsanteils wegen Berücksichtigung eines nicht gemeinschaftlichen Kindes; höchstens Leistungsbetrag. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{betreuung_durch_elternteil}{Expliziter Wahrheitswert: Ein Elternteil erfüllt seine Unterhaltspflicht durch Betreuung nach § 1606 Abs. 3 Satz 2. Keine bloße Angabe, ob Betreuung tatsächlich stattfindet.}
\item{leistungsart}{kindergeld oder ersatzleistung. Andere Leistungsarten sind nicht erfasst.}
\item{regelmaessig_wiederkehrend}{Expliziter Wahrheitswert, ob die Ersatzleistung regelmäßig wiederkehrt. Im Kindergeldzweig keine zusätzliche Berechnungsbedingung.}
\item{kindergeld_ausgeschlossen}{Expliziter Wahrheitswert: Die angegebene Ersatzleistung schließt Kindergeld aus. Für Kindergeld selbst muss FALSE angegeben werden.}
}
\details{betreuung_durch_elternteil bezeichnet rechtlich bewertete Erfüllung nach § 1606 Abs. 3 Satz 2, nicht jede tatsächliche Betreuungszeit. Wechselmodell nicht ohne Einordnung als Halbfall behandeln. Ersatzleistungen nur soweit sie Kindergeld ausschließen; anteilig betroffene Leistung vorab abgrenzen. Keine automatische Verteilung unter mehreren Unterhaltspflichtigen und keine Behandlung sonstiger Sozialleistungen.}
\value{S3-Objekt bgb_ergebnis. wert enthält bedarfsrelevante_leistung, bedarfsdeckung und verbleibender_barbedarf, jeweils als exakten EUR-Bruch. Bedarfsdeckung ist auf den Bedarf begrenzt; die bedarfsrelevante Leistung kann höher sein. Fehlende/ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\examples{
kindbezogene_leistung_anrechnen("500", "200", "0", TRUE, "kindergeld", TRUE, FALSE)
}
