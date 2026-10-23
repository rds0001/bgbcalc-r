% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{verjaehrung_aufrechnung_zurueckbehaltung}
\alias{verjaehrung_aufrechnung_zurueckbehaltung}
\title{verjaehrung aufrechnung zurueckbehaltung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{verjaehrung_aufrechnung_zurueckbehaltung(
  letzter_tag_vor_verjaehrung = NULL,
  erstmals_ausuebbar_am = NULL,
  rechtsart = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{letzter_tag_vor_verjaehrung}{ISO-Datum0001..9999 des rechtlich maßgeblichen letzten unverjährten Tages zum Tagesschluss. Alle einschlägigen Hemmungen, Ablaufhemmungen, Neubeginne und gegebenenfalls Werktagsverschiebungen zuvor bestimmen; keine ungeprüfte Grundfrist.}
\item{erstmals_ausuebbar_am}{ISO-Datum0001..9999, an dem das ausgewählte Recht erstmals rechtlich ausgeübt werden konnte. Bei Aufrechnung erstmalige geeignete Gegenüberstellung nach allen Voraussetzungen, nicht bloß Entstehung der eigenen Forderung. Taggenaue rechtliche Normalisierung; untertägige Besonderheiten gesondert.}
\item{rechtsart}{Auswahl aufrechnung oder zurueckbehaltung. Bei Zurückbehaltung maßgeblichen Zeitpunkt erstmaliger Leistungsverweigerungsmöglichkeit eingeben, nicht automatisch Aufrechnungslage übernehmen.}
\item{einordnungsnachweis}{Nichtleere Beschreibung des Anspruchs, abschließend bestimmten Verjährungstags und rechtlich ersten Ausübbarkeitszeitpunkts des ausgewählten Rechts. Weitere Ausschlüsse separat.}
}
\details{Prüfen, ob erstmalige rechtliche Ausübbarkeit spätestens am letzten unverjährten Tag lag. Dann schließt spätere Verjährung das gewählte Recht nach§215 nicht aus. Nur gesetzliches Erhaltungsprivileg, keine Prüfung aller Aufrechnungsvoraussetzungen oder sonstiger Zurückbehaltungsausschlüsse. Kein Wiederaufleben eines bereits vor erster Ausübbarkeit verjährten Anspruchs durch diese Funktion. ISO-Daten0001..9999, explizite Auswahl/Wahrheitswerte und nichtleerer Nachweis.}
\value{wert ist Wahrheitswert: TRUE erfüllt zeitliche Erhaltungsbedingung§215. FALSE ist keine umfassende Entscheidung über andere Rechtsgrundlagen. Einheit: wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_215_T0001}
\examples{
verjaehrung_aufrechnung_zurueckbehaltung(
  letzter_tag_vor_verjaehrung = "2025-12-31",
  erstmals_ausuebbar_am = "2025-12-30",
  rechtsart = "aufrechnung",
  einordnungsnachweis = paste0(
    "Synthetisch abschließend bestimmte Verjährung und erstmalige",
    " rechtliche Ausübbarkeit."
  )
)
}
