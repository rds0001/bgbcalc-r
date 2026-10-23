% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{betriebskostenpauschale_erhoehungsbeginn}
\alias{betriebskostenpauschale_erhoehungsbeginn}
\title{betriebskostenpauschale erhoehungsbeginn}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{betriebskostenpauschale_erhoehungsbeginn(
  erklaerungstag = NULL,
  kostenerhoehung_ab = NULL,
  kenntnis_am = NULL,
  massgebliches_dreimonatsfristende = NULL,
  kosten_rueckwirkend_erhoeht = NULL,
  erhoehung_nach_absatz_eins_zulaessig = NULL,
  zeitnachweis = NULL
)}
\arguments{
\item{erklaerungstag}{ISO-Datum0001..9999 des rechtlich maßgeblichen Tags der Erhöhungserklärung gegenüber dem Mieter. Nicht ungeprüft ein Versanddatum verwenden; rechtlichen Zugang und etwaige Sonderfälle im Nachweis bestimmen.}
\item{kostenerhoehung_ab}{ISO-Datum0001..9999 des Beginns der konkreten Betriebskostensteigerung. Bei rückwirkender Steigerung nicht später als Kenntnis. Mehrere Erhöhungen mit unterschiedlichen Anknüpfungsdaten getrennt behandeln.}
\item{kenntnis_am}{ISO-Datum0001..9999 der Kenntnis des Vermieters von genau dieser Kostensteigerung; nicht nach Erklärungstag. Löst die dreimonatige Erklärungsfrist für Rückwirkung aus.}
\item{massgebliches_dreimonatsfristende}{ISO-Datum0001..9999 des rechtlich maßgeblichen letzten Erklärungstags, nach Berechnung der Dreimonatsfrist und erforderlichen Kalenderkorrekturen. Darf die berechnete Grundfrist nicht verkürzen; eine spätere Grenze muss rechtlich nachgewiesen sein, nicht beliebig festgesetzt.}
\item{kosten_rueckwirkend_erhoeht}{Wahrheitswert, dass die konkrete Erhöhung der Betriebskosten rückwirkend erfolgt ist. Bloße verspätete Weitergabe längst bekannter Kosten ist nicht automatisch rückwirkende Kostensteigerung.}
\item{erhoehung_nach_absatz_eins_zulaessig}{Wahrheitswert der vorab geprüften Erhöhung einer Betriebskostenpauschale nach§560 Absatz1, insbesondere Vertragsgrundlage und ordnungsgemäße Erklärung mit bezeichnetem/erläutertem Grund. Weitere materielle Anforderungen einschließlich Wirtschaftlichkeit berücksichtigen. FALSE ergibt NICHT_ANWENDBAR.}
\item{zeitnachweis}{Nichtleere Beschreibung der Kostensteigerung, Kenntnis, maßgeblichen Erklärung und Dreimonatsfrist einschließlich zulässiger Kalenderkorrekturen.}
}
\details{Regulär Beginn des übernächsten Monats nach Erklärung. Bei qualifiziert rückwirkender Steigerung und rechtzeitiger Erklärung: späterer Tag aus Kostensteigerungsbeginn und Vorjahresbeginn der Erklärung. Keine Vorauszahlungen; keine Ermäßigung nachAbsatz3. Fristkorrekturen werden als belegtes maßgebliches Ende übergeben, Grundfrist zusätzlich berechnet und Mindestgrenze geprüft. Rechtswirksamen Erklärungstag bestimmen, nicht bloß Versanddatum. Mehrere Kostensteigerungen getrennt. ISO-Daten0001..9999; erforderliche resultierende Kalenderdaten ebenfalls in diesem Bereich. Explizite Wahrheitswerte und nichtleerer Nachweis.}
\value{wert enthält regulaerer_erhoehungsbeginn, rechnerisches_dreimonatsfristende und erhoehungsbeginn als ISO-Daten sowie dreimonatsfrist_eingehalten und rueckwirkung_anwendbar als Wahrheitswerte. Keine Zahlungsbeträge. Ohne zulässige Erhöhung NICHT_ANWENDBAR/null. Einheit: daten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_560_T0001, BGB_560_T0002, BGB_560_T0003, BGB_560_T0004}
\examples{
betriebskostenpauschale_erhoehungsbeginn(
  erklaerungstag = "2025-04-29",
  kostenerhoehung_ab = "2023-12-01",
  kenntnis_am = "2025-01-31",
  massgebliches_dreimonatsfristende = "2025-04-30",
  kosten_rueckwirkend_erhoeht = FALSE,
  erhoehung_nach_absatz_eins_zulaessig = TRUE,
  zeitnachweis = paste0(
    "Synthetisch rechtlich maßgeblicher Erklärungstag und belegte",
    " Frist, ohne zusätzliche Kalenderkorrektur."
  )
)
}
