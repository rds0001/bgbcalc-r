\name{modernisierung_haerteberuecksichtigung}
\alias{modernisierung_haerteberuecksichtigung}
\title{Berücksichtigung von Härteumständen}
\description{Prüft, ob § 559 Absatz 4 eine Härteabwägung vorsieht und ob Härteumstände nach Absatz 5 berücksichtigt werden können. Im vereinfachten Verfahren entfällt die Abwägung außer bei qualifiziertem Heizungseinbau. Der lediglich allgemein übliche Zustand schließt sie aus. Nicht zu vertretende Umstände schließen sie aus, außer bei qualifiziertem Heizungseinbau. Bei vorgesehener Abwägung sind rechtzeitig mitgeteilte Umstände berücksichtigungsfähig; die Ausschlussfrist greift außerdem nicht bei mehr als zehn Prozent Überschreitung der Ankündigung.}
\usage{
modernisierung_haerteberuecksichtigung(vereinfachtes_verfahren = NULL,
  qualifizierter_heizungseinbau = NULL,
  allgemein_ueblicher_zustand = NULL,
  umstaende_nicht_zu_vertreten = NULL,
  haerteumstaende_rechtzeitig_mitgeteilt = NULL,
  angekuendigter_erhoehungsbetrag = NULL,
  tatsaechlicher_erhoehungsbetrag = NULL)
}
\arguments{
\item{vereinfachtes_verfahren}{Expliziter Wahrheitswert zur rechtlich zuvor bestimmten Anwendung des vereinfachten Verfahrens nach § 559c.}
\item{qualifizierter_heizungseinbau}{Expliziter Wahrheitswert: Maßnahme erfüllt § 555b Nummer 1 oder 1a und erfolgt durch Einbau oder Aufstellung einer Heizungsanlage zur Inbetriebnahme in einem Gebäude. Beide Merkmale müssen vorliegen; keine automatische technische Einordnung.}
\item{allgemein_ueblicher_zustand}{Expliziter Wahrheitswert, ob die Mietsache lediglich in einen allgemein üblichen Zustand versetzt wurde (§ 559 Absatz 4 Satz 2 Nummer 1). Nutzerbewertung, keine automatische Bestimmung des Standards.}
\item{umstaende_nicht_zu_vertreten}{Expliziter Wahrheitswert, ob die Maßnahme aufgrund vom Vermieter nicht zu vertretender Umstände durchgeführt wurde (§ 559 Absatz 4 Satz 2 Nummer 2).}
\item{haerteumstaende_rechtzeitig_mitgeteilt}{Expliziter Wahrheitswert zur rechtzeitigen Mitteilung nach § 555d Absätzen 3 bis 5 einschließlich der dortigen Ausnahmen; diese Fristenprüfung erfolgt außerhalb dieser Funktion.}
\item{angekuendigter_erhoehungsbetrag}{Nichtnegative EUR-Dezimalzeichenfolge oder exaktes Bruchobjekt mit zaehler/nenner nach NUMERIK.md. Angekündigter Erhöhungsbetrag, nicht die gesamte Miete; bei fehlender Ankündigung ausdrücklich null Euro. Gleicher Bezugszeitraum wie der tatsächliche Betrag.}
\item{tatsaechlicher_erhoehungsbetrag}{Nichtnegative EUR-Dezimalzeichenfolge oder exaktes Bruchobjekt mit zaehler/nenner nach NUMERIK.md. Tatsächlicher, zuvor rechtlich ermittelter Erhöhungsbetrag im gleichen Bezugszeitraum; keine Berechnung seiner Zulässigkeit.}
}
\details{Rechenrelevante Auswahlregel, keine Bewertung der Härte und keine Ermittlung des zulässigen Erhöhungsbetrags. Ergebnis BERECHNET auch bei verneinter Berücksichtigungsfähigkeit. Liegen berücksichtigungsfähige Umstände vor, müssen künftige Betriebskosten und berechtigte Vermieterinteressen in der gesonderten Abwägung nach § 559 Absatz 4 berücksichtigt werden. Deren Ergebnis wird nicht vorweggenommen. Entsprechende Anwendung nach § 559e Absatz 4 setzt den ausgewählten Fall voraus. § 555d Absätze 3 bis 5, Ankündigung, Erhöhungserklärung und sonstige Voraussetzungen bleiben gesondert zu prüfen.}
\value{S3-Objekt bgb_ergebnis. wert enthält die Wahrheitswerte abwaegung_vorgesehen, umstaende_beruecksichtigungsfaehig und zehnprozentgrenze_ueberschritten. Die letzte Angabe beschreibt nur den Betragsvergleich, auch wenn die Abwägung aus einem anderen Grund entfällt. Kein Geldbetrag und keine Aussage, ob tatsächlich eine unzumutbare Härte vorliegt. Fehlende oder ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\examples{
modernisierung_haerteberuecksichtigung(FALSE, TRUE, FALSE, TRUE, FALSE, "100", "110.01")
}
