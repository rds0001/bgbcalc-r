% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{erbschaftskauf_verwendungsersatz}
\alias{erbschaftskauf_verwendungsersatz}
\title{erbschaftskauf verwendungsersatz}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{erbschaftskauf_verwendungsersatz(
  notwendige_verwendungen_vor_kauf = NULL,
  andere_aufwendungen_vor_kauf = NULL,
  fortbestehende_wertsteigerung_beim_kauf = NULL,
  aufwendungen_nach_2381_qualifiziert = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{notwendige_verwendungen_vor_kauf}{Nichtnegative exakte EUR-Summe notwendiger vom Verkäufer vor Kauf auf die Erbschaft gemachter Verwendungen, rechtlich qualifiziert.}
\item{andere_aufwendungen_vor_kauf}{Nichtnegative exakte EUR-Summe sonstiger Voraufwendungen, überschneidungsfrei zu notwendigen Verwendungen.}
\item{fortbestehende_wertsteigerung_beim_kauf}{Nichtnegativer exakter EUR-Wert der gerade durch diese anderen Aufwendungen verursachten und beim Verkauf noch vorhandenen Erbschaftswerterhöhung. Nicht gesamte Wertsteigerung aus anderen Ursachen.}
\item{aufwendungen_nach_2381_qualifiziert}{Expliziter Wahrheitswert des einschlägigen2381-Erstattungsfalls. Keine Nachkaufaufwendungen oder schon anderweitig doppelt erfassten Kosten; FALSE ergibt NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleerer Nachweis der Kostenabgrenzung, Kaufzeit und fortbestehenden aufwandsbedingten Wertsteigerung.}
}
\details{Notwendige Vorverwendungen voll; andere Aufwendungen auf Wertsteigerung bei Kauf begrenzen; beide Beträge addieren. Keine doppelte Erfassung notwendiger Kosten als andere Aufwendungen. Tilgungen2378 und Lasten/Nutzungen2379/2380 sowie Nachkaufkosten separat; keine erfundene Wertsteigerungsformel. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält ersatz_notwendiger_verwendungen, ersatz_anderer_aufwendungen und gesamter_verwendungsersatz als exakte EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2381_T0001, BGB_2381_T0002}
\examples{
erbschaftskauf_verwendungsersatz(
  notwendige_verwendungen_vor_kauf = "20",
  andere_aufwendungen_vor_kauf = "80",
  fortbestehende_wertsteigerung_beim_kauf = "30",
  aufwendungen_nach_2381_qualifiziert = TRUE,
  bewertungsnachweis = "Synthetisch überschneidungsfrei abgegrenzte Voraufwendungen."
)
}
