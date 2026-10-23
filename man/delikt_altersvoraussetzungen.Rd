\name{delikt_altersvoraussetzungen}
\alias{delikt_altersvoraussetzungen}
\title{delikt altersvoraussetzungen}
\description{Unter7 Ausschluss nach §828 Abs.1. Ab7 und unter10 bei sachlich anwendbarem Unfallprivileg Ausschluss nach Abs.2, außer vorsätzlich herbeigeführter Verletzung. Soweit Abs.1/2 nicht ausschließen, unter18 Ausschluss nach Abs.3 bei fehlender erforderlicher Einsicht. Ab18 kein Ausschluss durch §828.}
\usage{
delikt_altersvoraussetzungen(geburtsdatum = NULL,
  handlungstag = NULL,
  unfallprivileg_sachlich_anwendbar = NULL,
  verletzung_vorsaetzlich = NULL,
  erforderliche_einsicht_vorhanden = NULL)
}
\arguments{
  \item{geburtsdatum}{Tatsächliches Geburtsdatum als ISO-Zeichenfolge YYYY-MM-DD. Der Tag wird bei der Altersberechnung nach §187 Abs.2 mitgerechnet; die Geburtsuhrzeit ist für diese Altersstufen nicht maßgeblich. Keine Aussage zum tatsächlichen Beginn der Rechtsfähigkeit vor der Geburt.}
  \item{handlungstag}{ISO-Datum der schädigenden Handlung; darf nicht vor der Geburt liegen. Das Lebensalter wird auf diesen Tag bezogen, nicht auf einen späteren Zahlungs- oder Gerichtstermin.}
  \item{unfallprivileg_sachlich_anwendbar}{Expliziter Wahrheitswert zur rechtlich bewerteten sachlichen Anwendbarkeit des Unfallprivilegs nach §828 Abs.2 bei Unfall mit Kraftfahrzeug, Schienenbahn oder Schwebebahn. Altersgrenzen und Vorsatzausnahme nicht in diesen Wert vorwegnehmen; sie werden berechnet. Die sachliche Einordnung wird nicht automatisch aus einem beliebigen Fahrzeugkontakt hergeleitet.}
  \item{verletzung_vorsaetzlich}{Expliziter Wahrheitswert zur vorsätzlichen Herbeiführung der Verletzung. TRUE beseitigt nur den Ausschluss des §828 Abs.2, nicht pauschal den Altersausschluss unter7 oder die Prüfung des Absatzes3.}
  \item{erforderliche_einsicht_vorhanden}{Expliziter Wahrheitswert, ob bei Begehung der schädigenden Handlung die zur Erkenntnis der Verantwortlichkeit erforderliche Einsicht vorlag. Keine automatische psychologische Bewertung. Erst subsidiär nach Absätzen1/2 und nur unter18 berücksichtigt. Alle Wahrheitswerte müssen ausdrücklich vorliegen, auch wenn der Alterszweig sie im Einzelfall nicht benötigt.}
}
\details{Kein vollständiger Schadensersatzanspruch oder allgemeiner Haftungsstatus. Sachlicher Anwendungsbereich des Unfallprivilegs, Vorsatz und Einsicht sind ausdrücklich bewertete Nutzervorgaben. FALSE beim Gesamtausschluss bedeutet lediglich keinen Ausschluss nach dieser Regel; Tatbestand, §827, Billigkeitshaftung nach §829, Aufsichtspflichten und weitere Normen sind gesondert. Keine automatische Feststellung psychischer Zustände oder tatsächlicher Unfallumstände.}
\value{wert enthält vollendete_lebensjahre, ausschluss_nach_absatz_1, ausschluss_nach_absatz_2, ausschluss_nach_absatz_3 und verantwortlichkeit_nach_828_ausgeschlossen. Der Gesamtausschluss ist die Vereinigung der drei gesetzlichen Zweige; deren Vorrang wird berücksichtigt. Status BERECHNET bedeutet durchgeführte Teilprüfung. Fehler als bgb_berechnungsfehler mit EINGABE_FEHLT oder EINGABE_UNGUELTIG.}
\examples{
delikt_altersvoraussetzungen("2017-05-20", "2026-05-20", TRUE, FALSE, TRUE)
}
