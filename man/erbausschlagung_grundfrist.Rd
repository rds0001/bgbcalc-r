% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{erbausschlagung_grundfrist}
\alias{erbausschlagung_grundfrist}
\title{erbausschlagung grundfrist}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{erbausschlagung_grundfrist(
  erbfall_am = NULL,
  kenntnis_anfall_berufungsgrund_am = NULL,
  berufung_durch_verfuegung = NULL,
  gerichtliche_bekanntgabe_am = NULL,
  erblasser_letzter_wohnsitz_nur_ausland = NULL,
  erbe_bei_fristbeginn_im_ausland = NULL,
  ausschlagungsregel_anwendbar = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{erbfall_am}{ISO-Datum0001..9999 des rechtlich maßgeblichen Erbfalls. Kenntnis vom tatsächlichen Anfall nicht vor diesem Ereignis ansetzen.}
\item{kenntnis_anfall_berufungsgrund_am}{ISO-Datum0001..9999, an dem der Erbe von Anfall UND Grund der Berufung Kenntnis erlangt hat; mindestens Erbfall. Kenntnis bloß vom Tod ohne eigene Berufung nicht automatisch ausreichend.}
\item{berufung_durch_verfuegung}{Wahrheitswert, ob Berufung durch Verfügung von Todes wegen vorliegt. Dann Bekanntgabe durch Nachlassgericht als zusätzliche Startgrenze berücksichtigen.}
\item{gerichtliche_bekanntgabe_am}{ISO-Datum0001..9999 der rechtlich maßgeblichen Bekanntgabe der Verfügung durch das Nachlassgericht. Bei berufung_durch_verfuegung=TRUE erforderlich und nicht vor Erbfall. Sonst optional NULL/None; private frühere Kenntnis von Testament nicht ohne Weiteres als gerichtliche Bekanntgabe einsetzen.}
\item{erblasser_letzter_wohnsitz_nur_ausland}{Wahrheitswert, ob der Erblasser seinen letzten Wohnsitz NUR im Ausland hatte. Ein zusätzlicher Auslandswohnsitz neben einem inländischen erfüllt diese Alternative nicht automatisch.}
\item{erbe_bei_fristbeginn_im_ausland}{Wahrheitswert des Aufenthalts des Erben im Ausland gerade beim rechtlich bestimmten Fristbeginn. Bei späterer gerichtlicher Bekanntgabe deren Auswirkung auf den Beginn berücksichtigen; keine spätere Urlaubsreise einsetzen.}
\item{ausschlagungsregel_anwendbar}{Wahrheitswert des konkreten sachlichen/zeitlichen Ausschlagungstatbestands nach§1944. FALSE ergibt NICHT_ANWENDBAR; frühere Annahme und andere Ausschlüsse gesondert prüfen.}
\item{einordnungsnachweis}{Nichtleere Begründung von Erbfall, Berufung, Kenntnis, gerichtlicher Bekanntgabe und Auslandsverhältnissen gerade am maßgeblichen Zeitpunkt.}
}
\details{Fristbeginn Kenntnis von Anfall und Berufungsgrund, bei Verfügung frühestens gerichtliche Bekanntgabe: späteres Datum. Sechs Wochen; bei mindestens einer gesetzlichen Auslandsalternative sechs Monate. Nur Grundfrist vor§§206/210 und erforderlichen Kalenderkorrekturen. Keine automatische Ausschlagung oder Annahmefiktion; tatsächliche/formgerechte Erklärung und§1943 separat. ISO-Daten und berechnete Fristgrenzen0001..9999, explizite Auswahl/Wahrheitswerte und nichtleerer Nachweis. Optionale Bekanntgabe nur im beschriebenen Fall.}
\value{wert enthält fristbeginnereignis_am, rechnerischer_letzter_tag als ISO-Daten, fristdauer=6 und fristeinheit wochen oder monate. Ohne Anwendbarkeit NICHT_ANWENDBAR/null. Einheit: fristdaten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1944_T0001, BGB_1944_T0002, BGB_1944_T0003, BGB_1944_T0004, BGB_1944_T0005}
\examples{
erbausschlagung_grundfrist(
  erbfall_am = "2024-01-01",
  kenntnis_anfall_berufungsgrund_am = "2024-02-29",
  berufung_durch_verfuegung = FALSE,
  gerichtliche_bekanntgabe_am = "2024-02-15",
  erblasser_letzter_wohnsitz_nur_ausland = FALSE,
  erbe_bei_fristbeginn_im_ausland = FALSE,
  ausschlagungsregel_anwendbar = TRUE,
  einordnungsnachweis = paste0(
    "Synthetisch Kenntnis von Anfall und Berufungsgrund, gegebene",
    "nfalls gerichtliche Bekanntgabe und rechtlich maßgebliche Au",
    "slandsverhältnisse."
  )
)
}
