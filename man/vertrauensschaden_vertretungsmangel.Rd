% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{vertrauensschaden_vertretungsmangel}
\alias{vertrauensschaden_vertretungsmangel}
\title{vertrauensschaden vertretungsmangel}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{vertrauensschaden_vertretungsmangel(
  vertrauensschaden = NULL,
  wirksamkeitsinteresse = NULL,
  vertretungsmangel_unbekannt = NULL,
  vertretungsmacht_nachgewiesen = NULL,
  genehmigung_verweigert = NULL,
  gegner_kennt_oder_kennen_muss = NULL,
  vertreter_beschraenkt_geschaeftsfaehig = NULL,
  mit_zustimmung_des_gesetzlichen_vertreters = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{vertrauensschaden}{Nichtnegativer kausaler Schaden in EUR durch Vertrauen des anderen Teils auf Vertretungsmacht (negatives Interesse). Kein pauschaler Prozentsatz.}
\item{wirksamkeitsinteresse}{Nichtnegatives rechtlich bewertetes Interesse an Wirksamkeit des Vertrags in EUR als Höchstbetrag des§179 Absatz2.}
\item{vertretungsmangel_unbekannt}{Wahrheitswert, ob der Vertreter den Mangel seiner Vertretungsmacht nicht kannte. FALSE führt aus dem begrenzten Absatz2-Modell; umfassendere Folgen nach Absatz1 separat prüfen.}
\item{vertretungsmacht_nachgewiesen}{Wahrheitswert, ob Vertretungsmacht im konkreten Fall nachgewiesen ist. TRUE führt aus dem hier berechneten Haftungsfall heraus; keine automatische Beweiswürdigung.}
\item{genehmigung_verweigert}{Wahrheitswert einer rechtlich maßgeblichen Verweigerung der Vertragsgenehmigung durch den Vertretenen. Bloßes Schweigen ohne rechtlich einschlägige Verweigerungsfolge nicht ungeprüft gleichsetzen.}
\item{gegner_kennt_oder_kennen_muss}{Wahrheitswert, ob der andere Teil den Mangel der Vertretungsmacht kannte oder kennen musste. Im Anwendungsfall Ausschluss nach§179 Absatz3 Satz1.}
\item{vertreter_beschraenkt_geschaeftsfaehig}{Wahrheitswert zur beschränkten Geschäftsfähigkeit des Handelnden im konkreten Fall. Nicht automatisch mit bloßer Minderjährigkeit gleichsetzen; Ausnahmen/Ermächtigungen rechtlich einordnen.}
\item{mit_zustimmung_des_gesetzlichen_vertreters}{Wahrheitswert der Zustimmung des gesetzlichen Vertreters zum Handeln des beschränkt geschäftsfähigen Vertreters. Nur bei beschränkter Geschäftsfähigkeit für Ausschlussausnahme maßgeblich.}
\item{bewertungsnachweis}{Nichtleere Beschreibung von Vertragsschluss als Vertreter, Vertretungsmangel/Kenntnis, Genehmigung, Gegnerkenntnis, Geschäftsfähigkeit/Zustimmung und den beiden Geldwerten.}
}
\details{Absatz2-Modell bei unbekanntem Vertretungsmangel, nicht nachgewiesener Vertretungsmacht und verweigerter Genehmigung. Im Anwendungsfall0 bei Gegnerkenntnis/Kennenmüssen oder beschränkter Geschäftsfähigkeit ohne Zustimmung; sonst min(Vertrauensschaden,Wirksamkeitsinteresse). Keine Haftungsfreiheit aus NICHT_ANWENDBAR ableiten, insbesondere bei bekanntem Vertretungsmangel. Erfüllungs-/Schadenersatzwahl nach Absatz1 außerhalb des Modells. Geschäftsunfähigkeit oder andere Wirksamkeits-/Sonderfälle vorab gesondert prüfen. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter EUR-Betrag des begrenzten Vertrauensschadens. Ausschluss nach Absatz3 innerhalb dieses Modells ergibt0/1; fehlender Absatz2-Anwendungsfall null. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_179_T0001, BGB_179_T0002, BGB_179_T0003, BGB_179_T0004}
\examples{
vertrauensschaden_vertretungsmangel(
  vertrauensschaden = "800",
  wirksamkeitsinteresse = "500",
  vertretungsmangel_unbekannt = TRUE,
  vertretungsmacht_nachgewiesen = FALSE,
  genehmigung_verweigert = TRUE,
  gegner_kennt_oder_kennen_muss = FALSE,
  vertreter_beschraenkt_geschaeftsfaehig = FALSE,
  mit_zustimmung_des_gesetzlichen_vertreters = FALSE,
  bewertungsnachweis = paste0(
    "Synthetischer Vertretervertrag; Tatsachen und Interessenwert",
    "e geprüft."
  )
)
}
