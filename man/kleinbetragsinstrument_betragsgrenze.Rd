% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{kleinbetragsinstrument_betragsgrenze}
\alias{kleinbetragsinstrument_betragsgrenze}
\title{kleinbetragsinstrument betragsgrenze}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{kleinbetragsinstrument_betragsgrenze(
  grenzfall = NULL,
  massgeblicher_betrag = NULL,
  ausschliesslich_inland = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{grenzfall}{einzelzahlung, ausgabenobergrenze, speicherobergrenze oder egeld_sperrausnahme.}
\item{massgeblicher_betrag}{Nichtnegativer EUR-Betrag: rechtlich vorgesehener Höchstbetrag des einzelnen Vorgangs, Ausgaben-/Speicherobergrenze oder maßgeblicher Instrument-/Kontowert für675iIII. Kein zufällig kleiner Umsatz anstelle einer Instrumentenobergrenze.}
\item{ausschliesslich_inland}{Nur Ausgaben-/Speicherobergrenze: expliziter Wahrheitswert, ob das Instrument ausschließlich für inländische Vorgänge genutzt werden kann. Sonst null.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des Grenzfalls und maßgeblichen Betrags; übrige675i-Voraussetzungen separat.}
}
\details{Qualifizierte Instrumentenbeträge mit30,150oder200EUR vergleichen. §675iI: Einzelzahlungslimit höchstens30EUR; Ausgaben-/Speicherobergrenze150EUR, nur bei ausschließlich möglichen inländischen Vorgängen200EUR. Maßgeblich ist die rechtlich vorgesehene Instrumentengrenze, nicht ein zufällig kleiner Einzelumsatz; Speicherbetrag darf die Grenze zu keiner Zeit überschreiten. Drei alternative Instrumentenwege, kein kumulatives Erfordernis aller Grenzen. egeld_sperrausnahme betrifft nur die200EUR-Wertgrenze675iIII; fehlende Sperrmöglichkeit und übrige Voraussetzungen separat. Kein automatischer Ausschluss sämtlicher Zahlungsdienste-Schutzregeln aus einem positiven Zahlenvergleich; Vereinbarungen und spezifische Bedingungen675iII/III prüfen. Exakte EUR-Dezimaltexte oder Brüche nach NUMERIK.md; Kontostände vorzeichenbehaftet, Betragspositionen nichtnegativ. Keine Rundung.}
\value{wert: betragsgrenze_euro und ueberschreitungsbetrag als EUR-Brüche, grenze_eingehalten als Wahrheitswert. Einheit: EUR_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_675i_T0001, BGB_675i_T0002, BGB_675i_T0003, BGB_675i_T0004, BGB_675i_T0005, BGB_675i_T0006, BGB_675i_T0014, BGB_675i_T0015}
\examples{
kleinbetragsinstrument_betragsgrenze(
  grenzfall = "einzelzahlung",
  massgeblicher_betrag = "30",
  ausschliesslich_inland = NULL,
  einordnungsnachweis = paste0(
    "Qualifizierter Normfall mit widerspruchsfreier Betragszuordn",
    "ung; Voraussetzungen und Einwendungen vorab festgestellt."
  )
)
}
