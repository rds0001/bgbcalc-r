% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{zahlung_ausfuehrungsfristende}
\alias{zahlung_ausfuehrungsfristende}
\title{zahlung ausfuehrungsfristende}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{zahlung_ausfuehrungsfristende(
  zugangstag_fuer_ausfuehrungsfrist = NULL,
  fristfall = NULL,
  vereinbarte_geschaeftstage = NULL,
  bankkalender = NULL,
  kalendernachweis = NULL
)}
\arguments{
\item{zugangstag_fuer_ausfuehrungsfrist}{Bereits nach675n qualifizierter Zugangsgeschäftstag für675sI als ISO-Datum; muss im Kalender Geschäftstag sein.}
\item{fristfall}{standard (1Geschäftstag), papier_verlaengerung (wirksam genutzte2Geschäftstage) oder ewr_nichteuro_vereinbart.}
\item{vereinbarte_geschaeftstage}{Nur ewr_nichteuro_vereinbart: ganze Zahl1..4 aus wirksamer Vereinbarung; sonst null. Kein weiterer Papiertag auf diese Frist.}
\item{bankkalender}{Objekt mit genau erster_kalendertag, letzter_kalendertag (ISO-Daten) und geschaeftstage (unbenannte Liste1..10000 streng aufsteigender eindeutiger ISO-Daten innerhalb des Intervalls). Vollständiger Geschäftskalender des maßgeblichen Dienstleisters für den konkreten Zahlungsvorgang im angegebenen Intervall; keine Wochenendannahme. Die erforderlichen Vor-/Folgetage müssen enthalten sein.}
\item{kalendernachweis}{Nichtleerer Nachweis des Normfalls, tatsächlichen vollständigen Geschäftskalenders und der taggenau normalisierten Zugangs-/Terminbedingungen; Uhrzeiten, Annahmeschluss und Zeitzone extern qualifizieren.}
}
\details{Ein-/Zweitagesregel oder vereinbarte EWR-Nicht-Euro-Frist bis vier Geschäftstage. §675sI: spätester Eingang beim Zahlungsdienstleister des Empfängers. standard=ein Geschäftstag; papier_verlaengerung=nur wirksam genutzte Verlängerung der Standardfrist um einen Geschäftstag. ewr_nichteuro_vereinbart=nur wirksame Vereinbarung von1bis4Geschäftstagen im einschlägigen EWR-Nicht-Euro-Fall; kein zusätzlicher Papiertag auf diese Vier-Tages-Frist. Qualifizierter Geschäftskalender und675n-Zugangstag vorgeben.675sII-Empfängerauslösung und Ausnahmen675sIII/675dVI separat; keine automatische Gutschrift-/Wertstellungsentscheidung. ISO-Kalenderdaten0001..9999; Geschäftstagsliste1..10000 mit ausdrücklichem Abdeckungsintervall. Fehlende Kalenderabdeckung ist ungültig, keine Extrapolation.}
\value{wert: anzahl_geschaeftstage und spaetester_eingangstag (Tagesende beim Empfängerdienstleister). Einheit: datum_und_anzahl.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_675s_T0001, BGB_675s_T0002, BGB_675s_T0003}
\examples{
zahlung_ausfuehrungsfristende(
  zugangstag_fuer_ausfuehrungsfrist = "2024-03-28",
  fristfall = "standard",
  vereinbarte_geschaeftstage = NULL,
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
