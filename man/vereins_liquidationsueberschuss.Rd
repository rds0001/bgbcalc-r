% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{vereins_liquidationsueberschuss}
\alias{vereins_liquidationsueberschuss}
\title{vereins liquidationsueberschuss}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{vereins_liquidationsueberschuss(
  verfuegbares_liquidationsvermoegen = NULL,
  noch_zu_befriedigende_verbindlichkeiten = NULL,
  bestandsnachweis = NULL
)}
\arguments{
\item{verfuegbares_liquidationsvermoegen}{Nichtnegativer in EUR bestimmter verfügbarer Vermögensbestand für den konkreten Liquidationsstand, einschließlich bereits eingezogener Forderungen ohne Doppelzählung. Nicht verfügbare/streitige Werte nur nach rechtlicher Bewertung; keine automatische Gleichsetzung von Buchwert und verfügbarem Geld.}
\item{noch_zu_befriedigende_verbindlichkeiten}{Nichtnegative Summe in EUR aller zum gleichen Stand noch aus diesem Bestand zu befriedigenden Verbindlichkeiten einschließlich rechtlich zu berücksichtigender Liquidationslasten. Bereits bezahlte Verbindlichkeiten nicht erneut von bereits vermindertem Vermögen abziehen.}
\item{bestandsnachweis}{Nichtleere Beschreibung der zeitlich konsistenten und überschneidungsfreien Abgrenzung von verfügbarem Vermögen und offenen Verbindlichkeiten. Vollständigkeit, Hinterlegung, Sicherheiten und mögliche Insolvenzgründe separat prüfen.}
}
\details{Differenz=verfügbares Liquidationsvermögen minus noch zu befriedigende Verbindlichkeiten. Überschuss=max(Differenz,0); Fehlbetrag=max(-Differenz,0). Rechnerischer Bestand, keine Ausantwortungsreife. Tatsächliche Gläubigerbefriedigung, weitere Geschäfte, Sicherungen§52, Sperrjahr§51 und Insolvenzpflichten gesondert. Kein ungeprüftes Doppelzählen eingezogener Forderungen oder bereits bezahlter Schulden. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält ueberschuss und fehlbetrag als nichtnegative exakte EUR-Brüche. Positive Fehlbeträge nicht als negativer ausschüttbarer Anteil ausgeben. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_49_T0001, BGB_49_T0003}
\examples{
vereins_liquidationsueberschuss(
  verfuegbares_liquidationsvermoegen = "0",
  noch_zu_befriedigende_verbindlichkeiten = "0",
  bestandsnachweis = paste0(
    "Synthetischer konsistenter verfügbarer Bestand und offene Ve",
    "rbindlichkeiten."
  )
)
}
