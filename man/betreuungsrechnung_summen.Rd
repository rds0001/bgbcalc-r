% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{betreuungsrechnung_summen}
\alias{betreuungsrechnung_summen}
\title{betreuungsrechnung summen}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{betreuungsrechnung_summen(
  einnahmen = NULL,
  ausgaben = NULL,
  vermoegenszugaenge = NULL,
  vermoegensabgaenge = NULL,
  rechnungsnachweis = NULL
)}
\arguments{
\item{einnahmen}{Liste1..10000 nichtnegativer exakter EUR-Positionen derselben qualifizierten Rechnungsperiode. Keine Bewegung ausdrücklich als Liste mit einzelnem Betrag0, keine fehlende/leere Kategorie.}
\item{ausgaben}{Liste1..10000 nichtnegativer exakter EUR-Positionen derselben qualifizierten Rechnungsperiode. Keine Bewegung ausdrücklich als Liste mit einzelnem Betrag0, keine fehlende/leere Kategorie.}
\item{vermoegenszugaenge}{Liste1..10000 nichtnegativer exakter EUR-Positionen derselben qualifizierten Rechnungsperiode. Keine Bewegung ausdrücklich als Liste mit einzelnem Betrag0, keine fehlende/leere Kategorie.}
\item{vermoegensabgaenge}{Liste1..10000 nichtnegativer exakter EUR-Positionen derselben qualifizierten Rechnungsperiode. Keine Bewegung ausdrücklich als Liste mit einzelnem Betrag0, keine fehlende/leere Kategorie.}
\item{rechnungsnachweis}{Nichtleerer Nachweis des gerichtlich bestimmten Rechnungsjahres beziehungsweise Schlussrechnungszeitraums, qualifizierter Positionen und getrennter Geldfluss-/Vermögenssicht ohne doppelte Saldenaddition.}
}
\details{Vier Positionssummen getrennt bilden. Geldflusssaldo=Einnahmen-Ausgaben; Vermögensbewegungssaldo=Zugänge-Abgänge. Beide Salden nicht addieren. Rechnerischer Summenbaustein für§1865III1 und Schlussrechnung§1872III2, kein vollständiges Rechnungslegungsformular. Alle Positionen derselben rechtlich abgegrenzten Rechnungsperiode zuordnen; Rechnungsjahr gerichtlich bestimmt, Schlussrechnung grundsätzlich seit letzter eingereichter Rechnungslegung. Einnahmen/Ausgaben einerseits und Vermögenszugänge/-abgänge andererseits sind getrennte Sichten und können denselben wirtschaftlichen Vorgang abbilden. Ihre Salden daher nicht nochmals zu einem Vermögenszuwachs addieren. Vermögensumschichtungen und Sachwerte fachlich konsistent qualifizieren, keine automatische Buchungs-/Bewertungsmethode. Keine Bewegung explizit als eine Nullposition angeben; fehlende Kategorie ist keine stillschweigende Null. Reihenfolge, Einzelbelege, Anfangs-/Endbestand, Vollständigkeitserklärung, vom Betreuten selbst verwaltete Teile und Befreiungen gesondert. Negative Salden sind Rechenergebnisse, keine Feststellung einer Verbindlichkeit oder Pflichtverletzung. Numerischer259I-Anwendungsbeleg: nur Einnahmen-/Ausgabensummen und deren Saldo nutzen; zusätzliche Vermögensbewegungssicht ist nicht Bestandteil dieses Belegs. Geordnete Einzelrechnung und Belege bleiben erforderlich. Siehe fachkonzept/rechnungslegung_normanwendung.json. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält einnahmensumme, ausgabensumme, einnahmen_ausgaben_saldo, vermoegenszugangssumme, vermoegensabgangssumme und vermoegensbewegungssaldo als EUR-Brüche. Die beiden Salden dürfen negativ sein, übrige Summen nicht. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1865_T0004, BGB_1872_T0005, BGB_259_T0001}
\examples{
betreuungsrechnung_summen(
  einnahmen = list(
    "100",
    "50"
  ),
  ausgaben = list(
    "20",
    "30"
  ),
  vermoegenszugaenge = list(
    "200",
    "100"
  ),
  vermoegensabgaenge = list(
    "40",
    "60"
  ),
  rechnungsnachweis = paste0(
    "Identische rechtlich abgegrenzte Periode, getrennte Geldflus",
    "s- und Vermögensbewegungssichten."
  )
)
}
