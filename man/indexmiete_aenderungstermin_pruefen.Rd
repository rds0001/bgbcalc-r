\name{indexmiete_aenderungstermin_pruefen}
\alias{indexmiete_aenderungstermin_pruefen}
\title{indexmiete aenderungstermin pruefen}
\description{Beginn nach Zugang ist der erste Tag des übernächsten Kalendermonats. Frühester Beginn nach Jahresfrist ist der Tag nach Ablauf eines nach §§187 Abs.2/188 berechneten Jahres seit dem Tagesbeginn der bisherigen Indexmiete. Beide Termine werden verglichen.}
\usage{
indexmiete_aenderungstermin_pruefen(zugang_erklaerung = NULL,
  bisherige_indexmiete_ab = NULL,
  erklaerung_formell_ordnungsgemaess = NULL)
}
\arguments{
  \item{zugang_erklaerung}{ISO-Datum YYYY-MM-DD des nachgewiesenen Zugangs der Änderungserklärung. Kein Versanddatum und keine automatische Ermittlung des Zugangs.}
  \item{bisherige_indexmiete_ab}{ISO-Datum des Tagesbeginns, seit dem die bisherige Indexmiete gilt; bei der ersten Anpassung der maßgebliche Beginn der Ausgangsmiete. Darf nicht nach dem Zugang liegen. Erhöhungen nach §§559 bis560 sind von der unveränderten Jahresdauer ausgenommen und setzen diesen Zeitpunkt nicht automatisch neu.}
  \item{erklaerung_formell_ordnungsgemaess}{Expliziter Wahrheitswert zu Textform und erforderlichen Angaben nach §557b Abs.3 Sätze1/2: eingetretene Indexänderung und jeweilige Miete oder Erhöhungsbetrag. Hier keine Behauptung bereits eingehaltener Jahresfrist; diese wird berechnet. Wirksame Indexvereinbarung und Anwendungsbereich vorausgesetzt. FALSE ergibt NICHT_ANWENDBAR.}
}
\details{Feste lokale BGB-Fassung. Teilbaustein der Indexmiete; keine automatische Beschaffung amtlicher Indizes oder Vertragsauslegung. Spezial- und Übergangsrecht einschließlich Anwendungsbereich vorab prüfen. Keine automatische Cent-Rundung. Es wird kein abschließend wirksamer Änderungstermin festgestellt. Insbesondere wird bei nicht eingehaltener Jahresfrist weder die Erklärung automatisch verschoben noch deren rechtliches Schicksal entschieden. Ausnahme für Erhöhungen nach §§559 bis560 bei Ermittlung des vorgegebenen Beginns berücksichtigen. Keine Zahlungsfälligkeit nach §556b und keine Feiertagsverschiebung des Mietbeginns.}
\value{Ergebnis wert enthält beginn_nach_zugang und fruehester_beginn_nach_jahresfrist als ISO-Daten sowie jahresfrist_eingehalten als Wahrheitswert. BERECHNET bedeutet durchgeführte Teilprüfung, auch wenn der Wahrheitswert FALSE lautet. Bei NICHT_ANWENDBAR ist wert null. Fehler als bgb_berechnungsfehler mit EINGABE_FEHLT oder EINGABE_UNGUELTIG.}
\examples{
indexmiete_aenderungstermin_pruefen("2026-01-31", "2025-03-01", TRUE)
}
