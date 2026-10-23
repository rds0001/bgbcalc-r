\name{regelverjaehrung_grundfrist}
\alias{regelverjaehrung_grundfrist}
\title{Regelmäßige Verjährungsgrundfrist}
\description{Das spätere Kalenderjahr aus Anspruchsentstehung beziehungsweise Zuwiderhandlung und Kenntnis beziehungsweise grob fahrlässiger Unkenntnis bestimmen. Beginn mit Schluss des 31. Dezember dieses Jahres; rechnerischer letzter Tag der unmodifizierten Dreijahresfrist ist der 31. Dezember drei Jahre später.}
\usage{
regelverjaehrung_grundfrist(entstehung_oder_zuwiderhandlung_am = NULL,
  kenntnis_oder_kennenmuessen_am = NULL,
  regelmaessiger_jahresschlussbeginn_anwendbar = NULL)
}
\arguments{
\item{entstehung_oder_zuwiderhandlung_am}{ISO-Datum JJJJ-MM-TT der rechtlich bestimmten Anspruchsentstehung. Bei Unterlassungsansprüchen stattdessen das Datum der maßgeblichen Zuwiderhandlung (§ 199 Absatz 5). Keine automatische rechtliche Ermittlung des Entstehungszeitpunkts.}
\item{kenntnis_oder_kennenmuessen_am}{ISO-Datum JJJJ-MM-TT, an dem der Gläubiger Kenntnis von den anspruchsbegründenden Umständen und der Person des Schuldners hatte oder ohne grobe Fahrlässigkeit hätte erlangen müssen (§ 199 Absatz 1 Nummer 2). Nicht bloß Kenntnis irgendeines Teilumstands; ausdrückliche rechtliche Nutzervorgabe.}
\item{regelmaessiger_jahresschlussbeginn_anwendbar}{Expliziter Wahrheitswert: Die regelmäßige Dreijahresfrist und der Jahresschlussbeginn nach §§ 195, 199 Absatz 1 gelten für den ausgewählten Anspruch, ohne abweichenden gesetzlichen oder wirksam vereinbarten Beginn oder abweichende Fristdauer. FALSE liefert NICHT_ANWENDBAR.}
}
\details{Nur Grundfrist nach §§ 195, 199 Absatz 1/5. Keine Aussage, ob der Anspruch an einem Stichtag bereits verjährt ist. Kenntnisunabhängige Höchstfristen (§ 199 Absätze 2 bis 4), Hemmung (§§ 203 ff., 209), Ablaufhemmung (§§ 210/211), Neubeginn (§ 212), besondere Fristen und abweichende Vereinbarungen sind nicht eingerechnet. Eine gegebenenfalls erforderliche Werktagsverschiebung nach § 193 ist ebenfalls nicht enthalten; rechnerischer_letzter_tag ist deshalb ausdrücklich kein abschließend bestimmter Verjährungstag. Keine zweite Jahresschlussverschiebung bei einem späteren Neubeginn aus dieser Funktion ableiten. Die lokale Quellenfassung wird nicht automatisch auf historische Ansprüche übertragen.}
\value{S3-Objekt bgb_ergebnis. wert enthält beginn_mit_jahresschluss und rechnerischer_letzter_tag als ISO-Daten. Beide bezeichnen den Schluss des jeweiligen Tages, nicht dessen Beginn. Bei NICHT_ANWENDBAR ist wert null. Datumsbereich 0001 bis 9999; ein nicht darstellbarer Endtag wird als EINGABE_UNGUELTIG zurückgewiesen. Fehlende oder ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\examples{
regelverjaehrung_grundfrist("2020-02-29", "2021-01-01", TRUE)
}
