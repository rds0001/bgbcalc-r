% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{grenzbaum_beseitigungskosten}
\alias{grenzbaum_beseitigungskosten}
\title{grenzbaum beseitigungskosten}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{grenzbaum_beseitigungskosten(
  beseitigungskosten = NULL,
  anderer_nachbar_verzichtet = NULL,
  unersetzliches_grenzzeichen = NULL,
  grenzbaumregel_anwendbar = NULL,
  kostennachweis = NULL
)}
\arguments{
\item{beseitigungskosten}{Nichtnegative rechtlich berücksichtigungsfähige Beseitigungskosten in EUR für den betroffenen Grenzbaum/Grenzstrauch. Keine bereits von einer Seite getragenen Kosten nochmals addieren.}
\item{anderer_nachbar_verzichtet}{Wahrheitswert eines rechtlich wirksamen Verzichts des anderen Nachbarn auf sein Recht am Baum. Dann trägt der die Beseitigung verlangende Nachbar die Kosten allein. Bloß fehlendes Interesse, Schweigen oder Abwesenheit nicht automatisch Verzicht.}
\item{unersetzliches_grenzzeichen}{Wahrheitswert: Baum dient als Grenzzeichen und kann den Umständen nach nicht durch anderes zweckmäßiges Grenzzeichen ersetzt werden. TRUE schließt gesetzlichen Beseitigungsanspruch§923 Absatz2 aus; hier NICHT_ANWENDBAR.}
\item{grenzbaumregel_anwendbar}{Wahrheitswert des einschlägigen gesetzlichen Beseitigungsfalls§923 zwischen zwei Nachbargrundstücken. Auch Grenzstrauch gemäßAbsatz3. Grenzlage, sonstige Beschränkungen und keine vorrangige abweichende Kostenregelung zuvor prüfen; kein beliebiger Baum nahe Grenze.}
\item{kostennachweis}{Nichtleere Beschreibung der Grenzlage, des verlangenden und anderen Nachbarn, etwaigen Rechtsverzichts, Grenzzeichenfunktion und Beseitigungskosten. Freiwillige anderweitige Vereinbarungen separat.}
}
\details{Bei einschlägigem nicht wegen unersetzlichen Grenzzeichens ausgeschlossenen Beseitigungsfall Kosten grundsätzlichhälftig; bei Verzicht des anderen Nachbarn trägt Verlangender alles, anderer0. Kein gesetzlicher Beseitigungsanspruch bei unersetzlichem Grenzzeichen. Sonstige rechtliche/öffentlich-rechtliche Einschränkungen vorher prüfen; freiwillige andere Regelung außerhalb Modell. Eigentumserwerb mit Trennung und Früchteverteilung nicht Teil dieser Kostenoperation. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält kosten_verlangender_nachbar und kosten_anderer_nachbar als exakte EUR-Brüche mit Summe der Gesamtkosten; ausgeschlossener gesetzlicher Fall ergibt NICHT_ANWENDBAR/null. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_923_T0002, BGB_923_T0003, BGB_923_T0004, BGB_923_T0005, BGB_923_T0006}
\examples{
grenzbaum_beseitigungskosten(
  beseitigungskosten = "100.01",
  anderer_nachbar_verzichtet = FALSE,
  unersetzliches_grenzzeichen = FALSE,
  grenzbaumregel_anwendbar = TRUE,
  kostennachweis = paste0(
    "Synthetischer gesetzlicher Grenzbaum-Beseitigungsfall und Ko",
    "sten."
  )
)
}
