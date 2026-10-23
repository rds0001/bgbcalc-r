\name{bau_sicherungsbetrag}
\alias{bau_sicherungsbetrag}
\title{bau sicherungsbetrag}
\description{Sicherungsbetrag = 110 Prozent der offenen Vergütung nach Abzug unstreitiger oder rechtskräftig festgestellter aufrechenbarer Gegenforderung, mindestens null. Streitige, nicht rechtskräftig festgestellte Gegenforderungen bleiben unberücksichtigt.}
\usage{
bau_sicherungsbetrag(offene_verguetung = NULL,
  aufrechenbare_gegenforderung = NULL,
  gegenforderung_unstreitig = NULL,
  gegenforderung_rechtskraeftig = NULL,
  bestellerart = NULL,
  baubetreuer_bevollmaechtigt = NULL)
}
\arguments{
\item{offene_verguetung}{Nichtnegative Dezimalzeichenfolge der offenen vereinbarten Vergütung einschließlich Zusatzaufträgen bzw. einschlägiger Ersatzansprüche, vor Abzug der hier angegebenen Gegenforderung. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{aufrechenbare_gegenforderung}{Nichtnegative Dezimalzeichenfolge einer zur Aufrechnung geeigneten Gegenforderung. Bei mehreren Forderungen vorher nach unstreitig/rechtskräftig und streitig gruppieren. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{gegenforderung_unstreitig}{Expliziter Wahrheitswert: Die angegebene Gegenforderung ist unstreitig.}
\item{gegenforderung_rechtskraeftig}{Expliziter Wahrheitswert: Die angegebene Gegenforderung ist rechtskräftig festgestellt.}
\item{bestellerart}{sonstiger, oeffentlich_insolvenzunfaehig, verbraucherbau oder bautraeger_verbraucher. sonstiger umfasst auch Verbraucher außerhalb von § 650i/§ 650u. Öffentlich-rechtliche Rechtsform allein genügt nicht; Insolvenzverfahren muss unzulässig sein.}
\item{baubetreuer_bevollmaechtigt}{Expliziter Wahrheitswert: Ein Baubetreuer betreut das Vorhaben und ist zur Verfügung über Finanzierungsmittel des Bestellers ermächtigt. Nur der Verbraucherausschluss wird dadurch aufgehoben.}
}
\details{Offene Vergütung umfasst Zusatzaufträge und einschlägige Ersatzansprüche nach Abs. 1 Satz 2; Leistungen nicht doppelt zählen. bestellerart sonstiger umfasst auch Verbraucher außerhalb eines Verbraucherbau-/Bauträgervertrags. Öffentlich-rechtlicher Ausschluss setzt Insolvenzunfähigkeit voraus. Verbraucher-Ausnahme entfällt nur bei Baubetreuer, der zur Verfügung über Finanzierungsmittel ermächtigt ist. Abs. 2 Zahlungsbedingungen einer Garantie, Sicherungskosten, Sicherungshypothekenausschluss und Kündigungsfolgen sind gesonderte Regeln. Bei mehreren Gegenforderungen nach rechtlicher Qualifikation getrennt summieren; keine pauschale Anerkennung streitiger Teile.}
\value{S3-Objekt bgb_ergebnis. wert enthält den exakten Sicherungsbetrag als Bruch mit zaehler und nenner als Ganzzahlzeichenfolgen. Keine Rundung. Bei Nichtanwendbarkeit wert NULL und status NICHT_ANWENDBAR; fehlende/ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\examples{
bau_sicherungsbetrag("10000", "1000", FALSE, FALSE, "sonstiger", FALSE)
}
