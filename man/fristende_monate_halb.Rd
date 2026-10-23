\name{fristende_monate_halb}
\alias{fristende_monate_halb}
\title{fristende monate halb}
\description{Zuerst ganze Monate gemäß Kalenderfrist, danach exakt 15 Tage. Nicht zuerst 15 Tage und nicht 1,5*30 Tage.}
\usage{
fristende_monate_halb(anfangstag = NULL,
  ganze_monate = NULL,
  beginnart = NULL)
}
\arguments{
  \item{anfangstag}{Anknüpfungsdatum als ISO-Zeichenfolge YYYY-MM-DD. Ereignistag und Tagesbeginn werden über beginnart unterschieden.}
  \item{ganze_monate}{Positive ganze Zahl vollständiger Kalendermonate, höchstens 3652059; die 15 Tage werden danach gezählt.}
  \item{beginnart}{ereignis schließt den Anknüpfungstag aus; tagesbeginn zählt ihn mit.}
}
\details{Feste lokale BGB-Fassung; anwendbare Fristbestimmung bereits ausgewählt. Speziellere gesetzliche Vorschriften/abweichende wirksame Bestimmung vorher prüfen. § 193 ist ausschließlich separate explizite Operation. Keine automatische Feiertagsverschiebung. Keine historischen Fassungen behaupten. Proleptischer gregorianischer Kalender, Jahr 0001..9999. Ganze Anzahlen maximal 3652059 (technischer Schutz, keine gesetzliche Grenze); Überschreitung des Datumsbereichs als EINGABE_UNGUELTIG. Keine Uhrzeiten, keine Zeitzonen.}
\value{Ein Objekt der Klasse \code{bgb_ergebnis} mit wert, einheit, regel_id, regelversion, quellenfassung, eingaben, nutzervorgaben, rechenschritte, annahmen, hinweise und status. Datumswerte sind ISO-Zeichenfolgen, Tageszahlen exakte ganze Zahlen. Fehlende Werte erzeugen eine Condition der Klasse \code{bgb_berechnungsfehler} mit status EINGABE_FEHLT, ungültige Werte mit EINGABE_UNGUELTIG. Kein implizites Vektorrecycling.}
\examples{
fristende_monate_halb("2023-01-30", 1, "ereignis")
}
