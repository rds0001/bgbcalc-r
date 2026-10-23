% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{zahlungsauftrag_zugangstage}
\alias{zahlungsauftrag_zugangstage}
\title{zahlungsauftrag zugangstage}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{zahlungsauftrag_zugangstage(
  zugang_am = NULL,
  nach_annahmeschluss = NULL,
  vereinbarter_ausfuehrungstag_am = NULL,
  bankkalender = NULL,
  kalendernachweis = NULL
)}
\arguments{
\item{zugang_am}{Tatsächlicher qualifizierter Zugangstag beim Zahlungsdienstleister des Zahlers als ISO-Datum.}
\item{nach_annahmeschluss}{Expliziter Wahrheitswert: Zugang nach wirksam festgelegtem Annahmeschluss an einem Geschäftstag. Bei Terminauftrag FALSE.}
\item{vereinbarter_ausfuehrungstag_am}{Optionales qualifiziertes ISO-Ausführungsdatum nach675nII, nicht vor tatsächlichem Zugang; sonst null.}
\item{bankkalender}{Objekt mit genau erster_kalendertag, letzter_kalendertag (ISO-Daten) und geschaeftstage (unbenannte Liste1..10000 streng aufsteigender eindeutiger ISO-Daten innerhalb des Intervalls). Vollständiger Geschäftskalender des maßgeblichen Dienstleisters für den konkreten Zahlungsvorgang im angegebenen Intervall; keine Wochenendannahme. Die erforderlichen Vor-/Folgetage müssen enthalten sein.}
\item{kalendernachweis}{Nichtleerer Nachweis des Normfalls, tatsächlichen vollständigen Geschäftskalenders und der taggenau normalisierten Zugangs-/Terminbedingungen; Uhrzeiten, Annahmeschluss und Zeitzone extern qualifizieren.}
}
\details{Wirksamkeitszugang und für die Ausführungsfrist maßgeblichen Zugangstag getrennt bestimmen. §675n: Geschäftskalender des Zahlungsdienstleisters des Zahlers für den konkreten Vorgang vollständig im angegebenen Intervall vorgeben. Keine pauschale Werktags-/Feiertagskonvention. nach_annahmeschluss bedeutet nach einem wirksam festgelegten Zeitpunkt nahe Geschäftstagsende, nicht bloß außerhalb beliebiger Öffnungszeiten. Diese Verschiebung gilt nur für675sI, nicht pauschal für sämtliche Wirkungen des Zugangs. Bei vereinbartem Termin675nII diesen maßgeblichen Tag angeben, nach_annahmeschlussFALSE; tatsächlicher Zugang bleibt getrennt. Uhrzeiten, Zeitzonen und Intraday-Reihenfolge extern qualifizieren. ISO-Kalenderdaten0001..9999; Geschäftstagsliste1..10000 mit ausdrücklichem Abdeckungsintervall. Fehlende Kalenderabdeckung ist ungültig, keine Extrapolation.}
\value{wert: wirksamkeitszugangstag und zugangstag_fuer_ausfuehrungsfrist als ISO-Daten; Annahmeschluss verschiebt nur letzteren. Einheit: daten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_675n_T0001, BGB_675n_T0002, BGB_675n_T0003, BGB_675n_T0004, BGB_675n_T0005, BGB_675n_T0006}
\examples{
zahlungsauftrag_zugangstage(
  zugang_am = "2024-03-28",
  nach_annahmeschluss = FALSE,
  vereinbarter_ausfuehrungstag_am = NULL,
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
