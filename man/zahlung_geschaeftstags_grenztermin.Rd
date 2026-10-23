% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{zahlung_geschaeftstags_grenztermin}
\alias{zahlung_geschaeftstags_grenztermin}
\title{zahlung geschaeftstags grenztermin}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{zahlung_geschaeftstags_grenztermin(
  fristfall = NULL,
  bezugstag_am = NULL,
  bankkalender = NULL,
  kalendernachweis = NULL
)}
\arguments{
\item{fristfall}{lastschrift_widerruf_675p, terminauftrag_widerruf_675p, nichtautorisiert_erstattung_675u, erstattung_entscheidung_675x oder bareinzahlung_nichtverbraucher_675t.}
\item{bezugstag_am}{Qualifizierter ISO-Bezugstag: vereinbarte Fälligkeit/Ausführung bei675p, früheste Anzeige/Kenntnis bei675u, Zugang des Erstattungsverlangens bei675x oder Entgegennahme der Bareinzahlung bei675t.}
\item{bankkalender}{Objekt mit genau erster_kalendertag, letzter_kalendertag (ISO-Daten) und geschaeftstage (unbenannte Liste1..10000 streng aufsteigender eindeutiger ISO-Daten innerhalb des Intervalls). Vollständiger Geschäftskalender des maßgeblichen Dienstleisters für den konkreten Zahlungsvorgang im angegebenen Intervall; keine Wochenendannahme. Die erforderlichen Vor-/Folgetage müssen enthalten sein.}
\item{kalendernachweis}{Nichtleerer Nachweis des Normfalls, tatsächlichen vollständigen Geschäftskalenders und der taggenau normalisierten Zugangs-/Terminbedingungen; Uhrzeiten, Annahmeschluss und Zeitzone extern qualifizieren.}
}
\details{Vortag, nächster Geschäftstag oder zehnter Geschäftstag im qualifizierten Zahlungsfall. 675pII/III: letzter Geschäftstag vor vereinbarter Fälligkeit beziehungsweise vereinbartem Ausführungstag, nicht vor einem eigenständig verschobenen Termin; spätere Widerrufsvereinbarungen gesondert.675u: Bezugstag ist früheste maßgebliche Anzeige oder anderweitige Kenntnis, äußerste Erstattungs-/Kontokorrekturfrist, unverzüglich bleibt zusätzlich; qualifizierte Betrugsverdachtsausnahme außerhalb.675xV: zehn Geschäftstage nach Zugang des Erstattungsverlangens, Anspruch und Vier-/Achtwochenregeln getrennt.675tII: Nichtverbraucher-Bareinzahlung in Kontowährung, spätestens folgender Geschäftstag; Verbraucherregel unverzüglich nicht übertragen.675dVI-/Spezialausnahmen vorqualifizieren. Jeweils Kalender des verpflichteten Zahlungsdienstleisters für diesen Vorgang vollständig angeben. Ergebnis bezeichnet Tagesablauf; Uhrzeiten/Zeitzonen extern normalisieren. ISO-Kalenderdaten0001..9999; Geschäftstagsliste1..10000 mit ausdrücklichem Abdeckungsintervall. Fehlende Kalenderabdeckung ist ungültig, keine Extrapolation.}
\value{wert: rechnerischer_grenztermin als ISO-Datum, Tagesablauf. Einheit: daten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_675p_T0002, BGB_675p_T0003, BGB_675p_T0004, BGB_675t_T0006, BGB_675t_T0007, BGB_675u_T0001, BGB_675u_T0002, BGB_675u_T0003, BGB_675u_T0004, BGB_675u_T0005, BGB_675x_T0009, BGB_675x_T0010, BGB_675x_T0011}
\examples{
zahlung_geschaeftstags_grenztermin(
  fristfall = "lastschrift_widerruf_675p",
  bezugstag_am = "2024-04-02",
  bankkalender = list(
    "erster_kalendertag" = "2024-03-25",
    "letzter_kalendertag" = "2024-04-15",
    "geschaeftstage" = list(
    "2024-03-25",
    "2024-03-26",
    "2024-03-27",
    "2024-03-28",
    "2024-04-02",
    "2024-04-03",
    "2024-04-04",
    "2024-04-05",
    "2024-04-08",
    "2024-04-09",
    "2024-04-10",
    "2024-04-11",
    "2024-04-12",
    "2024-04-15"
  )
  ),
  kalendernachweis = paste0(
    "Expliziter synthetischer Geschäftskalender, vollständig im I",
    "ntervall; qualifizierter Normfall, keine Behauptung eines un",
    "iversellen Bankkalenders."
  )
)
}
