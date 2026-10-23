% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{vertrauensschaden_nichtigkeit_anfechtung}
\alias{vertrauensschaden_nichtigkeit_anfechtung}
\title{vertrauensschaden nichtigkeit anfechtung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{vertrauensschaden_nichtigkeit_anfechtung(
  vertrauensschaden = NULL,
  gueltigkeitsinteresse = NULL,
  nichtigkeit_nach_118 = NULL,
  anfechtung_nach_119_120 = NULL,
  grund_bekannt_oder_kennen_muessen = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{vertrauensschaden}{Nichtnegativer kausal durch Vertrauen auf Gültigkeit entstandener Schaden des geschützten Empfängers/Dritten in EUR (negatives Interesse). Rechtlich bestimmt, nicht ungeprüft der gesamte Geschäftswert.}
\item{gueltigkeitsinteresse}{Nichtnegatives rechtlich bewertetes Interesse an Gültigkeit der Erklärung in EUR als Höchstbetrag (positives Interesse). Gleichen Bezugsfall und Bewertungsmaßstab verwenden.}
\item{nichtigkeit_nach_118}{Expliziter Wahrheitswert einer Nichtigkeit gerade nach§118. Andere Nichtigkeitsgründe eröffnen§122 nicht automatisch.}
\item{anfechtung_nach_119_120}{Expliziter Wahrheitswert einer wirksamen Anfechtung gerade aufgrund§119 oder§120. Rechtzeitigkeit, Erklärung, Anfechtungsgrund und Wirksamkeit vorab prüfen;§123 nicht gleichsetzen.}
\item{grund_bekannt_oder_kennen_muessen}{Wahrheitswert, ob der Beschädigte den Grund der Nichtigkeit/Anfechtbarkeit kannte oder infolge Fahrlässigkeit nicht kannte. TRUE schließt Ersatz nach§122 Absatz2 aus.}
\item{bewertungsnachweis}{Nichtleere Beschreibung des gesetzlichen Ausgangsfalls, geschützten Empfängers/Dritten, Kausalität, Kenntnislage und beider Schadens-/Interessenwerte.}
}
\details{Anwendbarkeit durch Nichtigkeit§118 oder Anfechtung§119/§120. Im Anwendungsfall bei Kenntnis/Kennenmüssen0, sonst min(Vertrauensschaden,Gültigkeitsinteresse). Ohne Ausgangsfall NICHT_ANWENDBAR. Keine automatische Haftung für jede Nichtigkeit oder Anfechtung, insbesondere nicht bloß§123. Schadenwerte und geschützter Personenkreis extern bestimmt; mögliche andere Anspruchsgrundlagen nicht ausgeschlossen. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter EUR-Schadenersatz; gesetzlicher Kenntnisausschluss ergibt BERECHNET mit0/1. Fehlender Anwendungsfall ergibt NICHT_ANWENDBAR mit null. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_122_T0001, BGB_122_T0002}
\examples{
vertrauensschaden_nichtigkeit_anfechtung(
  vertrauensschaden = "0",
  gueltigkeitsinteresse = "0",
  nichtigkeit_nach_118 = FALSE,
  anfechtung_nach_119_120 = TRUE,
  grund_bekannt_oder_kennen_muessen = FALSE,
  bewertungsnachweis = paste0(
    "Synthetischer geschützter Empfänger mit kausalem Vertrauenss",
    "chaden."
  )
)
}
