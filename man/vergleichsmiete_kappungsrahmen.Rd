% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{vergleichsmiete_kappungsrahmen}
\alias{vergleichsmiete_kappungsrahmen}
\title{vergleichsmiete kappungsrahmen}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{vergleichsmiete_kappungsrahmen(
  ausgangsmiete_drei_jahre = NULL,
  nicht_anzurechnende_erhoehungen = NULL,
  derzeitige_monatsmiete = NULL,
  ortsuebliche_vergleichsmiete = NULL,
  gueltige_fuenfzehnprozent_verordnung = NULL,
  ausgleichszahlungsausnahme = NULL,
  drittmittelabzug_erforderlich = NULL,
  vergleichsmietregel_anwendbar = NULL,
  mietnachweis = NULL
)}
\arguments{
\item{ausgangsmiete_drei_jahre}{Nichtnegative rechtlich maßgebliche monatliche Ausgangsmiete in EUR am Beginn des einschlägigen Dreijahreszeitraums. Maßgeblichen Zeitpunkt zum beabsichtigten Wirksamwerden der Erhöhung und gegebenenfalls kürzere Vertragsdauer rechtlich bestimmen. Gleicher Mietbegriff wie übrige Beträge.}
\item{nicht_anzurechnende_erhoehungen}{Nichtnegative monatlich wirksame Summe der im Zeitraum für die Kappung nicht mitzuzählenden Erhöhungen nach§§559–560 in EUR, rechtlich bereinigt. Bereits in Ausgangsmiete enthaltene Erhöhungen nicht noch einmal addieren.}
\item{derzeitige_monatsmiete}{Nichtnegative bisherige rechtlich maßgebliche monatliche Miete in EUR, einschließlich inzwischen wirksamer berücksichtigter und nicht anzurechnender Erhöhungen. Konsistente Mietbasis; keine beliebige Warmmiete mit Nettokaltmiete vergleichen.}
\item{ortsuebliche_vergleichsmiete}{Nichtnegative rechtlich ermittelte ortsübliche Vergleichsmiete in EUR pro Monat für die konkrete Wohnung. Mietspiegel/Begründung, Vergleichbarkeit und Bewertungsstichtag zuvor bestimmen; kein automatisch aktueller Marktwert.}
\item{gueltige_fuenfzehnprozent_verordnung}{Wahrheitswert einer räumlich und zeitlich wirksamen landesrechtlichen Gebietsfestlegung nach§558 Absatz3 Satz2/3. TRUE wählt15Prozent, sonst20. Tatsächlich angespannter Markt ohne wirksame Verordnung allein genügt nicht.}
\item{ausgleichszahlungsausnahme}{Wahrheitswert einer einschlägigen Sonderausnahme nach§558 Absatz4. TRUE ergibt NICHT_ANWENDBAR für den regulären Betragsrahmen; Ausnahmebetrag und deren Wechselwirkung separat zu bestimmen.}
\item{drittmittelabzug_erforderlich}{Wahrheitswert eines erforderlichen Abzugs nach§558 Absatz5. TRUE führt aus diesem Grundmodell. Eine bereits anderweitig unklar bereinigte Vergleichsmiete ersetzt keine ausdrückliche Prüfung.}
\item{vergleichsmietregel_anwendbar}{Wahrheitswert des sachlich/zeitlich einschlägigen regulären§558, insbesondere keine entgegenstehende Staffel-/Indexmietbindung oder andere Sonderregel. Zeit- und Formvoraussetzungen des einzelnen Verlangens separat prüfen.}
\item{mietnachweis}{Nichtleere Beschreibung von Dreijahreszeitraum, Ausgangs-/Bestandsmiete, ausgeschlossenen Erhöhungen, Vergleichsmietbewertung, gültiger Gebietsverordnung und nicht vorliegenden Sonderfällen.}
}
\details{Kappungsbetrag=Ausgangsmiete×1,20 beziehungsweise1,15 + nicht anzurechnende Erhöhungen. Reguläre Obergrenze=min(Kappungsbetrag,Vergleichsmiete). Erhöhungsspielraum=max(Obergrenze-Bestandsmiete,0). Nur regulärer Betragsrahmen ohne AusnahmeAbsatz4 und DrittmittelAbsatz5. Zeit-/Form-/Zustimmungsvoraussetzungen separat. Nicht automatisch Senkung der Bestandsmiete, wenn diese oberhalb einer errechneten Grenze liegt. Erhöhungen§§559–560 rechtlich aus der Kappung herausrechnen, nicht doppelt berücksichtigen. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält kappungsgrenze_prozent als15/20 sowie kappungsbetrag_monatlich, obergrenze_monatlich, maximaler_erhoehungsbetrag und miete_nach_maximaler_erhoehung als exakte EUR-Brüche. Sonderfall/nicht anwendbar ergibt null. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_558_T0001, BGB_558_T0004, BGB_558_T0005, BGB_558_T0006, BGB_558_T0007, BGB_558_T0008, BGB_558_T0009, BGB_558_T0014}
\examples{
vergleichsmiete_kappungsrahmen(
  ausgangsmiete_drei_jahre = "500",
  nicht_anzurechnende_erhoehungen = "100",
  derzeitige_monatsmiete = "650",
  ortsuebliche_vergleichsmiete = "600",
  gueltige_fuenfzehnprozent_verordnung = FALSE,
  ausgleichszahlungsausnahme = FALSE,
  drittmittelabzug_erforderlich = FALSE,
  vergleichsmietregel_anwendbar = TRUE,
  mietnachweis = paste0(
    "Synthetischer konsistenter Mietverlauf und rechtlich bestimm",
    "te Vergleichsmiete."
  )
)
}
