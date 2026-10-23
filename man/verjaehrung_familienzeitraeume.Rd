% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{verjaehrung_familienzeitraeume}
\alias{verjaehrung_familienzeitraeume}
\title{verjaehrung familienzeitraeume}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{verjaehrung_familienzeitraeume(
  fristlauf_erster_tag = NULL,
  grundfrist_letzter_tag = NULL,
  beziehungsart = NULL,
  beziehungszeitraeume = NULL,
  geburtsdatum_kind = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{fristlauf_erster_tag}{Erster eingeschlossener Kalendertag des rechtlich qualifizierten Verjährungslaufs.}
\item{grundfrist_letzter_tag}{Letzter Kalendertag ohne hier zu berechnende Hemmungen, nicht vor erstem Fristtag.}
\item{beziehungsart}{ehegatten; lebenspartner; kind_eltern; kind_partner_elternteil; vormund_muendel; betreuer_betreuter; pfleger_pflegling; kind_gegen_beistand.}
\item{beziehungszeitraeume}{Liste0..10000 abgeschlossener rechtlich qualifizierter Beziehungen. Je genau erster_beziehungstag und letzter_beziehungstag als eingeschlossene ISO-Tagesgrenzen. Überschneidungen zulässig, werden einmal gezählt.}
\item{geburtsdatum_kind}{Pflichtdatum nur bei kind_eltern/kind_partner_elternteil; sonstNULL. Geburt nicht nach erstem Fristlauftag und kein Beziehungsbeginn vor Geburt.}
\item{einordnungsnachweis}{Nichtleerer Nachweis der Beziehung, Anspruchsrichtung und taggenau normalisierten tatsächlichen Zeitgrenzen.}
}
\details{Kindbeziehungsintervalle am letzten Tag vor21 beschneiden; bestehender209-Kern vereinigt Intervalle und verschiebt den Fristablauf um tatsächlich relevante Hemmungstage. Nur abgeschlossene Zeiträume. Keine Stichtagsfortschreibung als fiktives Ende; kein Aufleben bereits abgelaufener Fristen.208, andere Hemmungen, Ablaufhemmung, Neubeginn und193 separat. ISO-Daten und Resultate0001..9999; abgeschlossene Beziehungsintervalle; Kindgeburt mit darstellbarer21-Jahresgrenze.}
\value{wert enthält rechnerischer_letzter_tag und beruecksichtigte_hemmungstage. Einheit: datum_und_tage.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_207_T0001, BGB_207_T0002, BGB_207_T0003, BGB_207_T0004, BGB_207_T0005, BGB_207_T0006, BGB_207_T0007, BGB_207_T0008, BGB_207_T0009, BGB_207_T0010, BGB_207_T0011}
\examples{
verjaehrung_familienzeitraeume(
  fristlauf_erster_tag = "2030-01-01",
  grundfrist_letzter_tag = "2030-01-10",
  beziehungsart = "kind_eltern",
  beziehungszeitraeume = list(
    list(
    "erster_beziehungstag" = "2030-01-01",
    "letzter_beziehungstag" = "2030-01-20"
  )
  ),
  geburtsdatum_kind = "2009-01-10",
  einordnungsnachweis = paste0(
    "Abgeschlossene qualifizierte Beziehung, letzte eingeschlosse",
    "ne Hemmungstage taggenau normalisiert."
  )
)
}
