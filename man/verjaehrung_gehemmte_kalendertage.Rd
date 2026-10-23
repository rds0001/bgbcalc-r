\name{verjaehrung_gehemmte_kalendertage}
\alias{verjaehrung_gehemmte_kalendertage}
\title{Taggenaue Wirkung der Verjährungshemmung}
\description{Hemmungsintervalle nach Beginn sortieren und Überschneidungen vereinigen. Nur Tage ab dem ersten Fristlauftag berücksichtigen. Beginnt ein Intervall spätestens am bislang berechneten letzten Fristtag, dessen sämtliche eingeschlossenen Hemmungstage nicht mitzählen und den letzten Fristtag um diese Anzahl verschieben. Später beginnende Intervalle können dadurch noch relevant werden. Hemmungen erst nach endgültigem Ablauf lassen eine abgelaufene Frist nicht wieder aufleben.}
\usage{
verjaehrung_gehemmte_kalendertage(fristlauf_erster_tag = NULL,
  grundfrist_letzter_tag = NULL,
  hemmungszeitraeume = NULL,
  hemmung_nach_209_anwendbar = NULL)
}
\arguments{
\item{fristlauf_erster_tag}{ISO-Datum JJJJ-MM-TT des ersten in die Frist einzurechnenden Kalendertags. Bei Jahresschlussbeginn beispielsweise der folgende 1. Januar; nicht den ausgeschlossenen Ereignistag eingeben. Rechtliche Bestimmung des Fristbeginns erfolgt zuvor.}
\item{grundfrist_letzter_tag}{ISO-Datum JJJJ-MM-TT des rechnerischen letzten Tags ohne die hier eingegebenen Hemmungszeiträume, ohne Ablaufhemmung oder Werktagsverschiebung. Darf nicht vor fristlauf_erster_tag liegen. Bereits eingerechnete Hemmungen nicht erneut angeben.}
\item{hemmungszeitraeume}{Liste mit höchstens 10000 Objekten, jeweils genau erster_gehemmter_tag und letzter_gehemmter_tag als ISO-Daten. Beide Grenzen sind eingeschlossen und müssen bereits rechtlich auf die nach § 209 nicht mitzuzählenden Kalendertage normalisiert sein. Die Funktion ermittelt keine Hemmungsgründe oder Ereignistagsregeln. Überlappende oder doppelte Tage werden nur einmal berücksichtigt; Reihenfolge beliebig. Eine leere Liste ist zulässig. Offene oder nur teilweise bestimmte Zeiträume erlauben keine abschließende Berechnung und dürfen nicht durch erfundene Enddaten ersetzt werden. R verlangt eine unbenannte äußere Liste.}
\item{hemmung_nach_209_anwendbar}{Expliziter Wahrheitswert zur Anwendung der Hemmungswirkung nach § 209 auf die ausgewählte Frist. FALSE ergibt NICHT_ANWENDBAR. Jede eingegebene Periode muss rechtlich als Hemmung dieser Frist eingeordnet sein.}
}
\details{Taggenaue Wirkung des § 209 für ausdrücklich normalisierte, abgeschlossene Hemmungsintervalle. Keine automatische Bewertung von Verhandlungen, Klage, Zustellung, höherer Gewalt oder den übrigen Hemmungstatbeständen. Nicht für untertägige Zeitabschnitte. Keine Ablaufhemmung, kein Neubeginn, kein automatischer Abgleich mehrerer konkurrierender Verjährungsfristen und keine Werktagsverschiebung. Bestehen mehrere Fristläufe, muss jede betroffene Frist mit ihren eigenen rechtlichen Hemmungsperioden berechnet werden; nicht allein den bereits ausgewählten frühesten Grundfristtag ungeprüft fortschreiben. Das Ergebnis ist deshalb kein abschließender Verjährungstag. Gemeinsamer Datumsbereich 0001 bis 9999.}
\value{S3-Objekt bgb_ergebnis. Bei BERECHNET enthält wert rechnerischer_letzter_tag (ISO-Datum zum Tagesschluss) und beruecksichtigte_hemmungstage (nichtnegative Ganzzahl). Bei NICHT_ANWENDBAR ist wert null. Rechenschritte zeigen die tatsächlich berücksichtigten vereinigten Intervalle und den jeweils verlängerten Endtag. Fehlende oder ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\examples{
verjaehrung_gehemmte_kalendertage("2026-01-01", "2026-01-10",
  list(list(erster_gehemmter_tag = "2026-01-05",
    letzter_gehemmter_tag = "2026-01-07")), TRUE)
}
