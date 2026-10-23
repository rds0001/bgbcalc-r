% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{nachlass_zulaenglichkeitsbetrag}
\alias{nachlass_zulaenglichkeitsbetrag}
\title{nachlass zulaenglichkeitsbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{nachlass_zulaenglichkeitsbetrag(
  nachlassaktiva = NULL,
  gesamte_nachlassverbindlichkeiten = NULL,
  enthaltene_vermaechtnisverbindlichkeiten = NULL,
  enthaltene_auflagenverbindlichkeiten = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{nachlassaktiva}{Nichtnegative exakte EUR-Summe rechtlich bewerteter Nachlassaktiva.}
\item{gesamte_nachlassverbindlichkeiten}{Nichtnegative exakte Gesamtschuldensumme einschließlich separat genannter Vermächtnis-/Auflagenlasten.}
\item{enthaltene_vermaechtnisverbindlichkeiten}{Nichtnegative darin enthaltene Vermächtnisschulden, überschneidungsfrei zu Auflagen.}
\item{enthaltene_auflagenverbindlichkeiten}{Nichtnegative darin enthaltene Auflagenlasten; Summe beider Ausnahmen höchstens Gesamtschulden.}
\item{bewertungsnachweis}{Nichtleerer Nachweis der rechtlichen Bewertung und Abgrenzung. Keine automatische Insolvenzfeststellung.}
}
\details{Vermächtnis-/Auflagenschulden aus Gesamtschulden abziehen; Aktiva minus bereinigte Schulden. Nur numerische Bereinigung, keine Feststellung von Zahlungsunfähigkeit/Überschuldung/Antragspflicht. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält beruecksichtigte_verbindlichkeiten und vorzeichenbehaftete zulaenglichkeitsdifferenz als exakte EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1980_T0003}
\examples{
nachlass_zulaenglichkeitsbetrag(
  nachlassaktiva = "100",
  gesamte_nachlassverbindlichkeiten = "120",
  enthaltene_vermaechtnisverbindlichkeiten = "30",
  enthaltene_auflagenverbindlichkeiten = "10",
  bewertungsnachweis = "Synthetisch qualifizierte Aktiva/Schulden."
)
}
