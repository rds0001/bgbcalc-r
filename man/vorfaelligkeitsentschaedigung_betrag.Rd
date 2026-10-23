\name{vorfaelligkeitsentschaedigung_betrag}
\alias{vorfaelligkeitsentschaedigung_betrag}
\title{Vorfälligkeitsentschädigung: Voraussetzungen und Grenzen}
\description{Bei Allgemein-Verbraucherdarlehen min(unmittelbarer angemessener Schaden, 1 Prozent des vorzeitig gezahlten Betrags, verbleibende Sollzinsen); statt 1 Prozent nur 0,5 Prozent, wenn Zeitraum bis vereinbarter Rückzahlung höchstens ein Jahr beträgt. Bei Immobiliar-Verbraucherdarlehen keine Obergrenzen aus Abs. 3, sondern vorgegebene Schadensbewertung.}
\usage{
vorfaelligkeitsentschaedigung_betrag(vorzeitig_zurueckgezahlter_betrag = NULL,
  unmittelbarer_schaden = NULL,
  verbleibende_sollzinsen = NULL,
  rueckzahlungstag = NULL,
  vereinbarter_rueckzahlungstag = NULL,
  darlehensart = NULL,
  gebundener_sollzins = NULL,
  bei_abschluss_gebunden = NULL,
  versicherung_rueckzahlung = NULL,
  vertragsangaben_ausreichend = NULL)
}
\arguments{
\item{vorzeitig_zurueckgezahlter_betrag}{Nichtnegative Dezimalzeichenfolge des vorzeitig zurückgezahlten Betrags in EUR. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{unmittelbarer_schaden}{Nichtnegative Dezimalzeichenfolge des angemessenen, unmittelbar mit der vorzeitigen Rückzahlung zusammenhängenden Schadens. Bewertete Nutzervorgabe, keine automatisch berechnete Schadensgröße. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{verbleibende_sollzinsen}{Nichtnegative Dezimalzeichenfolge der Sollzinsen, die zwischen vorzeitiger und vereinbarter Rückzahlung angefallen wären. Bei Immobiliardarlehen wird diese Obergrenze nicht angewendet. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{rueckzahlungstag}{ISO-Datum der tatsächlichen vorzeitigen Rückzahlung.}
\item{vereinbarter_rueckzahlungstag}{ISO-Datum des maßgeblichen vereinbarten Rückzahlungstermins für den vorzeitig gezahlten Betrag; muss nach dem tatsächlichen Rückzahlungstag liegen.}
\item{darlehensart}{allgemein, immobiliar, eingeraeumte_ueberziehung oder geduldete_ueberziehung im Anwendungsbereich des Verbraucherdarlehensrechts.}
\item{gebundener_sollzins}{Expliziter Wahrheitswert: Werden zum Rückzahlungstag Zinsen zu einem gebundenen Sollzinssatz geschuldet?}
\item{bei_abschluss_gebunden}{Expliziter Wahrheitswert: Wurde der gebundene Sollzinssatz bereits bei Vertragsabschluss vereinbart? Nur bei Allgemein-Verbraucherdarlehen zusätzliche Voraussetzung.}
\item{versicherung_rueckzahlung}{Expliziter Wahrheitswert: Rückzahlung aus Mitteln einer Versicherung, die aufgrund entsprechender Verpflichtung im Darlehensvertrag zur Sicherung der Rückzahlung abgeschlossen wurde. Nicht jede Versicherungsleistung erfüllt den Ausschluss.}
\item{vertragsangaben_ausreichend}{Expliziter Wahrheitswert: Angaben zu Laufzeit, Kündigungsrecht und Berechnung der Vorfälligkeitsentschädigung sind ausreichend. Schon unzureichende Angaben in einem dieser Bereiche begründen den Ausschluss.}
}
\details{Gebundener Sollzinssatz zum Rückzahlungstag erforderlich; bei Allgemein-Verbraucherdarlehen bereits bei Vertragsschluss vereinbart. Ausschluss bei Rückzahlung aus vertraglich verpflichtend zur Rückzahlungssicherung abgeschlossener Versicherung oder unzureichenden Angaben über Laufzeit, Kündigungsrecht oder Berechnung der Vorfälligkeitsentschädigung. Eingeräumte Überziehung § 504 Abs. 1 und geduldete Überziehung § 505 Abs. 4 ausgeschlossen. Zulässige vorzeitige Erfüllung nach § 500 und Anwendbarkeit des Verbraucherdarlehensrechts sind vorab festgestellt; kein Kündigungsschadensrechner nach § 490. Unmittelbarer angemessener Schaden ist bewertete Nutzervorgabe, keine implementierte Aktiv-Aktiv-/Aktiv-Passiv-Schadensbewertung. Vereinbarte Rückzahlung bezeichnet den maßgeblichen Termin des vorzeitig zurückgezahlten Betrags. Keine automatische Berechnung verbleibender Sollzinsen oder Kostenminderung nach § 501. Jahresgrenze kalendarisch nach §§ 187/188; genau ein Jahr fällt unter die Grenze von 0,5 Prozent.}
\value{S3-Objekt bgb_ergebnis mit exaktem EUR-Bruch in wert (zaehler und nenner als Ganzzahlzeichenfolgen), keine automatische Rundung. Bei Nichtanwendbarkeit wert NULL und status NICHT_ANWENDBAR. Fehlende/ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\examples{
vorfaelligkeitsentschaedigung_betrag("10000", "300", "400",
  "2026-01-15", "2027-01-16", "allgemein", TRUE, TRUE, FALSE, TRUE)
}
