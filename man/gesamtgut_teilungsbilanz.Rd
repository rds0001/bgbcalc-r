% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{gesamtgut_teilungsbilanz}
\alias{gesamtgut_teilungsbilanz}
\title{gesamtgut teilungsbilanz}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{gesamtgut_teilungsbilanz(
  bereinigte_masse_ohne_ersatzforderungen = NULL,
  ersatzschuld_ehegatte = NULL,
  ersatzschuld_anderer = NULL,
  bilanznachweis = NULL
)}
\arguments{
\item{bereinigte_masse_ohne_ersatzforderungen}{Nichtnegativer Wert des sonstigen verbleibenden Gesamtguts in EUR nach erledigter§1475-Berichtigung/Rückbehalten, OHNE die beiden gesondert eingegebenen Ersatzforderungen. Keine Doppelzählung.}
\item{ersatzschuld_ehegatte}{Nichtnegative rechtlich festgestellte, in voller Höhe realisierbare/anrechenbare Ersatzschuld des ersten Ehegatten zum Gesamtgut in EUR.}
\item{ersatzschuld_anderer}{Entsprechende Ersatzschuld des anderen Ehegatten zum Gesamtgut in EUR.}
\item{bilanznachweis}{Nichtleerer Nachweis der Massenabgrenzung, erledigten vorrangigen Berichtigung/Rückbehalte und voll bewerteten beiderseitigen Ersatzforderungen.}
}
\details{Teilungsmasse=Masse ohne Ersatzforderungen+Ersatzschuld1+Ersatzschuld2; Halbanteil=Teilungsmasse/2; jeweiliger Saldo=Halbanteil-eigene Ersatzschuld. Anrechnung=min(Halbanteil,Ersatzschuld), Anspruch=max(Saldo,0), Restersatzpflicht=max(-Saldo,0). §1476I/II im Standardfall nach erledigter vorrangiger Verbindlichkeitenberichtigung und erforderlichen Rückbehalten nach§1475. Eingabemasse umfasst sonstiges verbleibendes Gesamtgut, aber gerade keine der gesondert eingegebenen Ersatzforderungen und keine nochmals abzuziehenden schon berücksichtigten Schulden. Beide Ersatzforderungen sind rechtlich festgestellt und in voller angesetzter Höhe realisierbar beziehungsweise anrechenbar; Abschläge wegen Uneinbringlichkeit, Insolvenz und Bewertungsstreit gesondert. Vor Halbteilung gehören die Ersatzforderungen zur Masse, danach wird die jeweilige Ersatzschuld auf den eigenen Halbanteil angerechnet; bloßes Halbieren der ersatzforderungsfreien Masse wäre falsch. Positiver Anspruch kann vorhandene Restmasse plus noch zu leistenden Ersatz des anderen umfassen und ist kein Nachweis sofort verfügbarer Barauszahlung. Negativer Saldo bedeutet überschießende Restersatzpflicht nachAbsatz2, nicht negativer Auszahlungsbetrag. Sonderrückerstattung§1478, Abfindungen§1501 und abweichende Vereinbarungen nicht in diese Standardbilanz hineinmischen. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält teilungsmasse_einschliesslich_ersatzforderungen und je ehegatte/anderer_ehegatte halbanteil, ersatzanrechnung, auseinandersetzungssaldo (kann negativ sein), auseinandersetzungsanspruch und restersatzpflicht als exakte EUR-Brüche. Anspruch nicht mit sofortigem Bargeldbestand gleichsetzen. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1476_T0001, BGB_1476_T0002, BGB_1476_T0003}
\examples{
gesamtgut_teilungsbilanz(
  bereinigte_masse_ohne_ersatzforderungen = "100",
  ersatzschuld_ehegatte = "0",
  ersatzschuld_anderer = "0",
  bilanznachweis = paste0(
    "Sonstige Masse nach§1475; beide Ersatzforderungen nicht enth",
    "alten und voll anrechenbar/werthaltig."
  )
)
}
