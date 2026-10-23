% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{landpacht_anfrage_im_drittletzten_pachtjahr}
\alias{landpacht_anfrage_im_drittletzten_pachtjahr}
\title{landpacht anfrage im drittletzten pachtjahr}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{landpacht_anfrage_im_drittletzten_pachtjahr(
  anfrage_am = NULL,
  pachtjahre = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{anfrage_am}{Rechtlich qualifizierter Zugang der FortsetzungsanfrageYYYY-MM-DD.}
\item{pachtjahre}{Liste3..1000 vollständig rechtlich bestimmter Pachtjahresabschnitte in aufsteigender Reihenfolge mit genau pachtjahr_id, erster_tag, letzter_tag. Einschließlich rechtlich zugehöriger Rumpfabschnitte, ohne ausgelassene Zeiträume; keine künstlichen Monate als Pachtjahre.}
\item{einordnungsnachweis}{Nichtleerer Nachweis594: vollständig bestimmte befristete Vertragsdauer und normativ richtige Pachtjahrsfolge. Schriftform, Folgenhinweis und Ablehnung separat.}
}
\details{Drittletztes qualifiziertes Pachtjahr auswählen und Anfragezeitpunkt vergleichen. §594: dritten Pachtjahresabschnitt von hinten aus der vollständigen rechtlich qualifizierten Vertragsfolge auswählen und Anfragezugang mit seinen eingeschlossenen Kalendertagen vergleichen. Zusätzlich mindestens dreijährige Vertragsdauer ab erstem eingeschlossenem Kalendertag prüfen. Pachtjahre sind keine automatisch gleichgesetzten Kalenderjahre; rechtliche Pachtjahrsfolge ausdrücklich Eingabe. Kein automatischer Fortsetzungsentscheid oder Übergehen fehlender Vertragsjahre. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.drittletztes_pachtjahr_erster_tag/letzter_tag alsISO-Daten und anfrage_im_drittletzten_pachtjahr alsWahrheitswert. Einheit: daten_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_594_T0001, BGB_594_T0002, BGB_594_T0003, BGB_594_T0004}
\examples{
landpacht_anfrage_im_drittletzten_pachtjahr(
  anfrage_am = "2026-01-01",
  pachtjahre = list(
    list(
    "pachtjahr_id" = "2024",
    "erster_tag" = "2024-01-01",
    "letzter_tag" = "2024-12-31"
  ),
    list(
    "pachtjahr_id" = "2025",
    "erster_tag" = "2025-01-01",
    "letzter_tag" = "2025-12-31"
  ),
    list(
    "pachtjahr_id" = "2026",
    "erster_tag" = "2026-01-01",
    "letzter_tag" = "2026-12-31"
  ),
    list(
    "pachtjahr_id" = "2027",
    "erster_tag" = "2027-01-01",
    "letzter_tag" = "2027-12-31"
  ),
    list(
    "pachtjahr_id" = "2028",
    "erster_tag" = "2028-01-01",
    "letzter_tag" = "2028-12-31"
  )
  ),
  einordnungsnachweis = paste0(
    "§594: dritten Pachtjahresabschnitt von hinten aus der vollst",
    "ändigen rechtlich qualifizierten Vertragsfolge auswählen und",
    " Anfragezugang mit seinen eingeschlossenen Kalendertagen ver",
    "gleichen. Zusätzlich mindestens dreijährige Vertragsdauer ab",
    " erstem eingeschlossenem Kalendertag prüfen. Pachtjahre sind",
    " keine automatisch gleichgesetzten Kalenderjahre; rechtliche",
    " Pachtjahrsfolge ausdrücklich Eingabe. Kein automatischer Fo",
    "rtsetzungsentscheid oder Übergehen fehlender Vertragsjahre."
  )
)
}
