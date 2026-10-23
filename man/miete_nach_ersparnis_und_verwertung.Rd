% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{miete_nach_ersparnis_und_verwertung}
\alias{miete_nach_ersparnis_und_verwertung}
\title{miete nach ersparnis und verwertung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{miete_nach_ersparnis_und_verwertung(
  zeitraumsmiete = NULL,
  ersparte_aufwendungen = NULL,
  anderweitiger_verwertungsvorteil = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{zeitraumsmiete}{Nichtnegativer exakter rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge oder Bruchobjekt; einheitlicher Zeitraum und keine Doppelzählung. Jahresnutzungswert positiv und mindestens Vorenthaltungsnutzungswert.}
\item{ersparte_aufwendungen}{Nichtnegativer exakter rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge oder Bruchobjekt; einheitlicher Zeitraum und keine Doppelzählung. Jahresnutzungswert positiv und mindestens Vorenthaltungsnutzungswert.}
\item{anderweitiger_verwertungsvorteil}{Nichtnegativer exakter rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge oder Bruchobjekt; einheitlicher Zeitraum und keine Doppelzählung. Jahresnutzungswert positiv und mindestens Vorenthaltungsnutzungswert.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des gesetzlichen Anwendungsfalls, einheitlichen Abrechnungszeitraums und rechtlich qualifizierter Beträge.}
}
\details{Vom qualifizierten Mietbetrag ersparte Aufwendungen und anderweitigen Verwertungsvorteil abziehen, Rest mindestens null Nur §537 Absatz1 bei persönlicher Gebrauchshinderung des Mieters. Zeitraumsmiete muss Zeiträume nach Absatz2 ausschließen, für die wegen Drittüberlassung kein Mietanspruch besteht. Abzüge für denselben Zeitraum rechtlich bewerten und überschneidungsfrei eingeben. Kein zusätzlicher Anspruch auf einen negativen Rest; Mietminderung und andere Einwendungen gesondert. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist der exakt berechnete EUR-Betrag als Bruchobjekt. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_537_T0002}
\examples{
miete_nach_ersparnis_und_verwertung(
  zeitraumsmiete = "1000",
  ersparte_aufwendungen = "100",
  anderweitiger_verwertungsvorteil = "200",
  einordnungsnachweis = "Qualifizierter537I-Zeitraum ohne537II."
)
}
