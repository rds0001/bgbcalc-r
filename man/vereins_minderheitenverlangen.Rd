% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{vereins_minderheitenverlangen}
\alias{vereins_minderheitenverlangen}
\title{vereins minderheitenverlangen}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{vereins_minderheitenverlangen(
  mitgliederzahl = NULL,
  verlangende_mitglieder = NULL,
  satzungsquote = NULL,
  verlangen_schriftlich_begruendet = NULL,
  bestandsnachweis = NULL
)}
\arguments{
\item{mitgliederzahl}{Positive ganze Zahl bis2^53-1 sämtlicher rechtlich maßgeblicher Vereinsmitglieder. Die Satzungsquote bezieht sich auf Mitglieder, nicht bloß auf anwesende oder stimmberechtigt abstimmende Personen einer bestimmten Versammlung.}
\item{verlangende_mitglieder}{Ganze Zahl0..mitgliederzahl der Mitglieder, die das gleiche konkrete Einberufungsverlangen unterstützen.}
\item{satzungsquote}{Optional: wirksamer satzungsmäßig bestimmter Mitgliederanteil als exakte Dezimalzeichenfolge oder Bruchobjekt, größer0 bis einschließlich1. None/NULL bedeutet keine abweichende Quote und wählt1/10. Keine automatische rechtliche Billigung einer eingegebenen Satzungsquote. Allgemeine Numerikgrenze2^53-1 gilt auch für exakte Zwischenzähler.}
\item{verlangen_schriftlich_begruendet}{Expliziter Wahrheitswert: Verlangen schriftlich unter Angabe des Zweckes und der Gründe, wie§37 Absatz1 verlangt. Bloßes Erreichen einer Unterschriftenzahl erfüllt die Form-/Inhaltsvoraussetzung nicht automatisch.}
\item{bestandsnachweis}{Nichtleere Beschreibung des vollständigen Mitgliederbestands, des verlangenden Kreises und gegebenenfalls rechtlich wirksamer Satzungsquote.}
}
\details{Quote aus wirksamer Satzung oder1/10. Mindestzahl=ceil(Mitgliederzahl×Quote); nur ganze Mitglieder zählen. Zusätzlich schriftliches Verlangen mit Zweck und Gründen. Keine automatische Zulässigkeit beliebiger Satzungsquote. Gerichtliche Ermächtigung§37 Absatz2 und weitere Verfahrensschritte nicht enthalten. Keine Abrundung bei Bruchteilen. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält massgebliche_quote als Bruch, mindestens_verlangende als ganze Zahl sowie minderheitenschwelle_erreicht und verlangen_nach_diesen_voraussetzungen_ausreichend. Einheit: mitgliederquote_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_37_T0001}
\examples{
vereins_minderheitenverlangen(
  mitgliederzahl = 1,
  verlangende_mitglieder = 0,
  satzungsquote = NULL,
  verlangen_schriftlich_begruendet = TRUE,
  bestandsnachweis = paste0(
    "Synthetischer vollständiger Mitgliederbestand und wirksame S",
    "atzungslage."
  )
)
}
