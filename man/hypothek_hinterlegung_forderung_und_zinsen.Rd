% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{hypothek_hinterlegung_forderung_und_zinsen}
\alias{hypothek_hinterlegung_forderung_und_zinsen}
\title{hypothek hinterlegung forderung und zinsen}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{hypothek_hinterlegung_forderung_und_zinsen(
  forderungsbetrag = NULL,
  ausschliessungsbeschluss_rechtskraeftig_am = NULL,
  zinssatz_im_grundbuch_eingetragen = NULL,
  zinsabschnitte = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{forderungsbetrag}{Rechtlich zu hinterlegender Forderungsbetrag in Euro, ohne erneut hinzugerechnete Zinsen.}
\item{ausschliessungsbeschluss_rechtskraeftig_am}{RechtskraftdatumYYYY-MM-DD als Bezugsdatum der1171I-Kalenderjahresgrenze.}
\item{zinssatz_im_grundbuch_eingetragen}{Wahrheitswert der qualifizierten Zinssatzeintragung1171I2.}
\item{zinsabschnitte}{Liste0..1000 überschneidungsfreier abgeschlossener qualifizierter Zinsabschnitte, je genau erster_zinstag, letzter_zinstag, zinsbetrag (EUR). Abschnitt an der1171-Kalenderjahresgrenze erforderlichenfalls zuvor aufteilen und beide Zinsbeträge korrekt berechnen.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des1171-Falls, Forderung, Eintragung und vollständig zutreffender Zinsabschnittsbeträge. Keine unbekannten Zinsen als0 ausgeben.}
}
\details{Rechtlich qualifizierte Zinsabschnitte nach1171-Kalenderjahresgrenze auswählen und nur bei eingetragenem Zinssatz zum Forderungsbetrag addieren. §1171I: Forderungsbetrag plus erforderliche eingetragene Zinsen, deren Zinszeitraum nicht vor Beginn des vierten Kalenderjahres vor Rechtskraft liegt. Maßgeblich ist Zinszeit, nicht Fälligkeit oder Buchungstag. Abschnittsbeträge nach zutreffendem Satz/Kapital/Zinszeitanteil zuvor berechnen, etwa mit gesetzliche_zinsen; keine pauschale Tageslinearität für beliebig vorgegebene Zinsbeträge. Abschnitt über die Kalenderjahresgrenze muss vorher rechtlich zutreffend geteilt werden. Keine automatische Zinsentstehung, Hinterlegungswirksamkeit oder Erlöschensentscheidung1171II/III. Eingaben sind bereits rechtlich zu hinterlegende abgeschlossene Zinsabschnitte; keine Zukunftszinsen erfinden. Ohne eingetragenen Zinssatz keinen Zinsbetrag zur Hinterlegung addieren. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.fruehester_hinterlegungszinsbeginn als Datum; hinterlegungszinsbetrag und hinterlegungsbetrag als exakte Eurobrüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1171_T0001, BGB_1171_T0002}
\examples{
hypothek_hinterlegung_forderung_und_zinsen(
  forderungsbetrag = "1000",
  ausschliessungsbeschluss_rechtskraeftig_am = "2024-05-15",
  zinssatz_im_grundbuch_eingetragen = TRUE,
  zinsabschnitte = list(
    list(
    "erster_zinstag" = "2019-01-01",
    "letzter_zinstag" = "2019-12-31",
    "zinsbetrag" = "50"
  ),
    list(
    "erster_zinstag" = "2020-01-01",
    "letzter_zinstag" = "2020-12-31",
    "zinsbetrag" = "60"
  ),
    list(
    "erster_zinstag" = "2021-01-01",
    "letzter_zinstag" = "2021-12-31",
    "zinsbetrag" = "70"
  )
  ),
  einordnungsnachweis = paste0(
    "§1171I: Forderungsbetrag plus erforderliche eingetragene Zin",
    "sen, deren Zinszeitraum nicht vor Beginn des vierten Kalende",
    "rjahres vor Rechtskraft liegt. Maßgeblich ist Zinszeit, nich",
    "t Fälligkeit oder Buchungstag. Abschnittsbeträge nach zutref",
    "fendem Satz/Kapital/Zinszeitanteil zuvor berechnen, etwa mit",
    " gesetzliche_zinsen; keine pauschale Tageslinearität für bel",
    "iebig vorgegebene Zinsbeträge. Abschnitt über die Kalenderja",
    "hresgrenze muss vorher rechtlich zutreffend geteilt werden. ",
    "Keine automatische Zinsentstehung, Hinterlegungswirksamkeit ",
    "oder Erlöschensentscheidung1171II/III. Eingaben sind bereits",
    " rechtlich zu hinterlegende abgeschlossene Zinsabschnitte; k",
    "eine Zukunftszinsen erfinden. Ohne eingetragenen Zinssatz ke",
    "inen Zinsbetrag zur Hinterlegung addieren."
  )
)
}
