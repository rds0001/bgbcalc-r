% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{bau_nachtrag_vorlaeufiger_abschlagsansatz}
\alias{bau_nachtrag_vorlaeufiger_abschlagsansatz}
\title{bau nachtrag vorlaeufiger abschlagsansatz}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{bau_nachtrag_vorlaeufiger_abschlagsansatz(
  angebotene_mehrverguetung = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{angebotene_mehrverguetung}{Nichtnegativer exakter rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge oder Bruchobjekt; dieselbe Preis-/Abrechnungsbasis ohne Doppelzählung.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des gesetzlichen Anordnungs-/Nachtragsfalls, der Zulässigkeit des Berechnungswegs und der qualifizierten Preisbestandteile.}
}
\details{Qualifizierte angebotene Mehrvergütung mit vier Fünfteln multiplizieren Nur gewählter zulässiger80\%-Weg nach §650c Absatz3 Satz1; fehlende Einigung und gerichtliche Entscheidung rechtlich qualifizieren. Ergebnis ist der anzusetzende Nachtragsanteil, nicht automatisch eine fällige Gesamtabschlagszahlung. Bereits gezahlte Abschläge und §632a-Einbehalt sowie §650m-Grenzen separat anwenden. Keine80\%-Kürzung der endgültigen geschuldeten Vergütung. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist ein exakter EUR-Bruch; bei bau_nachtragsverguetung_differenz kann er als Vergütungsminderung negativ sein. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_650c_T0005}
\examples{
bau_nachtrag_vorlaeufiger_abschlagsansatz(
  angebotene_mehrverguetung = "1000",
  einordnungsnachweis = "Qualifizierter zulässiger und gewählter80-Prozent-Weg."
)
}
