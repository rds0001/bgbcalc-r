% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{ueberlassung_ersatzverjaehrungsgrundfrist}
\alias{ueberlassung_ersatzverjaehrungsgrundfrist}
\title{ueberlassung ersatzverjaehrungsgrundfrist}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{ueberlassung_ersatzverjaehrungsgrundfrist(
  anspruchsfall = NULL,
  ereignis_am = NULL,
  rueckgabeanspruch_fristende = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{anspruchsfall}{Genau einer der Fälle: miete_vermieter: §548 Absatz1: tatsächlicher rechtlich maßgeblicher Rückerhalt der Mietsache; Ersatz wegen Veränderung/Verschlechterung.; miete_mieter: §548 Absatz2: Beendigung des Mietverhältnisses; Verwendungsersatz/Wegnahmegestattung.; landpacht_verpaechter: §591b: rechtlich maßgeblicher Rückerhalt der Pachtsache; Ersatz wegen Veränderung/Verschlechterung.; landpacht_paechter: §591b: Beendigung des Landpachtverhältnisses; Verwendungsersatz/Wegnahmegestattung.; leihe_verleiher: §606 mit§548: rechtlich maßgeblicher Rückerhalt der Leihsache; Ersatz wegen Veränderung/Verschlechterung.; leihe_entleiher: §606 mit§548: Beendigung der Leihe; Verwendungsersatz/Wegnahmegestattung.; niessbrauch_eigentuemer: §1057 mit§548: rechtlich maßgeblicher Rückerhalt der Sache; Eigentümerersatz wegen Veränderung/Verschlechterung.; niessbrauch_berechtigter: §1057 mit§548: rechtlich maßgebliche Beendigung des Nießbrauchs; Verwendungsersatz/Wegnahmegestattung.; pfand_verpfaender: §1226 mit§548: rechtlich maßgeblicher Rückerhalt des Pfandes; Verpfänderersatz wegen Veränderung/Verschlechterung.; pfand_pfandglaeubiger: §1226 mit§548: rechtlich maßgebliche Beendigung des Pfandrechtsverhältnisses; Verwendungsersatz/Wegnahmegestattung.}
\item{ereignis_am}{ISO-Datum des rechtlich qualifizierten Rückerhalts bei Überlasser/Eigentümer oder Verhältnisendes bei Nutzer; keine bloße Kündigung oder Rückgabeaufforderung.}
\item{rueckgabeanspruch_fristende}{Optionales gesondert rechtlich bestimmtes ISO-Fristende des Rückgabeanspruchs, ausschließlich auf Überlasser-/Eigentümerseite. Ohne Wert bleibt gekoppelte Grenze ausdrücklich unbekannt/null; keineBehauptungfehlenderfrühererVerjährung.}
\item{einordnungsnachweis}{Nichtleerer Nachweis der einschlägigen Anspruchsart und Auslöser/Kopplungsgrenze; Sonderkorrekturen gesondert.}
}
\details{Sechsmonatige Ereignisgrundfrist ausRückerhalt/Verhältnisende; beiüberlassendem/EigentümerAnspruch undbekanntemRückgabeanspruchsende früheresEndeausbeiden. Keine automatische Verjährung desRückgabeanspruchs. OhneübergebeneKopplungsgrenze aufÜberlasserseite bleibtbegrenztesEndeunbekannt. EigeneHemmung/Ablaufhemmung/Neubeginn/Feiertagskorrektur separat; beiKorrekturenMinimumanschließendneuprüfen, keinabschließenderVerjährungsbescheid. ISO-Daten/Ergebnisse0001..9999; festeFallliste; optionaleKopplungnurbeiÜberlasserseite.}
\value{wert enthält sechsmonatiges_grundfristende, rueckgabeanspruchskopplung_erforderlich und mit_rueckgabeanspruch_begrenztes_grundfristende (ohneKopplungsdatum/null). Einheit: daten_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_548_T0001, BGB_548_T0002, BGB_548_T0003, BGB_548_T0004, BGB_591b_T0001, BGB_591b_T0002, BGB_591b_T0003, BGB_591b_T0004, BGB_606_T0001, BGB_606_T0002, BGB_1057_T0001, BGB_1057_T0002, BGB_1226_T0001, BGB_1226_T0002}
\examples{
ueberlassung_ersatzverjaehrungsgrundfrist(
  anspruchsfall = "miete_vermieter",
  ereignis_am = "2027-08-31",
  rueckgabeanspruch_fristende = NULL,
  einordnungsnachweis = paste0(
    "Qualifizierte Anspruchsart und maßgeblicher Rückerhalt oder ",
    "Verhältnisende."
  )
)
}
