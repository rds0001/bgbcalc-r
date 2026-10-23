% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{kauf_digitale_mindesthaftungsdauer}
\alias{kauf_digitale_mindesthaftungsdauer}
\title{kauf digitale mindesthaftungsdauer}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{kauf_digitale_mindesthaftungsdauer(
  ablieferung_am = NULL,
  bereitstellung_bis = NULL,
  bereitstellung_unbefristet = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{ablieferung_am}{Qualifizierter Ablieferungstag der WareYYYY-MM-DD; nicht ungeprüft Gefahrübergang, Bestellung oder Beginn eines eigenständigen Digitalproduktvertrags.}
\item{bereitstellung_bis}{Bei befristeter Bereitstellung qualifiziertes EndeYYYY-MM-DD einschließlich Endtag, nicht vor Ablieferung. Bei unbefristeter Bereitstellung zwingendNULL/None; unbekannte Dauer ist kein unbefristeter Fall.}
\item{bereitstellung_unbefristet}{Expliziter Wahrheitswert. FALSE erfordert bestimmtes rechtlich maßgebliches Bereitstellungsende; TRUE bedeutet qualifiziert unbefristete Bereitstellung.}
\item{einordnungsnachweis}{Nichtleerer Nachweis einer Ware mit digitalen Elementen und vereinbarter dauerhafter Bereitstellung475cI. Bei nicht ausdrücklich bestimmter Dauer rechtliche Konkretisierung475cI2/475bIV2 vorab vornehmen.}
}
\details{Zweijahresgrenze ab Ablieferung berechnen und mit qualifiziertem Bereitstellungsende das spätere Ende bestimmen. §475cII: zeitlicher Umfang der Anforderungen an dauerhaft bereitzustellende digitale Elemente, mindestens zwei Jahre ab Ablieferung. Bei längerem qualifizierten Bereitstellungszeitraum gilt dessen Ende; bei unbefristeter Bereitstellung kein bestimmtes Gesamtende. Keine Verjährungsfrist und keine Beweislastvermutung477II; Mangel, übrige Anspruchsvoraussetzungen und rechtliche Bestimmung des Bereitstellungszeitraums separat. Keine193Verschiebung. Nur hier festgelegte endliche oder tatsächlich unbefristete Dauer; unbekannte Dauer darf nicht als unbefristet eingesetzt werden. Strikte ISO-Kalendertage0001..9999; keine automatische Feiertagsverschiebung.}
\value{wert: zweijahresgrenzeYYYY-MM-DD und massgebliches_zeitraumendeYYYY-MM-DD oderNULL bei qualifiziert unbefristeter Dauer. Einheit: daten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_475c_T0001, BGB_475c_T0002, BGB_475c_T0003}
\examples{
kauf_digitale_mindesthaftungsdauer(
  ablieferung_am = "2024-02-29",
  bereitstellung_bis = "2025-01-01",
  bereitstellung_unbefristet = FALSE,
  einordnungsnachweis = paste0(
    "§475cII: zeitlicher Umfang der Anforderungen an dauerhaft be",
    "reitzustellende digitale Elemente, mindestens zwei Jahre ab ",
    "Ablieferung. Bei längerem qualifizierten Bereitstellungszeit",
    "raum gilt dessen Ende; bei unbefristeter Bereitstellung kein",
    " bestimmtes Gesamtende. Keine Verjährungsfrist und keine Bew",
    "eislastvermutung477II; Mangel, übrige Anspruchsvoraussetzung",
    "en und rechtliche Bestimmung des Bereitstellungszeitraums se",
    "parat. Keine193Verschiebung. Nur hier festgelegte endliche o",
    "der tatsächlich unbefristete Dauer; unbekannte Dauer darf ni",
    "cht als unbefristet eingesetzt werden."
  )
)
}
