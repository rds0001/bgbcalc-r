% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{grundbuch_rangpaarvergleich}
\alias{grundbuch_rangpaarvergleich}
\title{grundbuch rangpaarvergleich}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{grundbuch_rangpaarvergleich(
  erstes_recht = NULL,
  zweites_recht = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{erstes_recht}{Objekt mit genau recht_id, abteilung (einheitliche nichtleere Kennung), eintragungsposition (positive ganze tatsächliche Reihenfolgenummer innerhalb der Abteilung) und eintragungstagYYYY-MM-DD.}
\item{zweites_recht}{Zweites verschiedenes wirksam eingetragenes Grundstücksrecht mit denselben Feldern; dasselbe belastete Grundstück.}
\item{einordnungsnachweis}{Nichtleerer Nachweis der879I/II-Grundregel, wirksamer Rechte und tatsächlicher Eintragungsdaten/Positionen. Keine eingetragene abweichende Rangbestimmung879III, keine nachträgliche Rangänderung.}
}
\details{Zwei Grundstücksrechte nach abteilungsabhängigem Eintragungsmaßstab paarweise vergleichen. §879I/II: in derselben Grundbuchabteilung tatsächliche Reihenfolge der Eintragungen vergleichen; in verschiedenen Abteilungen angegebenen Eintragungstag vergleichen, bei gleichem Tag Gleichrang. Zeitpunkt einer späteren dinglichen Einigung ersetzt den Eintragungsmaßstab nicht. Position ist wirkliche Reihenfolge, nicht ungeprüft laufende Nummer eines Rechts oder Antragsnummer. Nur Paarvergleich: bei mehreren Rechten keine transitive globale Ranggruppe aus einzelnen Gleichrangvergleichen erfinden. Abweichende eingetragene Rangbestimmung,880Rangänderung,881Vorbehalt,883Vormerkung und Verwertungsbeträge gesondert. Gleiche Position verschiedener Rechte derselben Abteilung wird mangels eindeutig qualifizierter Reihenfolge nicht angenommen. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.rangvergleich:-1 erstes Recht vorrangig,0gleichrangig,+1zweites Recht vorrangig; vergleichsmassstab eintragungsreihenfolge oder eintragungstag. Einheit: rangvergleich.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_879_T0001, BGB_879_T0002, BGB_879_T0003}
\examples{
grundbuch_rangpaarvergleich(
  erstes_recht = list(
    "recht_id" = "A",
    "abteilung" = "II",
    "eintragungsposition" = 1,
    "eintragungstag" = "2024-01-02"
  ),
  zweites_recht = list(
    "recht_id" = "B",
    "abteilung" = "II",
    "eintragungsposition" = 2,
    "eintragungstag" = "2024-01-03"
  ),
  einordnungsnachweis = paste0(
    "§879I/II: in derselben Grundbuchabteilung tatsächliche Reihe",
    "nfolge der Eintragungen vergleichen; in verschiedenen Abteil",
    "ungen angegebenen Eintragungstag vergleichen, bei gleichem T",
    "ag Gleichrang. Zeitpunkt einer späteren dinglichen Einigung ",
    "ersetzt den Eintragungsmaßstab nicht. Position ist wirkliche",
    " Reihenfolge, nicht ungeprüft laufende Nummer eines Rechts o",
    "der Antragsnummer. Nur Paarvergleich: bei mehreren Rechten k",
    "eine transitive globale Ranggruppe aus einzelnen Gleichrangv",
    "ergleichen erfinden. Abweichende eingetragene Rangbestimmung",
    ",880Rangänderung,881Vorbehalt,883Vormerkung und Verwertungsb",
    "eträge gesondert. Gleiche Position verschiedener Rechte ders",
    "elben Abteilung wird mangels eindeutig qualifizierter Reihen",
    "folge nicht angenommen."
  )
)
}
