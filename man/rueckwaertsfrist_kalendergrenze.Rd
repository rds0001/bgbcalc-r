% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{rueckwaertsfrist_kalendergrenze}
\alias{rueckwaertsfrist_kalendergrenze}
\title{rueckwaertsfrist kalendergrenze}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{rueckwaertsfrist_kalendergrenze(
  bezugstag = NULL,
  anzahl = NULL,
  einheit = NULL,
  bezugsart = NULL,
  monatsendregel = NULL,
  methodennachweis = NULL
)}
\arguments{
\item{bezugstag}{ISO-Kalendertag des rechtlich maßgeblichen rückwärts betrachteten Ereignisses oder Tagesendes.}
\item{anzahl}{Positive ganze Zahl der zurückzurechnenden Einheiten, höchstens3652059.}
\item{einheit}{tage,wochen,monate oder jahre; keine Umrechnung von Monaten in30Tage.}
\item{bezugsart}{ereignistag: Bezugstag rückwärts nicht mitzählen, Grenze am Beginn des namens-/zahlgleichen zurückliegenden Tages. tagesende: Bezug am Ende des Bezugstags, rückwärts mitzählen, Grenze am Beginn des Folgetags des zurückliegenden Vergleichstags.}
\item{monatsendregel}{nur_taggleiche_monate: fehlende Tageszahl im Zielmonat wird als nicht freigegebener Fall zurückgewiesen. letzter_monatstag: ausdrücklich rechtlich qualifizierte analoge188III-Monatsendregel anwenden. Keine stillschweigende Auswahl.}
\item{methodennachweis}{Nichtleere Begründung der für die konkrete Norm einschlägigen Rückwärtsanalogie, Bezugsart und gegebenenfalls Monatsendregel. Keine pauschale Anwendung auf sämtliche BGB-Vorläufe.}
}
\details{Qualifizierten Kalenderabstand rückwärts mit bestehenden Datumshelfern berechnen; Grenztagesbeginn und vorausgehenden vollen Tag ausweisen. Bedingter Kalenderkern zur ausdrücklich qualifizierten Rückwärtsanalogie187/188. Ereignistag: zurückliegender gleichbenannter/gleichzahliger Tag beginnt die Grenze; letzter voller vorausgehender Handlungstag ist dessen Vortag. Tagesende: rückwärts mitgezählter Bezugstag, Grenze am Folgetagesbeginn des zurückliegenden Vergleichstags; letzter voller Handlungstag ist Vergleichstag. Für reine Zeitfenster ist die Grenztagesbeginn-Ausgabe zu verwenden, nicht ungeprüft der letzte Handlungstag. Untertägige Zeitpunkte und rechtliche Einschließung einer einzelnen Grenzhandlung gesondert bestimmen. Monatsende nur auf ausdrückliche Methodenvorgabe; nur_taggleiche_monate verhindert eine ungesicherte Ersatzregel. Kein193-Automatismus: Verfahrenszwecke können unterschiedliche Werktagskorrekturen verlangen. Keine Inversion durch Suche nach einem beliebigen vorwärts passenden Datum. Standardkalender und bestehende Datumshelfer, unveränderte Vorwärtsfunktionen. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{grenztag_beginn und letzter_voller_tag_vor_grenze als ISO-Daten; rechtliche Verwendung nach gewähltem Normzweck. Einheit: daten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_187_T0001, BGB_187_T0002, BGB_187_T0003, BGB_188_T0001, BGB_188_T0002, BGB_188_T0003}
\examples{
rueckwaertsfrist_kalendergrenze(
  bezugstag = "2025-12-13",
  anzahl = 33,
  einheit = "monate",
  bezugsart = "tagesende",
  monatsendregel = "nur_taggleiche_monate",
  methodennachweis = paste0(
    "Bedingter Kalenderkern zur ausdrücklich qualifizierten Rückw",
    "ärtsanalogie187/188. Ereignistag: zurückliegender gleichbena",
    "nnter/gleichzahliger Tag beginnt die Grenze; letzter voller ",
    "vorausgehender Handlungstag ist dessen Vortag. Tagesende: rü",
    "ckwärts mitgezählter Bezugstag, Grenze am Folgetagesbeginn d",
    "es zurückliegenden Vergleichstags; letzter voller Handlungst",
    "ag ist Vergleichstag. Für reine Zeitfenster ist die Grenztag",
    "esbeginn-Ausgabe zu verwenden, nicht ungeprüft der letzte Ha",
    "ndlungstag. Untertägige Zeitpunkte und rechtliche Einschließ",
    "ung einer einzelnen Grenzhandlung gesondert bestimmen. Monat",
    "sende nur auf ausdrückliche Methodenvorgabe; nur_taggleiche_",
    "monate verhindert eine ungesicherte Ersatzregel. Kein193-Aut",
    "omatismus: Verfahrenszwecke können unterschiedliche Werktags",
    "korrekturen verlangen. Keine Inversion durch Suche nach eine",
    "m beliebigen vorwärts passenden Datum. Standardkalender und ",
    "bestehende Datumshelfer, unveränderte Vorwärtsfunktionen."
  )
)
}
