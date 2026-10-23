% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pauschalreise_ereignisentschaedigung_anrechnen}
\alias{pauschalreise_ereignisentschaedigung_anrechnen}
\title{pauschalreise ereignisentschaedigung anrechnen}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{pauschalreise_ereignisentschaedigung_anrechnen(
  anspruch_vor_anrechnung = NULL,
  bereits_erhaltene_ereignisentschaedigung = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{anspruch_vor_anrechnung}{Nichtnegativer exakter EUR-Anspruch vor Anrechnung.}
\item{bereits_erhaltene_ereignisentschaedigung}{Nichtnegative tatsächlich erhaltene und rechtlich anrechenbare Entschädigung für dasselbe Ereignis; noch nicht anderswo angerechnet.}
\item{einordnungsnachweis}{Nichtleerer Nachweis einer konkreten Anrechnungsrichtung nach §651pIII; identisches Ereignis und rechtlich anrechenbare Leistung bestimmt.}
}
\details{Bereits erhaltene anrechenbare Ereignisentschädigung vom Anspruch abziehen, mindestens null. §651pIII in einer ausdrücklich vorqualifizierten Anrechnungsrichtung. Externe Verordnungen/Übereinkünfte liefern den bewerteten Anspruch und die anrechenbare bereits erhaltene Zahlung; deren Berechnung wird hier nicht erfunden. Mehrere Anspruchspositionen vorab überschneidungsfrei zuordnen; dieselbe Entschädigung nicht mehrfach abziehen. Überschießende Entschädigung begründet hier keinen Rückzahlungsanspruch. Nichtnegative Eingangswerte, exakter nichtnegativer EUR-Bruch im sicheren gemeinsamen Zahlenbereich.}
\value{wert ist der exakte EUR-Bruch. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_651p_T0005, BGB_651p_T0006, BGB_651p_T0007, BGB_651p_T0008, BGB_651p_T0009, BGB_651p_T0010, BGB_651p_T0011}
\examples{
pauschalreise_ereignisentschaedigung_anrechnen(
  anspruch_vor_anrechnung = "100",
  bereits_erhaltene_ereignisentschaedigung = "40",
  einordnungsnachweis = paste0(
    "§651pIII in einer ausdrücklich vorqualifizierten Anrechnungs",
    "richtung. Externe Verordnungen/Übereinkünfte liefern den bew",
    "erteten Anspruch und die anrechenbare bereits erhaltene Zahl",
    "ung; deren Berechnung wird hier nicht erfunden. Mehrere Ansp",
    "ruchspositionen vorab überschneidungsfrei zuordnen; dieselbe",
    " Entschädigung nicht mehrfach abziehen. Überschießende Entsc",
    "hädigung begründet hier keinen Rückzahlungsanspruch."
  )
)
}
