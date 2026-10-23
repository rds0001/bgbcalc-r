% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{stiftung_grundstock_soll_ist_vergleich}
\alias{stiftung_grundstock_soll_ist_vergleich}
\title{stiftung grundstock soll ist vergleich}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{stiftung_grundstock_soll_ist_vergleich(
  erforderlicher_erhaltungswert = NULL,
  vorhandener_erhaltungswert = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{erforderlicher_erhaltungswert}{Rechtlich und nach zutreffendem Bewertungsmaßstab qualifizierter Sollwert des zu erhaltenden Grundstocks in Euro.}
\item{vorhandener_erhaltungswert}{Nach demselben Bewertungsmaßstab und Stichtag ermittelter vorhandener Grundstockwert in Euro.}
\item{einordnungsnachweis}{Nichtleerer Nachweis der83cI-Erhaltungsanforderung und vergleichbarer Bewertungen; Satzung, Landesrecht und zulässige vorübergehende Verbrauchsausnahmen bereits berücksichtigt.}
}
\details{Qualifizierten Erhaltungs-Sollwert und vorhandenen Grundstockwert vergleichen, Unterdeckung und Mehrbestand getrennt ausweisen. §83cI: ausschließlich numerischer Soll/Ist-Vergleich unter rechtlich qualifiziertem Erhaltungsmaßstab. Keine selbst erfundene Wahl zwischen nominaler, realer oder gegenständlicher Kapitalerhaltung, keine automatische Inflationsindexierung. Positiver Mehrbestand ist weder automatisch verwendbarer Umschichtungsgewinn noch ausschüttbarer Ertrag. Zulässiger Verbrauch und Wiederaufstockung83cII bleiben getrennt. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.rechnerische_unterdeckung und rechnerischer_mehrbestand als exakte Eurobrüche; sollwert_erreicht als Wahrheitswert. Einheit: EUR_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_83c_T0001, BGB_83c_T0002, BGB_83c_T0003}
\examples{
stiftung_grundstock_soll_ist_vergleich(
  erforderlicher_erhaltungswert = "1000",
  vorhandener_erhaltungswert = "900",
  einordnungsnachweis = paste0(
    "§83cI: ausschließlich numerischer Soll/Ist-Vergleich unter r",
    "echtlich qualifiziertem Erhaltungsmaßstab. Keine selbst erfu",
    "ndene Wahl zwischen nominaler, realer oder gegenständlicher ",
    "Kapitalerhaltung, keine automatische Inflationsindexierung. ",
    "Positiver Mehrbestand ist weder automatisch verwendbarer Ums",
    "chichtungsgewinn noch ausschüttbarer Ertrag. Zulässiger Verb",
    "rauch und Wiederaufstockung83cII bleiben getrennt."
  )
)
}
