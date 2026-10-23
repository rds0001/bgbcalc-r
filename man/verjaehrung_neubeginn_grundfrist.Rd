\name{verjaehrung_neubeginn_grundfrist}
\alias{verjaehrung_neubeginn_grundfrist}
\title{Grundfrist nach wirksamem Neubeginn}
\description{Bei wirksamem Neubeginn die volle maßgebliche Dauer vom Neubeginnereignis aus als Ereignisfrist nach §§ 187 Absatz 1, 188 berechnen. Vorher verstrichene Zeit wird nicht abgezogen. Auch bei einer regelmäßigen dreijährigen Frist kein zusätzlicher Jahresschlussbeginn; ein Ereignis am15.Januar2026 führt bei drei Jahren zum rechnerischen letzten Tag15.Januar2029.}
\usage{
verjaehrung_neubeginn_grundfrist(neubeginnereignis_am = NULL,
  fristdauer = NULL,
  fristeinheit = NULL,
  wirksamer_neubeginn = NULL)
}
\arguments{
\item{neubeginnereignis_am}{ISO-Datum JJJJ-MM-TT des rechtlich wirksamen Neubeginnereignisses. Nicht den früheren Fristbeginn oder den Tag der späteren Kenntnis vom Ereignis eingeben. Der Ereignistag wird nach § 187 Absatz 1 nicht mitgezählt.}
\item{fristdauer}{Positive Ganzzahl der vollen für den Anspruch maßgeblichen Verjährungsfrist in der angegebenen Einheit, nicht der vor dem Neubeginn noch verbleibende Rest. Höchstens 3652059; der errechnete Endtag muss zusätzlich im Kalenderbereich 0001 bis 9999 liegen. Die Dauer wird nicht aus der Ereignisart abgeleitet.}
\item{fristeinheit}{Auswahl tage, wochen, monate oder jahre. Monatliche und jährliche Fristen werden kalenderbezogen nach § 188 berechnet, nicht mit30 beziehungsweise365Tagen ersetzt. Andere Darstellungen zuvor rechtlich eindeutig in diese Einheiten überführen.}
\item{wirksamer_neubeginn}{Expliziter Wahrheitswert zum rechtlich wirksamen Neubeginn der ausgewählten Frist. Hierzu sind der einschlägige Auslöser und Rückausnahmen nach § 212, vorherige Verjährung sowie weitere Wirksamkeitsvoraussetzungen zuvor zu prüfen. Diese rechtliche Vorprüfung ist eine dokumentierte Nutzervorgabe. FALSE ergibt NICHT_ANWENDBAR.}
}
\details{Grundfrist nach einem rechtlich vorgegebenen wirksamen Neubeginn (§ 212). Keine Feststellung des Neubeginnereignisses oder der Fristdauer und keine Wiederbelebung eines schon verjährten Anspruchs allein aufgrund eines eingegebenen Anerkenntnisses. Spätere Hemmungen, Ablaufhemmungen, weitere Neubeginne, konkurrierende Fristläufe, besondere Vorschriften und gegebenenfalls § 193 sind gesondert zu verarbeiten. Das Ergebnis ist kein abschließend bestimmter Verjährungstag. Eine unwirksame Auslöserkonstellation darf nicht durch TRUE übergangen werden.}
\value{S3-Objekt bgb_ergebnis. ISO-Datum in wert als rechnerischer letzter Tag zum Tagesschluss. Bei NICHT_ANWENDBAR ist wert null. Kein Zeitstempel und keine automatische Werktagsverschiebung. Fehlende oder ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\examples{
verjaehrung_neubeginn_grundfrist("2026-01-15", 3, "jahre", TRUE)
}
