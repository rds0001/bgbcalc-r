% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{ankuendigung_vorlaufvergleich}
\alias{ankuendigung_vorlaufvergleich}
\title{ankuendigung vorlaufvergleich}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{ankuendigung_vorlaufvergleich(
  vorlauffall = NULL,
  zugang_am = NULL,
  beabsichtigter_beginn_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{vorlauffall}{modernisierung_555c, waermeumstellung_556c, mietaufrechnung_556b, zahlungsdienste_aenderung_675g, urlaubsprodukt_zahlung_486a gastschul_information_651u oder zahlung_vorabinformation_675x.}
\item{zugang_am}{ISO-Datum des tatsächlichen rechtlich maßgeblichen Zugangs einer vollständigen Erklärung/Information.}
\item{beabsichtigter_beginn_am}{ISO-Datum des Beginns der Maßnahme, Umstellung, Fälligkeit, Änderung oder Reise. Vorlauf muss vor Beginn dieses Tages vollständig abgelaufen sein; kein untertägiger Zeitpunkt.}
\item{einordnungsnachweis}{Nichtleere Qualifikation des gesetzlichen Vorlauffalls, des Zugangs und des Bezugsbeginns. Inhalt/Form/Adressat/Ausnahmen und zusätzliche Rechtsfolgen gesondert beurteilen.}
}
\details{Gesetzlichen Mindestvorlauf ab Zugang berechnen und Beginn nach vollständigem Fristablauf vergleichen. Mindestvorlauf ab tatsächlichem Zugang nach §§187I/188 vorwärts berechnen; der Zieltagesbeginn muss nach dem Ablaufdatum liegen. Nur kalendertäglicher Vorlauf, keine eigenständige qualitative Wirksamkeitsentscheidung und keine automatische Fristverschiebung nach§193. Bei verspäteter Ankündigung wird der tatsächlich beabsichtigte Beginn nicht automatisch geändert. §555cIV Bagatellausnahme, §556cI sonstige Umstellungsvoraussetzungen, §556bII zulässiger Forderungstyp und Textform, §675gII Zustimmung/Absätze3und4-Ausnahmen, §486a Zahlungsplan und §651uIII vollständige Information/angemessene Vorbereitung gesondert. §675xIII betrifft nur den Vierwochenvorlauf; direkte Zustimmung, wirksame Ausschlussvereinbarung und erforderliche Information sind gesonderte Voraussetzungen, kein automatischer Erstattungsausschluss. Untertägige Zeitpunktvereinbarungen sind nicht durch ein bloßes Datum abgebildet. Keine pauschale30-Tage-Monatsrechnung. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.vorlauf_ablauf_am ist letzter eingeschlossener Fristtag, wert.fruehester_beginn_am der folgende Kalendertag; wert.vorlauf_eingehalten vergleicht den tatsächlichen geplanten Beginn mit dieser Mindestgrenze. Einheit: daten_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_486a_T0001, BGB_486a_T0002, BGB_486a_T0003, BGB_486a_T0004, BGB_486a_T0005, BGB_555c_T0001, BGB_555c_T0002, BGB_555c_T0003, BGB_555c_T0004, BGB_555c_T0005, BGB_555c_T0006, BGB_555c_T0007, BGB_555c_T0008, BGB_555c_T0009, BGB_556b_T0001, BGB_556b_T0002, BGB_556b_T0003, BGB_556c_T0001, BGB_556c_T0002, BGB_556c_T0003, BGB_556c_T0004, BGB_556c_T0005, BGB_556c_T0006, BGB_556c_T0007, BGB_556c_T0008, BGB_651u_T0001, BGB_651u_T0002, BGB_651u_T0003, BGB_651u_T0004, BGB_651u_T0005, BGB_651u_T0006, BGB_651u_T0007, BGB_651u_T0008, BGB_651u_T0009, BGB_651u_T0010, BGB_651u_T0011, BGB_651u_T0012, BGB_651u_T0013, BGB_675g_T0001, BGB_675g_T0002, BGB_675g_T0003, BGB_675g_T0004, BGB_675g_T0005, BGB_675g_T0006, BGB_675g_T0007, BGB_675g_T0008, BGB_675x_T0001, BGB_675x_T0002, BGB_675x_T0003, BGB_675x_T0004, BGB_675x_T0005, BGB_675x_T0006, BGB_675x_T0007, BGB_675x_T0008, BGB_675x_T0009, BGB_675x_T0010, BGB_675x_T0011, BGB_675x_T0012, BGB_675x_T0013, BGB_675x_T0014}
\examples{
ankuendigung_vorlaufvergleich(
  vorlauffall = "modernisierung_555c",
  zugang_am = "2024-01-31",
  beabsichtigter_beginn_am = "2024-05-01",
  einordnungsnachweis = paste0(
    "Mindestvorlauf ab tatsächlichem Zugang nach §§187I/188 vorwä",
    "rts berechnen; der Zieltagesbeginn muss nach dem Ablaufdatum",
    " liegen. Nur kalendertäglicher Vorlauf, keine eigenständige ",
    "qualitative Wirksamkeitsentscheidung und keine automatische ",
    "Fristverschiebung nach§193. Bei verspäteter Ankündigung wird",
    " der tatsächlich beabsichtigte Beginn nicht automatisch geän",
    "dert. §555cIV Bagatellausnahme, §556cI sonstige Umstellungsv",
    "oraussetzungen, §556bII zulässiger Forderungstyp und Textfor",
    "m, §675gII Zustimmung/Absätze3und4-Ausnahmen, §486a Zahlungs",
    "plan und §651uIII vollständige Information/angemessene Vorbe",
    "reitung gesondert. §675xIII betrifft nur den Vierwochenvorla",
    "uf; direkte Zustimmung, wirksame Ausschlussvereinbarung und ",
    "erforderliche Information sind gesonderte Voraussetzungen, k",
    "ein automatischer Erstattungsausschluss. Untertägige Zeitpun",
    "ktvereinbarungen sind nicht durch ein bloßes Datum abgebilde",
    "t. Keine pauschale30-Tage-Monatsrechnung."
  )
)
}
