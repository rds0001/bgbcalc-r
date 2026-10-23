% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{bau_nachtragsverguetung_differenz}
\alias{bau_nachtragsverguetung_differenz}
\title{bau nachtragsverguetung differenz}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{bau_nachtragsverguetung_differenz(
  erforderliche_mehrkosten = NULL,
  angemessene_zuschlaege_mehrkosten = NULL,
  entfallende_kosten = NULL,
  entfallende_zuschlaege = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{erforderliche_mehrkosten}{Nichtnegativer exakter rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge oder Bruchobjekt; dieselbe Preis-/Abrechnungsbasis ohne Doppelzählung.}
\item{angemessene_zuschlaege_mehrkosten}{Nichtnegativer exakter rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge oder Bruchobjekt; dieselbe Preis-/Abrechnungsbasis ohne Doppelzählung.}
\item{entfallende_kosten}{Nichtnegativer exakter rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge oder Bruchobjekt; dieselbe Preis-/Abrechnungsbasis ohne Doppelzählung.}
\item{entfallende_zuschlaege}{Nichtnegativer exakter rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge oder Bruchobjekt; dieselbe Preis-/Abrechnungsbasis ohne Doppelzählung.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des gesetzlichen Anordnungs-/Nachtragsfalls, der Zulässigkeit des Berechnungswegs und der qualifizierten Preisbestandteile.}
}
\details{Tatsächlich erforderliche Mehrkosten und angemessene Zuschläge addieren; entfallende Kosten und zugehörige entfallende Zuschläge abziehen Nur qualifizierte Anordnung nach §650b Absatz2 und Berechnung nach §650c Absatz1; positiver Wert bedeutet Mehrvergütung, negativer Wert Vergütungsminderung. Die vier nichtnegativen Kostenkomponenten müssen in derselben Preisbasis ohne Doppelzählung vorliegen; Zuschläge für Geschäftskosten, Wagnis und Gewinn sind qualifizierte Geldbeträge, keine erfundenen Prozentsätze. Nach §650c Absatz1 Satz2 ausgeschlossener vermehrter Planungsaufwand darf nicht enthalten sein. Urkalkulationsmethode nach Absatz2, Fälligkeit und Abschlagsberechnung gesondert. Nichtnegative Komponenten; vorzeichenbehaftete exakte Vergütungsdifferenz. Gemeinsame sichere Zahlengrenzen gelten für Zwischenwerte.}
\value{wert ist ein exakter EUR-Bruch; bei bau_nachtragsverguetung_differenz kann er als Vergütungsminderung negativ sein. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_650c_T0001}
\examples{
bau_nachtragsverguetung_differenz(
  erforderliche_mehrkosten = "1000",
  angemessene_zuschlaege_mehrkosten = "100",
  entfallende_kosten = "200",
  entfallende_zuschlaege = "20",
  einordnungsnachweis = paste0(
    "Qualifizierte Anordnung und tatsächlich erforderliche Kosten",
    " samt Zuschlägen ohne ausgeschlossene Planung."
  )
)
}
