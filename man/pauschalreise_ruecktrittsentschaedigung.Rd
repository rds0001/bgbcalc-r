% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pauschalreise_ruecktrittsentschaedigung}
\alias{pauschalreise_ruecktrittsentschaedigung}
\title{pauschalreise ruecktrittsentschaedigung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{pauschalreise_ruecktrittsentschaedigung(
  reisepreis = NULL,
  ersparte_aufwendungen = NULL,
  anderweitiger_erwerb = NULL,
  entschaedigungspauschale_vereinbart = NULL,
  ausschluss_aussergewoehnliche_umstaende = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{reisepreis}{Nichtnegativer vereinbarter Reisepreis in EUR für die zurückgetretene Pauschalreise.}
\item{ersparte_aufwendungen}{Nichtnegativer Wert der durch den Rücktritt ersparten Aufwendungen des Veranstalters in EUR. Für konkrete Differenzrechnung tatsächliche rechtlich anrechenbare Ersparnis vorgeben, keine frei gewählte Pauschalquote.}
\item{anderweitiger_erwerb}{Nichtnegativer Erwerb durch anderweitige Verwendung der Reiseleistungen in EUR, rechtlich dem Fall zugeordnet. Nicht nochmals in ersparte_aufwendungen berücksichtigen.}
\item{entschaedigungspauschale_vereinbart}{Wahrheitswert, ob eine für den Fall wirksam maßgebliche Entschädigungspauschale vereinbart ist. TRUE führt ohne vorrangigen Ausschluss zu NICHT_ANWENDBAR, weil diese Funktion keine Pauschalen berechnet oder auf Angemessenheit prüft.}
\item{ausschluss_aussergewoehnliche_umstaende}{Expliziter Wahrheitswert zum vollständigen Ausschluss nach§651h Absatz3: unvermeidbare außergewöhnliche Umstände am Bestimmungsort oder in unmittelbarer Nähe, erhebliche Beeinträchtigung der Reise oder Beförderung. Bloße Sorge oder ein beliebiges Ereignis genügt nicht; rechtliche Definition nach Satz2 mitprüfen. TRUE ergibt0 auch bei Pauschalvereinbarung.}
\item{bewertungsnachweis}{Nichtleere Beschreibung des wirksamen Reisendenrücktritts vor Reisebeginn, Ersparnis, anderweitigen Erwerbs, Pauschalstatus und gegebenenfalls Ausschlusstatbestands.}
}
\details{Vorrangiger Ausschluss§651h Absatz3 führt zu0. Ohne Ausschluss und ohne maßgebliche Pauschalvereinbarung: Entschädigung=max(Reisepreis minus ersparte Aufwendungen minus anderweitigen Erwerb,0). Sonst NICHT_ANWENDBAR. Nur Rücktritt des Reisenden vor Reisebeginn und konkrete Differenzrechnung. Keine Stornostaffel oder Quote erfinden; Entschädigungspauschale, Rücktritt des Veranstalters sowie Rückerstattungs-/Leistungsfristen getrennt. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakte EUR-Entschädigung. Ausschluss bedeutet BERECHNET mit0/1. Pauschalweg ohne Ausschluss bedeutet NICHT_ANWENDBAR und null. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_651h_T0001, BGB_651h_T0002, BGB_651h_T0003, BGB_651h_T0004, BGB_651h_T0005, BGB_651h_T0006, BGB_651h_T0007, BGB_651h_T0008, BGB_651h_T0009, BGB_651h_T0010, BGB_651h_T0011}
\examples{
pauschalreise_ruecktrittsentschaedigung(
  reisepreis = "1000",
  ersparte_aufwendungen = "0",
  anderweitiger_erwerb = "0",
  entschaedigungspauschale_vereinbart = FALSE,
  ausschluss_aussergewoehnliche_umstaende = FALSE,
  bewertungsnachweis = paste0(
    "Synthetischer Reisendenrücktritt vor Beginn; konkrete Erspar",
    "nis und Erwerb."
  )
)
}
