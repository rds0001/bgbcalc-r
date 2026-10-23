% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{ersitzung_anrechenbare_zeitkette}
\alias{ersitzung_anrechenbare_zeitkette}
\title{ersitzung anrechenbare zeitkette}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{ersitzung_anrechenbare_zeitkette(
  fristfall = NULL,
  besitzabschnitte = NULL,
  hemmungszeitraeume = NULL,
  unterbrechungszeitraeume = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{fristfall}{bewegliche_sache_937, buchersitzung_900, grundstuecksaufgebot_927 oder drittrecht_945; jeweiliger Lauf rechtlich qualifiziert.}
\item{besitzabschnitte}{Geordnete lückenlose Liste1..1000 rechtlich anrechenbarer Abschnitte einschließlich zugerechneter Vorgänger-/Erbschaftsbesitzerzeit943/944, je genau erster_tag und letzter_tagYYYY-MM-DD. Auf vollständig anzurechnende Kalendertage normalisiert; erster Ereignistag gegebenenfalls zuvor ausschließen. Beginn900 erst bei gleichzeitig qualifizierter Eintragung und Besitz.940II-fortgeltende Zeiten rechtlich zuordnen.}
\item{hemmungszeitraeume}{Unbenannte Liste0..1000 rechtlich wirksamer abgeschlossener Hemmungsintervalle, je erster_tag und letzter_tag. Alle innerhalb belegter Besitzzeit; Überschneidung zulässig und nur einmal gezählt.}
\item{unterbrechungszeitraeume}{Geordnete disjunkte Liste0..100 wirksamer abgeschlossener Unterbrechungsintervalle941/942 beziehungsweise940, je erster_tag und letzter_tag. Vorzeit verfällt; erster neuer anzurechnender Tag nach letztem Unterbrechungstag. Wirkung212II/III zuvor qualifizieren.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des Fristfalls, lückenloser rechtlicher Zeitzurechnung, aller Hemmungen/Unterbrechungen und taggenauer Normalisierung. Kein automatischer Gutglaubens-/Eigentumserwerbsnachweis.}
}
\details{Lückenlose anrechenbare Besitzabschnitte verbinden; wirksame Unterbrechungen verwerfen Vorlauf und starten volle10/30Jahre neu; je Lauf vorhandenen Hemmungskern anwenden. §§939bis944, bei900/927 entsprechend und945 für gesonderten drittrechtbezogenen Lauf: zehn beziehungsweise dreißig Kalenderjahre ab erstem vollständig anrechenbarem Tag, Vorgängerzeiten ohne Doppelzählung verbinden. Alle Besitzabschnitte müssen rechtlich eine lückenlose anrechenbare Kette bilden;940II-Nichtunterbrechung und Nachfolge943/944 vorqualifizieren. Wirksame Unterbrechung verwirft Vorzeit; neuer voller Lauf erst nach Ende der Unterbrechung und belegtem erneuten anrechenbarem Besitz. Unterbrechung nach bereits rechnerisch vollendetem Lauf wird als widersprüchliche Eingabe abgelehnt. Hemmungen werden vom vorhandenen209-Kern je neuem Lauf verarbeitet; vor dessen Beginn liegende Hemmung wirkt nicht nochmals.939II-Hemmung während210/211-Schutz muss als rechtlich bestimmtes Intervall vorliegen, nicht unbesehen als bloßes Maximaldatum. Nur abgeschlossene Intervalle bis zum letzten belegten Besitztag; Ergebnis danach ist rechnerische Prognose unter Fortdauer der Voraussetzungen. Keine automatische Personen-/Rechtsnachfolge, Wirkung gegenüber Dritten, Ausschließungsentscheidung oder Eigentumsfeststellung;900-Registergleichlauf,927-Zustimmungseintragungsgrenze und945-Bösglauben gesondert. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält erster_tag_des_massgeblichen_laufs, rechnerisches_fristende, hemmungstage_im_massgeblichen_lauf und frist_am_letzten_belegten_tag_vollendet; kein Eigentumsurteil. Einheit: daten_und_tage.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_900_T0001, BGB_900_T0002, BGB_900_T0003, BGB_900_T0004, BGB_900_T0005, BGB_927_T0001, BGB_927_T0002, BGB_927_T0003, BGB_927_T0004, BGB_927_T0005, BGB_937_T0001, BGB_937_T0002, BGB_939_T0001, BGB_939_T0002, BGB_939_T0003, BGB_940_T0001, BGB_940_T0002, BGB_941_T0001, BGB_941_T0002, BGB_942_T0001, BGB_943_T0001, BGB_944_T0001, BGB_945_T0001, BGB_945_T0002}
\examples{
ersitzung_anrechenbare_zeitkette(
  fristfall = "bewegliche_sache_937",
  besitzabschnitte = list(
    list(
    "erster_tag" = "2000-01-01",
    "letzter_tag" = "2015-12-31"
  )
  ),
  hemmungszeitraeume = list(
    
  ),
  unterbrechungszeitraeume = list(
    
  ),
  einordnungsnachweis = paste0(
    "§§939bis944, bei900/927 entsprechend und945 für gesonderten ",
    "drittrechtbezogenen Lauf: zehn beziehungsweise dreißig Kalen",
    "derjahre ab erstem vollständig anrechenbarem Tag, Vorgängerz",
    "eiten ohne Doppelzählung verbinden. Alle Besitzabschnitte mü",
    "ssen rechtlich eine lückenlose anrechenbare Kette bilden;940",
    "II-Nichtunterbrechung und Nachfolge943/944 vorqualifizieren.",
    " Wirksame Unterbrechung verwirft Vorzeit; neuer voller Lauf ",
    "erst nach Ende der Unterbrechung und belegtem erneuten anrec",
    "henbarem Besitz. Unterbrechung nach bereits rechnerisch voll",
    "endetem Lauf wird als widersprüchliche Eingabe abgelehnt. He",
    "mmungen werden vom vorhandenen209-Kern je neuem Lauf verarbe",
    "itet; vor dessen Beginn liegende Hemmung wirkt nicht nochmal",
    "s.939II-Hemmung während210/211-Schutz muss als rechtlich bes",
    "timmtes Intervall vorliegen, nicht unbesehen als bloßes Maxi",
    "maldatum. Nur abgeschlossene Intervalle bis zum letzten bele",
    "gten Besitztag; Ergebnis danach ist rechnerische Prognose un",
    "ter Fortdauer der Voraussetzungen. Keine automatische Person",
    "en-/Rechtsnachfolge, Wirkung gegenüber Dritten, Ausschließun",
    "gsentscheidung oder Eigentumsfeststellung;900-Registergleich",
    "lauf,927-Zustimmungseintragungsgrenze und945-Bösglauben geso",
    "ndert."
  )
)
}
