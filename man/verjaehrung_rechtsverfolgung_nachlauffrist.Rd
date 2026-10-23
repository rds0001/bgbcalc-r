\name{verjaehrung_rechtsverfolgung_nachlauffrist}
\alias{verjaehrung_rechtsverfolgung_nachlauffrist}
\title{Nachlauffrist bei Rechtsverfolgung}
\description{Sechs Kalendermonate nach dem ausgewählten Anknüpfungsereignis als Ereignisfrist nach §§ 187 Absatz 1, 188 Absatz 2/3 berechnen. Bei nicht betriebenem Verfahren tritt die letzte Verfahrenshandlung an die Stelle der Beendigung. Kein Jahresschlussbeginn und kein pauschaler 180-Tage-Nachlauf.}
\usage{
verjaehrung_rechtsverfolgung_nachlauffrist(anknuepfungsereignis = NULL,
  anknuepfungsereignis_am = NULL,
  hemmung_durch_rechtsverfolgung_anwendbar = NULL)
}
\arguments{
\item{anknuepfungsereignis}{Auswahl rechtskraeftige_entscheidung, anderweitige_beendigung oder stillstand_durch_nichtbetreiben. Letztere Auswahl setzt rechtlich voraus, dass das Verfahren gerade deshalb stillsteht, weil die Parteien es nicht betreiben; bloße gerichtliche Verzögerung genügt nicht als Eingabegrund.}
\item{anknuepfungsereignis_am}{ISO-Datum JJJJ-MM-TT der Rechtskraft beziehungsweise anderweitigen Verfahrensbeendigung. Bei stillstand_durch_nichtbetreiben: Datum der letzten Verfahrenshandlung der Parteien, des Gerichts oder der sonst befassten Stelle; nicht ohne Weiteres das Datum, an dem jemand den Stillstand bemerkt.}
\item{hemmung_durch_rechtsverfolgung_anwendbar}{Expliziter Wahrheitswert, ob für den ausgewählten Anspruch ein wirksamer Hemmungstatbestand nach § 204 Absatz 1 vorliegt und der Nachlauf nach Absatz 2 Sätze 1/2 anwendbar ist. Verfahrensart, rechtzeitige Zustellung, gegebenenfalls Anmelde- und sonstige Voraussetzungen sind zuvor zu prüfen. FALSE ergibt NICHT_ANWENDBAR.}
}
\details{Berechnet ausschließlich die Nachlauffrist nach § 204 Absatz 2 Sätze 1/2, nicht den Verjährungsablauf. Eine erneute Hemmung bei Weiterbetreiben nach Satz 3 und der gegebenenfalls daran anschließende neue Nachlauf sind gesondert zu verarbeiten. Das berechnete Datum darf bei späteren Verfahrensereignissen daher nicht als unveränderliches Ende sämtlicher Hemmung verstanden werden. Die Ausgangstatbestände nach Absatz 1, die besonderen Fristen und Verweisungen nach Absatz 3, § 204a und Übergangsrecht werden nicht automatisch geprüft. Eine gegebenenfalls einschlägige Werktagsverschiebung bleibt gesondert. Das Ergebnis wird nicht unmittelbar als Fristende des Anspruchs verwendet; § 209 ist anschließend anhand rechtlich normalisierter Hemmungstage anzuwenden.}
\value{S3-Objekt bgb_ergebnis. ISO-Datum in wert zum Tagesschluss: rechnerisches Ende der ausgewählten sechsmonatigen Nachlauffrist. Bei NICHT_ANWENDBAR ist wert null. Kalenderbereich 0001 bis 9999. Fehlende oder ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\examples{
verjaehrung_rechtsverfolgung_nachlauffrist("rechtskraeftige_entscheidung", "2026-01-31", TRUE)
}
