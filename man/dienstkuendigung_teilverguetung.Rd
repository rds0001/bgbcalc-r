% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{dienstkuendigung_teilverguetung}
\alias{dienstkuendigung_teilverguetung}
\title{dienstkuendigung teilverguetung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{dienstkuendigung_teilverguetung(
  gesamtverguetung = NULL,
  leistungsanteil_zaehler = NULL,
  leistungsanteil_nenner = NULL,
  interesseloser_verguetungsanteil = NULL,
  selbst_gekuendigt = NULL,
  durch_vertragsbruch_des_anderen_veranlasst = NULL,
  fremdkuendigung_durch_eigenen_vertragsbruch = NULL,
  kuendigung_nach_626_627_nach_dienstbeginn = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{gesamtverguetung}{Nichtnegative rechtlich maßgebliche vereinbarte Gesamtvergütung in EUR für den betrachteten Leistungsumfang. Gleicher Bewertungsumfang wie Leistungsanteil.}
\item{leistungsanteil_zaehler}{Nichtnegative ganze Zahl des rechtlich bestimmten Anteils bisher erbrachter Leistung, höchstens Nenner und2^53-1. Nicht automatisch Zeitanteil; Wert/Umfang der vereinbarten Leistungen bestimmen.}
\item{leistungsanteil_nenner}{Positive ganze Bezugsgröße der gesamten betrachteten Leistung im selben Maßstab, höchstens2^53-1. Leistungsanteil0..1.}
\item{interesseloser_verguetungsanteil}{Nichtnegativer EUR-Anteil der bisher erarbeiteten Teilvergütung, dessen zugehörige Leistungen infolge der Kündigung für den anderen Teil kein Interesse mehr haben. Höchstens bisherige Teilvergütung. Rechtlich bewerteter Vergütungsanteil, nicht beliebige Schadenhöhe oder Interessenbewertung des gesamten Vertrags.}
\item{selbst_gekuendigt}{Wahrheitswert einer Kündigung durch den Dienstverpflichteten selbst. Rechtliche Kündigungserklärung und maßgeblichen Sachverhalt bestimmen.}
\item{durch_vertragsbruch_des_anderen_veranlasst}{Wahrheitswert: Eigenkündigung wurde durch vertragswidriges Verhalten des anderen Teils veranlasst. Nur bei Eigenkündigung für diese Verlustalternative maßgeblich.}
\item{fremdkuendigung_durch_eigenen_vertragsbruch}{Wahrheitswert: Dienstverpflichteter hat durch eigenes vertragswidriges Verhalten die Kündigung des anderen Teils veranlasst. Nicht jede Fremdkündigung gleichsetzen.}
\item{kuendigung_nach_626_627_nach_dienstbeginn}{Wahrheitswert einer rechtlich wirksamen Kündigung gerade nach§626 oder§627 nach Beginn der Dienstleistung. Gründe, Fristen, Kündigungsbefugnis und weitere Voraussetzungen vorab prüfen.}
\item{bewertungsnachweis}{Nichtleere Beschreibung von Kündigungsgrund/-richtung, Dienstbeginn, Leistungsanteil und kausal durch Kündigung eingetretenem Interessenverlust. Vorauszahlungen und gesonderte Schadenersatzansprüche separat.}
}
\details{Gesamtvergütung×bisheriger Leistungsanteil. Davon interesselosen Vergütungsanteil abziehen bei Eigenkündigung ohne Veranlassung durch Vertragsbruch des anderen ODER durch eigenen Vertragsbruch veranlasster Fremdkündigung. Nur§628 Absatz1 Sätze1/2; kein pauschaler Totalverlust bei Eigenkündigung. Interessenverlust gerade infolge Kündigung und höchstens bisherige Teilvergütung. VorausvergütungsrückzahlungSatz3 und KündigungsschadenAbsatz2 gesondert. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakte verbleibende EUR-Teilvergütung. Fehlender Anwendungsfall ergibt NICHT_ANWENDBAR/null. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_628_T0001, BGB_628_T0002}
\examples{
dienstkuendigung_teilverguetung(
  gesamtverguetung = "1200",
  leistungsanteil_zaehler = 1,
  leistungsanteil_nenner = 3,
  interesseloser_verguetungsanteil = "0",
  selbst_gekuendigt = FALSE,
  durch_vertragsbruch_des_anderen_veranlasst = FALSE,
  fremdkuendigung_durch_eigenen_vertragsbruch = FALSE,
  kuendigung_nach_626_627_nach_dienstbeginn = TRUE,
  bewertungsnachweis = paste0(
    "Synthetisch wirksame fristlose Dienstkündigung und bewertete",
    "r Leistungs-/Interessenanteil."
  )
)
}
