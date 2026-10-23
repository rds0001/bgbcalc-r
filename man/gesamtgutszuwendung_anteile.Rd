% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{gesamtgutszuwendung_anteile}
\alias{gesamtgutszuwendung_anteile}
\title{gesamtgutszuwendung anteile}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{gesamtgutszuwendung_anteile(
  zuwendungswert = NULL,
  abstammungszuordnung = NULL,
  ersatzpflichtzuordnung = NULL,
  gesamtgut_anwendbar = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{zuwendungswert}{Rechtlich bewerteter nichtnegativer EUR-Wert einer einzelnen Gesamtgutszuwendung; exakte Dezimalzeichenfolge oder Bruch. Keine eigene Schenkungsbewertung.}
\item{abstammungszuordnung}{keine, ehegatte_1 oder ehegatte_2. Ausschließlich die Abstammungsausnahme des§2331 Absatz1 Satz2: Empfänger ist Abkömmling nur dieses Ehegatten oder Person, von der nur dieser Ehegatte abstammt. Gemeinsame Abstammung: keine.}
\item{ersatzpflichtzuordnung}{keine, ehegatte_1 oder ehegatte_2. Rechtlich festgestellte Ersatzpflicht dieses Ehegatten gegenüber dem Gesamtgut gerade wegen der Zuwendung. Widerspruch zur Abstammungszuordnung führt NICHT_ANWENDBAR; kein erfundener Vorrang.}
\item{gesamtgut_anwendbar}{Expliziter Wahrheitswert: Zuwendung stammt aus Gesamtgut der Gütergemeinschaft oder fortgesetzten Gütergemeinschaft§2331 Absatz2. FALSE ergibt NICHT_ANWENDBAR.}
\item{einordnungsnachweis}{Nichtleere rechtliche Begründung des Gesamtguts, der Bewertung und beider Sonderzuordnungen. Ehegatte_1/2 bezeichnet stets dieselben ursprünglichen Ehegatten.}
}
\details{Ohne Sonderzuordnung je Hälfte, bei eindeutiger Abstammungs-/Ersatzpflichtzuordnung alles diesem Ehegatten, dem anderen null. Exakte Multiplikation des Wertes mit den Quoten. Keine eigene Wertbestimmung, Pflichtteilsquote, Abschmelzung oder Zahlungsforderung. Kollidierende Sonderzuordnungen außerhalb des Modells, NICHT_ANWENDBAR. Fortgesetzte Gütergemeinschaft entsprechend. Nichtnegative exakte Beträge innerhalb gemeinsamer Numerikgrenzen, Auswahlwerte und Wahrheitswert.}
\value{wert enthält quote_ehegatte_1, quote_ehegatte_2, betrag_ehegatte_1 und betrag_ehegatte_2 als exakte Brüche. Einheit: quoten_und_EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2331_T0001, BGB_2331_T0002, BGB_2331_T0003}
\examples{
gesamtgutszuwendung_anteile(
  zuwendungswert = "101",
  abstammungszuordnung = "keine",
  ersatzpflichtzuordnung = "keine",
  gesamtgut_anwendbar = TRUE,
  einordnungsnachweis = paste0(
    "Synthetisch vollständig qualifiziertes Gesamtgut und Zuordnu",
    "ng nach§2331."
  )
)
}
