\name{werktagsverschiebung}
\alias{werktagsverschiebung}
\title{werktagsverschiebung}
\description{Für Leistung/Willenserklärung Samstag, Sonntag und ausdrücklich übergebene örtliche gesetzliche Feiertage überspringen bis nächster zulässiger Tag. Keine Anwendung auf Lebensalter oder beliebige sonstige Fristen.}
\usage{
werktagsverschiebung(datum = NULL,
  anwendungsfall = NULL,
  feiertage = NULL,
  ort = NULL,
  kalenderquelle = NULL,
  kalender_von = NULL,
  kalender_bis = NULL)
}
\arguments{
  \item{datum}{Ausgangsdatum der Leistung oder Willenserklärung als ISO-Zeichenfolge.}
  \item{anwendungsfall}{Ausschließlich leistung oder willenserklaerung; keine automatische Übertragung auf Lebensalter, Kündigungsfristen oder andere Tatbestände.}
  \item{feiertage}{Explizite Liste oder Zeichenfolge der am angegebenen Ort gesetzlich anerkannten allgemeinen Feiertage; character(0) beziehungsweise list() bedeutet ausdrücklich keine Feiertage im bestätigten Bereich. NULL bedeutet fehlend. Keine Netzanfrage. In R sind nur unbenannte Listen beziehungsweise unbenannte Zeichenvektoren zulässig; benannte Objekte sind keine geordneten Folgen.}
  \item{ort}{Nichtleere Bezeichnung des Erklärungs- oder Leistungsorts; die Library ermittelt die Zuständigkeit nicht.}
  \item{kalenderquelle}{Nichtleere Herkunfts- und Versionsangabe des Nutzerkalenders. Seine Vollständigkeit für den angegebenen Zeitraum wird vorausgesetzt und ausgewiesen.}
  \item{kalender_von}{Erster eingeschlossener Tag des bestätigten Feiertagskalenders als ISO-Datum.}
  \item{kalender_bis}{Letzter eingeschlossener Tag des bestätigten Feiertagskalenders. Reicht dieser nicht bis zum nächsten zulässigen Tag, wird die Berechnung abgebrochen.}
}
\details{Feste lokale BGB-Fassung; anwendbare Fristbestimmung bereits ausgewählt. Speziellere gesetzliche Vorschriften/abweichende wirksame Bestimmung vorher prüfen. § 193 ist ausschließlich separate explizite Operation. Keine automatische Feiertagsverschiebung. Keine historischen Fassungen behaupten. Proleptischer gregorianischer Kalender, Jahr 0001..9999. Ganze Anzahlen maximal 3652059 (technischer Schutz, keine gesetzliche Grenze); Überschreitung des Datumsbereichs als EINGABE_UNGUELTIG. Keine Uhrzeiten, keine Zeitzonen.}
\value{Ein Objekt der Klasse \code{bgb_ergebnis} mit wert, einheit, regel_id, regelversion, quellenfassung, eingaben, nutzervorgaben, rechenschritte, annahmen, hinweise und status. Datumswerte sind ISO-Zeichenfolgen, Tageszahlen exakte ganze Zahlen. Fehlende Werte erzeugen eine Condition der Klasse \code{bgb_berechnungsfehler} mit status EINGABE_FEHLT, ungültige Werte mit EINGABE_UNGUELTIG. Kein implizites Vektorrecycling.}
\examples{
werktagsverschiebung("2026-10-24", "leistung", character(0),
  "Testort", "Synthetischer Testkalender", "2026-10-01", "2026-10-31")
}
