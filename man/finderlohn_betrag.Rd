\name{finderlohn_betrag}
\alias{finderlohn_betrag}
\title{finderlohn betrag}
\description{Allgemeiner Fund: bei verletzter Anzeigepflicht oder Verheimlichen auf Nachfrage kein Anspruch aus § 971 (NICHT_ANWENDBAR). Sonst bei Tieren 3 Prozent des Sachwerts, bei anderen Sachen 5 Prozent bis einschließlich 500 EUR plus 3 Prozent darüber. Nur persönlicher Wert: billiger_finderlohn als bewerteter Betrag, keine Ermessensformel. Behörde/Verkehrsanstalt: mindestens 50 EUR Sachwert, kein Bediensteter und keine Ablieferungspflichtverletzung; dann Hälfte des nach § 971 Abs. 1 Satz 2/3 bestimmten Betrags. § 971 Abs. 2 nicht zusätzlich auf öffentlichen Fund anwenden.}
\usage{
finderlohn_betrag(sachwert = NULL,
  tier = NULL,
  nur_persoenlicher_wert = NULL,
  billiger_finderlohn = NULL,
  fundort = NULL,
  bediensteter = NULL,
  anzeigepflicht_verletzt = NULL,
  fund_verheimlicht = NULL,
  ablieferungspflicht_verletzt = NULL)
}
\arguments{
  \item{sachwert}{Nichtnegative Dezimalzeichenfolge in EUR des bewerteten Sachwerts. Bei öffentlichem Fund für die 50-EUR-Schwelle erforderlich; die Bewertung erfolgt durch den Nutzer. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
  \item{tier}{Expliziter Wahrheitswert, ob es sich um ein Tier handelt; dann keine 5-Prozent-Stufe.}
  \item{nur_persoenlicher_wert}{Expliziter Wahrheitswert, ob die Sache nur für den Empfangsberechtigten Wert hat. Dann billige Bemessung statt Prozentstaffel.}
  \item{billiger_finderlohn}{Bei ausschließlich persönlichem Wert erforderliche nichtnegative Dezimalzeichenfolge in EUR. Sonst NULL. Dies ist eine bewertete Nutzervorgabe, keine von der Library ermittelte Ermessensentscheidung. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
  \item{fundort}{allgemein oder behoerde_oder_verkehrsanstalt. Letzteres setzt den gesetzlichen Ortsbezug nach § 978 voraus, nicht beliebigen öffentlichen Raum.}
  \item{bediensteter}{Expliziter Wahrheitswert, ob der Finder Bediensteter der betroffenen Behörde oder Verkehrsanstalt ist; Ausschluss nur im öffentlichen Fundzweig.}
  \item{anzeigepflicht_verletzt}{Rechtlich bewertete Verletzung der Anzeigepflicht nach § 965. Die Ausnahme bis einschließlich 10 EUR betrifft die Behördenanzeige bei unbekanntem Empfangsberechtigten, nicht jede Anzeige.}
  \item{fund_verheimlicht}{Expliziter Wahrheitswert, ob der Finder den Fund auf Nachfrage verheimlicht hat; § 971 Abs. 2 im allgemeinen Fundzweig.}
  \item{ablieferungspflicht_verletzt}{Expliziter Wahrheitswert zur Pflicht aus § 978 Abs. 1; maßgeblich im öffentlichen Fundzweig.}
}
\details{Feste lokale BGB-Fassung; die beschriebenen normbezogenen Tatsachen/Bewertungen werden ausdrücklich eingegeben. Betrag eines grundsätzlich ausgewählten Finderlohnanspruchs, nicht Fälligkeit, Durchsetzbarkeit oder Erlöschensfrist. § 1001 bei öffentlichem Fund und § 978 Abs. 3 bei Erlösanfall gesondert beachten. Anzeigepflichtverletzung muss rechtlich bewertet sein: bei unbekanntem Empfangsberechtigten keine Behördenanzeige bis einschließlich 10 EUR nach § 965 Abs. 2, nicht pauschale Befreiung von jeder Anzeige. Der Bewertungszweig für ausschließlich persönlichen Wert ist nur Entscheidungs-/Eingabevertrag, keine implementierte Ermessensbemessung.}
\value{S3-Objekt \code{bgb_ergebnis}. wert enthält zaehler und nenner als Ganzzahlzeichenfolgen, einheit ist EUR. Weitere Felder: regel_id, regelversion, quellenfassung, eingaben, nutzervorgaben, rechenschritte, annahmen, hinweise, status. Nichtanwendbarkeit liefert status NICHT_ANWENDBAR und wert NULL. Fehlende/ungültige Eingaben erzeugen \code{bgb_berechnungsfehler} mit EINGABE_FEHLT/EINGABE_UNGUELTIG.}
\examples{
finderlohn_betrag("1000", FALSE, FALSE, NULL, "allgemein",
  FALSE, FALSE, FALSE, FALSE)
}
