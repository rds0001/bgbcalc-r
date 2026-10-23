% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{besitz_nutzungswerte_im_haftungszeitraum}
\alias{besitz_nutzungswerte_im_haftungszeitraum}
\title{besitz nutzungswerte im haftungszeitraum}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{besitz_nutzungswerte_im_haftungszeitraum(
  haftungsbeginn_utc = NULL,
  beginn_eingeschlossen = NULL,
  abrechnungsende_utc = NULL,
  nutzungen = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{haftungsbeginn_utc}{Rechtlich maßgeblicher Beginn der Nutzungsverantwortlichkeit als ausreichend genauer UTC-SekundenzeitpunktYYYY-MM-DDTHH:MM:SSZ.}
\item{beginn_eingeschlossen}{Wahrheitswert: Beginn gehört zum qualifizierten Haftungszeitraum.987 nach Eintritt und990 von Erwerb/Kenntnis zeitlich rechtlich zutreffend normalisieren.}
\item{abrechnungsende_utc}{Letzter eingeschlossener UTC-Sekundenzeitpunkt der vollständig bekannten Abrechnung.}
\item{nutzungen}{Liste0..1000 mit genau nutzung_id, nutzungszeitpunkt_utc, nutzungsart (gezogen oder schuldhaft_nichtgezogen), nutzungswert(EUR). Pro Position eigener nachgewiesener Wert, keine doppelt gezählten tatsächlich/unterlassenen Nutzungen.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des987/990/991I-Falls, Beginn-/Endeinschlusses, rechtlich zutreffenden Nutzungszeitpunkts und Wertes; für nichtgezogene Nutzungen ordnungsgemäße Wirtschaft und Verschulden vorqualifiziert.}
}
\details{Qualifizierte Nutzungspositionen im maßgeblichen Haftungszeitraum auswählen und Werte nach gezogener und schuldhaft nicht gezogener Nutzung getrennt summieren. §§987/990,gegebenenfalls991I: qualifizierte Nutzungspositionen nach Haftungszeitraum auswählen, tatsächlich gezogene und schuldhaft nicht gezogene Werte getrennt summieren. Anwendungsfall, gegebenenfalls kumulative Verantwortlichkeit mittelbaren Besitzers991I, Bewertungsmaßstab und zeitliche Zuordnung extern. Keine automatische Bösgläubigkeit, Rechtshängigkeit oder Verschuldensentscheidung. Mehrtägige Nutzungsabschnitte an Haftungsgrenzen vorher rechtlich zutreffend aufteilen; kein pauschales Abstellen auf Buchungs-/Zahlungstag. UTC-Sekunden nur bei ausreichend genauer Normalisierung, keine Subsekunden abschneiden. Werte in Euro begründen keinen automatischen Geldersatz statt Naturherausgabe.988/993-Bereicherung und weitergehende Verzugshaftung gesondert. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.gezogener_nutzungswert, schuldhaft_nichtgezogener_nutzungswert und gesamter_nutzungswert als exakte Eurobrüche; beruecksichtigte_nutzung_ids als Liste in Eingabereihenfolge. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_987_T0001, BGB_987_T0002, BGB_990_T0001, BGB_990_T0002, BGB_991_T0001}
\examples{
besitz_nutzungswerte_im_haftungszeitraum(
  haftungsbeginn_utc = "2024-01-01T10:00:00Z",
  beginn_eingeschlossen = FALSE,
  abrechnungsende_utc = "2024-01-02T12:00:00Z",
  nutzungen = list(
    list(
    "nutzung_id" = "vorher",
    "nutzungszeitpunkt_utc" = "2024-01-01T09:59:59Z",
    "nutzungsart" = "gezogen",
    "nutzungswert" = "500"
  ),
    list(
    "nutzung_id" = "grenze",
    "nutzungszeitpunkt_utc" = "2024-01-01T10:00:00Z",
    "nutzungsart" = "gezogen",
    "nutzungswert" = "20"
  ),
    list(
    "nutzung_id" = "spaeter",
    "nutzungszeitpunkt_utc" = "2024-01-01T10:00:01Z",
    "nutzungsart" = "gezogen",
    "nutzungswert" = "30"
  ),
    list(
    "nutzung_id" = "unterlassen",
    "nutzungszeitpunkt_utc" = "2024-01-02T12:00:00Z",
    "nutzungsart" = "schuldhaft_nichtgezogen",
    "nutzungswert" = "40"
  ),
    list(
    "nutzung_id" = "danach",
    "nutzungszeitpunkt_utc" = "2024-01-02T12:00:01Z",
    "nutzungsart" = "gezogen",
    "nutzungswert" = "600"
  )
  ),
  einordnungsnachweis = paste0(
    "§§987/990,gegebenenfalls991I: qualifizierte Nutzungsposition",
    "en nach Haftungszeitraum auswählen, tatsächlich gezogene und",
    " schuldhaft nicht gezogene Werte getrennt summieren. Anwendu",
    "ngsfall, gegebenenfalls kumulative Verantwortlichkeit mittel",
    "baren Besitzers991I, Bewertungsmaßstab und zeitliche Zuordnu",
    "ng extern. Keine automatische Bösgläubigkeit, Rechtshängigke",
    "it oder Verschuldensentscheidung. Mehrtägige Nutzungsabschni",
    "tte an Haftungsgrenzen vorher rechtlich zutreffend aufteilen",
    "; kein pauschales Abstellen auf Buchungs-/Zahlungstag. UTC-S",
    "ekunden nur bei ausreichend genauer Normalisierung, keine Su",
    "bsekunden abschneiden. Werte in Euro begründen keinen automa",
    "tischen Geldersatz statt Naturherausgabe.988/993-Bereicherun",
    "g und weitergehende Verzugshaftung gesondert."
  )
)
}
