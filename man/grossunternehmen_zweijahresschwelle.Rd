% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{grossunternehmen_zweijahresschwelle}
\alias{grossunternehmen_zweijahresschwelle}
\title{grossunternehmen zweijahresschwelle}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{grossunternehmen_zweijahresschwelle(
  vertragsjahr = NULL,
  jahreswerte = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{vertragsjahr}{Kalenderjahr des Vertragsschlusses, ganze Zahl3..9999. Es werden genau die beiden vorhergehenden Kalenderjahre geprüft.}
\item{jahreswerte}{Unbenannte Liste genau zweier Objekte mit kalenderjahr und den nichtnegativen exakten Zahlen arbeitnehmer_jahresdurchschnitt, umsatzerloese, bilanzsumme. EUR-Beträge nicht in Millionen angeben. Arbeitnehmermittel nach267V HGB und Bilanzsumme nach267IVa HGB fachlich vorqualifiziert; jedes Vorjahr genau einmal.}
\item{bewertungsnachweis}{Nichtleerer Nachweis der Jahreswerte, gesetzeskonformen HGB-Ermittlung und einheitlichen Unternehmenszuordnung.}
}
\details{Je Vorjahr zählen: Arbeitnehmermittel mindestens250, Umsatz strikt größer50MillionenEUR, Bilanzsumme strikt größer43MillionenEUR. Mindestens2 Merkmale in jedem Jahr, nicht zwingend dieselben. Reiner numerischer Größenvergleich, keine vollständige AGB-Kontrollausnahme. Geschäftsart, rechtmäßige gewerbsmäßige Tätigkeit und übrige310-Tatbestände separat. Keine HGB-Jahresabschlussberechnung. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert: nach Kalenderjahr sortierte jahrespruefungen mit drei Einzelmerkmalen, erfuellte_merkmale, mindestens_zwei_merkmale; in_beiden_jahren_zwei_merkmale als Gesamtvergleich. Einheit: anzahlen_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_310_T0014, BGB_310_T0015, BGB_310_T0016, BGB_310_T0017}
\examples{
grossunternehmen_zweijahresschwelle(
  vertragsjahr = 2030,
  jahreswerte = list(
    list(
    "kalenderjahr" = 2028,
    "arbeitnehmer_jahresdurchschnitt" = "249.99",
    "umsatzerloese" = "50000000",
    "bilanzsumme" = "43000000"
  ),
    list(
    "kalenderjahr" = 2029,
    "arbeitnehmer_jahresdurchschnitt" = "249.99",
    "umsatzerloese" = "50000000",
    "bilanzsumme" = "43000000"
  )
  ),
  bewertungsnachweis = "Synthetische HGB-gemäß qualifizierte Vorjahreszahlen in EUR."
)
}
