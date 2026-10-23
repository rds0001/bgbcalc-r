\name{lebensalter_beginn}
\alias{lebensalter_beginn}
\title{lebensalter beginn}
\description{Geburtstag mitzählen. Beginn nach Vollendung der angeforderten Lebensjahre ist der Tag nach dem nach Tagesbeginnprinzip errechneten Jahresfristende. Bei Geburt am 29. Februar und nichtschaltigem Zieljahr: 1. März; kein Feiertagsaufschub. Alter 0 entspricht Geburtstagsbeginn, nicht dem tatsächlichen Geburtszeitpunkt.}
\usage{
lebensalter_beginn(geburtsdatum = NULL,
  lebensjahre = NULL)
}
\arguments{
  \item{geburtsdatum}{Geburtstag als ISO-Datum. Uhrzeit wird für das Lebensalter nach § 187 Abs. 2 nicht verwendet.}
  \item{lebensjahre}{Nichtnegative ganze Zahl zu vollendender Jahre, höchstens 3652059. Null liefert den Geburtstagsbeginn; kein Ersatz für den tatsächlichen Beginn der Rechtsfähigkeit.}
}
\details{Feste lokale BGB-Fassung; anwendbare Fristbestimmung bereits ausgewählt. Speziellere gesetzliche Vorschriften/abweichende wirksame Bestimmung vorher prüfen. § 193 ist ausschließlich separate explizite Operation. Keine automatische Feiertagsverschiebung. Keine historischen Fassungen behaupten. Proleptischer gregorianischer Kalender, Jahr 0001..9999. Ganze Anzahlen maximal 3652059 (technischer Schutz, keine gesetzliche Grenze); Überschreitung des Datumsbereichs als EINGABE_UNGUELTIG. Keine Uhrzeiten, keine Zeitzonen.}
\value{Ein Objekt der Klasse \code{bgb_ergebnis} mit wert, einheit, regel_id, regelversion, quellenfassung, eingaben, nutzervorgaben, rechenschritte, annahmen, hinweise und status. Datumswerte sind ISO-Zeichenfolgen, Tageszahlen exakte ganze Zahlen. Fehlende Werte erzeugen eine Condition der Klasse \code{bgb_berechnungsfehler} mit status EINGABE_FEHLT, ungültige Werte mit EINGABE_UNGUELTIG. Kein implizites Vektorrecycling.}
\examples{
lebensalter_beginn("2008-02-29", 18)
}
