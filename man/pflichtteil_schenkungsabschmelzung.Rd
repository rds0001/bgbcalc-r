% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pflichtteil_schenkungsabschmelzung}
\alias{pflichtteil_schenkungsabschmelzung}
\title{pflichtteil schenkungsabschmelzung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{pflichtteil_schenkungsabschmelzung(
  schenkungswert = NULL,
  leistung_am = NULL,
  erbfall_am = NULL,
  fristanlauf_durch_leistung = NULL,
  ehegattenschenkung = NULL,
  eheaufloesung_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{schenkungswert}{Nichtnegativer rechtlich bestimmter Schenkungswert in EUR nach Bewertung§2325 Absatz2, vor zeitlicher Abschmelzung. Pflicht-/Anstandsschenkungen nach§2330 zuvor ausschließen; Ergebnis NICHT_ANWENDBAR nicht als Zahl weiterreichen.}
\item{leistung_am}{ISO-Datum0001..9999 des rechtlich maßgeblichen Leistungsereignisses, nicht automatisch Datum des Schenkungsvertrags. Bei späterer maßgeblicher Aufgabe vorbehaltener Rechte zutreffenden Ereignistag wählen. Nicht nach Erbfall.}
\item{erbfall_am}{ISO-Datum0001..9999 des Erbfalls. Ereignisjahre werden mit dem vorhandenen Kalenderkern nach§§187/188 gerechnet; letzter Tag eines vollen Jahres zählt bis Tagesschluss, nächster Abschlag ab Folgetag.}
\item{fristanlauf_durch_leistung}{Wahrheitswert, ob die Leistung die Frist nach§2325 Absatz3 rechtlich überhaupt in Lauf setzen kann. Vorbehaltene Nutzung/Herrschaft, Sonderfälle und tatsächliche Leistung prüfen; FALSE bedeutet noch kein laufender Abschmelzungszeitraum, nicht Wegfall der Schenkung.}
\item{ehegattenschenkung}{Wahrheitswert, ob Schenkung an den Ehegatten mit Aufschub nach§2325 Absatz3 Satz3 vorliegt. Maßgebliche rechtliche Ehegattenstellung prüfen; nicht bloß Zusammenleben oder heutiger Familienstand.}
\item{eheaufloesung_am}{ISO-Datum der rechtlich maßgeblichen Eheauflösung, nicht bloßer Trennungstag. Bei Ehegattenschenkung und None/NULL wird noch kein Eheauflösungsereignis vor/bei Erbfall angesetzt, daher keine Abschmelzung. Auflösung durch Erbfall kann mit erbfall_am angegeben werden. Angabe auch sonst validiert; darf nicht nach Erbfall liegen. Bei gegebenem Ereignis späteren Tag aus Leistung/Eheauflösung wählen.}
\item{einordnungsnachweis}{Nichtleere Beschreibung von fristauslösender Leistung, vorbehaltenen Rechten, Ehegattenstellung/-auflösung, Erbfall und bereits rechtlich bestimmtem Schenkungswert.}
}
\details{Fristanlauf nur bei rechtlich geeigneter Leistung; bei Ehegattenschenkung frühestens Eheauflösung. Für jedes voll bis Tagesschluss abgelaufene Ereignisjahr ein Zehntel weniger, höchstens zehn Jahre. Faktor=(10-min(voll abgelaufene Jahre,10))/10; Betrag×Faktor. Keine automatisch rechtliche Leistungs-/Nießbrauchbeurteilung. Keine Abschmelzung vor wirksamem Fristanlauf beziehungsweise vor Eheauflösung. Ereignisjahr und keine§193-Verschiebung. Bewertung, Ausnahme§2330, Pflichtteilsquote, negative Nachlasswerte und weitere Anrechnungen getrennt. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält fristbeginnereignis_am (null bei noch nicht begonnenem Fristlauf), voll_abgelaufene_jahre_bis_zehn (0..10), beruecksichtigungsfaktor und beruecksichtigter_schenkungswert als exakte Brüche. Faktor0 ab voll abgelaufenem Zehnjahreszeitraum; noch nicht begonnener Fristlauf Faktor1. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2325_T0004, BGB_2325_T0005, BGB_2325_T0006, BGB_187_T0001, BGB_187_T0002, BGB_187_T0003, BGB_187_T0004, BGB_188_T0001, BGB_188_T0002, BGB_188_T0003, BGB_188_T0004}
\examples{
pflichtteil_schenkungsabschmelzung(
  schenkungswert = "1000",
  leistung_am = "2000-06-15",
  erbfall_am = "2001-06-14",
  fristanlauf_durch_leistung = TRUE,
  ehegattenschenkung = FALSE,
  eheaufloesung_am = NULL,
  einordnungsnachweis = paste0(
    "Synthetisch rechtlich festgestellte Leistung ohne zurückbeha",
    "ltene Nutzung."
  )
)
}
