\name{gemeinschaft_lastenanteile}
\alias{gemeinschaft_lastenanteile}
\title{Lasten und Kosten der Bruchteilsgemeinschaft}
\description{Der Lasten- oder Kostenbetrag wird mit dem jeweiligen Teilhaberanteil multipliziert. Bei ausdrücklich ausgewählter Zweifelsregel nach § 742 erhält jeder Teilhaber den Anteil 1/Anzahl der Teilhaber.}
\usage{
gemeinschaft_lastenanteile(gesamtbetrag = NULL,
  teilhaber = NULL,
  gleiche_anteile_im_zweifel = NULL,
  gemeinschaft_nach_bruchteilen = NULL)
}
\arguments{
\item{gesamtbetrag}{Nichtnegative EUR-Dezimalzeichenfolge der für § 748 rechtlich maßgeblichen Lasten oder Kosten. Nur gemeinschaftliche Lasten und Kosten der Erhaltung, Verwaltung oder gemeinschaftlichen Benutzung einbeziehen. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{teilhaber}{Liste mit 2 bis 1000 Objekten mit genau person_id, anteil_zaehler und anteil_nenner. Kennungen nichtleer und eindeutig. Bei vorgegebenen Anteilen sind Zähler und Nenner positive ganze Zahlen innerhalb NUMERIK.md und die Anteile summieren sich zu 1. Bei ausdrücklich gewählter Zweifelsregel beide Anteilsfelder jedes Teilhabers NULL in R beziehungsweise None in Python. In R eine Liste benannter Listen verwenden. R-Sammlungen müssen unbenannte Listen sein; enthaltene Datensätze behalten ihre ausdrücklich benannten Felder. Benannte Objekte sind auch bei Leerheit kein Ersatz für eine Sammlung. Siehe EINGABESTRUKTUREN.md.}
\item{gleiche_anteile_im_zweifel}{Expliziter Wahrheitswert, ob die Zweifelsregel gleicher Anteile nach § 742 für diesen Fall ausgewählt ist. Kein stillschweigender Ersatz für fehlende Angaben zu bekannten Anteilen.}
\item{gemeinschaft_nach_bruchteilen}{Expliziter Wahrheitswert zur rechtlichen Einordnung nach § 741 einschließlich der Prüfung vorrangiger gesetzlicher Sonderregeln.}
}
\details{Abgegrenzte Kostenverteilung nach § 748 innerhalb einer Bruchteilsgemeinschaft. Rechtsgrund, Erstattungsfähigkeit, wirksame abweichende Regelungen und einschlägiges Sonderrecht sind vorab zu prüfen. Keine automatische Beschlussprüfung oder Berechnung von Ansprüchen aus einer eigenmächtigen Maßnahme. Die Funktion verteilt den vorgegebenen Gesamtbetrag, bestimmt aber keinen bereits durch Zahlung ausgelösten Ausgleichsanspruch und verrechnet keine Vorleistungen. Kein WEG-Abrechnungsautomat. Technische Gruppengrenze 1000, keine gesetzliche Obergrenze. Zwei Teilhaber mindestens, weil eine Gemeinschaft mehrerer vorausgesetzt ist.}
\value{S3-Objekt bgb_ergebnis. wert ist eine Liste in Eingabereihenfolge mit person_id, anteil und betrag. Anteil und EUR-Betrag sind exakte Brüche als zaehler/nenner-Ganzzahlzeichenfolgen. Die Beträge ergeben zusammen den Gesamtbetrag; keine Cent-Rundung. Bei NICHT_ANWENDBAR ist wert null. Fehlende oder ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\examples{
gemeinschaft_lastenanteile("120", list(
  list(person_id = "A", anteil_zaehler = 1, anteil_nenner = 3),
  list(person_id = "B", anteil_zaehler = 2, anteil_nenner = 3)), FALSE, TRUE)
}
