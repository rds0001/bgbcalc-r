\name{modernisierung_drittmittel_aufteilen}
\alias{modernisierung_drittmittel_aufteilen}
\title{Zuordnung von Modernisierungs-Drittmitteln}
\description{Wohnungsanteil = aufgewendete Kosten der Wohnung / Summe der Kosten aller einbezogenen Wohnungen. Zugeordnete Drittmittel = Gesamtmittel * Wohnungsanteil.}
\usage{
modernisierung_drittmittel_aufteilen(gesamtmittel = NULL,
  wohnungskosten = NULL,
  zuordnung_feststellbar = NULL)
}
\arguments{
\item{gesamtmittel}{Nichtnegativer Gesamtbetrag der nach § 559a den einbezogenen Wohnungen zuzuordnenden Zuschüsse oder Darlehen in EUR; Dezimalzeichenfolge oder exaktes Bruchobjekt gemäß NUMERIK.md. Förderart und maßgeblichen Betrag vorab rechtlich bestimmen.}
\item{wohnungskosten}{Liste mit 1 bis 1000 Objekten mit genau wohnung_id und aufgewendete_kosten. Kennungen nichtleer und eindeutig. Kosten je Wohnung sind nichtnegative EUR-Dezimalzeichenfolgen oder exakte Bruchobjekte; ihre Summe muss positiv sein. In R eine Liste benannter Listen verwenden. R-Sammlungen müssen unbenannte Listen sein; enthaltene Datensätze behalten ihre ausdrücklich benannten Felder. Benannte Objekte sind auch bei Leerheit kein Ersatz für eine Sammlung. Siehe EINGABESTRUKTUREN.md.}
\item{zuordnung_feststellbar}{Expliziter Wahrheitswert, ob festgestellt werden kann, in welcher Höhe die Zuschüsse oder Darlehen für die einzelnen Wohnungen gewährt wurden. Bei wahr ist der Auffangschlüssel nicht anwendbar.}
}
\details{Auffangverteilung nach § 559a Abs. 4 nur bei nicht feststellbarer Einzelzuordnung. Bereits bekannte Förderzuordnungen nicht durch diesen Schlüssel ersetzen. Rechtliche Förderfähigkeit, förderrechtliche Höchstbeträge, Kostenabgrenzung und die Auswahl der tatsächlich vom Förderbetrag erfassten Wohnungen sind vorab zu prüfen. Die Funktion verteilt nur den vorgegebenen Betrag und bestimmt keine Förderung oder Darlehenshöhe selbst. Bei unterschiedlichen Fördergruppen getrennt rechnen und Beträge nicht doppelt zuordnen. Keine unmittelbare Mieterhöhung: Zuschussabzug und Zinsvorteil eines zugeordneten Darlehens sind unterschiedliche Folgeschritte. Technische Grenze 1000 Wohnungen, keine gesetzliche Grenze.}
\value{S3-Objekt bgb_ergebnis. wert ist eine Liste in Eingabereihenfolge mit wohnung_id, kostenanteil und drittmittel. Kostenanteil und zugeordneter EUR-Betrag sind exakte Brüche; alle zugeordneten Beträge summieren sich zum Gesamtmittelbetrag. Das Feld drittmittel kann ohne Rundung an eine fachlich passende weitere Betragsfunktion übergeben werden. Bei NICHT_ANWENDBAR ist wert null. Fehlende oder ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\seealso{\code{\link{bgb_zahleneingaben}}}
\examples{
modernisierung_drittmittel_aufteilen("300", list(
  list(wohnung_id = "A", aufgewendete_kosten = "100"),
  list(wohnung_id = "B", aufgewendete_kosten = "200")), FALSE)
}
