% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{vaterschaftsanfechtung_grundfrist}
\alias{vaterschaftsanfechtung_grundfrist}
\title{vaterschaftsanfechtung grundfrist}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{vaterschaftsanfechtung_grundfrist(
  kenntnis_am = NULL,
  kind_geboren_am = NULL,
  fristfall = NULL,
  berechtigter_geboren_am = NULL,
  anerkennung_wirksam_am = NULL,
  fristbeginnnachweis = NULL
)}
\arguments{
\item{kenntnis_am}{ISO-Datum qualifizierter Kenntnis der gegen Vaterschaft sprechenden Umstände; bei eigener Minderjährigenfrist eigene Kenntnis.}
\item{kind_geboren_am}{ISO-Geburtsdatum des betroffenen Kindes.}
\item{fristfall}{allgemein oder minderjaehriger_selbst: rechtlich qualifizierter Anwendungsfall; Vertreteranfechtung Minderjähriger nicht enthalten.}
\item{berechtigter_geboren_am}{ISO-Geburtsdatum des selbst anfechtenden früher Minderjährigen; hierfür erforderlich, im allgemeinen Fall zwingend null.}
\item{anerkennung_wirksam_am}{Optionales ISO-Datum der maßgeblichen wirksamen Anerkennung; sonst null, nicht bloß Abgabe der Erklärung.}
\item{fristbeginnnachweis}{Nichtleerer Nachweis von Kenntnis, maßgeblicher Vaterschaftszuordnung und Fristvariante.}
}
\details{Zweijahresfrist ab spätestem maßgeblichem Ereignis; eigene Minderjährigenfrist zusätzlich nicht vor Volljährigkeit und Ablauf nicht vor Vollendung21. Bestehenden Kalenderkern mit Ereignis-/Tagesbeginnmodus verwenden. §1600bI/II der lokalen Fassung: ungestörte Grundfrist, keine abschließende Anfechtungszulässigkeit. allgemein setzt rechtlich qualifiziert voraus, dass die besondere eigene Minderjährigenfrist nicht eingreift. minderjaehriger_selbst erfasst die eigene Anfechtung nach Absatz2Sätze2/3; Kenntnis ist eigene Kenntnis, nicht Vertreterkenntnis. Die Auswahl ersetzt keine Prüfung der gesetzlichen Fallvoraussetzungen. anerkennung_wirksam_am nur bei maßgeblicher Anerkennung; bei anderweitiger Vaterschaftszuordnung null. Kindesgeburt und Kenntnis können vor Wirksamkeit der Anerkennung liegen. Altersgrenzen nach§187II2 ab Tagesbeginn: Ablauf am Vortag des21.Geburtstags bedeutet Vollendung21 mit Ablauf dieses Tages, nicht einen Tag früher. Geburtsdaten/Wirksamkeitszeitpunkte rechtlich qualifiziert. Vertreteranfechtung Minderjähriger, Wiederanfechtung nach Geschäftsunfähigkeit(Absatz3), Neubeginn bei Unzumutbarkeit(Absatz5), sämtliche Hemmungen/§§204,206,210 und§193-Korrekturen nicht berechnet. Fristende daher nicht ungeprüft als tatsächlichen letzten Antragstag verwenden. ISO-Daten0001..9999, qualifizierter Auswahltext und Nachweis. Fehlende Pflichtangaben EINGABE_FEHLT; unzulässige Typen, Daten, Auswahl und Bereichsüberschreitung EINGABE_UNGUELTIG.}
\value{wert enthält Ereignisbeginn-Datum, optional Volljährigkeitsbeginn, Zweijahresgrundfristende, optional Mindestablauf Vollendung21 und kombiniertes Anfechtungsgrundfristende. Keine Hemmungs-/Feiertagskorrektur. Einheit: daten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1600b_T0001, BGB_1600b_T0002, BGB_1600b_T0004, BGB_1600b_T0005, BGB_1600b_T0006}
\examples{
vaterschaftsanfechtung_grundfrist(
  kenntnis_am = "2020-01-01",
  kind_geboren_am = "2010-05-10",
  fristfall = "allgemein",
  berechtigter_geboren_am = NULL,
  anerkennung_wirksam_am = NULL,
  fristbeginnnachweis = paste0(
    "Gesetzlicher Anwendungsfall und eigene Kenntnis qualifiziert",
    "; ungestörter Grundfristenlauf."
  )
)
}
