% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{digitale_vertragsgrundfrist}
\alias{digitale_vertragsgrundfrist}
\title{digitale vertragsgrundfrist}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{digitale_vertragsgrundfrist(
  fristfall = NULL,
  ereignis_am = NULL,
  aenderung_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{fristfall}{Genau einer der Fälle: minderung_erstattung: §327n Absatz4: Zugang der Minderungserklärung beim Unternehmer; Höchstfrist ersetzt nicht unverzügliche Erstattung.; beendigung_erstattung: §327o Absatz4 mit§327n Absatz4: Zugang der Beendigungserklärung; Höchstfrist ersetzt nicht unverzügliche Erstattung.; datentraeger_rueckforderung: §327o Absatz5: rechtlich wirksame Vertragsbeendigung; Frist für das Rücksendeverlangen des Unternehmers, nicht Rücksendefrist des Verbrauchers.; aenderung_beendigung: §327r Absatz3: Zugang der qualifizierten Änderungsinformation, bei späterer Änderung deren Zeitpunkt; AusnahmenAbsatz4/6 und Beeinträchtigung gesondert.; regress_nichtbereitstellung: §327u Absatz2 Nummer1: Ausübung des Verbraucherrechts nach§327c Absatz1 Satz1; nicht erst Erstattung oder spätere Beschwerde.; regress_nacherfuellung: §327u Absatz2 Nummer2: Erfüllung der Verbraucheransprüche nach§327l Absatz1; keine automatische Hemmung oder Neubeginn.; beweislast_einmalbereitstellung: §327k Absatz1: Bereitstellung an Verbraucher, auch im Rückgriff327u Absatz3; nur zeitliche Einjahresgrenze, keine Beweis-/Mangelentscheidung. DauerbereitstellungAbsatz2 gesondert.}
\item{ereignis_am}{ISO-Datum des qualifizierten Ereignisses nach Fall; im Änderungsfall Zugang der vorgeschriebenen Information.}
\item{aenderung_am}{Nur im Fall aenderung_beendigung zwingendes ISO-Datum der tatsächlichen/maßgeblichen Änderung; in anderen Fällen null/None.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des digitalen Vertrags-/Regressfalls und rechtlich maßgeblicher Ereignisse; andere Fristkorrekturen separat.}
}
\details{14TageErstattungs-/Datenträgerverlangen;30TageÄnderungsbeendigung abmax(Information,Änderung);6MonateRegress abRechtsausübung/Nacherfüllung;1JahrBeweislastzeit abBereitstellung. Nur rechnerische Grundfrist; keine vollständige Anspruchs-/Mangelprüfung, keine automatische Vertragsbeendigung/Verjährung. Dauerbereitstellungsbeweislast und Kalender-/Hemmungskorrekturen gesondert. Datenträgerfrist für Verlangen des Unternehmers, nicht Rücksendung des Verbrauchers. ISO-Daten/Ergebnis0001..9999; feste Fallliste; Änderungstag genau imÄnderungsfall erforderlich.}
\value{wert enthält massgeblicher_ausloesertag und rechnerisches_fristende, beide ISO-Datum. Einheit: daten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_327k_T0001, BGB_327n_T0008, BGB_327n_T0009, BGB_327o_T0007, BGB_327o_T0008, BGB_327r_T0009, BGB_327r_T0010, BGB_327r_T0011, BGB_327u_T0003, BGB_327u_T0005, BGB_327u_T0006, BGB_327u_T0007}
\examples{
digitale_vertragsgrundfrist(
  fristfall = "minderung_erstattung",
  ereignis_am = "2028-02-29",
  aenderung_am = NULL,
  einordnungsnachweis = paste0(
    "Qualifizierter digitaler Vertragsfall und maßgeblicher Auslö",
    "ser."
  )
)
}
