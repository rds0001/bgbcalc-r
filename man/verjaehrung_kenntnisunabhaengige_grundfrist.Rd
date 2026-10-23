\name{verjaehrung_kenntnisunabhaengige_grundfrist}
\alias{verjaehrung_kenntnisunabhaengige_grundfrist}
\title{Kenntnisunabhängige Verjährungsgrundfrist}
\description{Absatz 2: dreißig Jahre ab schadensauslösendem Ereignis. Absatz 3: zehn Jahre ab Entstehung und dreißig Jahre ab schadensauslösendem Ereignis getrennt berechnen und den früheren letzten Tag auswählen. Absatz 3a: dreißig Jahre ab Entstehung. Absatz 4: zehn Jahre ab Entstehung. Kein Jahresschlussbeginn; Ereignistag nach § 187 Absatz 1 nicht mitzählen, Jahresfrist nach § 188 Absatz 2/3.}
\usage{
verjaehrung_kenntnisunabhaengige_grundfrist(anspruchsart = NULL,
  entstehung_oder_zuwiderhandlung_am = NULL,
  schadensausloesendes_ereignis_am = NULL,
  kenntnisunabhaengige_frist_anwendbar = NULL)
}
\arguments{
\item{anspruchsart}{Auswahl der zuvor rechtlich bestimmten Fallgruppe: leben_koerper_gesundheit_freiheit (§ 199 Absatz 2), sonstiger_schadensersatz (Absatz 3), erbfall (Absatz 3a) oder sonstiger_anspruch (Absatz 4). Die Funktion klassifiziert den Anspruch nicht selbst. erbfall umfasst auch Ansprüche, deren Geltendmachung Kenntnis einer Verfügung von Todes wegen voraussetzt.}
\item{entstehung_oder_zuwiderhandlung_am}{ISO-Datum JJJJ-MM-TT der Anspruchsentstehung, bei Unterlassen der Zuwiderhandlung (§ 199 Absatz 5). Erforderlich für Absatz 3, 3a und 4. Für Absatz 2 ausdrücklich None beziehungsweise NULL, weil dessen Frist nicht von der Entstehung abhängt.}
\item{schadensausloesendes_ereignis_am}{ISO-Datum JJJJ-MM-TT der Begehung der Handlung, Pflichtverletzung oder des sonstigen schadensauslösenden Ereignisses. Erforderlich für Absatz 2 und 3. Für Absatz 3a und 4 ausdrücklich None beziehungsweise NULL. Bei Absatz 3 darf dieses Datum nicht nach dem eingegebenen Entstehungsdatum liegen.}
\item{kenntnisunabhaengige_frist_anwendbar}{Expliziter Wahrheitswert zur Anwendung der ausgewählten kenntnisunabhängigen Grundfrist; abweichende Sondervorschriften sind vorher zu prüfen. FALSE ergibt NICHT_ANWENDBAR.}
}
\details{Unmodifizierte kenntnisunabhängige Frist, kein abschließender Verjährungstag. Eine bereits früher ablaufende kenntnisabhängige Frist ist nicht enthalten. Hemmung, Ablaufhemmung, Neubeginn, Sondervorschriften und gegebenenfalls § 193 bleiben gesondert zu berücksichtigen. Die Auswahl der richtigen Anspruchsgruppe und der maßgeblichen Ereignisse ist rechtliche Nutzervorgabe. Insbesondere darf der Katalog von Absatz 2 nicht automatisch mit dem abweichenden Katalog des § 197 Absatz 1 Nummer 1 gleichgesetzt werden. Alle benötigten Zwischenfristen müssen im Datumsbereich 0001 bis 9999 liegen, auch wenn eine andere Frist früher endet.}
\value{S3-Objekt bgb_ergebnis. wert enthält fristen als Liste mit anknuepfung, beginnereignis, jahre und rechnerischer_letzter_tag sowie den ausgewählten rechnerischer_letzter_tag. Die Enddaten bezeichnen den Tagesschluss. Bei NICHT_ANWENDBAR ist wert null. Nicht benötigte Datumsparameter müssen ausdrücklich fehlen (None/NULL), nicht mit sachfremden Datumswerten belegt werden. Fehlende oder ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\examples{
verjaehrung_kenntnisunabhaengige_grundfrist(
  "sonstiger_schadensersatz", "2010-05-20", "1990-01-01", TRUE
)
}
