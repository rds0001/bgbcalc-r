% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{immobiliardarlehen_wechselkursrechnung}
\alias{immobiliardarlehen_wechselkursrechnung}
\title{immobiliardarlehen wechselkursrechnung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{immobiliardarlehen_wechselkursrechnung(
  fremdwaehrungsbetrag = NULL,
  wechselkurs_vertrag = NULL,
  wechselkurs_vergleich = NULL,
  wechselkurs_umstellung = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{fremdwaehrungsbetrag}{Nichtnegative exakte Dezimalzeichenfolge oder Bruchobjekt. Zinssätze als Jahresquoten (0.05=5\%); Wechselkurse strikt positiv als Landeswährung je Fremdwährungseinheit, Fremdwährungsbetrag nichtnegativ.}
\item{wechselkurs_vertrag}{Nichtnegative exakte Dezimalzeichenfolge oder Bruchobjekt. Zinssätze als Jahresquoten (0.05=5\%); Wechselkurse strikt positiv als Landeswährung je Fremdwährungseinheit, Fremdwährungsbetrag nichtnegativ.}
\item{wechselkurs_vergleich}{Nichtnegative exakte Dezimalzeichenfolge oder Bruchobjekt. Zinssätze als Jahresquoten (0.05=5\%); Wechselkurse strikt positiv als Landeswährung je Fremdwährungseinheit, Fremdwährungsbetrag nichtnegativ.}
\item{wechselkurs_umstellung}{Nichtnegative exakte Dezimalzeichenfolge oder Bruchobjekt. Zinssätze als Jahresquoten (0.05=5\%); Wechselkurse strikt positiv als Landeswährung je Fremdwährungseinheit, Fremdwährungsbetrag nichtnegativ.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des qualifizierten gesetzlichen Falls und rechtlich bestimmten Zinssatz-/Kursgrundlagen; keine automatische Markt-/Effektivzinsberechnung.}
}
\details{Identischen Rest- oder Ratenbetrag zum Vertrags-/Vergleichskurs bewerten,120\%-Grenze prüfen und Umstellungswert berechnen. Nur §503 für qualifiziertes Immobiliar-Verbraucherdarlehen in Fremdwährung. Derselbe aktuelle Restbetrag oder dieselbe regelmäßige Rate wird in beiden Vergleichswerten verwendet, nicht ursprünglicher Nennbetrag gegen heutige Restschuld. Landeswährung nach Absatz1 einschließlich wirksamer Währungsvereinbarung rechtlich bestimmen. Restbetrag und Rate bei unterschiedlichen relevanten Werten separat prüfen; numerischer Auslöser liegt vor, wenn wenigstens einer strikt über20\% gestiegen ist. Umstellungskurs ist grundsätzlich Marktwechselkurs am Antragstag, bei wirksamer abweichender Vereinbarung deren Kurs; muss extern belegt werden. Kein Kursabruf, keine automatische Umwandlung/Vertragsänderung. Alle Kurse haben dieselbe ausdrückliche Orientierung Landeswährung je Fremdwährungseinheit. Exakte gemeinsame rationale Zahlengrenzen; Eingangszinsen nichtnegativ, rechnerischer korrigierter Sollzins vorzeichenbehaftet; Wechselkurse positiv, Währungsbetrag nichtnegativ.}
\value{wert enthält exakte Zinsquoten einschließlich gegebenenfalls negativem mathematischem Korrekturwert bzw. Landeswährungswerte und strikt geprüften120\%-Grenzvergleich. Einheit: landeswaehrung.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_503_T0002, BGB_503_T0004, BGB_503_T0005}
\examples{
immobiliardarlehen_wechselkursrechnung(
  fremdwaehrungsbetrag = "1000",
  wechselkurs_vertrag = "1",
  wechselkurs_vergleich = "1.21",
  wechselkurs_umstellung = "1.25",
  einordnungsnachweis = paste0(
    "Qualifiziertes503-Fremdwährungsdarlehen; gleicher aktueller ",
    "Restbetrag und belegter Umstellungskurs."
  )
)
}
