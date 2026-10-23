% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{verjaehrung_hoehere_gewalt_festes_ablauffenster}
\alias{verjaehrung_hoehere_gewalt_festes_ablauffenster}
\title{verjaehrung hoehere gewalt festes ablauffenster}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{verjaehrung_hoehere_gewalt_festes_ablauffenster(
  fristlauf_erster_tag = NULL,
  fristende_ohne_diese_hemmung = NULL,
  verhinderungszeitraeume = NULL,
  fenstermodell = NULL,
  monatsendregel = NULL,
  methodennachweis = NULL
)}
\arguments{
\item{fristlauf_erster_tag}{Erster rechtlich maßgeblicher ganzer Fristlauftag.}
\item{fristende_ohne_diese_hemmung}{Endtag der ohne diese206-Hemmung maßgeblichen Frist; sonstige rechtlich relevante Korrekturen bereits überschneidungsfrei berücksichtigt.}
\item{verhinderungszeitraeume}{Liste0..10000 abgeschlossener Intervalle mit erster_verhinderter_tag und letzter_verhinderter_tag. Tatsächliche rechtlich qualifizierte Verhinderungstage, nicht schon zugeschnittene Hemmungssummen.}
\item{fenstermodell}{Ausschließlich fester_ablauf_ohne_206: ausdrücklich rechtlich qualifiziertes festes Sechsmonatsfenster vor dem ohne diese206-Hemmung maßgeblichen Ablauf. Kein stiller Standard oder dynamisches Modell.}
\item{monatsendregel}{nur_taggleiche_monate oder letzter_monatstag gemäß rueckwaertsfrist_kalendergrenze; Monatsend-Ersatzregel ausdrücklich rechtlich begründen.}
\item{methodennachweis}{Nichtleere rechtliche Begründung dieses festen Fenstermodells, der Monatsendregel und vollständig abgeschlossener Verhinderungen. Erstinstanzlicher Beleg allein begründet keine universelle Rechtsregel.}
}
\details{Festes rechtlich ausgewähltes Sechsmonatsfenster aus Ausgangsablauf berechnen, auf tatsächlichen Fristlauf begrenzen und bestehende206/209-Schnittmengenrechnung anwenden. Bedingte vollständige206-Fensterarithmetik für das ausdrücklich gewählte feste Ablaufmodell. Sechs Kalendermonate vom Tagesende der Ausgangsfrist rückwärts, Fensterbeginn ist Grenztagesbeginn, frühestens erster Fristlauftag. Verhinderungsintervalle schneiden, Überschneidungen vereinigen und209-Tage fortschreiben. Kein vom Nutzer vorberechneter Fensterbeginn erforderlich. LGRegensburg18.6.2026,45O1916/24,Rn35–37 stützt im dortigen Fall Begrenzung auf festen Zeitraum bis zum Ablauf ohne206; keine Behauptung höchstrichterlicher oder universeller Freigabe. Keine automatische dynamische Fensterverschiebung; deren ursprüngliche Inventarbezeichnung war eine offene Hypothese, kein belegter gesetzlicher Algorithmus. Hindernisse außerhalb des festen Fensters werden in diesem Modell nicht erfasst. Ein fortdauerndes Hindernis ohne rechtlich feststehendes Ende erlaubt keinen endgültigen Ablauf. Weitere Hemmungen nicht doppelt zählen;210/211,Neubeginn und gegebenenfalls193 anschließend gesondert qualifizieren. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Berechneter erster/letzter Fenstertag, fortgeschriebener letzter Fristtag und berücksichtigte Hemmungstage; nur für ausdrücklich qualifiziertes festes Modell. Einheit: daten_und_tage.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_206_T0001, BGB_209_T0001}
\examples{
verjaehrung_hoehere_gewalt_festes_ablauffenster(
  fristlauf_erster_tag = "2022-01-01",
  fristende_ohne_diese_hemmung = "2024-12-31",
  verhinderungszeitraeume = list(
    list(
    "erster_verhinderter_tag" = "2024-06-25",
    "letzter_verhinderter_tag" = "2024-07-05"
  )
  ),
  fenstermodell = "fester_ablauf_ohne_206",
  monatsendregel = "letzter_monatstag",
  methodennachweis = paste0(
    "Bedingte vollständige206-Fensterarithmetik für das ausdrückl",
    "ich gewählte feste Ablaufmodell. Sechs Kalendermonate vom Ta",
    "gesende der Ausgangsfrist rückwärts, Fensterbeginn ist Grenz",
    "tagesbeginn, frühestens erster Fristlauftag. Verhinderungsin",
    "tervalle schneiden, Überschneidungen vereinigen und209-Tage ",
    "fortschreiben. Kein vom Nutzer vorberechneter Fensterbeginn ",
    "erforderlich. LGRegensburg18.6.2026,45O1916/24,Rn35–37 stütz",
    "t im dortigen Fall Begrenzung auf festen Zeitraum bis zum Ab",
    "lauf ohne206; keine Behauptung höchstrichterlicher oder univ",
    "erseller Freigabe. Keine automatische dynamische Fenstervers",
    "chiebung; deren ursprüngliche Inventarbezeichnung war eine o",
    "ffene Hypothese, kein belegter gesetzlicher Algorithmus. Hin",
    "dernisse außerhalb des festen Fensters werden in diesem Mode",
    "ll nicht erfasst. Ein fortdauerndes Hindernis ohne rechtlich",
    " feststehendes Ende erlaubt keinen endgültigen Ablauf. Weite",
    "re Hemmungen nicht doppelt zählen;210/211,Neubeginn und gege",
    "benenfalls193 anschließend gesondert qualifizieren."
  )
)
}
