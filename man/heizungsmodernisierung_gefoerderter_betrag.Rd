% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{heizungsmodernisierung_gefoerderter_betrag}
\alias{heizungsmodernisierung_gefoerderter_betrag}
\title{heizungsmodernisierung gefoerderter betrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{heizungsmodernisierung_gefoerderter_betrag(
  kosten_wohnung = NULL,
  von_erhaltungspauschale_ausgenommene_kosten = NULL,
  abzuziehende_drittmittel = NULL,
  monatliche_restkappungsgrenze = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{kosten_wohnung}{Nichtnegativer exakter EUR-Betrag als Dezimalzeichenfolge oder Bruchobjekt. Ausgenommene Kosten höchstens Wohnungskosten; kostenmindernde Drittmittel positiv und höchstens Wohnungskosten.}
\item{von_erhaltungspauschale_ausgenommene_kosten}{Nichtnegativer exakter EUR-Betrag als Dezimalzeichenfolge oder Bruchobjekt. Ausgenommene Kosten höchstens Wohnungskosten; kostenmindernde Drittmittel positiv und höchstens Wohnungskosten.}
\item{abzuziehende_drittmittel}{Nichtnegativer exakter EUR-Betrag als Dezimalzeichenfolge oder Bruchobjekt. Ausgenommene Kosten höchstens Wohnungskosten; kostenmindernde Drittmittel positiv und höchstens Wohnungskosten.}
\item{monatliche_restkappungsgrenze}{Nichtnegativer exakter EUR-Betrag als Dezimalzeichenfolge oder Bruchobjekt. Ausgenommene Kosten höchstens Wohnungskosten; kostenmindernde Drittmittel positiv und höchstens Wohnungskosten.}
\item{einordnungsnachweis}{Nichtleerer Nachweis §559e-Kapitalzuschussfall, nach §559 Absatz3 zugeordneter Wohnungskosten, Absatz2-Satz2-Ausnahmeanteils und vorab bestimmter monatlicher Restkappungsgrenze. Laufende Förderung und Zinsvergünstigungen außerhalb dieses Falls.}
}
\details{15 Prozent des nicht ausgenommenen Kostenanteils abziehen, danach qualifizierte Drittmittel abziehen und bei null begrenzen; zehn Prozent jährlich, durch zwölf teilen und auf vorab bestimmte monatliche Restkappungsgrenze begrenzen. Nur §559e mit tatsächlich in Anspruch genommenen, einmaligen kostenmindernden Drittmitteln als positivem Betrag. Kosten bereits nach §559 Absatz3 der Wohnung zugeordnet. Ausgenommenen Kostenanteil nach lokaler Fassung §559e Absatz2 Satz2 (Heizungsanlage im Sinne §43 Gebäudemodernisierungsgesetz) ausdrücklich qualifizieren, andernfalls null. Keine automatische Förderfähigkeit, Kostenverteilung, Härteprüfung oder Wirksamkeit. Restkappungsgrenze zuvor nach §559e Absatz3 rechtlich bestimmen, etwa mit modernisierung_kappungsgrenze; keine doppelte Anrechnung bisheriger Erhöhungen. Fälle laufender Zuschüsse, Darlehen und Zinsvergünstigungen einschließlich ihrer Reihenfolge zur Kappung bleiben außerhalb dieses Kapitalzuschussfalls. Ohne Förderung gilt anderer Ansatz §559. Keine tatsächlichen Erhaltungskosten zusätzlich zur Pauschale abziehen. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält erhaltungspauschale, kostenbasis, jahresbetrag_vor_kappung, monatsbetrag_vor_kappung und gekappter_monatsbetrag als exakte EUR-Bruchobjekte. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_559e_T0001, BGB_559e_T0003, BGB_559e_T0004, BGB_559e_T0005, BGB_559e_T0006}
\examples{
heizungsmodernisierung_gefoerderter_betrag(
  kosten_wohnung = "30000",
  von_erhaltungspauschale_ausgenommene_kosten = "0",
  abzuziehende_drittmittel = "9000",
  monatliche_restkappungsgrenze = "40",
  einordnungsnachweis = paste0(
    "Förderfähige Maßnahme; Kapitalzuschuss und qualifizierte Res",
    "tkappung; keine laufende Förderung."
  )
)
}
