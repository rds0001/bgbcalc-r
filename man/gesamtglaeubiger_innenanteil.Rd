\name{gesamtglaeubiger_innenanteil}
\alias{gesamtglaeubiger_innenanteil}
\title{Gleichanteil nach § 430}
\description{Bei anwendbarer gleichanteiliger Innenberechtigung: Anteilsquote=1geteilt durch Anzahl der Gesamtgläubiger; rechnerischer Innenanteil=Gesamtleistung mal Anteilsquote.}
\usage{
gesamtglaeubiger_innenanteil(gesamtleistung = NULL,
  anzahl_gesamtglaeubiger = NULL,
  leistungseinheit = NULL,
  gleichanteilige_innenberechtigung_anwendbar = NULL)
}
\arguments{
\item{gesamtleistung}{Nichtnegative Dezimalzeichenfolge oder exaktes Bruchobjekt mit zaehler/nenner nach NUMERIK.md. Bezifferte Gesamtleistung in der gesondert angegebenen Einheit; keine automatische Bewertung oder Umrechnung.}
\item{anzahl_gesamtglaeubiger}{Ganzzahl zwischen 2 und 9007199254740991. Gezählt werden ausschließlich die Personen auf der aufzuteilenden Seite; die Gegenpartei nicht mitzählen. Keine Anzahl verschiedener Ansprüche oder Leistungsteile.}
\item{leistungseinheit}{Nichtleere Zeichenfolge der gemeinsamen Leistungseinheit, beispielsweise EUR oder kg. Wird als Ergebniseinheit übernommen; keine Umrechnung und keine automatische Cent- oder Stückrundung. Physische Teilbarkeit und rechtliche Einordnung bleiben gesonderte Tatsachen.}
\item{gleichanteilige_innenberechtigung_anwendbar}{Expliziter Wahrheitswert: Gesamtgläubigerschaft liegt vor und im Innenverhältnis ist kein anderer Anteil bestimmt (§ 430). FALSE ergibt NICHT_ANWENDBAR. Eine abweichende Bestimmung wird nicht automatisch verworfen oder durch Gleichanteile ersetzt.}
}
\details{Nur rechnerische gleiche Innenberechtigung der Gesamtgläubiger nach §430. Die gegenüber dem Schuldner bestehende Außenberechtigung wird nicht auf diesen Innenanteil reduziert. Keine Abrechnung bereits vereinnahmter Leistungen, kein selbständiger Ausgleichsanspruch in exakt dieser Höhe ohne Prüfung weiterer Voraussetzungen. Abweichende Bestimmungen und andere Gläubigerformen bleiben gesondert.}
\value{S3-Objekt bgb_ergebnis. wert enthält anteilsquote als exakten dimensionslosen Bruch und leistungsanteil als exakten Bruch in leistungseinheit. Bei NICHT_ANWENDBAR ist wert null. Keine automatische Rundung; Nutzerangaben einschließlich Einheit bleiben im Ergebnis sichtbar. Fehlende oder ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\examples{
gesamtglaeubiger_innenanteil("120", 3, "EUR", TRUE)
}
