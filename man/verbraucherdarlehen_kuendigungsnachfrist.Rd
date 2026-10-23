\name{verbraucherdarlehen_kuendigungsnachfrist}
\alias{verbraucherdarlehen_kuendigungsnachfrist}
\title{Nachfrist für die Kündigung eines Verbraucherdarlehens}
\description{Rechnerisches Mindestende aus Zugang plus zwei Ereigniswochen bestimmen. Vorgegebenes rechtlich maßgebliches Ende muss mindestens dieses Ende erreichen; Prüftag muss nach diesem maßgeblichen Ende liegen. Nummer2 ist in dieser Teilprüfung nur bei ausreichender Dauer, eingetretenem Ablauf, vorgegebener Erfolglosigkeit und erklärter Restschuldandrohung erfüllt.}
\usage{
verbraucherdarlehen_kuendigungsnachfrist(zugang_fristsetzung = NULL,
  massgebliches_nachfristende = NULL,
  prueftag = NULL,
  nachfristende_nachweis = NULL,
  fristsetzung_erfolglos = NULL,
  restschuldandrohung_erklaert = NULL,
  teilzahlungsdarlehen = NULL)
}
\arguments{
  \item{zugang_fristsetzung}{ISO-Datum des rechtlich maßgeblichen Zugangs der konkreten Fristsetzung. Ereignistag wird nach §187 Abs.1 nicht mitgezählt; keine Gleichsetzung mit Versanddatum.}
  \item{massgebliches_nachfristende}{ISO-Datum des rechtlich maßgeblichen Ablaufs der tatsächlich gewährten Nachfrist, einschließlich erforderlicher Sonnabend-, Sonn- und Feiertagskorrekturen sowie sonstiger anwendbarer Regeln. Darf nicht vor Zugang liegen. Ein bloß im Schreiben genanntes Datum ohne Prüfung einer erforderlichen Korrektur genügt nicht. Bei einschlägigem §193 kann die vorhandene Funktion werktagsverschiebung mit einem belegten Ortskalender vorgeschaltet werden.}
  \item{prueftag}{ISO-Datum der taggenauen Prüfung, nicht vor Zugang. Erst ein Tag nach dem maßgeblichen Fristende gilt die Frist hier als abgelaufen. Keine Aussage zum untertägigen Zeitpunkt einer Kündigung.}
  \item{nachfristende_nachweis}{Nichtleere Beschreibung der Ermittlung des rechtlich maßgeblichen Fristendes einschließlich etwaiger Kalender-/Ortskorrekturen. Das rechnerische Mindestende dieser Funktion ersetzt diesen Nachweis nicht.}
  \item{fristsetzung_erfolglos}{Expliziter Wahrheitswert zur rechtlich und tatsächlich bewerteten Erfolglosigkeit der konkreten Zahlungsfrist. Maßgebliche Erfüllung und etwaige verspätete Zahlungen sind extern einzuordnen; keine automatische Auswertung eines Zahlungsledgers. Wirkt im Ergebnis nur zusammen mit Mindestdauer und bereits eingetretenem Fristablauf.}
  \item{restschuldandrohung_erklaert}{Expliziter Wahrheitswert, ob mit der Fristsetzung erklärt wurde, bei Nichtzahlung innerhalb der Frist die gesamte Restschuld zu verlangen. Eine allgemeine Zahlungserinnerung genügt nicht automatisch.}
  \item{teilzahlungsdarlehen}{Expliziter Wahrheitswert zum Verbraucherdarlehen, das in Teilzahlungen zu tilgen ist. FALSE ergibt NICHT_ANWENDBAR. Materiellen Anwendungsbereich des Verbraucherdarlehensrechts vorab bestimmen.}
}
\details{Teilprüfung des §498 Abs.1 Satz1 Nr.2. Rückstandsvoraussetzungen nach Nr.1, Gesprächsangebot nach Satz2, Kündigungserklärung und sonstige Wirksamkeitsfragen bleiben getrennt. Keine automatische Anwendung von §193; rechtlich maßgeblichen Ablauf mit belegtem Ortskalender vorab bestimmen. Rechenmindestende ist kein alleiniger Nachweis eines abgelaufenen gesetzlichen Zahlungszeitraums. Keine automatische Feststellung von Erfolglosigkeit oder Rechtsfolgen verspäteter Zahlung. Kein vollständiges Kündigungsrecht oder Restschuldbetrag.}
\value{wert enthält rechnerisches_mindestende als ISO-Datum sowie nachfrist_mindestdauer_eingehalten, nachfrist_am_prueftag_abgelaufen und voraussetzungen_nummer_2_erfuellt als Wahrheitswerte. BERECHNET bedeutet durchgeführte Teilprüfung, auch wenn Voraussetzungen FALSE sind. Bei NICHT_ANWENDBAR ist wert null. Fehler als bgb_berechnungsfehler mit EINGABE_FEHLT oder EINGABE_UNGUELTIG.}
\examples{
verbraucherdarlehen_kuendigungsnachfrist("2026-01-01", "2026-01-15", "2026-01-16",
  "Synthetisch maßgeblicher Ablauf ohne weitere Kalenderkorrektur", TRUE, TRUE, TRUE)
}
