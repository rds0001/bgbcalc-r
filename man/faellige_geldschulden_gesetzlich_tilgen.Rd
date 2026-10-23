\name{faellige_geldschulden_gesetzlich_tilgen}
\alias{faellige_geldschulden_gesetzlich_tilgen}
\title{Gesetzliche Tilgung mehrerer fälliger Geldschulden}
\description{Bei anwendbarer Auffangregel ohne Bestimmung: Ranggruppen lexikographisch nach Sicherheit, Lästigkeit und Alter aufsteigend bilden. Zahlung nacheinander bis zum Gruppenbetrag einsetzen. Innerhalb einer vollständig gleichrangigen Gruppe Zahlung im Verhältnis der positiven offenen Schuldbeträge verteilen. Jeder Schuld höchstens ihren offenen Betrag zuweisen, Restschuld und nicht zugeordnete Zahlung exakt ausweisen.}
\usage{
faellige_geldschulden_gesetzlich_tilgen(zahlung = NULL,
  schulden = NULL,
  tilgungsbestimmung_getroffen = NULL,
  gesetzliche_reihenfolge_anwendbar = NULL)
}
\arguments{
  \item{zahlung}{Nichtnegative Dezimalzeichenfolge oder exaktes Bruchobjekt mit Zeichenfolgenfeldern zaehler und nenner nach NUMERIK.md. Zahlung in EUR, ohne automatische Cent-Rundung.}
  \item{schulden}{Unbenannte Liste mit 2 bis 1000 bereits fälligen Geldschulden desselben Schuldners gegenüber demselben Gläubiger, sämtlich in EUR. Jede Schuld ist ein Objekt mit genau schuld_id (eindeutige nichtleere Zeichenfolge), offener_betrag (positive Dezimalzeichenfolge oder exaktes Bruchobjekt), sicherheitsrang, laestigkeitsrang und altersrang (jeweils ganze Zahl von 1 bis 9007199254740991). Kleinere Rangzahl bedeutet geringere Sicherheit für den Gläubiger, größere Lästigkeit für den Schuldner beziehungsweise ältere Schuld. Gleiche Zahlen bedeuten rechtlich gleichrangig. Ränge sind ausschließlich ordinale, fachlich begründete Nutzervorgaben, keine Geldwerte, Gewichtungen oder automatisch ermittelten Bewertungen. Die Liste muss die für diese fällige Verteilungsstufe relevanten Schulden vollständig enthalten; einzelne Schuld nicht in mehrere Positionen zerlegen. Kosten, Zinsen und Hauptforderung innerhalb derselben Schuld sind gesondert zu behandeln.}
  \item{tilgungsbestimmung_getroffen}{Expliziter Wahrheitswert, ob der Schuldner bei der Leistung eine maßgebliche Tilgungsbestimmung getroffen hat. TRUE sperrt diese Auffangfunktion mit NICHT_ANWENDBAR; die Bestimmung wird hier nicht ausgeführt oder ausgelegt.}
  \item{gesetzliche_reihenfolge_anwendbar}{Expliziter Wahrheitswert zur Anwendbarkeit der gesetzlichen Auffangreihenfolge für die eingegebene Gruppe bereits fälliger Geldschulden. Gleichartige Leistungen zwischen denselben Parteien, keine vorrangige wirksame Vereinbarung oder Spezialregel und rechtlich zulässige Zahlung vorausgesetzt. FALSE ergibt NICHT_ANWENDBAR. Dieser Parameter bestimmt nicht die Rangfolge; diese wird aus den drei gesetzlichen Rangmerkmalen berechnet.}
}
\details{Ausdrücklich nur bereits fällige Geldschulden nach §366 Abs.2; die Stufenauswahl gegenüber noch nicht fälligen Schulden ist nicht implementiert. Tilgungsbestimmung nach Abs.1 und vorrangige Spezialregeln führen hier zu NICHT_ANWENDBAR. Keine automatische Bewertung von Sicherheit, Lästigkeit, Schuldalter, Fälligkeit oder Erfüllbarkeit. Keine Verteilung innerhalb einer Schuld nach §367; dafür gegebenenfalls zahlung_anrechnen separat verwenden. Bei Zahlung oberhalb aller erfassten fälligen Schulden bleibt Überschuss unzugeordnet; keine automatische Tilgung nicht fälliger Schulden oder Rückerstattungsentscheidung.}
\value{wert enthält zuordnungen in ursprünglicher Eingabereihenfolge, jeweils schuld_id, tilgungsbetrag und restschuld, sowie nicht_zugeordnet. Alle Geldwerte sind exakte Bruchobjekte. Bei NICHT_ANWENDBAR ist wert null. rechenschritte dokumentieren jede Ranggruppe in gesetzlicher Reihenfolge. Fehler als bgb_berechnungsfehler mit EINGABE_FEHLT oder EINGABE_UNGUELTIG.}
\examples{
faellige_geldschulden_gesetzlich_tilgen("100", list(
  list(schuld_id = "A", offener_betrag = "100",
    sicherheitsrang = 1, laestigkeitsrang = 1, altersrang = 1),
  list(schuld_id = "B", offener_betrag = "300",
    sicherheitsrang = 1, laestigkeitsrang = 1, altersrang = 1)), FALSE, TRUE)
}
