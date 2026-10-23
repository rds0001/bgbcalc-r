% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{modernisierung_vereinfachter_foerderfreier_betrag}
\alias{modernisierung_vereinfachter_foerderfreier_betrag}
\title{modernisierung vereinfachter foerderfreier betrag}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{modernisierung_vereinfachter_foerderfreier_betrag(
  geltend_gemachte_kosten = NULL,
  frueher_geltend_gemachte_kosten = NULL,
  wohnflaeche = NULL,
  monatliche_miete_je_quadratmeter = NULL,
  bisherige_monatliche_erhoehung_gesamt = NULL,
  bisherige_monatliche_heizungserhoehung = NULL,
  erhoehungsart = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{geltend_gemachte_kosten}{Nach559c geltend gemachte Kosten der Wohnung vor30\%-Pauschale in Euro; gültige verbleibende10000EUR-Grenze muss eingehalten sein.}
\item{frueher_geltend_gemachte_kosten}{Nach559cII in den letzten fünf Jahren maßgeblich geltend gemachte Kosten in Euro, rechtlich zeitlich korrekt zusammengestellt.}
\item{wohnflaeche}{Positive qualifizierte Wohnfläche in Quadratmetern.}
\item{monatliche_miete_je_quadratmeter}{Für559IIIa maßgebliche monatliche Ausgangsmiete je Quadratmeter in Euro.}
\item{bisherige_monatliche_erhoehung_gesamt}{Für Sechsjahreskappung qualifizierte bisherige monatliche Erhöhungen insgesamt in Euro.}
\item{bisherige_monatliche_heizungserhoehung}{Darin enthaltene qualifizierte bisherige monatliche Heizungserhöhungen in Euro.}
\item{erhoehungsart}{allgemein oder heizung_559; kein geförderter559e-Fall.}
\item{einordnungsnachweis}{Nichtleerer Nachweis gültig gewähltem559c-Verfahren, Modernisierungsvoraussetzungen, Kostengrenze, Kappungsgrößen und fehlenden abzuziehenden Kostenbeiträgen/laufenden Zuschüssen nach559a. Keine offenen Förderabzüge.}
}
\details{Förderfreie559c-Kostenbasis mit8\%-Jahresumlage und einschlägiger monatlicher Restkappung kombinieren. §559cI/II mit559I/IIIa: qualifizierte Kosten minus30\%Erhaltungspauschale;8\%jährliche Umlage, durch12zumMonat, anschließend einschlägige Restkappung. Nur förderfreier Grundfall ohne abzuziehende559a-Beiträge/laufende Zuschüsse; dadurch keine ungeklärte Reihenfolge laufender Förderabzüge gegenüber Kappung. Keine zusätzliche tatsächliche Erhaltungskostenkürzung neben30\%Pauschale. Heizungsfall559 zusätzlich50Cent je Quadratmeter;559e nicht hier. Schonzeit, Auskunft/Erklärung559b, Sperre559cIV und gegebenenfalls verbleibende Härteprüfung559cI3 separat. Überschrittene Kostengrenze ist ungültige Eingabe für diesen vorqualifizierten vereinfachten Ablauf, keine automatische Umstellung auf Regelverfahren. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält erhaltungspauschale,kostenbasis,jaehrlicher_betrag_vor_kappung,monatlicher_betrag_vor_kappung,monatliche_restkappung,monatlicher_betrag_nach_kappung,jaehrlicher_betrag_nach_kappung als exakte Eurobrüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_559c_T0001, BGB_559c_T0002, BGB_559c_T0003, BGB_559c_T0004, BGB_559_T0001, BGB_559_T0002, BGB_559_T0006, BGB_559_T0007, BGB_559_T0008}
\examples{
modernisierung_vereinfachter_foerderfreier_betrag(
  geltend_gemachte_kosten = "10000",
  frueher_geltend_gemachte_kosten = "0",
  wohnflaeche = "50",
  monatliche_miete_je_quadratmeter = "10",
  bisherige_monatliche_erhoehung_gesamt = "0",
  bisherige_monatliche_heizungserhoehung = "0",
  erhoehungsart = "allgemein",
  einordnungsnachweis = paste0(
    "§559cI/II mit559I/IIIa: qualifizierte Kosten minus30\%Erhaltu",
    "ngspauschale;8\%jährliche Umlage, durch12zumMonat, anschließe",
    "nd einschlägige Restkappung. Nur förderfreier Grundfall ohne",
    " abzuziehende559a-Beiträge/laufende Zuschüsse; dadurch keine",
    " ungeklärte Reihenfolge laufender Förderabzüge gegenüber Kap",
    "pung. Keine zusätzliche tatsächliche Erhaltungskostenkürzung",
    " neben30\%Pauschale. Heizungsfall559 zusätzlich50Cent je Quad",
    "ratmeter;559e nicht hier. Schonzeit, Auskunft/Erklärung559b,",
    " Sperre559cIV und gegebenenfalls verbleibende Härteprüfung55",
    "9cI3 separat. Überschrittene Kostengrenze ist ungültige Eing",
    "abe für diesen vorqualifizierten vereinfachten Ablauf, keine",
    " automatische Umstellung auf Regelverfahren."
  )
)
}
