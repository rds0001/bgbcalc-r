% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{modernisierung_beginnverzoegerung}
\alias{modernisierung_beginnverzoegerung}
\title{modernisierung beginnverzoegerung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{modernisierung_beginnverzoegerung(
  ankuendigungszugang_am = NULL,
  angekuendigter_beginn_am = NULL,
  tatsaechlicher_beginn_am = NULL,
  prueftag = NULL,
  zeitnachweis = NULL
)}
\arguments{
\item{ankuendigungszugang_am}{ISO-Datum0001..9999 des rechtlich maßgeblichen Zugangs der Ankündigung beim Mieter. Ersatzanknüpfung nur, wenn kein Beginn angegeben wurde.}
\item{angekuendigter_beginn_am}{ISO-Datum0001..9999 des rechtlich maßgeblichen angekündigten Beginns oder NULL/None, wenn hierzu tatsächlich keine Angaben erfolgt sind. Ein unklarer oder nur als Zeitraum angegebener Beginn ist vorher rechtlich zu bestimmen; NULL nicht als unbekanntes Datum missbrauchen.}
\item{tatsaechlicher_beginn_am}{ISO-Datum0001..9999 des tatsächlichen rechtlich relevanten Beginns der baulichen Veränderung; nicht später als Prüftag. NULL/None bedeutet am Prüftag noch nicht begonnen. Nicht bloße Vorbereitungshandlung ohne Prüfung als Baubeginn zählen.}
\item{prueftag}{ISO-Datum0001..9999 des Prüftags, mindestens Ankündigungszugang; laufender Sachverhalt wird taggenau bis zum Tagesschluss betrachtet. Bei bereits erfolgtem Beginn wird dessen Tag geprüft, nicht der spätere Prüftag als vermeintliche Verzögerung.}
\item{zeitnachweis}{Nichtleere Begründung der maßgeblichen Ankündigung, tatsächlicher Beginn/Nichtbeginn, untertägiger Normalisierung und sachlicher/zeitlicher Anwendbarkeit§559d. Andere Ankündigungen oder Änderungen nicht ohne rechtliche Prüfung austauschen.}
}
\details{Zwölfmonatsgrenze ereignisbezogen ab angekündigtem Beginn, nur ersatzweise Ankündigungszugang. Tatsächlicher späterer Beginn oder nach Fristablauf weiterhin fehlender Beginn erfüllt Nummer1. Nur zeitlicher Tatbestand; objektiver Grund und übrige Vermutungsbedingungen separat. Schon rechtzeitiger Beginn wird nicht durch späteren Prüftag verspätet. Keine automatische§193-Verschiebung tatsächlichen Baubeginns. ISO-Daten und berechnete Grenzen0001..9999, explizite Auswahl und nichtleerer Nachweis. Optionale Daten ausschließlich mit der beschriebenen Bedeutung.}
\value{wert enthält anknuepfung_am und zwoelfmonatsgrenze als ISO-Daten sowie beginnverzoegerung_nummer_1 als Wahrheitswert. Einheit: daten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_559d_T0002}
\examples{
modernisierung_beginnverzoegerung(
  ankuendigungszugang_am = "2023-12-01",
  angekuendigter_beginn_am = "2024-02-29",
  tatsaechlicher_beginn_am = NULL,
  prueftag = "2025-02-27",
  zeitnachweis = paste0(
    "Synthetisch maßgebliche Ankündigung und tatsächlicher Bauver",
    "lauf; rechtlich eingeordnete Tagesdaten."
  )
)
}
