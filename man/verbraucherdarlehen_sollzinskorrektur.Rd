% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{verbraucherdarlehen_sollzinskorrektur}
\alias{verbraucherdarlehen_sollzinskorrektur}
\title{verbraucherdarlehen sollzinskorrektur}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{verbraucherdarlehen_sollzinskorrektur(
  vertraglicher_sollzinssatz = NULL,
  angegebener_effektiver_jahreszins = NULL,
  tatsaechlicher_effektiver_jahreszins = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{vertraglicher_sollzinssatz}{Nichtnegative exakte Dezimalzeichenfolge oder Bruchobjekt. Zinssätze als Jahresquoten (0.05=5\%); Wechselkurse strikt positiv als Landeswährung je Fremdwährungseinheit, Fremdwährungsbetrag nichtnegativ.}
\item{angegebener_effektiver_jahreszins}{Nichtnegative exakte Dezimalzeichenfolge oder Bruchobjekt. Zinssätze als Jahresquoten (0.05=5\%); Wechselkurse strikt positiv als Landeswährung je Fremdwährungseinheit, Fremdwährungsbetrag nichtnegativ.}
\item{tatsaechlicher_effektiver_jahreszins}{Nichtnegative exakte Dezimalzeichenfolge oder Bruchobjekt. Zinssätze als Jahresquoten (0.05=5\%); Wechselkurse strikt positiv als Landeswährung je Fremdwährungseinheit, Fremdwährungsbetrag nichtnegativ.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des qualifizierten gesetzlichen Falls und rechtlich bestimmten Zinssatz-/Kursgrundlagen; keine automatische Markt-/Effektivzinsberechnung.}
}
\details{Sollzinssatz um die positive Differenz zwischen tatsächlichem und angegebenem Effektivzins vermindern. Nur §494 Absatz3 bei qualifiziert zu niedrig angegebenem effektivem Jahreszins. Zinssätze als Jahresquoten eingeben, etwa0.05 für5Prozent; Differenz von6\%und5\% ist ein Prozentpunkt, kein relativer Abschlag von20\%. Tatsächlichen Effektivzins extern nach einschlägigen Vorgaben berechnen. Ergebnis ist der vorzeichenbehaftete mathematische Korrekturwert ohne im Normtext nicht genannte Nulluntergrenze; negative Ergebnisse begründen hier keine automatische Zahlungspflicht des Darlehensgebers. Fehlende Angaben nach Absatz2, Kostenwegfall nach Absatz4 und neue Raten nach Absatz5 separat behandeln; keine automatische Annuitätenformel. Exakte gemeinsame rationale Zahlengrenzen; Eingangszinsen nichtnegativ, rechnerischer korrigierter Sollzins vorzeichenbehaftet; Wechselkurse positiv, Währungsbetrag nichtnegativ.}
\value{wert enthält exakte Zinsquoten einschließlich gegebenenfalls negativem mathematischem Korrekturwert bzw. Landeswährungswerte und strikt geprüften120\%-Grenzvergleich. Einheit: zinssaetze.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_494_T0004}
\examples{
verbraucherdarlehen_sollzinskorrektur(
  vertraglicher_sollzinssatz = "0.05",
  angegebener_effektiver_jahreszins = "0.06",
  tatsaechlicher_effektiver_jahreszins = "0.08",
  einordnungsnachweis = "Qualifizierte Effektivzins-Unterangabe und Jahresquoten."
)
}
