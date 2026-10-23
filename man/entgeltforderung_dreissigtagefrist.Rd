% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{entgeltforderung_dreissigtagefrist}
\alias{entgeltforderung_dreissigtagefrist}
\title{entgeltforderung dreissigtagefrist}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{entgeltforderung_dreissigtagefrist(
  faelligkeit_am = NULL,
  bezugsereignis_am = NULL,
  bezugsart = NULL,
  dreissigtageregel_anwendbar = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{faelligkeit_am}{ISO-Datum der rechtlich maßgeblichen Fälligkeit, nicht bloß Rechnungsdatum.}
\item{bezugsereignis_am}{ISO-Datum des tatsächlichen Zugangs der Rechnung/gleichwertigen Zahlungsaufstellung; bei rechtlich zulässigem Ersatzfall Datum des Gegenleistungsempfangs.}
\item{bezugsart}{rechnungszugang oder gegenleistungsempfang_bei_unsicherem_zugang. Ersatzfall ausschließlich Nichtverbraucher bei unsicherem Rechnungszugang.}
\item{dreissigtageregel_anwendbar}{Explizite Bestätigung des286III-Falls, bei Verbrauchern insbesondere besonderer Folgenhinweis; FALSE ergibt NICHT_ANWENDBAR.}
\item{einordnungsnachweis}{Nichtleerer Nachweis der Fälligkeit, Zugang/Empfang, Fallwahl und ggf.Verbraucherhinweis.}
}
\details{Maximum aus Fälligkeit und Bezugstag;30Tage Ereignisfrist und nachfolgender Kalendertag. Nur rechnerische Grundfrist. Kein endgültiger Verzugsbeginn: frühere Verzugsgründe, Leistung, Vertretenmüssen, wirksame Vereinbarungen und erforderliche Kalenderkorrekturen separat. ISO-Daten im Bereich0001..9999 inklusive berechneter Folgetage; feste Fallwahl undWahrheitswert.}
\value{wert: massgeblicher_beginn, grundfristende und tag_nach_grundfrist alsISO-Daten. Einheit: daten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_286_T0009, BGB_286_T0010}
\examples{
entgeltforderung_dreissigtagefrist(
  faelligkeit_am = "2030-01-01",
  bezugsereignis_am = "2030-01-10",
  bezugsart = "rechnungszugang",
  dreissigtageregel_anwendbar = TRUE,
  einordnungsnachweis = "Synthetisch qualifizierter286III-Fall."
)
}
