% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{modernisierung_arbeitsruhe}
\alias{modernisierung_arbeitsruhe}
\title{modernisierung arbeitsruhe}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{modernisierung_arbeitsruhe(
  ruhebeginn_am = NULL,
  beginnart = NULL,
  wiederaufnahme_am = NULL,
  prueftag = NULL,
  zeitnachweis = NULL
)}
\arguments{
\item{ruhebeginn_am}{ISO-Datum0001..9999 des rechtlich maßgeblichen Beginns einer zusammenhängenden Arbeitsruhe, nachdem die bauliche Veränderung bereits begonnen hat. Unzusammenhängende Unterbrechungen nicht aufsummieren.}
\item{beginnart}{Auswahl tagesbeginn, wenn der erste Ruhetag vom Tagesbeginn an mitzählt, oder ereignis, wenn ein Ereignis im Tagesverlauf den Zeitraum auslöst und der Ereignistag nicht mitzählt. Rechtliche Einordnung§187 vorgeben; keine beliebige Auswahl zur Ergebnissteuerung.}
\item{wiederaufnahme_am}{ISO-Datum0001..9999 einer rechtlich wirksamen Wiederaufnahme zum Tagesbeginn, mindestens Ruhebeginn und höchstens Prüftag. Dann zählt der Vortag als letzter Ruhetag. NULL/None bedeutet am Prüftag weiterhin ununterbrochene Ruhe. Untertägige Wiederaufnahme nicht ungeprüft als Tagesbeginn normalisieren.}
\item{prueftag}{ISO-Datum0001..9999, mindestens Ruhebeginn; bei laufender Ruhe Prüfung bis zum Tagesschluss. Bei bereits erfolgter Wiederaufnahme entscheidet letzter Ruhetag, nicht späterer Prüftag.}
\item{zeitnachweis}{Nichtleere Begründung, dass Bauarbeiten schon begonnen hatten, die Ruhe ununterbrochen war, welche Beginnart gilt und ob/ab wann die Arbeiten rechtlich relevant wiederaufgenommen wurden. Sachlichen/zeitlichen Anwendungsbereich§559d prüfen.}
}
\details{Zwölfmonatsgrenze nach gewählter rechtlicher Beginnart berechnen. Letzter Ruhetag ist Prüftag bei laufender Ruhe, sonst Vortag tagbeginnlicher Wiederaufnahme. Nummer4 nur bei strikt späterem letzten Ruhetag. Nur eine ununterbrochene Arbeitsruhe nach Baubeginn; keine Addition einzelner Pausen. Taggenaues Modell, untertägige Grenzfälle rechtlich gesondert; objektiver Grund separat. Genau zwölf Monate genügen nicht. ISO-Daten und berechnete Grenzen0001..9999, explizite Auswahl und nichtleerer Nachweis. Optionale Daten ausschließlich mit der beschriebenen Bedeutung.}
\value{wert enthält zwoelfmonatsgrenze, letzter_beruecksichtigter_ruhetag als ISO-Daten und arbeitsruhe_nummer_4 als Wahrheitswert. Einheit: daten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_559d_T0005}
\examples{
modernisierung_arbeitsruhe(
  ruhebeginn_am = "2024-01-01",
  beginnart = "tagesbeginn",
  wiederaufnahme_am = NULL,
  prueftag = "2024-12-30",
  zeitnachweis = paste0(
    "Synthetische ununterbrochene Arbeitsruhe nach Baubeginn; Wie",
    "deraufnahme falls angegeben zum Tagesbeginn."
  )
)
}
