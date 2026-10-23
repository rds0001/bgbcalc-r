\name{volljaehrigkeitsbeginn}
\alias{volljaehrigkeitsbeginn}
\title{volljaehrigkeitsbeginn}
\description{Lebensalterbeginn mit 18 Jahren, ohne Feiertagsverschiebung.}
\usage{
volljaehrigkeitsbeginn(geburtsdatum = NULL)
}
\arguments{
  \item{geburtsdatum}{Geburtstag als ISO-Datum. Uhrzeit wird für das Lebensalter nach § 187 Abs. 2 nicht verwendet.}
}
\details{Feste lokale BGB-Fassung; anwendbare Fristbestimmung bereits ausgewählt. Speziellere gesetzliche Vorschriften/abweichende wirksame Bestimmung vorher prüfen. § 193 ist ausschließlich separate explizite Operation. Keine automatische Feiertagsverschiebung. Keine historischen Fassungen behaupten. Proleptischer gregorianischer Kalender, Jahr 0001..9999. Ganze Anzahlen maximal 3652059 (technischer Schutz, keine gesetzliche Grenze); Überschreitung des Datumsbereichs als EINGABE_UNGUELTIG. Keine Uhrzeiten, keine Zeitzonen.}
\value{Ein Objekt der Klasse \code{bgb_ergebnis} mit wert, einheit, regel_id, regelversion, quellenfassung, eingaben, nutzervorgaben, rechenschritte, annahmen, hinweise und status. Datumswerte sind ISO-Zeichenfolgen, Tageszahlen exakte ganze Zahlen. Fehlende Werte erzeugen eine Condition der Klasse \code{bgb_berechnungsfehler} mit status EINGABE_FEHLT, ungültige Werte mit EINGABE_UNGUELTIG. Kein implizites Vektorrecycling.}
\examples{
volljaehrigkeitsbeginn("2008-02-29")
}
