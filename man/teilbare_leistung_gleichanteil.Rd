\name{teilbare_leistung_gleichanteil}
\alias{teilbare_leistung_gleichanteil}
\title{Gleichanteil nach § 420}
\description{Bei teilbarer Leistung und anwendbarer Zweifelsregel: Anteilsquote=1geteilt durch Anzahl der beteiligten Schuldner beziehungsweise Gläubiger; Leistungsanteil=Gesamtleistung mal Anteilsquote.}
\usage{
teilbare_leistung_gleichanteil(gesamtleistung = NULL,
  anzahl_beteiligte = NULL,
  leistungseinheit = NULL,
  rollenart = NULL,
  leistung_teilbar = NULL,
  gleichanteilsvermutung_anwendbar = NULL)
}
\arguments{
\item{gesamtleistung}{Nichtnegative Dezimalzeichenfolge oder exaktes Bruchobjekt mit zaehler/nenner nach NUMERIK.md. Bezifferte Gesamtleistung in der gesondert angegebenen Einheit; keine automatische Bewertung oder Umrechnung.}
\item{anzahl_beteiligte}{Ganzzahl zwischen 2 und 9007199254740991. Gezählt werden ausschließlich die Personen auf der aufzuteilenden Seite; die Gegenpartei nicht mitzählen. Keine Anzahl verschiedener Ansprüche oder Leistungsteile.}
\item{leistungseinheit}{Nichtleere Zeichenfolge der gemeinsamen Leistungseinheit, beispielsweise EUR oder kg. Wird als Ergebniseinheit übernommen; keine Umrechnung und keine automatische Cent- oder Stückrundung. Physische Teilbarkeit und rechtliche Einordnung bleiben gesonderte Tatsachen.}
\item{rollenart}{Auswahl teilschuld oder teilforderung. Im ersten Fall sind Schuldner zu zählen, im zweiten Gläubiger. Keine Auswahl einer Gesamtschuld oder Gesamtgläubigerschaft nach anderen Vorschriften.}
\item{leistung_teilbar}{Expliziter Wahrheitswert zur Teilbarkeit der Leistung. FALSE ergibt NICHT_ANWENDBAR.}
\item{gleichanteilsvermutung_anwendbar}{Expliziter Wahrheitswert zur Zweifelsregel des § 420: keine vorrangige abweichende Zuordnung oder andere Haftungs-/Berechtigungsform. FALSE ergibt NICHT_ANWENDBAR; keine automatische Vertragsauslegung.}
}
\details{Nur Zweifelsregel für Teilschuld beziehungsweise Teilforderung nach §420. Keine Gesamtschuld, Gesamtgläubigerschaft, gemeinschaftliche Gläubigerschaft oder automatische Vertragsauslegung. Jede Person erhält hier den gleichen rechnerischen Anteil; bereits erbrachte Zahlungen, Einwendungen und abweichende Quoten sind gesondert. Bezifferte Mengen sind keine automatische Anordnung, eine physisch unteilbare Sache zu zerteilen.}
\value{S3-Objekt bgb_ergebnis. wert enthält anteilsquote als exakten dimensionslosen Bruch und leistungsanteil als exakten Bruch in leistungseinheit. Bei NICHT_ANWENDBAR ist wert null. Keine automatische Rundung; Nutzerangaben einschließlich Einheit bleiben im Ergebnis sichtbar. Fehlende oder ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\examples{
teilbare_leistung_gleichanteil("120", 3, "EUR", "teilschuld", TRUE, TRUE)
}
