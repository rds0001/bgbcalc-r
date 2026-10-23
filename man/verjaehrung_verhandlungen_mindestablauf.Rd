\name{verjaehrung_verhandlungen_mindestablauf}
\alias{verjaehrung_verhandlungen_mindestablauf}
\title{Mindestablauf nach Verhandlungshemmung}
\description{Dreimonatigen Mindestnachlauf ab dem Ende der Verhandlungshemmung als Ereignisfrist nach §§ 187 Absatz 1, 188 Absatz 2/3 bestimmen. Der spätere Tag aus diesem Mindestablauf und dem bereits um Hemmungszeiten bereinigten letzten Fristtag ist das Ergebnis. Drei Monate werden nicht pauschal zur nach § 209 verlängerten Frist addiert.}
\usage{
verjaehrung_verhandlungen_mindestablauf(hemmungsende_am = NULL,
  rechnerischer_letzter_tag = NULL,
  hemmung_durch_verhandlungen_anwendbar = NULL)
}
\arguments{
\item{hemmungsende_am}{ISO-Datum JJJJ-MM-TT des rechtlich bestimmten Endes der Hemmung durch Verhandlungen nach § 203 Satz 1. Die Funktion stellt weder das Vorliegen von Verhandlungen noch deren Ende selbst fest.}
\item{rechnerischer_letzter_tag}{ISO-Datum des bereits unter Einrechnung der Hemmungswirkung (§ 209) bestimmten letzten Fristtags, noch ohne den Mindestnachlauf nach § 203 Satz 2 und ohne Werktagsverschiebung. Bei anwendbarer Verhandlungshemmung darf dieser Tag nicht vor deren Ende liegen. Keine ungeprüfte ursprüngliche Grundfrist eingeben.}
\item{hemmung_durch_verhandlungen_anwendbar}{Expliziter Wahrheitswert, ob die ausgewählte Verjährungsfrist tatsächlich nach § 203 durch Verhandlungen zwischen Gläubiger und Schuldner über Anspruch oder anspruchsbegründende Umstände gehemmt war. FALSE ergibt NICHT_ANWENDBAR; keine Wiederbelebung bereits verjährter Ansprüche.}
}
\details{Mindestnachlauf nach § 203 Satz 2 als gesonderte Stufe nach der Hemmungswirkung. Keine automatische rechtliche Bestimmung von Verhandlungsbeginn, Verhandlungsende oder eingeschlossenen Hemmungstagen. Andere Hemmungen, Ablaufhemmungen, Neubeginn, konkurrierende Fristläufe und gegebenenfalls § 193 bleiben gesondert. Der rechnerische letzte Tag ist daher kein abschließend bestimmter Verjährungstag. Kalenderbereich 0001 bis 9999; fehlender Tag im Zielmonat wird nach § 188 Absatz 3 durch dessen letzten Tag ersetzt.}
\value{S3-Objekt bgb_ergebnis. wert enthält mindestablauf_nach_verhandlungen und rechnerischer_letzter_tag als ISO-Daten zum jeweiligen Tagesschluss. Bei NICHT_ANWENDBAR ist wert null. Nutzervorgaben und Auswahl des späteren Ablaufs bleiben im Ergebnis nachvollziehbar. Fehlende oder ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\examples{
verjaehrung_verhandlungen_mindestablauf("2026-01-31", "2026-02-01", TRUE)
}
