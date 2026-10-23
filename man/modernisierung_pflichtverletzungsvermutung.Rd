% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{modernisierung_pflichtverletzungsvermutung}
\alias{modernisierung_pflichtverletzungsvermutung}
\title{modernisierung pflichtverletzungsvermutung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{modernisierung_pflichtverletzungsvermutung(
  monatliche_miete = NULL,
  angekuendigte_monatliche_erhoehung = NULL,
  ankuendigung_nach_555c_absatz_1 = NULL,
  beginnverzoegerung_nummer_1 = NULL,
  belastungen_nummer_3 = NULL,
  arbeitsruhe_nummer_4 = NULL,
  objektiver_grund_dargelegt = NULL,
  tatbestandsnachweis = NULL
)}
\arguments{
\item{monatliche_miete}{Positive bisherige monatliche Vergleichsmiete in EUR als exakte Zahl. Rechtlich zutreffende und konsistente Mietbestandteile vorgeben; keine automatische Wahl zwischen Netto- und Bruttomiete. Nullmiete ist außerhalb dieses Verhältnisvergleichs.}
\item{angekuendigte_monatliche_erhoehung}{Nichtnegativer, in der Ankündigung ausgewiesener monatlicher Erhöhungsbetrag in EUR, nicht die neue Gesamtmiete. Der Anstieg muss mindestens die bisherige monatliche Vergleichsmiete erreichen.}
\item{ankuendigung_nach_555c_absatz_1}{Wahrheitswert, ob der eingegebene Erhöhungsbetrag in einer Ankündigung nach §555c Absatz1 angegeben wurde.}
\item{beginnverzoegerung_nummer_1}{Explizit rechtlich geprüfter Wahrheitswert zu §559d Nummer1: kein Beginn innerhalb zwölf Monaten nach angekündigtem Beginn, ersatzweise nach Zugang bei fehlender Beginnangabe. Frist und tatsächlicher Beginn hier nicht berechnet. Zeitliche Teilprüfung über modernisierung_beginnverzoegerung verfügbar; dessen Ergebnis nach rechtlicher Einordnung verwenden.}
\item{belastungen_nummer_3}{Explizit bewerteter Wahrheitswert: Art der Durchführung geeignet, erhebliche objektiv nicht notwendige Belastungen des Mieters herbeizuführen. Keine automatische Belastungsbewertung.}
\item{arbeitsruhe_nummer_4}{Explizit rechtlich geprüfter Wahrheitswert, ob Arbeiten nach Beginn mehr als zwölf Monate ruhen. Genau zwölf Monate reichen nicht; Zeitrechnung hier nicht implementiert. Zeitliche Teilprüfung über modernisierung_arbeitsruhe verfügbar; dessen Ergebnis nach rechtlicher Einordnung verwenden.}
\item{objektiver_grund_dargelegt}{Wahrheitswert zum dargelegten nachvollziehbaren objektiven Grund im Einzelfall. TRUE nur, wenn der Grund das jeweils vermutungsbegründende Verhalten abdeckt; bei mehreren Tatbeständen müssen sämtliche noch tragenden Verhaltensweisen erfasst sein. Bloße Behauptung genügt nicht automatisch.}
\item{tatbestandsnachweis}{Nichtleere Beschreibung der Herkunft der Mietbeträge und der rechtlichen Bewertung der eingegebenen Tatbestände und des objektiven Grundes.}
}
\details{Nummer2: angekündigte Monatserhöhung mindestens bisherige Monatsmiete und Ankündigung nach §555c Absatz1. Mindestens einer der vier Tatbestände begründet die Vermutung, sofern kein abdeckender nachvollziehbarer objektiver Grund dargelegt ist. Nur widerlegbare Vermutung nach§559d, kein endgültiges Urteil und keine Schadenersatzberechnung. Zeitwerte Nummer1/4 können aus den separaten Funktionen modernisierung_beginnverzoegerung und modernisierung_arbeitsruhe stammen; Bewertung Nummer3 bleibt rechtliche Eingabe. Diese Verknüpfungsfunktion selbst berechnet die Zeiträume nicht. Anwendungs-/Übergangsverweise§578 Absatz3 undArt229§49BGBEG vorab prüfen. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält verdoppelung_nummer_2, vermutungstatbestand_erfuellt, pflichtverletzung_wird_vermutet als Wahrheitswerte. Status BERECHNET bestätigt nur die Prüfung, auch bei FALSE. Einheit: wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_559d_T0001, BGB_559d_T0002, BGB_559d_T0003, BGB_559d_T0004, BGB_559d_T0005, BGB_559d_T0006, BGB_559d_T0007}
\examples{
modernisierung_pflichtverletzungsvermutung(
  monatliche_miete = "800",
  angekuendigte_monatliche_erhoehung = "799.99",
  ankuendigung_nach_555c_absatz_1 = FALSE,
  beginnverzoegerung_nummer_1 = FALSE,
  belastungen_nummer_3 = FALSE,
  arbeitsruhe_nummer_4 = FALSE,
  objektiver_grund_dargelegt = FALSE,
  tatbestandsnachweis = paste0(
    "Synthetische geprüfte Tatbestände; ein Grund deckt alle gelt",
    "end gemachten Tatbestände ab."
  )
)
}
