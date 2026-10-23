\name{modernisierung_regulaerer_zwischenbetrag}
\alias{modernisierung_regulaerer_zwischenbetrag}
\title{Regulärer Modernisierungszwischenbetrag}
\description{Kostenbasis = max(Kosten minus Erhaltungsanteil minus Kostenbeiträge, 0). Jahresbetrag vor laufenden Abzügen = Kostenbasis mal 8 Prozent. Jährlicher Zwischenbetrag = max(Jahresbetrag minus Zinsvorteil minus laufende Jahresförderung, 0). Monatlicher Zwischenbetrag = jährlicher Zwischenbetrag geteilt durch zwölf.}
\usage{
modernisierung_regulaerer_zwischenbetrag(kosten_wohnung = NULL,
  erforderliche_erhaltungskosten = NULL,
  abzuziehende_kostenbeitraege = NULL,
  jaehrliche_zinsermaessigung = NULL,
  jaehrliche_laufende_zuschuesse_und_darlehen = NULL,
  grundtatbestand_erfuellt = NULL)
}
\arguments{
\item{kosten_wohnung}{Nichtnegative EUR-Dezimalzeichenfolge oder exaktes Bruchobjekt mit den Zeichenfolgenfeldern zaehler und nenner gemäß NUMERIK.md. Der Wohnung bereits zugeordnete aufgewendete Kosten der berücksichtigungsfähigen Maßnahmen.}
\item{erforderliche_erhaltungskosten}{Nichtnegative EUR-Dezimalzeichenfolge oder exaktes Bruchobjekt mit den Zeichenfolgenfeldern zaehler und nenner gemäß NUMERIK.md. Nach § 559 Absatz 2 ermittelter Erhaltungsanteil, gegebenenfalls ausdrücklich geschätzt. Keine automatische Schätzung oder Pauschale.}
\item{abzuziehende_kostenbeitraege}{Nichtnegative EUR-Dezimalzeichenfolge oder exaktes Bruchobjekt mit den Zeichenfolgenfeldern zaehler und nenner gemäß NUMERIK.md. Nach § 559a Absatz 1 aus der Kostenbasis abzuziehende Beiträge. Bereits abgezogene oder im Erhaltungsanteil enthaltene Beträge nicht doppelt ansetzen.}
\item{jaehrliche_zinsermaessigung}{Nichtnegative EUR-Dezimalzeichenfolge oder exaktes Bruchobjekt mit den Zeichenfolgenfeldern zaehler und nenner gemäß NUMERIK.md. Jährlicher Zinsvorteil nach § 559a Absatz 2 Sätze 1 bis 3 und Absatz 3, gegebenenfalls Ergebnis von modernisierung_zinsermaessigung.}
\item{jaehrliche_laufende_zuschuesse_und_darlehen}{Nichtnegative EUR-Dezimalzeichenfolge oder exaktes Bruchobjekt mit den Zeichenfolgenfeldern zaehler und nenner gemäß NUMERIK.md. Jahresbetrag der nach § 559a Absatz 2 Satz 4 anzurechnenden Zuschüsse oder Darlehen zur Deckung laufender Aufwendungen; keine erneute Eingabe von Kostenbeiträgen.}
\item{grundtatbestand_erfuellt}{Expliziter Wahrheitswert zum Grundtatbestand der regulären Achtprozentrechnung, extern rechtlich zu qualifizieren. Bei FALSE: NICHT_ANWENDBAR. Keine Aussage zur vollständigen Wirksamkeit des Erhöhungsverlangens.}
}
\details{Reguläre Teilrechnung nach §§ 559 Absatz 1/2 und 559a. Keine Anwendung von § 559c oder § 559e, keine Pauschalschätzung des Erhaltungsanteils. Die Reihenfolge der laufenden Förderabzüge gegenüber der Kappung nach § 559 Absatz 3a ist noch nicht fachlich abgeschlossen; die Zwischenbeträge dürfen deshalb nicht als endgültige Erhöhung ausgegeben oder ungeprüft mit der separaten Kappungsfunktion kombiniert werden. Härteprüfung, Kostenaufteilung, Ankündigung, Erklärung, Fristen und sonstige Wirksamkeitsvoraussetzungen sind nicht enthalten. Ein rechnerisch negativer Rest begründet hier keine Mietsenkung oder Erstattung.}
\value{S3-Objekt bgb_ergebnis. wert enthält kostenbasis, jahresbetrag_vor_laufenden_abzuegen, jaehrlicher_zwischenbetrag und monatlicher_zwischenbetrag, jeweils als exakte EUR-Brüche. Kein Betrag nach Kappung. Bei NICHT_ANWENDBAR ist wert null. Keine automatische Cent-Rundung. Fehlende oder ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\examples{
modernisierung_regulaerer_zwischenbetrag("10000", "2000", "1000", "300", "50", TRUE)
}
