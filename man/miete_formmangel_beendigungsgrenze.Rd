% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{miete_formmangel_beendigungsgrenze}
\alias{miete_formmangel_beendigungsgrenze}
\title{miete formmangel beendigungsgrenze}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{miete_formmangel_beendigungsgrenze(
  ueberlassung_am = NULL,
  ordentlicher_beendigungstag = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{ueberlassung_am}{Tag der tatsaechlichen Ueberlassung im qualifizierten550Fall.}
\item{ordentlicher_beendigungstag}{Nach einschlaegiger Kuendigungsfrist bereits errechneter regulaerer Monatsendtermin, etwa aus wohnraummiete_kuendigungstermin.}
\item{einordnungsnachweis}{Vertragsdauer laenger als ein Jahr, einschlaegiger Schriftformmangel, ordentliche Kuendigung zu Monatsende und Zugang/Wirksamkeit rechtlich qualifizieren.}
}
\details{Jahresmindestbindung550mit regulaerem Monatsendtermin verbinden und erforderlichenfalls bis zum naechsten zulaessigen Monatsende verschieben. §550Satz2: regulaeren ordentlichen Monatsendtermin mit dem Ablauf eines Jahres nach tatsaechlicher Ueberlassung vergleichen. Liegt der regulaere Termin davor, ersten Monatsendtermin bestimmen, der die Jahresgrenze erreicht. Nicht bloss das Maximum mit einem mitten im Monat liegenden Jahrestag als angeblich zulaessigen Kuendigungstermin ausgeben. Ueberlassungsereignis nach187I, keine pauschale365Tage-Dauer. Die ordentliche Frist wird vom bestehenden Wohnraummietkern berechnet; diese Funktion fuegt nur550-Mindestbindung hinzu. Kein automatischer Formmangelentscheid, keine Kuendigungssperre fuer ausserordentliche wichtige Gruende und keine Behandlung abweichender wirksamer Terminvereinbarungen. Bei rechtlich anderem Beginn187II gesondert qualifizieren. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Jahresmindestgrenze und fruehester damit vereinbarer Monatsendtermin, keine automatische Vertragsbeendigung. Einheit: daten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_550_T0001, BGB_550_T0002, BGB_573c_T0001, BGB_573c_T0002, BGB_573c_T0003, BGB_573c_T0004, BGB_573c_T0005}
\examples{
miete_formmangel_beendigungsgrenze(
  ueberlassung_am = "2024-02-15",
  ordentlicher_beendigungstag = "2024-12-31",
  einordnungsnachweis = paste0(
    "§550Satz2: regulaeren ordentlichen Monatsendtermin mit dem A",
    "blauf eines Jahres nach tatsaechlicher Ueberlassung vergleic",
    "hen. Liegt der regulaere Termin davor, ersten Monatsendtermi",
    "n bestimmen, der die Jahresgrenze erreicht. Nicht bloss das ",
    "Maximum mit einem mitten im Monat liegenden Jahrestag als an",
    "geblich zulaessigen Kuendigungstermin ausgeben. Ueberlassung",
    "sereignis nach187I, keine pauschale365Tage-Dauer. Die ordent",
    "liche Frist wird vom bestehenden Wohnraummietkern berechnet;",
    " diese Funktion fuegt nur550-Mindestbindung hinzu. Kein auto",
    "matischer Formmangelentscheid, keine Kuendigungssperre fuer ",
    "ausserordentliche wichtige Gruende und keine Behandlung abwe",
    "ichender wirksamer Terminvereinbarungen. Bei rechtlich ander",
    "em Beginn187II gesondert qualifizieren."
  )
)
}
