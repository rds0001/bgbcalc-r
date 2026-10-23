% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{bau_nachtrag_ueberzahlungsbetrag}
\alias{bau_nachtrag_ueberzahlungsbetrag}
\title{bau nachtrag ueberzahlungsbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{bau_nachtrag_ueberzahlungsbetrag(
  gezahlte_vorlaeufige_nachtragsverguetung = NULL,
  geschuldete_mehrverguetung = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{gezahlte_vorlaeufige_nachtragsverguetung}{Nichtnegativer exakter rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge oder Bruchobjekt; dieselbe Preis-/Abrechnungsbasis ohne Doppelzählung.}
\item{geschuldete_mehrverguetung}{Nichtnegativer exakter rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge oder Bruchobjekt; dieselbe Preis-/Abrechnungsbasis ohne Doppelzählung.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des gesetzlichen Anordnungs-/Nachtragsfalls, der Zulässigkeit des Berechnungswegs und der qualifizierten Preisbestandteile.}
}
\details{Vorläufig gezahlte Nachtragsvergütung minus endgültig geschuldete Mehrvergütung, mindestens null Nur Zahlungen nach §650c Absatz3 Satz1 und rechtlich feststehende nichtnegative Mehrvergütung nach Absatz1/2. Mehrfachzahlungen nur einmal summieren; echte Vergütungsminderungsfälle gesondert abrechnen. Überzahlungszinsen ab jeweiligem Zahlungseingang nach entsprechend §288 Absatz1 Satz2/Absatz2 ohne Zinseszins (§289 Satz1); vorhandene Zinskerne mit qualifizierter Überzahlungszuordnung und Datumsbasis separat verwenden, nicht pauschal gesamte Bruttozahlung verzinsen. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist ein exakter EUR-Bruch; bei bau_nachtragsverguetung_differenz kann er als Vergütungsminderung negativ sein. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_650c_T0007, BGB_650c_T0008}
\examples{
bau_nachtrag_ueberzahlungsbetrag(
  gezahlte_vorlaeufige_nachtragsverguetung = "800",
  geschuldete_mehrverguetung = "600",
  einordnungsnachweis = paste0(
    "Qualifizierte vorläufige Zahlungen und endgültig geschuldete",
    " Mehrvergütung."
  )
)
}
