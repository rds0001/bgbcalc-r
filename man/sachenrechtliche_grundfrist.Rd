% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{sachenrechtliche_grundfrist}
\alias{sachenrechtliche_grundfrist}
\title{sachenrechtliche grundfrist}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{sachenrechtliche_grundfrist(
  regelfall = NULL,
  fristbeginnereignis_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{regelfall}{besitzschutz_864: Verübung der verbotenen Eigenmacht; rechtzeitige Klage/rechtskräftige frühere Entscheidung gesondert berücksichtigen.; fundanzeige_973: Anzeige des Fundes bei zuständiger Behörde, gewöhnlicher Fall über10EUR; keine Sonderfunde nach978.; geringwertiger_fund_973: Fundtag bei Sachwert höchstens10EUR; keine Sonderfunde nach978. Keine Eigentumsentscheidung bei Verheimlichung.; fundbereicherung_977: Rechtlich feststehender Eigentumsübergang auf Finder/Gemeinde; gerichtliche Wahrung gesondert.; finderlohn_erloes_978: Entstehung gerade des Absatz3-Anspruchs gegen Erlös-/Geldempfänger, nicht bloß Fundtag.; fundversteigerung_anmeldefrist_981: Ablauf der in öffentlicher Bekanntmachung bestimmten Anmeldefrist.; fundgeld_bekanntmachung_981: Öffentliche Aufforderung zur Anmeldung bei vorheriger Versteigerung ohne Bekanntmachung oder abgeliefertem Geld.; niessbrauch_eigentuemerersatz_1057: Rückerhalt der Sache durch Eigentümer nach entsprechend548I2; Gleichlauf548I3 kann früheres Ende erfordern.; niessbrauch_verwendungsersatz_1057: Beendigung des Nießbrauchs für Verwendungs-/Wegnahmeanspruch, entsprechend548II.; hypothekenversicherung_anzeige_1128: Zugang der Schadensanzeige an Hypothekengläubiger; Widerspruch und angemeldete Hypothek1128II gesondert.; hypothekenversicherung_untunlich_1128: Fälligkeit der Versicherungssumme bei rechtlich untunlicher Schadensanzeige; kein frei wählbarer Ersatzbeginn.; buchhypothek_widerspruch_1139: Eintragung der Buchhypothek; ausgebliebene Darlehenshingabe, Antrag/Eintragung gesondert qualifizieren.; grundschuld_kuendigung_1193: Wirksamer Zugang der Kündigung; gesetzliche Dauer ohne zulässige abweichende Bestimmung. Sicherungsgrundschuld nicht frei abweichbar.; rentenschuld_kuendigung_1202: Wirksamer Kündigungszugang; unveränderte gesetzliche Dauer, separate30Jahres-Kündigungsbeschränkung nicht geprüft.; pfand_verpfaenderersatz_1226: Pfandrückerhalt durch Verpfänder, entsprechend548I2; Gleichlauf548I3 gesondert.; pfand_verwendungsersatz_1226: Rechtlich bestimmtes Ende des Pfandrechtsverhältnisses für Ansprüche des Pfandgläubigers entsprechend548II.; pfandverkauf_androhung_1234: Wirksame Androhung nach eingetretener Verkaufsberechtigung. Verkauf erst nach Ablauf, nicht schon am Anfang des ausgegebenen Endtags.; pfandverkauf_untunlich_1234: Eintritt der Verkaufsberechtigung bei untunlicher Androhung; Verkauf erst nach Ende des Fristendtags.; hypothekenmiete_faelligkeitsjahr_1123: Fälligkeit der konkreten Miet-/Pachtforderung; einjährige Grundgrenze, vorherige Beschlagnahme und Vorauszahlungszeitraum gesondert. Keine automatische Haftungsbefreiung.; hypothek_wiederkehrende_leistung_1126: Beschlagnahme als Anfangsereignis der Dreimonatsgrenze für vorangegangene Verfügung über eine wiederkehrende Leistung. Ausgegeben ist nur die Kalendergrenze, keine Entscheidung über Wirksamkeit oder Anspruchsrang.}
\item{fristbeginnereignis_am}{ISO-Datum des im jeweiligen regelfall beschriebenen Anfangsereignisses, kein beliebig gewähltes Ersatzdatum.}
\item{einordnungsnachweis}{Nichtleerer Nachweis zu Normfall, tatsächlichem Ereignis, zeitlicher Anwendbarkeit und unveränderter gesetzlicher Dauer.}
}
\details{Gesetzliche Monats-/Jahresdauer auswählen und mit vorhandenem Kalenderkern als Ereignisfrist berechnen. Nur Grundfristen. Gerichtliche Wahrung, Rechtskraft, Hemmung/Neubeginn,548-Gleichlauf und Kalenderkorrekturen separat. Keine automatische Eigentums-/Fälligkeits-/Erlöschensentscheidung.1202Absatz2-Kündigungsbeschränkung nicht abgedeckt. Entsprechende981-Anwendung bei qualifiziertem983-Behördenverwahrfall; Anmeldefrist und Berechtigung vorqualifiziert. Siehe fachkonzept/behoerdenfund_normanwendung.json. ISO-Daten einschließlich Resultat0001..9999; feste Fallwahl und nichtleerer Nachweis.}
\value{wert enthält grundfristende, anzahl und einheit der gesetzlichen Dauer. Einheit: datum_und_fristlaenge.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_864_T0001, BGB_864_T0002, BGB_973_T0001, BGB_973_T0002, BGB_973_T0003, BGB_973_T0004, BGB_973_T0005, BGB_977_T0001, BGB_977_T0002, BGB_978_T0001, BGB_978_T0002, BGB_978_T0003, BGB_978_T0004, BGB_978_T0005, BGB_978_T0006, BGB_978_T0007, BGB_978_T0008, BGB_978_T0009, BGB_981_T0001, BGB_981_T0002, BGB_981_T0003, BGB_981_T0004, BGB_1057_T0001, BGB_1057_T0002, BGB_1128_T0001, BGB_1128_T0002, BGB_1128_T0003, BGB_1128_T0004, BGB_1128_T0005, BGB_1139_T0001, BGB_1139_T0002, BGB_1193_T0001, BGB_1193_T0002, BGB_1193_T0003, BGB_1193_T0004, BGB_1193_T0005, BGB_1202_T0001, BGB_1202_T0002, BGB_1202_T0003, BGB_1202_T0004, BGB_1226_T0001, BGB_1226_T0002, BGB_1234_T0001, BGB_1234_T0002, BGB_1234_T0003, BGB_1234_T0004, BGB_1123_T0002, BGB_1126_T0003, BGB_983_T0001}
\examples{
sachenrechtliche_grundfrist(
  regelfall = "besitzschutz_864",
  fristbeginnereignis_am = "2030-01-31",
  einordnungsnachweis = paste0(
    "Synthetischer qualifizierter Normfall mit gesetzlicher Ereig",
    "nisfrist."
  )
)
}
