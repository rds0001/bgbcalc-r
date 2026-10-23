% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{minderjaehrigen_unterhaltsfehlbetrag}
\alias{minderjaehrigen_unterhaltsfehlbetrag}
\title{minderjaehrigen unterhaltsfehlbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{minderjaehrigen_unterhaltsfehlbetrag(
  unterhaltsbedarf = NULL,
  anrechenbare_vermoegenseinkuenfte = NULL,
  anrechenbarer_arbeitsertrag = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{unterhaltsbedarf}{Nichtnegativer qualifizierter Bedarf des minderjährigen Kindes für bestimmte Periode in EUR.}
\item{anrechenbare_vermoegenseinkuenfte}{Nichtnegative rechtlich anrechenbare Vermögenserträge derselben Periode in EUR; kein Vermögensstamm.}
\item{anrechenbarer_arbeitsertrag}{Nichtnegativer rechtlich anrechenbarer Arbeitsertrag derselben Periode in EUR.}
\item{bewertungsnachweis}{Nichtleerer Nachweis von Minderjährigkeit/Elternbeziehung, Bedarf und Anrechenbarkeit; keine ungeprüften Bruttowerte.}
}
\details{Fehlbetrag=max(Bedarf-Vermögenserträge-Arbeitserträge,0), ohne Vermögensstamm. §1602II im Verhältnis des minderjährigen Kindes zu seinen Eltern. Bedürftigkeitsrest, kein abschließender Zahlungsanspruch gegen einzelne Elternteile. Kindesalter, Bedarf, Anrechenbarkeit und identischer Zeitraum rechtlich qualifiziert; Einkünfte nicht ungeprüft brutto einsetzen. Vermögensstamm wird nicht verbraucht und ist keine Eingabe. Rang, Leistungsfähigkeit, Kindergeldbehandlung, weitere Deckungsmittel, Naturalunterhalt und Elternverteilung gesondert und ohne Doppelanrechnung. Nicht ungeprüft auf volljährige Kinder übertragen. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter EUR-Fehlbetrag. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1602_T0002}
\examples{
minderjaehrigen_unterhaltsfehlbetrag(
  unterhaltsbedarf = "1000",
  anrechenbare_vermoegenseinkuenfte = "100",
  anrechenbarer_arbeitsertrag = "200",
  bewertungsnachweis = paste0(
    "Qualifizierter minderjähriger Bedarf und anrechenbare Erträg",
    "e derselben Periode."
  )
)
}
