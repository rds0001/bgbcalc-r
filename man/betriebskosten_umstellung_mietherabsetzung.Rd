% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{betriebskosten_umstellung_mietherabsetzung}
\alias{betriebskosten_umstellung_mietherabsetzung}
\title{betriebskosten umstellung mietherabsetzung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{betriebskosten_umstellung_mietherabsetzung(
  bisherige_zeitraummiete = NULL,
  bisher_enthaltener_kostenanteil = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{bisherige_zeitraummiete}{Nichtnegativer exakter qualifizierter EUR-Betrag als Dezimalzeichenfolge/Bruch; Miete und Kosten gleiche Zeiteinheit, enthaltener Kostenanteil höchstens Miete.}
\item{bisher_enthaltener_kostenanteil}{Nichtnegativer exakter qualifizierter EUR-Betrag als Dezimalzeichenfolge/Bruch; Miete und Kosten gleiche Zeiteinheit, enthaltener Kostenanteil höchstens Miete.}
\item{einordnungsnachweis}{Nichtleerer Nachweis rechtlich zutreffenden556a-Umlagemaßstabs/Kostenkreises bzw. zulässiger Umstellung und bisherigen Kostenanteils.}
}
\details{Bisherige Miete um bislang enthaltene künftig gesondert umgelegte Betriebskosten herabsetzen. Nur §556a Absatz2 Satz3 nach qualifiziert zulässiger Umstellung der Umlage erfassten Verbrauchs/Verursachung. Kostenanteil und Miete gleiche Zeiteinheit, nicht Jahreskosten unmittelbar von Monatsmiete abziehen. Nur bisher tatsächlich in der Miete enthaltenen künftig gesonderten Anteil abziehen, keine Schätzung durch Bibliothek. Textform, rechtzeitige Erklärung vor Abrechnungsbeginn und Wirksamkeit gesondert. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält je Position Quote/Wohnungsbetrag und Gesamtsumme oder den herabgesetzten Mietbetrag; exakte EUR-/Quotenbrüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_556a_T0005}
\examples{
betriebskosten_umstellung_mietherabsetzung(
  bisherige_zeitraummiete = "1000",
  bisher_enthaltener_kostenanteil = "150",
  einordnungsnachweis = paste0(
    "Zulässige Umstellung, bisher enthaltener Kostenanteil dersel",
    "ben Periode künftig separat."
  )
)
}
