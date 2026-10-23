% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{sachenrecht_gleichanteil}
\alias{sachenrecht_gleichanteil}
\title{sachenrecht gleichanteil}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{sachenrecht_gleichanteil(
  gesamtmenge = NULL,
  anzahl_berechtigte = NULL,
  regelfall = NULL,
  verteilungsnachweis = NULL
)}
\arguments{
\item{gesamtmenge}{Nichtnegative Gesamtfläche, Frucht-/Holzmenge oder Wirtschaftsplankosten in einer gemeinsamen Einheit; Kosten inEUR.}
\item{anzahl_berechtigte}{Ganze Zahl2..1000 betroffener Grundstücksseiten; bei Wirtschaftsplankosten genau2:Eigentümer und Nießbraucher. Miteigentümer einer Seite nicht mehrfach zählen.}
\item{regelfall}{grenzflaeche_920; grenzbaum_fruechte_923; grenzbaum_holz_923; wirtschaftsplan_kosten_1038.}
\item{verteilungsnachweis}{Nichtleerer Nachweis des gesetzlichen Gleichverteilungsfalls, ohne abweichende Billigkeits-/Verzichtsregel. Keine rechtliche Entscheidung durch den Rechner.}
}
\details{Einzelanteil=Gesamtmenge/Anzahl; Quote=1/Anzahl. Nur qualifizierte Gleichverteilung.920Absatz2-Billigkeit und923Verzicht nicht in dieser Grundverteilung. Räumliche Grenzziehung, Sachbewertung und die interne Verteilung mehrerer Miteigentümer einer Nachbarseite separat. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält anteilsquote und einzelanteil als exakte Brüche. Einheit: menge_oder_EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_920_T0002, BGB_920_T0003, BGB_923_T0001, BGB_923_T0004, BGB_923_T0006, BGB_1038_T0003, BGB_1038_T0004}
\examples{
sachenrecht_gleichanteil(
  gesamtmenge = "901",
  anzahl_berechtigte = 2,
  regelfall = "grenzflaeche_920",
  verteilungsnachweis = paste0(
    "Qualifizierte Wirtschaftsplankosten, Eigentümer und Nießbrau",
    "cher tragen je die Hälfte."
  )
)
}
