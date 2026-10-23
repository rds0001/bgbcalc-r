% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{unterhalt_vorausleistung_zeitgrenze}
\alias{unterhalt_vorausleistung_zeitgrenze}
\title{unterhalt vorausleistung zeitgrenze}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{unterhalt_vorausleistung_zeitgrenze(
  zeitabschnittsfall = NULL,
  bezugstag_am = NULL,
  beginnart = NULL,
  qualifizierte_dauer = NULL,
  qualifizierte_einheit = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{zeitabschnittsfall}{geldrente_760, andere_rente_760 oder angemessener_selbstbestimmter_zeitabschnitt; gesetzliche Anwendbarkeit vorqualifizieren.}
\item{bezugstag_am}{Rechtlich bestimmter BezugstagYYYY-MM-DD für den Zeitraum der befreienden Vorausleistung; nicht ungeprüft Zahlungstag oder erneuten Bedürftigkeitsbeginn einsetzen.}
\item{beginnart}{ereignis oder tagesbeginn nach rechtlich zutreffendem Fristbeginn; vollständig auf Kalendertage normalisieren.}
\item{qualifizierte_dauer}{Nur bei anderer Rente oder rechtlich selbst zu bestimmendem angemessenem Zeitraum positive ganze Dauer1..3652059. Im Geldrentenfall null.}
\item{qualifizierte_einheit}{Nur zusammen mit qualifizierter_dauer: tage, wochen, monate oder jahre. Im gesetzlichen Geldrentenfall null.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des1614II-Falls, Beginns und erforderlichenfalls Beschaffenheit/Zweck beziehungsweise rechtlich angemessener Dauer.}
}
\details{Gesetzliche Dreimonatsdauer oder ausdrücklich rechtlich qualifizierte Sonderdauer auswählen und Zeitraum mit vorhandener Kalenderbibliothek berechnen. §1614II in Verbindung mit760II: nur zeitliche Grenze der befreienden Wirkung einer Vorausleistung bei erneuter Bedürftigkeit, kein wirksamer Verzicht auf künftigen Unterhalt. Im gesetzlichen Geldrentenfall drei Kalendermonate. Bei anderer Rente den nach Beschaffenheit/Zweck bestimmten Zeitabschnitt vorqualifizieren. Die angemessene Sonderdauer gilt nur, wenn der Verpflichtete den Zeitabschnitt rechtlich selbst zu bestimmen hatte, nicht schon bei jeder tatsächlich von ihm gewählten Vorauszahlung. Maßgeblichen Beginn und Beginnart rechtlich bestimmen; keine automatische neue Dreimonatsfrist ab erneuter Bedürftigkeit, keine Gleichsetzung von Zahlungstag und Periodenbeginn. Betrag, Bedarfsentwicklung, ausreichende Vorausleistung und weitere Unterhaltsvoraussetzungen separat. Keine eigenständige Angemessenheitsbewertung oder pauschale90Tage-Annahme. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.rechnerische_befreiungsgrenze alsYYYY-MM-DD; keine automatische Feststellung des Unterhaltsanspruchs oder wirksamen Verzichts. Einheit: datum.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1614_T0002, BGB_760_T0002}
\examples{
unterhalt_vorausleistung_zeitgrenze(
  zeitabschnittsfall = "geldrente_760",
  bezugstag_am = "2024-01-01",
  beginnart = "tagesbeginn",
  qualifizierte_dauer = NULL,
  qualifizierte_einheit = NULL,
  einordnungsnachweis = paste0(
    "§1614II in Verbindung mit760II: nur zeitliche Grenze der bef",
    "reienden Wirkung einer Vorausleistung bei erneuter Bedürftig",
    "keit, kein wirksamer Verzicht auf künftigen Unterhalt. Im ge",
    "setzlichen Geldrentenfall drei Kalendermonate. Bei anderer R",
    "ente den nach Beschaffenheit/Zweck bestimmten Zeitabschnitt ",
    "vorqualifizieren. Die angemessene Sonderdauer gilt nur, wenn",
    " der Verpflichtete den Zeitabschnitt rechtlich selbst zu bes",
    "timmen hatte, nicht schon bei jeder tatsächlich von ihm gewä",
    "hlten Vorauszahlung. Maßgeblichen Beginn und Beginnart recht",
    "lich bestimmen; keine automatische neue Dreimonatsfrist ab e",
    "rneuter Bedürftigkeit, keine Gleichsetzung von Zahlungstag u",
    "nd Periodenbeginn. Betrag, Bedarfsentwicklung, ausreichende ",
    "Vorausleistung und weitere Unterhaltsvoraussetzungen separat",
    ". Keine eigenständige Angemessenheitsbewertung oder pauschal",
    "e90Tage-Annahme."
  )
)
}
