% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{digitalprodukt_beweislastzeitvergleich}
\alias{digitalprodukt_beweislastzeitvergleich}
\title{digitalprodukt beweislastzeitvergleich}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{digitalprodukt_beweislastzeitvergleich(
  bereitstellungsart = NULL,
  bereitstellung_an_verbraucher_am = NULL,
  abweichung_gezeigt_am = NULL,
  bereitstellungsende_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{bereitstellungsart}{einmalig, befristet_dauerhaft oder unbefristet_dauerhaft. Rechtlich bestimmte Bereitstellungsart, keine Gleichsetzung dauerhafter Nutzung mit dauerhafter Bereitstellung.}
\item{bereitstellung_an_verbraucher_am}{ISO-Datum des tatsächlichen Bereitstellungsbeginns beim Verbraucher; auch im Regress§327uIII nicht die frühere Bereitstellung an den Vertriebspartner.}
\item{abweichung_gezeigt_am}{ISO-Datum des tatsächlichen Auftretens des abweichenden Zustands. Bei gleichem Datum wie Bereitstellung muss das tatsächliche Auftreten nach Bereitstellung rechtlich feststehen.}
\item{bereitstellungsende_am}{Bei befristet_dauerhaft: ISO-Datum des letzten eingeschlossenen Bereitstellungstags. Sonst ausdrücklich null/NULL; unbekanntes Ende darf nicht als unbefristet deklariert werden.}
\item{einordnungsnachweis}{Nichtleere Qualifikation von §§327kI/II, gegebenenfalls327uIII, Bereitstellungsart und tatsächlichen Zeitpunkten. Mangel, Gegenbeweis und Ausnahmen327kIII/IV gesondert.}
}
\details{Auftreten eines abweichenden Zustands mit Jahresgrundgrenze oder tatsächlichem dauerhaften Bereitstellungszeitraum vergleichen. Bei einmaliger Bereitstellung Jahresgrundgrenze nach§327kI/§§187I/188; bei dauerhafter Bereitstellung tatsächlicher qualifizierter Bereitstellungszeitraum nach§327kII. Beginn jeweils Bereitstellung an den Verbraucher, auch nach§327uIII. Abweichung muss innerhalb einschließlich Anfangs-/Endtag auftreten; tatsächliche Reihenfolge am selben Tag ist qualifiziert. Unbefristete Bereitstellung hat keine erfundene maximale Jahresgrenze. Ergebnis bezeichnet ausschließlich zeitliche Voraussetzung, keine automatische Beweislast-, Mangel- oder Haftungsentscheidung. Technische Umgebung, Mitwirkung und Belehrung nachAbsätzen3/4 separat; keine193Verlängerung des Beobachtungszeitraums. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält zeitfenster_beginn_am, zeitfenster_ende_am (null/NULL nur für unbefristete Dauerbereitstellung) und abweichung_im_zeitfenster. Zeitliche Voraussetzung, keine abschließende Beweislastentscheidung. Einheit: daten_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_327k_T0001, BGB_327k_T0002, BGB_327k_T0003, BGB_327k_T0004, BGB_327k_T0005, BGB_327k_T0006, BGB_327k_T0007, BGB_327k_T0008, BGB_327u_T0007}
\examples{
digitalprodukt_beweislastzeitvergleich(
  bereitstellungsart = "befristet_dauerhaft",
  bereitstellung_an_verbraucher_am = "2024-01-01",
  abweichung_gezeigt_am = "2025-06-30",
  bereitstellungsende_am = "2025-06-30",
  einordnungsnachweis = paste0(
    "Bei einmaliger Bereitstellung Jahresgrundgrenze nach§327kI/§",
    "§187I/188; bei dauerhafter Bereitstellung tatsächlicher qual",
    "ifizierter Bereitstellungszeitraum nach§327kII. Beginn jewei",
    "ls Bereitstellung an den Verbraucher, auch nach§327uIII. Abw",
    "eichung muss innerhalb einschließlich Anfangs-/Endtag auftre",
    "ten; tatsächliche Reihenfolge am selben Tag ist qualifiziert",
    ". Unbefristete Bereitstellung hat keine erfundene maximale J",
    "ahresgrenze. Ergebnis bezeichnet ausschließlich zeitliche Vo",
    "raussetzung, keine automatische Beweislast-, Mangel- oder Ha",
    "ftungsentscheidung. Technische Umgebung, Mitwirkung und Bele",
    "hrung nachAbsätzen3/4 separat; keine193Verlängerung des Beob",
    "achtungszeitraums."
  )
)
}
