% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{unterhalt_rueckwirkungsbeginn}
\alias{unterhalt_rueckwirkungsbeginn}
\title{unterhalt rueckwirkungsbeginn}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{unterhalt_rueckwirkungsbeginn(
  auskunftsaufforderung_am = NULL,
  verzug_am = NULL,
  rechtshaengigkeit_am = NULL,
  anspruchsbeginn_am = NULL,
  anlassnachweis = NULL
)}
\arguments{
\item{auskunftsaufforderung_am}{Optionales ISO-Datum einer für Geltendmachung gerade dieses Unterhalts rechtlich wirksamen Auskunftsaufforderung, sonstNULL.}
\item{verzug_am}{Optionales ISO-Datum wirksamen Verzugs für denselben Anspruch, sonstNULL.}
\item{rechtshaengigkeit_am}{Optionales ISO-Datum einschlägiger Rechtshängigkeit, sonstNULL. Mindestens eines der drei qualifizierten Ereignisse erforderlich.}
\item{anspruchsbeginn_am}{ISO-Datum des rechtlich bestimmten Beginns eines danach durchgehend dem Grunde nach bestehenden Unterhaltsverhältnisses, keine bloße Betragsänderung.}
\item{anlassnachweis}{Nichtleerer Nachweis der Wirksamkeit/Anspruchszuordnung jedes angegebenen Ereignisses und des durchgehenden Anspruchsbeginns.}
}
\details{Anlass=min(angegebene qualifizierte Ereignisse). Wenn Anspruchsbeginn<=Anlassmonatsanfang: Rückwirkung ab Monatsanfang; sonst max(Anlass,Anspruchsbeginn). §1613I für ein rechtlich abgegrenztes durchgehend bestehendes Unterhaltsverhältnis. Nur für Geltendmachung dieses Unterhalts wirksame Auskunftsaufforderung, wirksamen Verzug oder Rechtshängigkeit eingeben; unwirksame oder anders zugeordnete Ereignisse nicht eintragen. Anspruchsbeginn ist qualifizierter Beginn des dem Grunde nach bestehenden Anspruchs, nicht Beginn bloß einer späteren Betragsänderung. Besteht er am ersten Tag des Monats des frühesten Ereignisses, gilt dieser Monatsanfang; andernfalls keine pauschale Rückverlagerung auf Anspruchsentstehung vor dem Anlass. Ein rechtlich bereits vor Anspruchsbeginn wirksamer Anlass kann keinen Unterhalt vor Anspruchsentstehung erzeugen. Anspruchsunterbrechungen oder wechselnde Unterhaltsverhältnisse getrennt berechnen. Sonderbedarf/Hinderungsfälle nachAbsatz2, HärteregelAbsatz3, Erfüllung und Betragshöhe nicht berechnet. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält fruehester_qualifizierter_anlass, anlassmonatsanfang und rueckwirkungsbeginn als ISO-Daten. Einheit: daten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1613_T0001, BGB_1613_T0002}
\examples{
unterhalt_rueckwirkungsbeginn(
  auskunftsaufforderung_am = "2030-03-15",
  verzug_am = "2030-04-01",
  rechtshaengigkeit_am = "2030-05-01",
  anspruchsbeginn_am = "2030-01-01",
  anlassnachweis = paste0(
    "Alle angegebenen Ereignisse für denselben durchgehend besteh",
    "enden Anspruch rechtlich qualifiziert."
  )
)
}
