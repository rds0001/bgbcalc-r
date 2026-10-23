% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{werk_abschlagsrestbetrag}
\alias{werk_abschlagsrestbetrag}
\title{werk abschlagsrestbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{werk_abschlagsrestbetrag(
  wert_geschuldeter_erbrachter_leistungen = NULL,
  bereits_gezahlte_abschlaege = NULL,
  qualifizierter_zurueckbehaltungsbetrag = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{wert_geschuldeter_erbrachter_leistungen}{Nichtnegativer exakter rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge oder Bruchobjekt; einheitlicher Zeitraum und keine Doppelzählung. Jahresnutzungswert positiv und mindestens Vorenthaltungsnutzungswert.}
\item{bereits_gezahlte_abschlaege}{Nichtnegativer exakter rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge oder Bruchobjekt; einheitlicher Zeitraum und keine Doppelzählung. Jahresnutzungswert positiv und mindestens Vorenthaltungsnutzungswert.}
\item{qualifizierter_zurueckbehaltungsbetrag}{Nichtnegativer exakter rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge oder Bruchobjekt; einheitlicher Zeitraum und keine Doppelzählung. Jahresnutzungswert positiv und mindestens Vorenthaltungsnutzungswert.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des gesetzlichen Anwendungsfalls, einheitlichen Abrechnungszeitraums und rechtlich qualifizierter Beträge.}
}
\details{Kumulierten Wert geschuldeter erbrachter Leistungen um bereits gezahlte Abschläge und qualifizierten Zurückbehaltungsbetrag vermindern, Rest mindestens null Nur §632a kumulierte, nachgewiesene vertragsgeschuldete Leistungen derselben Abrechnung. Nicht bloß Rechnungsnennbetrag. Angemessenen Einbehalt, einschließlich entsprechend §641 Absatz3, extern qualifizieren (vorhandener werk_maengeleinbehalt-Kern). Stoffe/Bauteile nur bei qualifiziert erfüllten Sicherungs-/Eigentumsvoraussetzungen. Keine automatische Rückforderung bei Überzahlung und kein doppelter Abzug schon verrechneter Abschläge oder Mängel. Verbraucherbau-Gesamtgrenze und Herstellungssicherheit nach §650m zusätzlich gesondert anwenden. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist der exakt berechnete EUR-Betrag als Bruchobjekt. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_632a_T0001, BGB_632a_T0002, BGB_632a_T0004}
\examples{
werk_abschlagsrestbetrag(
  wert_geschuldeter_erbrachter_leistungen = "10000",
  bereits_gezahlte_abschlaege = "4000",
  qualifizierter_zurueckbehaltungsbetrag = "2000",
  einordnungsnachweis = paste0(
    "Kumuliert erbrachte geschuldete Leistungen und qualifizierte",
    "r Einbehalt ohne Doppelzählung."
  )
)
}
