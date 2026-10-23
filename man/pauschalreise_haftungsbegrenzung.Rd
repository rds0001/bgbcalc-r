% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pauschalreise_haftungsbegrenzung}
\alias{pauschalreise_haftungsbegrenzung}
\title{pauschalreise haftungsbegrenzung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{pauschalreise_haftungsbegrenzung(
  reisepreis = NULL,
  ersatzfaehiger_schaden = NULL,
  haftungsbeschraenkung_vereinbart = NULL,
  koerperschaden = NULL,
  schuldhaft_herbeigefuehrt = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{reisepreis}{Nichtnegativer rechtlich maßgeblicher Reisepreis in EUR als Basis der Dreifachgrenze.}
\item{ersatzfaehiger_schaden}{Nichtnegative bereits dem Grunde und der Höhe nach bestimmte Schadenersatzposition in EUR vor dieser Haftungsbegrenzung. Keine bloß behauptete Schadenssumme; gemischte Körper-/Vermögenspositionen separat prüfen.}
\item{haftungsbeschraenkung_vereinbart}{Wahrheitswert einer im Übrigen wirksamen Vereinbarung, die Haftung nach§651p Absatz1 auf den dreifachen Reisepreis zu begrenzen. Keine automatische gesetzliche Begrenzung ohne Vereinbarung. Körper-/Verschuldensvoraussetzungen werden zusätzlich hier verknüpft.}
\item{koerperschaden}{Wahrheitswert, ob die konkrete Position ein Körperschaden ist. TRUE verhindert die Begrenzung nach Absatz1.}
\item{schuldhaft_herbeigefuehrt}{Wahrheitswert zur rechtlich zurechenbaren schuldhaften Herbeiführung des konkreten Schadens im Sinne§651p Absatz1 Nummer2. TRUE verhindert die Dreifachgrenze; Zurechnung und Verschuldensmaßstab extern prüfen.}
\item{bewertungsnachweis}{Nichtleere Beschreibung von ersatzfähigem Schaden, Vereinbarung, Schadensart und Verschuldenseinordnung. Andere Haftungsvoraussetzungen nicht durch diesen Nachweis automatisch bestätigt.}
}
\details{Bei Vereinbarung UND keinem Körperschaden UND keiner schuldhaften Herbeiführung: min(ersatzfähiger Schaden,3×Reisepreis). Sonst wird dieser Begrenzungstatbestand nicht angewandt und der vorgegebene Schaden ausgegeben. Absatz1 allein. Internationale Beschränkungen nach Absatz2 und wechselseitige Anrechnung nach Absatz3 nicht enthalten. Ungekürzter Betrag ist kein neu festgestellter Haftungsanspruch. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter EUR-Betrag nach Prüfung der Dreifachgrenze, immer BERECHNET bei gültigen Eingaben. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_651p_T0001, BGB_651p_T0002, BGB_651p_T0003}
\examples{
pauschalreise_haftungsbegrenzung(
  reisepreis = "1000",
  ersatzfaehiger_schaden = "2999.99",
  haftungsbeschraenkung_vereinbart = FALSE,
  koerperschaden = FALSE,
  schuldhaft_herbeigefuehrt = FALSE,
  bewertungsnachweis = paste0(
    "Synthetische ersatzfähige Position und vereinbarte Haftungsg",
    "renze."
  )
)
}
