\name{modernisierung_erhoehungsbeginn}
\alias{modernisierung_erhoehungsbeginn}
\title{Beginn der erhöhten Miete}
\description{Bei wirksamer Erklärung: erster Tag des dritten Kalendermonats nach dem Zugangsmonat. Wenn die Ankündigung nicht ordnungsgemäß war oder der tatsächliche Erhöhungsbetrag mehr als 110 Prozent des angekündigten beträgt, einmalig sechs Monate später. Genau zehn Prozent Überschreitung verlängern nicht.}
\usage{
modernisierung_erhoehungsbeginn(zugang_erklaerung = NULL,
  ankuendigung_ordnungsgemaess = NULL,
  angekuendigter_erhoehungsbetrag = NULL,
  tatsaechlicher_erhoehungsbetrag = NULL,
  erklaerung_wirksam = NULL)
}
\arguments{
\item{zugang_erklaerung}{Kalenderdatum des Zugangs der Mieterhöhungserklärung als ISO-Zeichenfolge JJJJ-MM-TT im Bereich 0001 bis 9999; der Zugangstag wird nicht automatisch rechtlich festgestellt.}
\item{ankuendigung_ordnungsgemaess}{Expliziter Wahrheitswert, ob die Ankündigung den in § 559b Absatz 2 Nummer 1 genannten Anforderungen des § 555c entspricht, einschließlich einschlägiger Ausnahmen. FALSE auch bei fehlender erforderlicher Ankündigung.}
\item{angekuendigter_erhoehungsbetrag}{Nichtnegative EUR-Dezimalzeichenfolge oder exaktes Bruchobjekt mit zaehler/nenner nach NUMERIK.md. Angekündigter Erhöhungsbetrag, nicht gesamte Miete. Bei vollständig fehlender Ankündigung ausdrücklich null Euro eingeben. Gleicher Bezugszeitraum wie der tatsächliche Betrag.}
\item{tatsaechlicher_erhoehungsbetrag}{Nichtnegative EUR-Dezimalzeichenfolge oder exaktes Bruchobjekt mit zaehler/nenner nach NUMERIK.md. Rechtlich ermittelter tatsächlicher Erhöhungsbetrag im gleichen Bezugszeitraum wie die Ankündigung; keine automatische Kosten- oder Kappungsberechnung.}
\item{erklaerung_wirksam}{Expliziter Wahrheitswert zur wirksamen Erhöhungserklärung und sonstigen Voraussetzungen des ausgewählten Falls. Form, Berechnung und Erläuterung nach § 559b Absatz 1 sowie Besonderheiten des Verfahrens sind zuvor zu prüfen; FALSE ergibt NICHT_ANWENDBAR.}
}
\details{Berechnet den Beginn der erhöhten Miete, nicht die Fälligkeit einer konkreten Zahlung. Keine Verschiebung von Sonn- oder Feiertagen. Die beiden Verlängerungsgründe werden mit ODER verbunden und nicht kumuliert. Entsprechende Anwendung im vereinfachten Verfahren (§ 559c Absatz 3) und beim Heizungseinbau (§ 559e Absatz 4) setzt deren gesonderte Voraussetzungen voraus. Keine Ermittlung der zulässigen Erhöhung oder Prüfung der Ankündigungs- und Erklärungsvoraussetzungen. Gleiche Bezugszeiträume der beiden Beträge sind durch den Aufrufer sicherzustellen.}
\value{S3-Objekt bgb_ergebnis. ISO-Datum in wert; bei NICHT_ANWENDBAR wert null. Ergebnisobjekt enthält ursprüngliche Eingaben, Nutzervorgaben und die beiden Verzögerungsprüfungen. Datumsüberschreitung über 9999 führt zu EINGABE_UNGUELTIG. Fehlende oder ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\examples{
modernisierung_erhoehungsbeginn("2026-01-31", TRUE, "100", "110", TRUE)
}
