% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{schuldrechtliche_zeitgrenze}
\alias{schuldrechtliche_zeitgrenze}
\title{schuldrechtliche zeitgrenze}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{schuldrechtliche_zeitgrenze(
  regelfall = NULL,
  anfangstag = NULL,
  beginnart = NULL,
  vergleichstag = NULL,
  gesetzliche_zeitgrenze_anwendbar = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{regelfall}{zahlungsvereinbarung_271a_absatz_1: 60Tage ab Empfang der Gegenleistung, bei späterem Rechnungszugang ab diesem. Zugang/Beweisvermutung nachAbsatz1 Sätze2/3 qualifizieren.; oeffentliche_zahlung_271a_absatz_2_nummer_1: 30Tage beim öffentlichen Auftraggeber; qualifizierter Beginn entsprechendAbsatz1.; oeffentliche_zahlung_271a_absatz_2_nummer_2: 60Tage beim öffentlichen Auftraggeber; qualifizierter Beginn entsprechendAbsatz1.; abnahme_271a_absatz_3: 30Tage ab Empfang der Gegenleistung.; agb_zahlung_308_nummer_1a: 30Tage ab Empfang, ersatzweise späterem Rechnungszugang; Nichtverbraucher-Verwender undAGB-Anwendung qualifizieren.; agb_abnahme_308_nummer_1b: 15Tage ab Empfang; Nichtverbraucher-Verwender undAGB-Anwendung qualifizieren.; agb_preiserhoehung_309_nummer_1: 4Monate ab Vertragsschluss, Vergleichstag=vereinbarter Liefer-/Leistungstag. Dauerschuldverhältnisse ausgeschlossen. Innerhalb einschließlich Grenztag ist zeitlicher Verbotsbereich.; agb_laufzeit_309_nummer_9a: 2Jahre ab qualifiziertem Beginn der Bindung, Beginnart explizit wählen. Nur regelmäßige Waren-/Dienst-/Werkleistungen; zusammengehörig verkaufte Sachen undVersicherungen ausgeschlossen.; agb_verlaengerungskuendigung_309_nummer_9b: 1Monat ab qualifiziertem Zugang der Kündigung in unbefristeter stillschweigender Verlängerung. Vergleichstag=vertragliches Ende; jederzeitige Kündbarkeit undAusnahmen vorher qualifizieren.; finanzvorgaenge_312_absatz_5: 1Jahr ab letztem Vorgang gleicher Art ohne anfängliche Rahmenvereinbarung; Vergleichstag=nächster Vorgang. Nicht ab Vertragsschluss.; leistungsbestimmung_anfechtung_318_absatz_2: 30Jahre ab getroffener Bestimmung. Berechnet absolute Zeitgrenze, nicht daneben gebotene Unverzüglichkeit.}
\item{anfangstag}{ISO-Datum des für den gewählten Fall rechtlich maßgeblichen Beginns, siehe regelfall.}
\item{beginnart}{ereignis: Anfangstag wird nicht mitgezählt; tagesbeginn: qualifizierter Tagesbeginn wird mitgezählt. Für Empfang/Zugang/Vertragsschluss/Leistungsbestimmung regelmäßig ereignis; für Bindung ab Tagesbeginn entsprechend tagesbeginn. Nicht frei zur Ergebnisoptimierung wählen.}
\item{vergleichstag}{ISO-Datum mindestens anfangstag; geplanter/vereinbarter Endtag oder maßgeblicher Vorgangstag. Ausgegeben wird Abstand zur numerischen Grenze, keine endgültige Rechtsfolge.}
\item{gesetzliche_zeitgrenze_anwendbar}{Explizite Bestätigung des sachlichen/zeitlichen Normfalls ohne erforderliche Kalenderkorrektur/Hemmung.271a insbesondere keine Verbraucher als Schuldner, keine Raten-/Abschlagsvereinbarung. AGB-Anwendung undSonderausnahmen vorher prüfen. FALSE ergibt NICHT_ANWENDBAR.}
\item{einordnungsnachweis}{Nichtleerer Nachweis der Fallwahl, des Anfangs und der Voraussetzungen; keine automatische Rechtsbewertung.}
}
\details{Gesetzliche Dauer aus Fallwahl in vorhandenen Kalenderkern einsetzen; Grenztag und Tagesdifferenz des Vergleichstags ausgeben. Nur numerischer Zeitanteil, kein abschließender Wirksamkeits-/Anfechtungsentscheid. Keine automatische Korrektur oder Hemmung.309Nummer9c-Rückwärtsfrist nicht hier enthalten. ISO-Daten im Bereich0001..9999, feste Fallauswahl, Wahrheitswert und nichtleerer Nachweis.}
\value{wert: grenztag, abstand_zur_grenze_tage als ganze Zahl, zeitgrenze_ueberschritten bei strikt späterem Vergleichstag. Einheit: datum_tage_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_271a_T0001, BGB_271a_T0005, BGB_271a_T0006, BGB_271a_T0008, BGB_308_T0004, BGB_308_T0006, BGB_309_T0002, BGB_309_T0025, BGB_309_T0026, BGB_312_T0028, BGB_318_T0004, BGB_271a_T0002, BGB_271a_T0003, BGB_271a_T0007, BGB_271a_T0011, BGB_271a_T0012}
\examples{
schuldrechtliche_zeitgrenze(
  regelfall = "zahlungsvereinbarung_271a_absatz_1",
  anfangstag = "2030-01-01",
  beginnart = "ereignis",
  vergleichstag = "2030-03-01",
  gesetzliche_zeitgrenze_anwendbar = TRUE,
  einordnungsnachweis = "Synthetisch qualifizierter Fall mit Ereignisbeginn."
)
}
