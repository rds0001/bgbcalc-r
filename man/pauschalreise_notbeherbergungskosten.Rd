% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pauschalreise_notbeherbergungskosten}
\alias{pauschalreise_notbeherbergungskosten}
\title{pauschalreise notbeherbergungskosten}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{pauschalreise_notbeherbergungskosten(
  nachtkosten = NULL,
  dreinaechtegrenze_anwendbar = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{nachtkosten}{Unbenannte chronologische Liste0..10000 nichtnegativer EUR-Nachtbeträge ab erster notwendiger Nacht; kostenlose Nächte ausdrücklich als0 einfügen. Leere Liste bedeutet keine Nächte, fehlende Liste ist keine Null.}
\item{dreinaechtegrenze_anwendbar}{Expliziter Wahrheitswert: gesetzliche Begrenzung auf drei Nächte greift. FALSE nur bei rechtlich qualifizierter Ausnahme651kV; eingegebener Gesamtzeitraum dann bereits dem anderweitig maßgeblichen notwendigen Umfang zugeordnet.}
\item{einordnungsnachweis}{Nichtleerer Nachweis notwendiger Beherbergung wegen unmöglicher vertraglicher Rückbeförderung und außergewöhnlicher Umstände; Reihenfolge und gegebenenfalls Ausnahme/Zeitraum qualifiziert.}
}
\details{Notwendige Nachtkosten chronologisch summieren, gegebenenfalls auf die ersten drei Nächte begrenzen. §651kIV/V: nur qualifizierte notwendige Beherbergung wegen unmöglicher vertraglicher Rückbeförderung infolge unvermeidbarer außergewöhnlicher Umstände. Nachtkosten chronologisch ab erster notwendiger Nacht vollständig eingeben, auch eine kostenlose Nacht als0, damit keine spätere Nacht an ihre Stelle rückt. Bei anwendbarer Begrenzung keine Auswahl der teuersten drei Nächte. FALSE nur nach qualifizierter Ausnahme651kV; dann sämtliche eingegebenen Nächte rechtlich dem anderweitig maßgeblichen notwendigen Umfang zuordnen, keine unbegrenzte Hotelzusage. Vorrangige EU-Regelungen, persönliche Voraussetzungen/48Stundeninformation, Gleichwertigkeit der Unterkunft und bereits gezahlte Kosten separat. Keine Cent-Rundung und keine automatische Rückzahlung oder Verdoppelung schon übernommener Kosten. Nichtnegative exakte EUR-Dezimaltexte/Brüche nach NUMERIK.md. Kostenlisten ohne doppelte Positionen, keine Rundung.}
\value{wert: anzahl_erfasster_naechte, anzahl_beruecksichtigter_naechte sowie kosten_im_qualifizierten_umfang und kosten_ausserhalb_dreinaechtegrenze als EUR-Brüche. Einheit: EUR_und_naechte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_651k_T0010, BGB_651k_T0011, BGB_651k_T0012, BGB_651k_T0013, BGB_651k_T0014, BGB_651k_T0015, BGB_651k_T0016, BGB_651k_T0017}
\examples{
pauschalreise_notbeherbergungskosten(
  nachtkosten = list(
    "100",
    "200",
    "300",
    "400"
  ),
  dreinaechtegrenze_anwendbar = TRUE,
  einordnungsnachweis = paste0(
    "Qualifizierte überschneidungsfreie Kosten des gesetzlichen N",
    "ormfalls; Information beziehungsweise notwendige Beherbergun",
    "g/Zeitraum festgestellt."
  )
)
}
