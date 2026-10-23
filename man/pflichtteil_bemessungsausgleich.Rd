% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pflichtteil_bemessungsausgleich}
\alias{pflichtteil_bemessungsausgleich}
\title{pflichtteil bemessungsausgleich}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{pflichtteil_bemessungsausgleich(
  frueherer_pflichtteilsnachlass = NULL,
  neuer_pflichtteilsnachlass = NULL,
  gesetzliche_erbquote_zaehler = NULL,
  gesetzliche_erbquote_nenner = NULL,
  grundmodell_ohne_anrechnung_qualifiziert = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{frueherer_pflichtteilsnachlass}{Vorzeichenbehaftete exakte EUR-Nettobasis vor Neubemessung.}
\item{neuer_pflichtteilsnachlass}{Vorzeichenbehaftete exakte EUR-Nettobasis nach rechtlich qualifizierter Neubemessung2313, gleicher Bewertungsmaßstab.}
\item{gesetzliche_erbquote_zaehler}{Ganzzahlig0..Nenner, Zähler unveränderter gesetzlicher Erbquote.}
\item{gesetzliche_erbquote_nenner}{Positiver ganzzahliger Nenner bis2^53-1.}
\item{grundmodell_ohne_anrechnung_qualifiziert}{Pflichtwahrheitswert: Neubemessung2313 bei unveränderter Quote ohne2315/2316/2325 oder Vermächtnisanrechnung; FALSE ergibt NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleerer Nachweis geänderter Positionen und unveränderter Bewertungsgrundlage.}
}
\details{Beide Nettobasen jeweils mindestens null mit halber gesetzlicher Erbquote multiplizieren; neuer minus früherer Pflichtteilswert. Nur Grundmodell; keine automatischen Zahlungs-/Rückzahlungsansprüche, Vorleistungen/Einwendungen separat. Keine anderen Anrechnungsregime. Nachlassbasen als vorzeichenbehaftete Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält frueherer_pflichtteilswert, neuer_pflichtteilswert und vorzeichenbehaftete ausgleichsdifferenz als exakte EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2313_T0003, BGB_2313_T0004, BGB_2303_T0002}
\examples{
pflichtteil_bemessungsausgleich(
  frueherer_pflichtteilsnachlass = "100",
  neuer_pflichtteilsnachlass = "140",
  gesetzliche_erbquote_zaehler = 1,
  gesetzliche_erbquote_nenner = 2,
  grundmodell_ohne_anrechnung_qualifiziert = TRUE,
  bewertungsnachweis = "Synthetische Neubemessung wegen Bedingungseintritt."
)
}
