% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{werkwohnung_kuendigungstermin}
\alias{werkwohnung_kuendigungstermin}
\title{werkwohnung kuendigungstermin}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{werkwohnung_kuendigungstermin(
  fristfall = NULL,
  kuendigungszugang_am = NULL,
  ueberlassungsbeginn_am = NULL,
  qualifizierte_zugangsgrenze_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{fristfall}{ersatzbedarf_576_1_1 oder arbeitsplatznaehe_576_1_2; übrige gesetzliche Voraussetzungen einschließlich beendetem Dienstverhältnis vorqualifiziert.}
\item{kuendigungszugang_am}{Tatsächlicher ZugangYYYY-MM-DD.}
\item{ueberlassungsbeginn_am}{Rechtlich anrechenbarer zusammenhängender Überlassungsbeginn am TagesbeginnYYYY-MM-DD.}
\item{qualifizierte_zugangsgrenze_am}{Rechtlich bestimmter letzter Zugangstag der Dritte-Werktag-Regel im ZugangsmonatYYYY-MM-DD; örtliche Kalenderqualifikation ausdrücklich vorgeben.}
\item{einordnungsnachweis}{Nichtleerer Nachweis von576I-Fall, Überlassungszeitraum, Wirksamkeit/Zugang und einschlägiger Werktagsgrenze.}
}
\details{Werkmietwohnungs-Sonderfrist nach qualifizierter Dritte-Werktag-Grenze und Zehnjahresvergleich zum Monatsendtermin berechnen. §576I: Nummer1 nur bei weniger als zehn Jahren Überlassung am Zugangstag; Nummer2 ohne diese Zehnjahresgrenze. Im qualifizierten Nummer1-Fall dritter Werktag zum Ende des übernächsten Monats, Nummer2 zum Ende des laufenden Monats. Bei Zugang nach Monatsgrenze verschiebt sich der früheste Termin um einen Monat. Zehnjahreszeitraum ab rechtlich qualifiziertem Tagesbeginn; intratägige Sonderfälle oder Unterbrechungen extern. Ist Nummer1 zeitlich ausgeschlossen, bleibt SonderterminNULL; daraus folgt keine generelle Unkündbarkeit und kein automatisch ersatzweise berechneter573c-Termin. Dienstverhältnis muss beendet und Ersatzbedarf/Arbeitsplatzbezug rechtlich festgestellt sein. Keine automatische Kündigungswirksamkeit, Widerspruchsentscheidung oder Feiertagsverschiebung des Mietendes. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.zehnjahreszeitraum_letzter_tag als Datum, weniger_als_zehn_jahre_am_zugang und zugangsgrenze_eingehalten als Wahrheitswerte; rechnerischer_sonderbeendigungstag als Datum oderNULL bei zeitlichem Ausschluss vonNummer1. Einheit: daten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_576_T0001, BGB_576_T0002, BGB_576_T0003}
\examples{
werkwohnung_kuendigungstermin(
  fristfall = "ersatzbedarf_576_1_1",
  kuendigungszugang_am = "2024-01-04",
  ueberlassungsbeginn_am = "2020-07-01",
  qualifizierte_zugangsgrenze_am = "2024-01-04",
  einordnungsnachweis = paste0(
    "§576I: Nummer1 nur bei weniger als zehn Jahren Überlassung a",
    "m Zugangstag; Nummer2 ohne diese Zehnjahresgrenze. Im qualif",
    "izierten Nummer1-Fall dritter Werktag zum Ende des übernächs",
    "ten Monats, Nummer2 zum Ende des laufenden Monats. Bei Zugan",
    "g nach Monatsgrenze verschiebt sich der früheste Termin um e",
    "inen Monat. Zehnjahreszeitraum ab rechtlich qualifiziertem T",
    "agesbeginn; intratägige Sonderfälle oder Unterbrechungen ext",
    "ern. Ist Nummer1 zeitlich ausgeschlossen, bleibt Sondertermi",
    "nNULL; daraus folgt keine generelle Unkündbarkeit und kein a",
    "utomatisch ersatzweise berechneter573c-Termin. Dienstverhält",
    "nis muss beendet und Ersatzbedarf/Arbeitsplatzbezug rechtlic",
    "h festgestellt sein. Keine automatische Kündigungswirksamkei",
    "t, Widerspruchsentscheidung oder Feiertagsverschiebung des M",
    "ietendes."
  )
)
}
