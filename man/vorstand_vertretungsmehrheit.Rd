% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{vorstand_vertretungsmehrheit}
\alias{vorstand_vertretungsmehrheit}
\title{vorstand vertretungsmehrheit}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{vorstand_vertretungsmehrheit(
  vorstandsmitglieder = NULL,
  mitwirkende_vorstandsmitglieder = NULL,
  rechtsform = NULL,
  abweichende_satzungsregel = NULL,
  bestandsnachweis = NULL
)}
\arguments{
\item{vorstandsmitglieder}{Positive ganze Zahl der rechtlich maßgeblichen gesamten Vorstandsmitglieder, höchstens2^53-1. Nicht nur anwesende oder bereits zustimmende Mitglieder zählen. Besetzung, Vakanzen und besondere Vertretungsregelungen vorab prüfen.}
\item{mitwirkende_vorstandsmitglieder}{Ganze Zahl0..vorstandsmitglieder der bei der konkreten Vertretung mitwirkenden Mitglieder. Kein bloßer Beschlussstimmenzähler.}
\item{rechtsform}{Auswahl verein für§26 Absatz2 Satz1 oder stiftung für§84 Absatz2 Satz2. Einzelvorstand nach jeweiligem Vertretungsgrundsatz mit einer Person.}
\item{abweichende_satzungsregel}{Wahrheitswert, ob eine im konkreten Fall maßgebliche wirksame abweichende Satzungsregel den gesetzlichen Mehrheitsmaßstab ersetzt. TRUE ergibt NICHT_ANWENDBAR; alternative Regel nicht automatisch unwirksam oder gleichbedeutend mit fehlender Vertretung.}
\item{bestandsnachweis}{Nichtleere Beschreibung des maßgeblichen Vorstandbestands, der Mitwirkung und Satzungslage. Register-/Drittwirkung und weitere Vertretungsbeschränkungen vorab einordnen.}
}
\details{Gesetzliche strikte Mehrheit: mindestens floor(Vorstandsmitglieder/2)+1 Mitwirkende. Erreicht, wenn Mitwirkende mindestens diese Zahl. Satzungsabweichung führt zu NICHT_ANWENDBAR. Aktive Vertretung von Verein/Stiftung, nicht Vorstandsbeschluss und nicht Empfang einer Erklärung. Kein abschließender Vertretungsnachweis, keine automatische Entscheidung über Vakanzen oder Umfang der Vertretungsmacht. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält mindestens_mitwirkende als ganze Zahl und vertretungsmehrheit_erreicht als Wahrheitswert. Bei NICHT_ANWENDBAR null. Einheit: stimmen_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_26_T0002, BGB_26_T0004, BGB_40_T0001, BGB_84_T0003, BGB_84_T0004, BGB_84_T0006}
\examples{
vorstand_vertretungsmehrheit(
  vorstandsmitglieder = 1,
  mitwirkende_vorstandsmitglieder = 0,
  rechtsform = "verein",
  abweichende_satzungsregel = FALSE,
  bestandsnachweis = paste0(
    "Synthetischer vollständiger Vorstand ohne abweichende Satzun",
    "gsregel."
  )
)
}
