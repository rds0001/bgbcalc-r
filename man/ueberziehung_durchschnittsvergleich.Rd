% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{ueberziehung_durchschnittsvergleich}
\alias{ueberziehung_durchschnittsvergleich}
\title{ueberziehung durchschnittsvergleich}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{ueberziehung_durchschnittsvergleich(
  kontosaldoabschnitte = NULL,
  bezugsbetrag = NULL,
  vergleichsregel = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{kontosaldoabschnitte}{Vollständige lückenlose/überschneidungsfreie Liste1..10000 Abschnitte mit positiver ganzzahliger kalendertage und nichtnegativem exaktem ueberziehungsbetrag; insgesamt höchstens1000000Tage. Guthabenzeiten als0 aufnehmen.}
\item{bezugsbetrag}{Bei kreditlinie_504a unveränderter vereinbarter Höchstbetrag; bei geduldete_ueberziehung_505 gesamter qualifizierter Geldeingang der letzten drei Monate. Nichtnegativer EUR-Dezimalwert/Bruch.}
\item{vergleichsregel}{kreditlinie_504a oder geduldete_ueberziehung_505.}
\item{einordnungsnachweis}{Nichtleerer Nachweis rechtlich maßgeblichen Beobachtungszeitraums und lückenloser Kontosaldoabschnitte; Monatsdauer/Rechnungsabschluss separat qualifizieren.}
}
\details{Zeitgewichteten Überziehungsdurchschnitt mit3/4 Kreditlinie beziehungsweise1/6 Gesamtdreimonatsgeldeingang vergleichen. §504a Absatz1/§505 Absatz2: Abschnitte müssen den rechtlich maßgeblichen Beobachtungszeitraum lückenlos und überschneidungsfrei abdecken; jeder Betrag gilt an allen eingegebenen Kalendertagen des Abschnitts. Guthabenzeiten mit Überziehungsbetrag0 einbeziehen, nicht weglassen. Nullabschnitt widerlegt rechnerisch ununterbrochene positive Nutzung; fehlende Tage werden nicht automatisch entdeckt. bezugsbetrag ist bei504a der für den Zeitraum unverändert vereinbarte Höchstbetrag; bei505 der gesamte maßgebliche Geldeingang der letzten drei Monate, dessen Monatsdurchschnitt ein Drittel beträgt, davon Hälfte=ein Sechstel. Geänderte Kreditlinien und andere Bewertungs-/Zeitgewichtungskonventionen gesondert qualifizieren. Beobachtungsdauer allein erfüllt nicht die zusätzlichen gesetzlichen Sechsmonats-/Mehr-als-Dreimonatsbedingungen; Kalendermonate mit Kalenderkern prüfen, niemals pauschal180/90Tage. Maßgeblichen Rechnungsabschluss rechtlich bestimmen. Ergebnis ist Betrags-/Kontinuitätsrechnung, keine automatische Beratungspflicht. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält beobachtete_kalendertage, durchschnittlicher_ueberziehungsbetrag, betragsgrenze, betragsgrenze_strikt_ueberschritten und alle_abschnitte_mit_positiver_ueberziehung; Geldbeträge exakte EUR-Brüche. Einheit: EUR_und_tage.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_504a_T0001, BGB_505_T0004}
\examples{
ueberziehung_durchschnittsvergleich(
  kontosaldoabschnitte = list(
    list(
    "kalendertage" = 10,
    "ueberziehungsbetrag" = "100"
  ),
    list(
    "kalendertage" = 20,
    "ueberziehungsbetrag" = "200"
  )
  ),
  bezugsbetrag = "200",
  vergleichsregel = "kreditlinie_504a",
  einordnungsnachweis = paste0(
    "Qualifizierter lückenloser Beobachtungszeitraum; zeitgewicht",
    "ete Beträge; Kalenderdauer separat."
  )
)
}
