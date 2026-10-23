% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pauschalreise_preiserhoehungsgrenze}
\alias{pauschalreise_preiserhoehungsgrenze}
\title{pauschalreise preiserhoehungsgrenze}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{pauschalreise_preiserhoehungsgrenze(
  reisepreis = NULL,
  erhoehungsbetrag = NULL,
  reisebeginn = NULL,
  unterrichtungstag = NULL,
  aenderungsvorbehalt_ordnungsgemaess = NULL,
  zulaessiger_kostengrund = NULL,
  unterrichtung_formgerecht = NULL,
  berechnungsnachweis = NULL
)}
\arguments{
\item{reisepreis}{Positiver vereinbarter Reisepreis der konkreten Pauschalreise in EUR, als exakte Dezimalzeichenfolge oder Bruchobjekt. Basis der Achtprozentprüfung; keine bereits erhöhte Basis zur Umgehung der Grenze.}
\item{erhoehungsbetrag}{Nichtnegativer konkret verlangter Erhöhungsbetrag in EUR, aus dem zulässigen vertraglichen Berechnungsweg. Zusammengehörige Änderungen nicht künstlich aufteilen; die gesetzliche Achtprozentgrenze selbst berechtigt nicht zu einem pauschalen Aufschlag.}
\item{reisebeginn}{ISO-Datum0001..9999 des rechtlich maßgeblichen Reisebeginns. Für den taggenauen Vorlauf wird20Kalendertage zurückgerechnet; Ergebnis muss im Datumsbereich liegen.}
\item{unterrichtungstag}{ISO-Datum der tatsächlichen rechtlich maßgeblichen Unterrichtung des Reisenden, kein Versanddatum. Genau20Tage vor Beginn genügt; spätere oder erst nach Reisebeginn liegende Unterrichtung ist nicht fristgerecht.}
\item{aenderungsvorbehalt_ordnungsgemaess}{Expliziter Wahrheitswert zur Vertragsgrundlage nach§651f Absatz1 Satz1 Nummer1 einschließlich Hinweis auf Senkungspflicht und Angabe des Berechnungsverfahrens. Die bloße Erwähnung möglicher Erhöhungen genügt nicht automatisch.}
\item{zulaessiger_kostengrund}{Expliziter Wahrheitswert, dass die konkrete Erhöhung sich unmittelbar aus einer nach Vertragsschluss eingetretenen zulässigen Energie-/Beförderungskosten-, Abgaben- oder Wechselkursänderung nach§651f Absatz1 Satz1 Nummer2 ergibt. Keine frei gewählte Kostensteigerung oder automatische Marktdatenabfrage.}
\item{unterrichtung_formgerecht}{Expliziter Wahrheitswert: klar und verständlich auf dauerhaftem Datenträger über Erhöhung, Gründe und Berechnung unterrichtet. Zeitliche Rechtzeitigkeit wird zusätzlich berechnet.}
\item{berechnungsnachweis}{Nichtleere Beschreibung des vertraglichen Berechnungswegs, Kostenereignisses, Reisepreises und Unterrichtung. Preisformel aus Vertrag nicht vom Programm erfunden.}
}
\details{Achtprozentbetrag=Reisepreis×2/25. Einseitige Grenze überschritten nur bei größerem Erhöhungsbetrag. Unterrichtung spätestens Reisebeginn minus20Kalendertage. Voraussetzungen der einseitigen Erhöhung nur bei eingehaltenen beiden Grenzen und drei vorgegebenen Vertrags-/Grund-/Formbedingungen. Keine Berechnung zulässiger Vertragsformel aus Energie-/Abgaben-/Wechselkursdaten. Über8Prozent ist keine einseitige Erhöhung möglich; Angebotsweg§651g mit Informations-/Annahmevoraussetzungen bleibt getrennt. Sonstige Vertragsänderungen nicht mitberechnet. Keine Feiertagsverschiebung zu Lasten des Vorlaufs. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält achtprozentbetrag als EUR-Bruch, achtprozentgrenze_ueberschritten, spaetester_unterrichtungstag als ISO-Datum, zwanzigtage_vorlauf_eingehalten und einseitige_erhoehungsvoraussetzungen_erfuellt. BERECHNET kann FALSE-Ergebnisse enthalten. Einheit: preisgrenze_und_voraussetzungen.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_651f_T0001, BGB_651f_T0002, BGB_651f_T0003, BGB_651f_T0004, BGB_651f_T0005, BGB_651f_T0006, BGB_651f_T0007, BGB_651f_T0008, BGB_651g_T0001, BGB_651g_T0006}
\examples{
pauschalreise_preiserhoehungsgrenze(
  reisepreis = "1000",
  erhoehungsbetrag = "79.99",
  reisebeginn = "2026-06-21",
  unterrichtungstag = "2026-05-31",
  aenderungsvorbehalt_ordnungsgemaess = FALSE,
  zulaessiger_kostengrund = FALSE,
  unterrichtung_formgerecht = FALSE,
  berechnungsnachweis = paste0(
    "Synthetische geprüfte Vertragsformel und nachvertragliche Ko",
    "stenänderung."
  )
)
}
