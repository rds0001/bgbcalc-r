% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{verbandsklage_hemmungsnachlauf}
\alias{verbandsklage_hemmungsnachlauf}
\title{verbandsklage hemmungsnachlauf}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{verbandsklage_hemmungsnachlauf(
  verfahrensende_am = NULL,
  teilnahmefall = NULL,
  teilnahmeende_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{verfahrensende_am}{Optionales ISO-Datum der Rechtskraft beziehungsweise anderweitigen Beendigung des einschlägigen Verfahrens; kein bloßer Stillstand. Bei noch nicht eingetretenem Ereignis null.}
\item{teilnahmefall}{Expliziter Wahrheitswert, ob ein Teilnahmefall nach204aIII2 vorliegt.}
\item{teilnahmeende_am}{Nur im Teilnahmefall optionales ISO-Datum des tatsächlichen Teilnahmeendes, etwa wirksame Rücknahme der Anmeldung; andernfalls null.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des204a-Verfahrens, Anwendbarkeit, qualifizierter Endereignisse und gegebenenfalls Teilnahmefall.}
}
\details{Frühestes einschlägiges Verfahrens-/Teilnahmeende bestimmen und sechsmonatigen Hemmungsnachlauf berechnen. §204aIII: sechsmonatiger Nachlauf ab rechtskräftiger Entscheidung/anderweitigem Verfahrensende entsprechend204II1; im qualifizierten Teilnahmefall auch ab Ende der Teilnahme, insbesondere Rücknahme der Registeranmeldung. Wenn beide einschlägigen Ereignisse feststehen, maßgeblich ist das frühere Nachlaufende. Kein Stillstand durch Nichtbetreiben als zusätzlicher204a-Auslöser: der Verweis nennt nur204II1. Teilnahmefall ausschließlich204aI1Nr3/4 oderII2, gegebenenfalls gleichgestellte UnternehmerIV; keine beliebige Nichtteilnahme bei Unterlassungsklage. Ohne bekanntes Endereignis kein fiktives Ende des laufenden Schutzes. Keine automatische Addition des Ergebnisses zur Verjährungsfrist: normierte tatsächliche Hemmungstage und209 gesondert berechnen. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.rechnerisches_nachlaufende alsYYYY-MM-DD; kein Anspruchsverjährungsdatum. Einheit: datum.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_204_T0024, BGB_204a_T0020, BGB_204a_T0021, BGB_204a_T0022}
\examples{
verbandsklage_hemmungsnachlauf(
  verfahrensende_am = "2024-01-31",
  teilnahmefall = FALSE,
  teilnahmeende_am = NULL,
  einordnungsnachweis = paste0(
    "§204aIII: sechsmonatiger Nachlauf ab rechtskräftiger Entsche",
    "idung/anderweitigem Verfahrensende entsprechend204II1; im qu",
    "alifizierten Teilnahmefall auch ab Ende der Teilnahme, insbe",
    "sondere Rücknahme der Registeranmeldung. Wenn beide einschlä",
    "gigen Ereignisse feststehen, maßgeblich ist das frühere Nach",
    "laufende. Kein Stillstand durch Nichtbetreiben als zusätzlic",
    "her204a-Auslöser: der Verweis nennt nur204II1. Teilnahmefall",
    " ausschließlich204aI1Nr3/4 oderII2, gegebenenfalls gleichges",
    "tellte UnternehmerIV; keine beliebige Nichtteilnahme bei Unt",
    "erlassungsklage. Ohne bekanntes Endereignis kein fiktives En",
    "de des laufenden Schutzes. Keine automatische Addition des E",
    "rgebnisses zur Verjährungsfrist: normierte tatsächliche Hemm",
    "ungstage und209 gesondert berechnen."
  )
)
}
