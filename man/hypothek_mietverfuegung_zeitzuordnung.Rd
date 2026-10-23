% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{hypothek_mietverfuegung_zeitzuordnung}
\alias{hypothek_mietverfuegung_zeitzuordnung}
\title{hypothek mietverfuegung zeitzuordnung}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{hypothek_mietverfuegung_zeitzuordnung(
  beschlagnahme_am = NULL,
  mietabschnitte = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{beschlagnahme_am}{Qualifizierte Beschlagnahme zugunsten des HypothekengläubigersYYYY-MM-DD.}
\item{mietabschnitte}{Liste0..1000 überschneidungsfreier Abschnitte einer Miet-/Pachtforderung, je genau abschnitt_id, erster_miettag, letzter_miettag, verfuegungsbetrag(EUR). Vor der Beschlagnahme rechtlich erfolgte Verfügung vorausgesetzt. Grenzüberschreitende Abschnitte zuvor zutreffend aufteilen.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des1124I/II-Falls, vorzeitiger Verfügung und identischer Forderungsgrundlage; Zeiträume betreffen die Miet-/Pachtzeit, nicht Zahlung oder Fälligkeit.}
}
\details{Vor Beschlagnahme verfügte Miet-/Pachtabschnittsbeträge nach gesetzlicher Monatsgrenze zeitlich auswählen und getrennt summieren. §1124II: vor Beschlagnahme erfolgte Verfügungen nach ihrem Miet-/Pachtzeitraum der Monatsgrenze zuordnen. Beschlagnahme bis einschließlich15.: Ende laufender Monat; nach15.: Ende Folgemonat. Beträge vollständig innerhalb/außerhalb getrennt summieren. Keine pauschale gleichmäßige Tagesaufteilung für einen grenzüberschreitenden Gesamtbetrag. Nur eine Forderungs-/Vertragsgrundlage je Aufruf; mehrere Verträge getrennt behandeln. Zeitliche Zuordnung setzt übrige1124-Voraussetzungen voraus und entscheidet keine sonstigen Wirksamkeitsfragen.1123-Jahresbefreiung sowie1126-Dreimonatsregel nicht durch diesen Monatsvergleich ersetzen. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.letzter_erfasster_miettag als Datum; betrag_im_zeitlichen_fenster und betrag_ausserhalb_des_zeitlichen_fensters als Eurobrüche; abschnitt_ids_im_zeitlichen_fenster in Eingabereihenfolge. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1124_T0001, BGB_1124_T0002, BGB_1124_T0003}
\examples{
hypothek_mietverfuegung_zeitzuordnung(
  beschlagnahme_am = "2024-01-15",
  mietabschnitte = list(
    list(
    "abschnitt_id" = "Januar",
    "erster_miettag" = "2024-01-01",
    "letzter_miettag" = "2024-01-31",
    "verfuegungsbetrag" = "100"
  ),
    list(
    "abschnitt_id" = "Februar",
    "erster_miettag" = "2024-02-01",
    "letzter_miettag" = "2024-02-29",
    "verfuegungsbetrag" = "200"
  ),
    list(
    "abschnitt_id" = "Maerz",
    "erster_miettag" = "2024-03-01",
    "letzter_miettag" = "2024-03-31",
    "verfuegungsbetrag" = "300"
  )
  ),
  einordnungsnachweis = paste0(
    "§1124II: vor Beschlagnahme erfolgte Verfügungen nach ihrem M",
    "iet-/Pachtzeitraum der Monatsgrenze zuordnen. Beschlagnahme ",
    "bis einschließlich15.: Ende laufender Monat; nach15.: Ende F",
    "olgemonat. Beträge vollständig innerhalb/außerhalb getrennt ",
    "summieren. Keine pauschale gleichmäßige Tagesaufteilung für ",
    "einen grenzüberschreitenden Gesamtbetrag. Nur eine Forderung",
    "s-/Vertragsgrundlage je Aufruf; mehrere Verträge getrennt be",
    "handeln. Zeitliche Zuordnung setzt übrige1124-Voraussetzunge",
    "n voraus und entscheidet keine sonstigen Wirksamkeitsfragen.",
    "1123-Jahresbefreiung sowie1126-Dreimonatsregel nicht durch d",
    "iesen Monatsvergleich ersetzen."
  )
)
}
