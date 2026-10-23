\name{fristende}
\alias{fristende}
\title{fristende}
\description{Datum des letzten Fristtages, Ablauf am Tagesende. Tage/Wochen: Anfang + Dauer minus 1 nur bei Tagesbeginn. Monate/Jahre: Zielmonat nach Dauer, bei Ereignis Tag=Anfangstag, bei Tagesbeginn Tag=Anfangstag-1; Tag 0 bezeichnet letzten Tag des Vormonats. Fehlenden maßgeblichen Tag auf letztem Tag des Zielmonats begrenzen. Halbes Jahr 6, Vierteljahr 3 Monate, halber Monat 15 Tage.}
\usage{
fristende(anfangstag = NULL,
  anzahl = NULL,
  einheit = NULL,
  beginnart = NULL)
}
\arguments{
  \item{anfangstag}{Anknüpfungsdatum als ISO-Zeichenfolge YYYY-MM-DD. Ereignistag und Tagesbeginn werden über beginnart unterschieden.}
  \item{anzahl}{Ganze Anzahl der Einheiten, höchstens 3652059; positive Zahl bei Fristen, null bei zeitraum_tage zulässig. Technischer Wertebereich, keine gesetzliche Fristobergrenze.}
  \item{einheit}{Fristen: tage, wochen, monate, jahre, halbjahre, vierteljahre oder halber_monat. Bei halber_monat ist anzahl genau eins. zeitraum_tage erlaubt nur monate oder jahre.}
  \item{beginnart}{ereignis schließt den Anknüpfungstag aus; tagesbeginn zählt ihn mit.}
}
\details{Feste lokale BGB-Fassung; anwendbare Fristbestimmung bereits ausgewählt. Speziellere gesetzliche Vorschriften/abweichende wirksame Bestimmung vorher prüfen. § 193 ist ausschließlich separate explizite Operation. Keine automatische Feiertagsverschiebung. Keine historischen Fassungen behaupten. Proleptischer gregorianischer Kalender, Jahr 0001..9999. Ganze Anzahlen maximal 3652059 (technischer Schutz, keine gesetzliche Grenze); Überschreitung des Datumsbereichs als EINGABE_UNGUELTIG. Keine Uhrzeiten, keine Zeitzonen.}
\value{Ein Objekt der Klasse \code{bgb_ergebnis} mit wert, einheit, regel_id, regelversion, quellenfassung, eingaben, nutzervorgaben, rechenschritte, annahmen, hinweise und status. Datumswerte sind ISO-Zeichenfolgen, Tageszahlen exakte ganze Zahlen. Fehlende Werte erzeugen eine Condition der Klasse \code{bgb_berechnungsfehler} mit status EINGABE_FEHLT, ungültige Werte mit EINGABE_UNGUELTIG. Kein implizites Vektorrecycling.}
\examples{
fristende("2024-01-31", 1, "monate", "ereignis")
}
