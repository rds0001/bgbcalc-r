% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{anerkennung_fuenfjahresfrist_mit_hemmung}
\alias{anerkennung_fuenfjahresfrist_mit_hemmung}
\title{anerkennung fuenfjahresfrist mit hemmung}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{anerkennung_fuenfjahresfrist_mit_hemmung(
  fristausloesung_am = NULL,
  ruecknahmezeitraeume = NULL,
  aufschiebende_wirkung_zeitraeume = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{fristausloesung_am}{Qualifizierte Registereintragung oder gesetzlich gleichgestellte Beurkundung1598II als EreignistagYYYY-MM-DD.}
\item{ruecknahmezeitraeume}{Liste höchstens1000 abgeschlossener, auf eingeschlossene Kalendertage normalisierter rechtlich wirksamer Rücknahme-Hemmungsintervalle mit genau erster_tag und letzter_tag.}
\item{aufschiebende_wirkung_zeitraeume}{Liste höchstens1000 abgeschlossener, auf eingeschlossene Kalendertage normalisierter Intervalle gerichtlich angeordneter aufschiebender Wirkung80V VwGO mit genau erster_tag und letzter_tag. Leere Liste bedeutet festgestellt keine.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des1598II-Fristbeginns, Rücknahme mit unrichtig gewordener Eintragung und der vollständigen qualifizierten Hemmungs-/Ausnahmeintervalle.}
}
\details{Fünfjahresfrist berechnen; gerichtlich angeordnete aufschiebende Wirkungszeiten aus Rücknahmehemmung ausschneiden und verbleibende Hemmungstage vereinigt berücksichtigen. §1598II: Fünfjahresgrundlauf ab qualifiziertem Register-/Beurkundungsereignis. Von den abgeschlossenen qualifizierten Rücknahmeintervallen die Intervalle angeordneter aufschiebender Wirkung abziehen; verbleibende Tage vereinigen und nicht mitzählen. Bloße Rechtsbehelfseinlegung ist keine automatische aufschiebende Wirkung. Alle Intervalle müssen rechtlich taggenau normalisiert sein; offene oder unbekannte Enden nicht durch erfundene Daten ersetzen. Eine nach bereits abgeschlossenem Fristlauf eintretende Rücknahme setzt keine neue Frist in Gang. Keine automatische Anerkennungswirksamkeit, Ausländerbehördenentscheidung oder Feiertagsverschiebung. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.grundfrist_letzter_tag und rechnerischer_letzter_tag alsYYYY-MM-DD; beruecksichtigte_hemmungstage als ganze Zahl. Einheit: daten_und_tage.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1598_T0003, BGB_1598_T0004, BGB_1598_T0005, BGB_1598_T0006, BGB_1598_T0007, BGB_1598_T0008}
\examples{
anerkennung_fuenfjahresfrist_mit_hemmung(
  fristausloesung_am = "2020-01-01",
  ruecknahmezeitraeume = list(
    list(
    "erster_tag" = "2021-03-01",
    "letzter_tag" = "2021-03-31"
  )
  ),
  aufschiebende_wirkung_zeitraeume = list(
    
  ),
  einordnungsnachweis = paste0(
    "§1598II: Fünfjahresgrundlauf ab qualifiziertem Register-/Beu",
    "rkundungsereignis. Von den abgeschlossenen qualifizierten Rü",
    "cknahmeintervallen die Intervalle angeordneter aufschiebende",
    "r Wirkung abziehen; verbleibende Tage vereinigen und nicht m",
    "itzählen. Bloße Rechtsbehelfseinlegung ist keine automatisch",
    "e aufschiebende Wirkung. Alle Intervalle müssen rechtlich ta",
    "ggenau normalisiert sein; offene oder unbekannte Enden nicht",
    " durch erfundene Daten ersetzen. Eine nach bereits abgeschlo",
    "ssenem Fristlauf eintretende Rücknahme setzt keine neue Fris",
    "t in Gang. Keine automatische Anerkennungswirksamkeit, Auslä",
    "nderbehördenentscheidung oder Feiertagsverschiebung."
  )
)
}
