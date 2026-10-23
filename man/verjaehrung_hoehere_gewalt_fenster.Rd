% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{verjaehrung_hoehere_gewalt_fenster}
\alias{verjaehrung_hoehere_gewalt_fenster}
\title{verjaehrung hoehere gewalt fenster}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{verjaehrung_hoehere_gewalt_fenster(
  fristlauf_erster_tag = NULL,
  grundfrist_letzter_tag = NULL,
  fenster_erster_tag = NULL,
  fenster_letzter_tag = NULL,
  verhinderungszeitraeume = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{fristlauf_erster_tag}{Erster rechtlich zum Fristlauf gehörender TagYYYY-MM-DD.}
\item{grundfrist_letzter_tag}{Letzter Tag der ohne diese206-Hemmung maßgeblichen FristYYYY-MM-DD; andere Hemmungen nicht doppelt berücksichtigen.}
\item{fenster_erster_tag}{Erster einschließlich maßgeblicher Tag des rechtlich bestimmten206-Sechsmonatsfensters; bei kürzerem Fristlauf gegebenenfalls kürzeres Fenster.}
\item{fenster_letzter_tag}{Letzter einschließlich maßgeblicher Tag des rechtlich bestimmten Fensters. Lage/Grenzen vollständig vorqualifizieren; höchstens sechs zusammenhängende Kalendermonate.}
\item{verhinderungszeitraeume}{Unbenannte Liste0..10000 abgeschlossener Intervalle, je genau erster_verhinderter_tag und letzter_verhinderter_tagYYYY-MM-DD; rechtlich als höhere Gewalt und Verfolgungshindernis qualifiziert.}
\item{einordnungsnachweis}{Nichtleerer Nachweis von206-Anwendbarkeit, rechtlich bestimmter Fensterlage und eingeschlossenen Tagen. Keine automatische Auswahl zwischen Auslegungen eines festen oder fortgeschriebenen Fensters.}
}
\details{Qualifiziertes206-Fenster mit Verhinderungsintervallen schneiden und vorhandenen209-Hemmungskern auf die Schnittintervalle anwenden. §206 mit209: nur Schnittmenge rechtlich qualifizierter Verfolgungshindernisse mit einem ausdrücklich vorgegebenen vollständigen Sechsmonatsfenster; vorhandener209-Kern vereinigt Überschneidungen und rechnet Hemmungstage heraus. Das Fenster wird weder eigenständig rückwärts aus dem Enddatum ermittelt noch dynamisch verschoben. Seine richtige rechtliche Lage und die Anwendbarkeit eines einzelnen abgeschlossenen Fensters sind Voraussetzungen dieser Funktion. Bei ungeklärten, fortdauernden oder mehrfach zu korrigierenden Fensterlagen keine abschließende Verjährung behaupten. Kein allgemeiner Nachlauf von sechs Monaten nach Wegfall des Hindernisses. Höhere Gewalt, Zumutbarkeit und Kausalität sind Rechts-/Tatsachenbewertungen. Alle Grenzen einschließlich, keine untertägige Rundung und keine doppelte Erfassung bereits berücksichtigter Hemmungen. Ablaufhemmung und Neubeginn getrennt. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.rechnerischer_letzter_tag und wert.beruecksichtigte_hemmungstage; nur unter Voraussetzung des rechtlich zutreffenden vollständig bestimmten Eingabefensters. Einheit: datum_und_tage.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_206_T0001, BGB_209_T0001}
\examples{
verjaehrung_hoehere_gewalt_fenster(
  fristlauf_erster_tag = "2024-01-01",
  grundfrist_letzter_tag = "2024-12-31",
  fenster_erster_tag = "2024-07-01",
  fenster_letzter_tag = "2024-12-31",
  verhinderungszeitraeume = list(
    list(
    "erster_verhinderter_tag" = "2024-06-20",
    "letzter_verhinderter_tag" = "2024-07-10"
  )
  ),
  einordnungsnachweis = paste0(
    "§206 mit209: nur Schnittmenge rechtlich qualifizierter Verfo",
    "lgungshindernisse mit einem ausdrücklich vorgegebenen vollst",
    "ändigen Sechsmonatsfenster; vorhandener209-Kern vereinigt Üb",
    "erschneidungen und rechnet Hemmungstage heraus. Das Fenster ",
    "wird weder eigenständig rückwärts aus dem Enddatum ermittelt",
    " noch dynamisch verschoben. Seine richtige rechtliche Lage u",
    "nd die Anwendbarkeit eines einzelnen abgeschlossenen Fenster",
    "s sind Voraussetzungen dieser Funktion. Bei ungeklärten, for",
    "tdauernden oder mehrfach zu korrigierenden Fensterlagen kein",
    "e abschließende Verjährung behaupten. Kein allgemeiner Nachl",
    "auf von sechs Monaten nach Wegfall des Hindernisses. Höhere ",
    "Gewalt, Zumutbarkeit und Kausalität sind Rechts-/Tatsachenbe",
    "wertungen. Alle Grenzen einschließlich, keine untertägige Ru",
    "ndung und keine doppelte Erfassung bereits berücksichtigter ",
    "Hemmungen. Ablaufhemmung und Neubeginn getrennt."
  )
)
}
