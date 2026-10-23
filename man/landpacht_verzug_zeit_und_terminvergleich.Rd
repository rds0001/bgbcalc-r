% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{landpacht_verzug_zeit_und_terminvergleich}
\alias{landpacht_verzug_zeit_und_terminvergleich}
\title{landpacht verzug zeit und terminvergleich}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{landpacht_verzug_zeit_und_terminvergleich(
  verzugsbeginn_am = NULL,
  beginnart = NULL,
  prueftag = NULL,
  rueckstaendige_terminnummern = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{verzugsbeginn_am}{Rechtlich qualifizierter Beginn des fortdauernden erheblichen PachtverzugsYYYY-MM-DD, nicht ungeprüft gleich Fälligkeit.}
\item{beginnart}{ereignis oder tagesbeginn nach rechtlicher Qualifikation des Beginns der Verzugslaufzeit.}
\item{prueftag}{KalendertagYYYY-MM-DD für Vergleich mit abgelaufener Dreimonatszeit.}
\item{rueckstaendige_terminnummern}{Liste0..1000 positiver eindeutiger ganzer Nummern aus dem vollständigen chronologisch fortlaufend nummerierten Pachtzahlungskalender. Jede genannte Rate rechtlich in Verzug mit Pacht oder nicht unerheblichem Teil; ausgelassene Nummern sind nicht qualifiziert rückständig.}
\item{einordnungsnachweis}{Nichtleerer Nachweis594eII, kontinuierlichem maßgeblichem Verzug, Zeitnormalisierung und vollständiger Terminfolge. Einordnung Zahlungsabschnitte kürzer als ein Jahr und übrige Kündigungsvoraussetzungen extern.}
}
\details{Dreimonats-Verzugslaufzeit streng vergleichen und aufeinanderfolgende qualifiziert rückständige Pachtzahlungstermine zählen. §594eII: Ende einer qualifizierten Dreimonats-Verzugslaufzeit und strenges Überschreiten am Prüftag berechnen; daneben längste lückenlos aufeinanderfolgende Folge qualifiziert rückständiger Zahlungstermine zählen und mit2vergleichen. Keine erfundene Euro-/Prozentgrenze für nicht unerheblichen Teil. Beide numerischen Teilprüfungen getrennt ausgegeben; rechtliche Fallzuordnung nach Zahlungsabschnitt sowie deren Zusammenspiel und Kündigung nicht automatisch entschieden. Terminnummern müssen dem vollständigen Kalender entsprechen, keine nachträgliche Neunummerierung nur rückständiger Raten. Kein künstlicher Neustart/Stillstand des Verzugs bei unbekannten Zahlungsvorgängen; Fristbeginn und kontinuierlicher Verlauf vorqualifiziert. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.dreimonatszeitraum_letzter_tag als Datum, laenger_als_drei_monate als Wahrheitswert, laengste_rueckstandsfolge als ganze Zahl, mindestens_zwei_aufeinanderfolgende_termine als Wahrheitswert. Einheit: datum_anzahl_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_594e_T0002, BGB_594e_T0003}
\examples{
landpacht_verzug_zeit_und_terminvergleich(
  verzugsbeginn_am = "2024-01-01",
  beginnart = "tagesbeginn",
  prueftag = "2024-04-01",
  rueckstaendige_terminnummern = list(
    1,
    2
  ),
  einordnungsnachweis = paste0(
    "§594eII: Ende einer qualifizierten Dreimonats-Verzugslaufzei",
    "t und strenges Überschreiten am Prüftag berechnen; daneben l",
    "ängste lückenlos aufeinanderfolgende Folge qualifiziert rück",
    "ständiger Zahlungstermine zählen und mit2vergleichen. Keine ",
    "erfundene Euro-/Prozentgrenze für nicht unerheblichen Teil. ",
    "Beide numerischen Teilprüfungen getrennt ausgegeben; rechtli",
    "che Fallzuordnung nach Zahlungsabschnitt sowie deren Zusamme",
    "nspiel und Kündigung nicht automatisch entschieden. Terminnu",
    "mmern müssen dem vollständigen Kalender entsprechen, keine n",
    "achträgliche Neunummerierung nur rückständiger Raten. Kein k",
    "ünstlicher Neustart/Stillstand des Verzugs bei unbekannten Z",
    "ahlungsvorgängen; Fristbeginn und kontinuierlicher Verlauf v",
    "orqualifiziert."
  )
)
}
