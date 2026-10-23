% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{gesamthypothekenvermaechtnis_befriedigungsbetrag}
\alias{gesamthypothekenvermaechtnis_befriedigungsbetrag}
\title{gesamthypothekenvermaechtnis befriedigungsbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{gesamthypothekenvermaechtnis_befriedigungsbetrag(
  schuldbetrag = NULL,
  grundstuecke = NULL,
  vermachtes_grundstueck_id = NULL,
  schuld_nach_2166_qualifiziert = NULL,
  zweifelsregel_anwendbar = NULL,
  hoechstbetragshypothek = NULL,
  alle_mithaftenden_grundstuecke_im_nachlass = NULL,
  drittberichtigung_nach_2166_absatz_2 = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{schuldbetrag}{Nichtnegative volle betrachtete Hypothekenschuld in EUR. Nicht vorab um Drittberichtigung kürzen; Fälle§2166 Absatz2 sind hier ausdrücklich außerhalb Modell.}
\item{grundstuecke}{Liste2..1000 aller mit derselben Hypothek haftenden Grundstücke. Genau grundstueck_id (nichtleer eindeutig), grundstueckswert und vorrangige_belastungen (nichtnegative EUR). Werte gemäß§2166 Absatz1 Satz2 bei Eigentumsübergang, bei verschiedenen Übergangszeitpunkten Vergleichsbasis rechtlich bestimmen. Nur im Rang vorgehende Belastungen abziehen, nicht betrachtete Gesamthypothek.}
\item{vermachtes_grundstueck_id}{ID des vermachten Grundstücks aus vollständiger Liste; nur dessen interne Befriedigungspflicht wird berechnet.}
\item{schuld_nach_2166_qualifiziert}{Expliziter Wahrheitswert: eigene Schuld des Erblassers oder Schuld, zu deren Berichtigung er dem Schuldner verpflichtet war, Nachlassgrundstücksvermächtnis und sonstige Grundvoraussetzungen§2166 qualifiziert.}
\item{zweifelsregel_anwendbar}{Expliziter Wahrheitswert der einschlägigen Zweifelsregel ohne abweichenden Erblasserwillen.}
\item{hoechstbetragshypothek}{Expliziter Wahrheitswert zur Hypothek§1190; TRUE schließt Anwendung aus.}
\item{alle_mithaftenden_grundstuecke_im_nachlass}{Expliziter Wahrheitswert, dass sämtliche mithaftenden Grundstücke zur Erbschaft gehören und vollständig aufgeführt sind. FALSE ergibt NICHT_ANWENDBAR.}
\item{drittberichtigung_nach_2166_absatz_2}{Expliziter Wahrheitswert des Drittberichtigungsfalls§2166 Absatz2. TRUE ergibt NICHT_ANWENDBAR; Verteilungs-/Drittleistungsreihenfolge wird hier nicht erfunden.}
\item{bewertungsnachweis}{Nichtleere Herkunft und rechtliche Einordnung von Schuldbetrag, sämtlichen Grundstückswerten, Stichtag, Ranglasten und Anwendungsbereich.}
}
\details{Je Grundstück positive Wertdeckung nach rangvorrangigen Lasten berechnen. Vermachten bereinigten Wert durch bereinigten Gesamtwert teilen; volle Schuld proportional verteilen und zusätzlich auf eigene Wertdeckung begrenzen. Bei Gesamtdeckung0 Befriedigung0 ohne fingierte0/0-Quote. Keine Drittberichtigung§2166II; kein Nichtnachlassgrundstück, keine Höchstbetragshypothek oder Gesamtgrund-/Rentenschuld. Nur interne Verpflichtung gegenüber Erben, keine Begrenzung dinglicher Gläubigerrechte. Keine erfundene Bewertungs-/Fälligkeitsregel. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält bereinigte_grundstueckswerte, bereinigter_gesamtwert, verteilungsquote, anteilige_schuld, befriedigungsbetrag. Bei Gesamtdeckung0 sind Quote und anteilige Schuld NULL, Befriedigungsbetrag0. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2167_T0001, BGB_2167_T0002, BGB_2166_T0001, BGB_2166_T0002, BGB_2166_T0004}
\examples{
gesamthypothekenvermaechtnis_befriedigungsbetrag(
  schuldbetrag = "0",
  grundstuecke = list(
    list(
    "grundstueck_id" = "A",
    "grundstueckswert" = "100",
    "vorrangige_belastungen" = "40"
  ),
    list(
    "grundstueck_id" = "B",
    "grundstueckswert" = "200",
    "vorrangige_belastungen" = "80"
  )
  ),
  vermachtes_grundstueck_id = "A",
  schuld_nach_2166_qualifiziert = TRUE,
  zweifelsregel_anwendbar = TRUE,
  hoechstbetragshypothek = FALSE,
  alle_mithaftenden_grundstuecke_im_nachlass = TRUE,
  drittberichtigung_nach_2166_absatz_2 = FALSE,
  bewertungsnachweis = paste0(
    "Synthetisch qualifizierte Gesamthypothek auf vollständigem N",
    "achlassgrundstückskreis, Vergleichswerte und Ranglasten bei ",
    "Eigentumsübergang."
  )
)
}
