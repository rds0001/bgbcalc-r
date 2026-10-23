% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{mietpreisbegrenzung_vormiete_bereinigen}
\alias{mietpreisbegrenzung_vormiete_bereinigen}
\title{mietpreisbegrenzung vormiete bereinigen}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{mietpreisbegrenzung_vormiete_bereinigen(
  letzte_geschuldete_monatsmiete = NULL,
  minderungsbetrag = NULL,
  auszunehmende_erhoehungsbetraege = NULL,
  bereinigungsnachweis = NULL
)}
\arguments{
\item{letzte_geschuldete_monatsmiete}{Zuletzt rechtlich geschuldete Monatsmiete nach tatsächlicher Mietminderung, nicht tatsächlicher Zahlungseingang oder bloß geforderte Vertragsmiete.}
\item{minderungsbetrag}{In dieser Monatsmiete wirksam enthaltene Minderung in EUR, die556eI2 unberücksichtigt lässt.}
\item{auszunehmende_erhoehungsbetraege}{Liste0..1000 nichtnegativer monatlicher Erhöhungsanteile, die innerhalb des letzten Jahres vor Vertragsende mit dem Vormieter vereinbart wurden. Rechtlich und zeitlich qualifizierte, in der ungeminderten letzten Monatsmiete noch enthaltene, überschneidungsfreie Betragskomponenten; keine Prozentangaben.}
\item{bereinigungsnachweis}{Nachweis rechtlich geschuldeter Miete, Minderungsbetrag und zeitlich/inhaltlich ausgeschlossener Erhöhungsanteile; keine bloße Istzahlung.}
}
\details{Minderungsbetrag hinzurechnen, ausgeschlossene Erhöhungsanteile summieren und abziehen. 556eI2: zunächst Minderung aus letzter geschuldeter Monatsmiete herausrechnen, dann Summe der rechtlich ausgeschlossenen Erhöhungsanteile abziehen. Das Ergebnis ist Eingabe für vorhandenen Vormietgrenzenkern. Erhöhungsanteile nach tatsächlicher Wirkung in der ungeminderten letzten Miete bestimmen; verkettete Prozentänderungen oder später aufgehobene Erhöhungen nicht doppelt zählen. Rechtswirksamkeit, zeitliche Einordnung ins letzte Jahr, Staffel-/Indexsonderfälle und Nutzbarkeit nach556g sind vorqualifiziert. Keine automatische Vertragszeitreihenbewertung. Abzüge oberhalb ungeminderter Miete sind widersprüchliche Eingaben und werden nicht still auf null gekappt. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Ungeminderte Monatsmiete, ausgeschlossene Erhöhungssumme und bereinigte Vormiete als exakte EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_556e_T0001, BGB_556e_T0002}
\examples{
mietpreisbegrenzung_vormiete_bereinigen(
  letzte_geschuldete_monatsmiete = "900",
  minderungsbetrag = "100",
  auszunehmende_erhoehungsbetraege = list(
    "50",
    "25"
  ),
  bereinigungsnachweis = paste0(
    "556eI2: zunächst Minderung aus letzter geschuldeter Monatsmi",
    "ete herausrechnen, dann Summe der rechtlich ausgeschlossenen",
    " Erhöhungsanteile abziehen. Das Ergebnis ist Eingabe für vor",
    "handenen Vormietgrenzenkern. Erhöhungsanteile nach tatsächli",
    "cher Wirkung in der ungeminderten letzten Miete bestimmen; v",
    "erkettete Prozentänderungen oder später aufgehobene Erhöhung",
    "en nicht doppelt zählen. Rechtswirksamkeit, zeitliche Einord",
    "nung ins letzte Jahr, Staffel-/Indexsonderfälle und Nutzbark",
    "eit nach556g sind vorqualifiziert. Keine automatische Vertra",
    "gszeitreihenbewertung. Abzüge oberhalb ungeminderter Miete s",
    "ind widersprüchliche Eingaben und werden nicht still auf nul",
    "l gekappt."
  )
)
}
