% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{zahlungsdienste_entgeltabschnitt}
\alias{zahlungsdienste_entgeltabschnitt}
\title{zahlungsdienste entgeltabschnitt}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{zahlungsdienste_entgeltabschnitt(
  abschnitt_von_utc = NULL,
  abschnitt_bis_utc = NULL,
  beendigung_utc = NULL,
  abschnittsentgelt = NULL,
  vorausgezahltes_entgelt = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{abschnitt_von_utc}{Eingeschlossener Beginn des homogenen Entgeltabschnitts als sekundengenauer UTC-Zeitpunkt.}
\item{abschnitt_bis_utc}{Ausgeschlossene Endgrenze; strikt nach Beginn.}
\item{beendigung_utc}{Rechtlich wirksamer Beendigungszeitpunkt; Vertrag läuft bis zu dieser ausgeschlossenen Grenze.}
\item{abschnittsentgelt}{Regelmäßiges Entgelt für den gesamten Abschnitt, nichtnegativer exakter EUR-Wert.}
\item{vorausgezahltes_entgelt}{Bereits gezahltes Entgelt höchstens Abschnittsentgelt; proportional über diesen Abschnitt zugeordnet.}
\item{einordnungsnachweis}{Wirksame Kündigung, homogene Zeitbewertung, proportional zugeordnete Zahlung und UTC-Normalisierung belegen.}
}
\details{Halb offenen Entgeltabschnitt am Beendigungszeitpunkt schneiden; Zeitanteile exakt bestimmen und Entgelt sowie Vorauszahlung proportional abrechnen. §675hIII: Entgelt nur bis zur Beendigung; auf danach entfallende Zeit zugeordnete Vorauszahlung erstatten. Berechnung unter ausdrücklich rechtlich bestimmter gleichmäßiger Zeitbewertung in Sekunden; keine automatische Wahl einer Vertrags-/Tageskonvention. Abweichend bewertete Preisperioden getrennt normalisieren und abrechnen. Halb offene Intervalle verhindern doppelte Grenzsekunden. Standardbibliotheken und vorhandener UTC-Parser, keine neue Datumsbibliothek; keine stillschweigende Zeitzone oder Rundung von Subsekunden. Vertragswirksamkeit, zulässige Kündigungsfrist675hI/II und EntgeltverbotIV separat; kein Kündigungsentgelt ergänzen. Geschuldetes Entgelt und Rückerstattung nicht als zwei zusätzliche Ansprüche zusammenzählen. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Sekunden insgesamt/bis Beendigung, exakter geschuldeter Zeitanteil und Entgeltbetrag sowie Erstattung des nach Beendigung zugeordneten Vorauszahlungsanteils. Einheit: sekunden_quote_und_eur.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_675h_T0001, BGB_675h_T0002, BGB_675h_T0003, BGB_675h_T0004, BGB_675h_T0005, BGB_675h_T0006, BGB_675h_T0007, BGB_675h_T0008}
\examples{
zahlungsdienste_entgeltabschnitt(
  abschnitt_von_utc = "2024-02-01T00:00:00Z",
  abschnitt_bis_utc = "2024-03-01T00:00:00Z",
  beendigung_utc = "2024-02-15T12:00:00Z",
  abschnittsentgelt = "29",
  vorausgezahltes_entgelt = "29",
  einordnungsnachweis = paste0(
    "§675hIII: Entgelt nur bis zur Beendigung; auf danach entfall",
    "ende Zeit zugeordnete Vorauszahlung erstatten. Berechnung un",
    "ter ausdrücklich rechtlich bestimmter gleichmäßiger Zeitbewe",
    "rtung in Sekunden; keine automatische Wahl einer Vertrags-/T",
    "ageskonvention. Abweichend bewertete Preisperioden getrennt ",
    "normalisieren und abrechnen. Halb offene Intervalle verhinde",
    "rn doppelte Grenzsekunden. Standardbibliotheken und vorhande",
    "ner UTC-Parser, keine neue Datumsbibliothek; keine stillschw",
    "eigende Zeitzone oder Rundung von Subsekunden. Vertragswirks",
    "amkeit, zulässige Kündigungsfrist675hI/II und EntgeltverbotI",
    "V separat; kein Kündigungsentgelt ergänzen. Geschuldetes Ent",
    "gelt und Rückerstattung nicht als zwei zusätzliche Ansprüche",
    " zusammenzählen."
  )
)
}
