% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{darlehensvermittlung_auslagenobergrenze}
\alias{darlehensvermittlung_auslagenobergrenze}
\title{darlehensvermittlung auslagenobergrenze}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{darlehensvermittlung_auslagenobergrenze(
  entstandene_erforderliche_auslagen = NULL,
  vorab_mitgeteilter_hoechstbetrag = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{entstandene_erforderliche_auslagen}{Nichtnegativer exakter qualifizierter Dezimalwert/Bruch; Beträge in EUR, vertragliche Wertbeteiligung/Zinsen als Quote (0.05=5Prozent).}
\item{vorab_mitgeteilter_hoechstbetrag}{Nichtnegativer exakter qualifizierter Dezimalwert/Bruch; Beträge in EUR, vertragliche Wertbeteiligung/Zinsen als Quote (0.05=5Prozent).}
\item{einordnungsnachweis}{Nichtleerer Nachweis des jeweiligen Darlehens-/Vermittlungs-/Teilzahlungsfalls und rechtlich qualifizierter Wert-, Kosten- oder Zinsgrundlage.}
}
\details{Qualifiziert vereinbarte entstandene erforderliche Vermittlerauslagen auf vorab mitgeteilten Höchstbetrag begrenzen Nur §655d Satz2/3: wirksame Vereinbarung über tatsächlich entstandene erforderliche Auslagen vorausgesetzt; nicht Maklervergütung oder Beratungsentgelt. Mitgeteilte Höhe/Höchstgrenze rechtlich bestimmen; bei getrennten Einzelkategorien jede passende Grenze separat anwenden, kein Austausch ungenutzter Grenzen ohne Rechtsgrundlage. Keine automatische Erforderlichkeits- oder Anspruchsprüfung. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist der exakt berechnete EUR-Betrag als Bruchobjekt. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_655d_T0002, BGB_655d_T0003}
\examples{
darlehensvermittlung_auslagenobergrenze(
  entstandene_erforderliche_auslagen = "120",
  vorab_mitgeteilter_hoechstbetrag = "100",
  einordnungsnachweis = paste0(
    "Wirksame Auslagenvereinbarung und vorab mitgeteilte Kostengr",
    "enze."
  )
)
}
