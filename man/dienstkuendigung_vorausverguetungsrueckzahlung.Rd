% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{dienstkuendigung_vorausverguetungsrueckzahlung}
\alias{dienstkuendigung_vorausverguetungsrueckzahlung}
\title{dienstkuendigung vorausverguetungsrueckzahlung}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{dienstkuendigung_vorausverguetungsrueckzahlung(
  vorausverguetung = NULL,
  zeitanteil_nach_kuendigung_zaehler = NULL,
  zeitanteil_nach_kuendigung_nenner = NULL,
  kuendigungsumstand_nicht_zu_vertreten = NULL,
  abziehbare_entreicherung = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{vorausverguetung}{Nichtnegativer exakter EUR-Betrag der tatsächlich vorausbezahlten Vergütung für den betrachteten Zeitraum.}
\item{zeitanteil_nach_kuendigung_zaehler}{Nichtnegative ganze Zahl des rechtlich bestimmten auf die spätere Zeit entfallenden Vergütungsanteils, höchstens Nenner und2^53-1.}
\item{zeitanteil_nach_kuendigung_nenner}{Positive ganze Bezugsgröße desselben vorausbezahlten Zeitraums, höchstens2^53-1. Vergütungskonvention und Kündigungszeitpunkt im Nachweis belegen.}
\item{kuendigungsumstand_nicht_zu_vertreten}{Expliziter Wahrheitswert: Kündigung erfolgt wegen eines vom Dienstverpflichteten nicht zu vertretenden Umstands; dann Bereicherungsrecht, andernfalls346.}
\item{abziehbare_entreicherung}{Nur im Bereicherungsfall nichtnegativer bereits rechtlich abzugsfähiger EUR-Betrag, höchstens vorausbezahlter Nachkündigungsanteil. Nullverlust ausdrücklich0. Im346-Fall null.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des628I3-Falls, tatsächlich vorausbezahlten Zeitraums, Vergütungsanteils und rechtlich qualifizierter Rückabwicklung; nicht automatisch jede freie Kündigung gleichsetzen.}
}
\details{Vorauszahlung mit qualifiziertem Nachkündigungsanteil multiplizieren; nur im Bereicherungsfall rechtlich abzugsfähige Entreicherung abziehen. §628I3 nach qualifizierter Kündigung626/627 nach Dienstbeginn: nur im Voraus entrichtete Vergütung für Zeit nach Kündigung. Anteil auf den tatsächlich vorausbezahlten Zeitraum beziehen, nicht blind auf gesamte Vertragsvergütung oder bisherige Leistungsquote. Teilbetrag nach der rechtlich einschlägigen Vergütungs-/Zeitkonvention bestimmen; keine universelle Dreißigtage- oder Jahreskonvention. Hat der Dienstverpflichtete den Kündigungsumstand nicht zu vertreten, gelten Bereicherungsvorschriften; abzugsfähige Entreicherung insbesondere unter Berücksichtigung818/819/820 rechtlich bestimmen. Im346-Fall keine818III-Entreicherung abziehen. Weitere Nutzungen, Wertersatz, frühere Leistungen und Interessenverlust628I1/2 sowie Kündigungsschaden628II separat; keine automatische Aufrechnung. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert: rechnerischer_vorausanteil und rechnerischer_rueckzahlungsbetrag als exakte EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_628_T0001, BGB_628_T0002, BGB_628_T0003}
\examples{
dienstkuendigung_vorausverguetungsrueckzahlung(
  vorausverguetung = "1200",
  zeitanteil_nach_kuendigung_zaehler = 1,
  zeitanteil_nach_kuendigung_nenner = 3,
  kuendigungsumstand_nicht_zu_vertreten = FALSE,
  abziehbare_entreicherung = NULL,
  einordnungsnachweis = paste0(
    "§628I3 nach qualifizierter Kündigung626/627 nach Dienstbegin",
    "n: nur im Voraus entrichtete Vergütung für Zeit nach Kündigu",
    "ng. Anteil auf den tatsächlich vorausbezahlten Zeitraum bezi",
    "ehen, nicht blind auf gesamte Vertragsvergütung oder bisheri",
    "ge Leistungsquote. Teilbetrag nach der rechtlich einschlägig",
    "en Vergütungs-/Zeitkonvention bestimmen; keine universelle D",
    "reißigtage- oder Jahreskonvention. Hat der Dienstverpflichte",
    "te den Kündigungsumstand nicht zu vertreten, gelten Bereiche",
    "rungsvorschriften; abzugsfähige Entreicherung insbesondere u",
    "nter Berücksichtigung818/819/820 rechtlich bestimmen. Im346-",
    "Fall keine818III-Entreicherung abziehen. Weitere Nutzungen, ",
    "Wertersatz, frühere Leistungen und Interessenverlust628I1/2 ",
    "sowie Kündigungsschaden628II separat; keine automatische Auf",
    "rechnung."
  )
)
}
