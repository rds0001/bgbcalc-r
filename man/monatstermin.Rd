\name{monatstermin}
\alias{monatstermin}
\title{monatstermin}
\description{Anfang=1, Mitte=15, Ende=letzter Tag des konkret angegebenen Monats.}
\usage{
monatstermin(jahr = NULL,
  monat = NULL,
  lage = NULL)
}
\arguments{
  \item{jahr}{Ganzes Kalenderjahr von 1 bis 9999.}
  \item{monat}{Ganze Monatszahl von 1 bis 12.}
  \item{lage}{anfang, mitte oder ende. Mitte bedeutet den 15. und nicht die Hälfte der Monatslänge.}
}
\details{Feste lokale BGB-Fassung; anwendbare Fristbestimmung bereits ausgewählt. Speziellere gesetzliche Vorschriften/abweichende wirksame Bestimmung vorher prüfen. § 193 ist ausschließlich separate explizite Operation. Keine automatische Feiertagsverschiebung. Keine historischen Fassungen behaupten. Proleptischer gregorianischer Kalender, Jahr 0001..9999. Ganze Anzahlen maximal 3652059 (technischer Schutz, keine gesetzliche Grenze); Überschreitung des Datumsbereichs als EINGABE_UNGUELTIG. Keine Uhrzeiten, keine Zeitzonen.}
\value{Ein Objekt der Klasse \code{bgb_ergebnis} mit wert, einheit, regel_id, regelversion, quellenfassung, eingaben, nutzervorgaben, rechenschritte, annahmen, hinweise und status. Datumswerte sind ISO-Zeichenfolgen, Tageszahlen exakte ganze Zahlen. Fehlende Werte erzeugen eine Condition der Klasse \code{bgb_berechnungsfehler} mit status EINGABE_FEHLT, ungültige Werte mit EINGABE_UNGUELTIG. Kein implizites Vektorrecycling.}
\examples{
monatstermin(2024, 2, "ende")
}
