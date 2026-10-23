\name{fristverlaengerung}
\alias{fristverlaengerung}
\title{fristverlaengerung}
\description{Voriger Ablauf als Ereignisdatum für Verlängerungsfrist. Keine erneute Anknüpfung an ursprünglichen Anfang. Nutzer liefert den rechtlich maßgeblichen vorigen Ablauf.}
\usage{
fristverlaengerung(bisheriges_fristende = NULL,
  anzahl = NULL,
  einheit = NULL)
}
\arguments{
  \item{bisheriges_fristende}{Rechtlich maßgeblicher Ablauf der bisherigen Frist als ISO-Datum; keine automatische Bestimmung aus einem früheren Fristbeginn.}
  \item{anzahl}{Ganze Anzahl der Einheiten, höchstens 3652059; positive Zahl bei Fristen, null bei zeitraum_tage zulässig. Technischer Wertebereich, keine gesetzliche Fristobergrenze.}
  \item{einheit}{Fristen: tage, wochen, monate, jahre, halbjahre, vierteljahre oder halber_monat. Bei halber_monat ist anzahl genau eins. zeitraum_tage erlaubt nur monate oder jahre.}
}
\details{Feste lokale BGB-Fassung; anwendbare Fristbestimmung bereits ausgewählt. Speziellere gesetzliche Vorschriften/abweichende wirksame Bestimmung vorher prüfen. § 193 ist ausschließlich separate explizite Operation. Keine automatische Feiertagsverschiebung. Keine historischen Fassungen behaupten. Proleptischer gregorianischer Kalender, Jahr 0001..9999. Ganze Anzahlen maximal 3652059 (technischer Schutz, keine gesetzliche Grenze); Überschreitung des Datumsbereichs als EINGABE_UNGUELTIG. Keine Uhrzeiten, keine Zeitzonen.}
\value{Ein Objekt der Klasse \code{bgb_ergebnis} mit wert, einheit, regel_id, regelversion, quellenfassung, eingaben, nutzervorgaben, rechenschritte, annahmen, hinweise und status. Datumswerte sind ISO-Zeichenfolgen, Tageszahlen exakte ganze Zahlen. Fehlende Werte erzeugen eine Condition der Klasse \code{bgb_berechnungsfehler} mit status EINGABE_FEHLT, ungültige Werte mit EINGABE_UNGUELTIG. Kein implizites Vektorrecycling.}
\examples{
fristverlaengerung("2026-01-31", 1, "monate")
}
