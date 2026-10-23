
entgangener_gewinn_nettobetrag <- function(erwartbare_erloese=NULL, zugehoerige_aufwendungen=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(erwartbare_erloese), .geld(zugehoerige_aufwendungen))
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(erwartbare_erloese=erwartbare_erloese, zugehoerige_aufwendungen=zugehoerige_aufwendungen, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(if(.vergleichen(werte[[1]],werte[[2]])>0) .subtrahieren(werte[[1]],werte[[2]]) else .bruch(0), "BGB_ENTGANGENER_GEWINN_NETTOBETRAG", eingaben,list(list(operation="Erwartbare Erl\u00f6se um zugeh\u00f6rige Aufwendungen vermindern; positiver Nettogewinn mindestens null.")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("\u00a7252: rein rechnerische Nettogewinnermittlung aus qualifizierter kontrafaktischer Basis. Wahrscheinlichkeit, Kausalit\u00e4t und Bewertungsansatz werden nicht ermittelt. Kein zus\u00e4tzlicher Anspruch auf Erl\u00f6s und Nettogewinn zugleich; weitere Vorteile, tats\u00e4chlich verbleibende Ertr\u00e4ge, Mitverschulden und Schadensminderung getrennt ber\u00fccksichtigen. Negative Marge begr\u00fcndet hier keinen entgangenen Gewinn; kein vollst\u00e4ndiger Schadensersatzbetrag."))
 ergebnis
}

zahlung_empfaengerentgelt_restbetrag <- function(vollstaendiger_zahlungsbetrag=NULL, vereinbartes_empfaengerentgelt=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(vollstaendiger_zahlungsbetrag), .geld(vereinbartes_empfaengerentgelt))
 .text(einordnungsnachweis,"einordnungsnachweis")
 if(.vergleichen(werte[[2]],werte[[1]])>0) .fehler("vereinbartes_empfaengerentgelt","Abzugsbetrag darf den verf\u00fcgbaren Zahlungsbetrag nicht \u00fcbersteigen.")
 eingaben <- list(vollstaendiger_zahlungsbetrag=vollstaendiger_zahlungsbetrag, vereinbartes_empfaengerentgelt=vereinbartes_empfaengerentgelt, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(.subtrahieren(werte[[1]],werte[[2]]), "BGB_ZAHLUNG_EMPFAENGERENTGELT_RESTBETRAG", eingaben,list(list(operation="Vollst\u00e4ndigen Zahlungsbetrag um das zul\u00e4ssige vereinbarte Empf\u00e4ngerentgelt vermindern.")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("\u00a7675qII-Grundfall, vor Erteilung der Gutschrift vereinbarter Abzug eines zustehenden Entgelts. Vollst\u00e4ndiger Zahlungsbetrag und Entgelt bleiben in eingaben und nutzervorgaben getrennt dokumentiert; gesetzliche Zahlungsinformationen m\u00fcssen sie separat ausweisen. Keine K\u00fcrzung durch zwischengeschaltete Stellen nachAbsatz1, keine Entgeltberechnung und keine Abweichung nachAbsatz4. Entgelt \u00fcber Zahlungsbetrag und gesonderte Kontobelastungen au\u00dferhalb dieses Modells."))
 ergebnis
}

buergschaft_regressverlust_restbetrag <- function(buergschaftsverbindlichkeit=NULL, verlorener_erlangbarer_regress=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(buergschaftsverbindlichkeit), .geld(verlorener_erlangbarer_regress))
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(buergschaftsverbindlichkeit=buergschaftsverbindlichkeit, verlorener_erlangbarer_regress=verlorener_erlangbarer_regress, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(if(.vergleichen(werte[[1]],werte[[2]])>0) .subtrahieren(werte[[1]],werte[[2]]) else .bruch(0), "BGB_BUERGSCHAFT_REGRESSVERLUST_RESTBETRAG", eingaben,list(list(operation="Offene B\u00fcrgschaftsverbindlichkeit um erlangbaren verlorenen Regress mindern, mindestens null.")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("\u00a7776: Ma\u00dfgeblich ist der erlangbare Ersatz aus dem aufgegebenen Recht, nicht automatisch dessen Nominalwert. Verwertbarkeit, Rang, Mitb\u00fcrgenquote und weitere Bedingungen vorqualifizieren. Keine automatische Auslegung einer wirksamen Rechtsaufgabe oder kumulative Anrechnung gleicher Sicherheiten. Ergebnis ist verbleibende betragsm\u00e4\u00dfige B\u00fcrgschaftsbindung vor weiteren Einreden; \u00fcberschie\u00dfender Regresswert begr\u00fcndet hier keine Forderung des B\u00fcrgen."))
 ergebnis
}

annahmeverzug_mehraufwendungsbetrag <- function(mehraufwand_erfolgloses_angebot=NULL, mehraufwand_aufbewahrung=NULL, mehraufwand_erhaltung=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(mehraufwand_erfolgloses_angebot), .geld(mehraufwand_aufbewahrung), .geld(mehraufwand_erhaltung))
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(mehraufwand_erfolgloses_angebot=mehraufwand_erfolgloses_angebot, mehraufwand_aufbewahrung=mehraufwand_aufbewahrung, mehraufwand_erhaltung=mehraufwand_erhaltung, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(.addieren(.addieren(werte[[1]],werte[[2]]),werte[[3]]), "BGB_ANNAHMEVERZUG_MEHRAUFWENDUNGSBETRAG", eingaben,list(list(operation="Erforderliche zus\u00e4tzliche Aufwendungen f\u00fcr erfolgloses Angebot, Aufbewahrung und Erhaltung addieren.")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("\u00a7304: nur rechtlich zugeordnete erforderliche Mehraufwendungen infolge des Annahmeverzugs; keine pauschale Bewertung von Arbeitszeit oder ohnehin angefallenen Kosten. Kostenpositionen \u00fcberschneidungsfrei den drei Gruppen zuordnen; dieselbe Rechnung nur einmal erfassen. Grundvoraussetzungen des Annahmeverzugs sowie weitergehende Schadensersatzanspr\u00fcche werden nicht ermittelt."))
 ergebnis
}

anweisung_schuldrest_nach_leistung <- function(schuld_vor_leistung=NULL, tatsaechlich_geleisteter_betrag=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(schuld_vor_leistung), .geld(tatsaechlich_geleisteter_betrag))
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(schuld_vor_leistung=schuld_vor_leistung, tatsaechlich_geleisteter_betrag=tatsaechlich_geleisteter_betrag, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(if(.vergleichen(werte[[1]],werte[[2]])>0) .subtrahieren(werte[[1]],werte[[2]]) else .bruch(0), "BGB_ANWEISUNG_SCHULDREST_NACH_LEISTUNG", eingaben,list(list(operation="Offene Anweisungsschuld um tats\u00e4chlich bewirkte zugeordnete Leistung mindern, mindestens null.")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("\u00a7787I: nur Betrag der Schuld des Angewiesenen gegen\u00fcber dem Anweisenden im qualifizierten Deckungsverh\u00e4ltnis. \u00a7788 trennt blo\u00dfe Annahme von tats\u00e4chlicher Leistung im Valutaverh\u00e4ltnis; die Annahme allein wird nicht als Zahlung eingestellt. Andere Schuldverh\u00e4ltnisse nicht vermischen. \u00dcberschie\u00dfende Zahlung begr\u00fcndet hier weder negative Schuld noch automatisch einen R\u00fcckforderungsanspruch."))
 ergebnis
}

zahlungsinstrument_ersatzentgelt_grenze <- function(vereinbartes_ersatzentgelt=NULL, unmittelbare_ersatzkosten=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(vereinbartes_ersatzentgelt), .geld(unmittelbare_ersatzkosten))
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(vereinbartes_ersatzentgelt=vereinbartes_ersatzentgelt, unmittelbare_ersatzkosten=unmittelbare_ersatzkosten, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(if(.vergleichen(werte[[1]],werte[[2]])<=0) werte[[1]] else werte[[2]], "BGB_ZAHLUNGSINSTRUMENT_ERSATZENTGELT_GRENZE", eingaben,list(list(operation="Numerisch auf die ausschlie\u00dflich unmittelbaren Ersatzkosten begrenztes Entgelt: Minimum aus vereinbartem Entgelt und Kosten.")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("\u00a7675lI: ausschlie\u00dflich numerische Entgeltobergrenze f\u00fcr Ersatz nach Verlust, Diebstahl, Missbrauch oder sonst nicht autorisierter Nutzung. Das Minimum heilt keine unwirksame Entgeltvereinbarung und entscheidet keinen Zahlungsanspruch; Wirksamkeit und Rechtsfolgen einer \u00fcberschie\u00dfenden Klausel gesondert. Kosten m\u00fcssen dem konkreten Ersatz unmittelbar und ausschlie\u00dflich zurechenbar sein; kein allgemeines Entgelt f\u00fcr Sperrung oder Anzeige."))
 ergebnis
}

buergschaft_forderungsuebergang_betrag <- function(offene_hauptforderung=NULL, befriedigung_durch_buergen=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(offene_hauptforderung), .geld(befriedigung_durch_buergen))
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(offene_hauptforderung=offene_hauptforderung, befriedigung_durch_buergen=befriedigung_durch_buergen, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(if(.vergleichen(werte[[1]],werte[[2]])<=0) werte[[1]] else werte[[2]], "BGB_BUERGSCHAFT_FORDERUNGSUEBERGANG_BETRAG", eingaben,list(list(operation="Numerischer Forderungs\u00fcbergang: Minimum aus noch bestehender erfasster Hauptforderung und darauf bewirkter Befriedigung durch den B\u00fcrgen.")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("\u00a7774I: ausschlie\u00dflich H\u00f6he des gesetzlichen \u00dcbergangs der konkret erfassten Hauptforderung. Entsprechend\u00a71143I bei Befriedigung durch den Grundst\u00fcckseigent\u00fcmer, der nicht pers\u00f6nlicher Schuldner ist; befriedigung_durch_buergen bezeichnet in dieser Normanwendung dessen qualifizierten Befriedigungsbetrag. Der Funktionsname bezeichnet den wiederverwendeten774-Kern, keine zus\u00e4tzlich vorausgesetzte B\u00fcrgschaft. Gesamthypothekenfolgen1143II/1173 und Sicherheitenverteilung werden hier nicht berechnet. Keine Vermehrung der Forderung bei \u00dcberzahlung und keine Berechnung eines daraus m\u00f6glichen R\u00fcckforderungsanspruchs. Durchsetzung darf dem verbleibenden Gl\u00e4ubiger nicht schaden; Hauptschuldnereinwendungen bleiben bestehen. Innenausgleich unter Mitb\u00fcrgen nach774II/426, Sicherheiten, Zinsen und Kosten separat zuordnen; keine doppelte Erfassung bereits \u00fcbergegangener Forderungen."))
 ergebnis
}

mietsicherheit_mit_anlageertraegen <- function(sicherheit_vor_ertragszuwachs=NULL, hinzukommende_anlageertraege=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(sicherheit_vor_ertragszuwachs), .geld(hinzukommende_anlageertraege))
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(sicherheit_vor_ertragszuwachs=sicherheit_vor_ertragszuwachs, hinzukommende_anlageertraege=hinzukommende_anlageertraege, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(.addieren(werte[[1]],werte[[2]]), "BGB_MIETSICHERHEIT_MIT_ANLAGEERTRAEGEN", eingaben,list(list(operation="Bestehende Sicherheit und noch nicht enthaltene zugeordnete Anlageertr\u00e4ge addieren.")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("\u00a7551III: tats\u00e4chlicher Ertragszuwachs erh\u00f6ht die Sicherheit; keine erneute Begrenzung des Ertragszuwachses auf drei Monatsmieten. Ausgangssicherheit gesondert nach551I pr\u00fcfen. Keine Hochrechnung eines hypothetischen Sparzinses, kein Ersatz einer unterlassenen Anlage und keine automatische Kautionsfreigabe. Anlageverluste, Entnahmen und bereits eingerechnete Ertr\u00e4ge getrennt ber\u00fccksichtigen; keine Doppelz\u00e4hlung."))
 ergebnis
}

landpacht_verbesserungsmassnahme_ersatzbetrag <- function(ersatzfaehige_aufwendungen=NULL, ersatzfaehige_entgangene_ertraege=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(ersatzfaehige_aufwendungen), .geld(ersatzfaehige_entgangene_ertraege))
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(ersatzfaehige_aufwendungen=ersatzfaehige_aufwendungen, ersatzfaehige_entgangene_ertraege=ersatzfaehige_entgangene_ertraege, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(.addieren(werte[[1]],werte[[2]]), "BGB_LANDPACHT_VERBESSERUNGSMASSNAHME_ERSATZBETRAG", eingaben,list(list(operation="Angemessene ersatzf\u00e4hige Aufwendungen und \u00fcberschneidungsfrei bewertete entgangene Ertr\u00e4ge addieren.")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("\u00a7588II: numerischer Ersatzumfang aus qualifizierten Betragskomponenten. Keine automatische Billigkeitsbewertung oder Brutto-/Nettobewertung entgangener Ertr\u00e4ge; diese ist widerspruchsfrei mit den Aufwendungen vorzugeben. Vorsch\u00fcsse/Zahlungen gesondert anrechnen. Eine Pachterh\u00f6hung wegen h\u00f6herer Ertr\u00e4ge588III ist ein anderer Rechengegenstand und wird nicht erfunden."))
 ergebnis
}

landpacht_verwendungsersatz_mehrwertgrenze <- function(ersatzfaehige_verwendungen=NULL, fortbestehender_mehrwert=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(ersatzfaehige_verwendungen), .geld(fortbestehender_mehrwert))
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(ersatzfaehige_verwendungen=ersatzfaehige_verwendungen, fortbestehender_mehrwert=fortbestehender_mehrwert, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(if(.vergleichen(werte[[1]],werte[[2]])<=0) werte[[1]] else werte[[2]], "BGB_LANDPACHT_VERWENDUNGSERSATZ_MEHRWERTGRENZE", eingaben,list(list(operation="Ersatzf\u00e4hige Verwendungen auf den \u00fcber die Pachtzeit hinaus fortbestehenden Mehrwert begrenzen.")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("\u00a7591I: Grundbetrag als Minimum aus ersatzf\u00e4higen Verwendungen und fortbestehendem Mehrwert. Notwendige Verwendungen590b und Wegnahmerechte591a, Zustimmung/gerichtliche Ersetzung, Bewertungsmethode und gerichtliche Teilzahlungen oder Vertragsfortsetzung591III separat. Kein automatischer Zahlungsplan und keine automatische F\u00e4lligkeit bei gerichtlich abweichender Regelung."))
 ergebnis
}

billigkeitshaftung_mittelbegrenzter_betrag <- function(billig_erforderlicher_ersatzbetrag=NULL, verfuegbare_mittel=NULL, geschuetzter_unterhaltsbedarf=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(billig_erforderlicher_ersatzbetrag), .geld(verfuegbare_mittel), .geld(geschuetzter_unterhaltsbedarf))
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(billig_erforderlicher_ersatzbetrag=billig_erforderlicher_ersatzbetrag, verfuegbare_mittel=verfuegbare_mittel, geschuetzter_unterhaltsbedarf=geschuetzter_unterhaltsbedarf, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(if(.vergleichen(werte[[2]],werte[[3]])<=0) .bruch(0) else { frei <- .subtrahieren(werte[[2]],werte[[3]]); if(.vergleichen(werte[[1]],frei)<=0) werte[[1]] else frei }, "BGB_BILLIGKEITSHAFTUNG_MITTELBEGRENZTER_BETRAG", eingaben,list(list(operation="Vom verf\u00fcgbaren Mittelbestand gesch\u00fctzten Unterhaltsbedarf abziehen, mindestens null; Billigkeitsersatz auf diesen verbleibenden Betrag begrenzen.")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("\u00a7829: nur numerische Mittelgrenze eines bereits nach Billigkeit qualifizierten Ersatzbetrags. Keine automatische Billigkeitsentscheidung aus Verm\u00f6genszahlen und keine Tabelle f\u00fcr angemessenen Unterhalt. Haftungsvoraussetzungen827/828, fehlende Erlangbarkeit von Ersatz durch einen aufsichtspflichtigen Dritten und Verh\u00e4ltnisse der Beteiligten extern feststellen. Keine Entscheidung \u00fcber zeitliche Streckung, k\u00fcnftige Eink\u00fcnfte oder Vollstreckbarkeit."))
 ergebnis
}

landpacht_beschreibung_kostenhaelfte <- function(sachverstaendigenkosten=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(sachverstaendigenkosten))
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(sachverstaendigenkosten=sachverstaendigenkosten, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(.multiplizieren(werte[[1]],.bruch(1,2)), "BGB_LANDPACHT_BESCHREIBUNG_KOSTENHAELFTE", eingaben,list(list(operation="Qualifizierte Sachverst\u00e4ndigenkosten zur H\u00e4lfte je Vertragsseite aufteilen.")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("\u00a7585bII: Verp\u00e4chter und P\u00e4chter tragen jeweils eine H\u00e4lfte der qualifizierten Kosten. Nicht erneut durch die Anzahl einzelner Personen innerhalb einer Vertragsseite teilen. Keine Kostenentscheidung \u00fcber andere Verfahren; bereits gezahlte Beitr\u00e4ge separat. Exakte H\u00e4lfte ohne Cent-Rundung; beide Seitenanteile ergeben zusammen den Gesamtbetrag."))
 ergebnis
}

landpacht_erzeugnisse_mehrwert <- function(wert_erforderlicher_endbestand=NULL, vergleichswert_uebernommener_anfangsbestand=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(wert_erforderlicher_endbestand), .geld(vergleichswert_uebernommener_anfangsbestand))
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(wert_erforderlicher_endbestand=wert_erforderlicher_endbestand, vergleichswert_uebernommener_anfangsbestand=vergleichswert_uebernommener_anfangsbestand, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(if(.vergleichen(werte[[1]],werte[[2]])>0) .subtrahieren(werte[[1]],werte[[2]]) else .bruch(0), "BGB_LANDPACHT_ERZEUGNISSE_MEHRWERT", eingaben,list(list(operation="Wert erforderlicher zur\u00fcckzulassender Erzeugnisse abz\u00fcglich gleichartig bewerteten \u00fcbernommenen Anfangsbestands, mindestens null.")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("\u00a7596bII: Ersatz nur f\u00fcr den rechtlich qualifizierten Mehrbestand beziehungsweise bessere Beschaffenheit der nachAbsatz1 zur\u00fcckzulassenden Erzeugnisse. Werte m\u00fcssen den Unterschied in Menge/Beschaffenheit abbilden, nicht blo\u00dfe allgemeine Preissteigerung. \u00dcber die erforderlichen Erzeugnisse hinaus freiwillig zur\u00fcckgelassene Mengen nicht einrechnen; Pflicht nachAbsatz1 kann auch ohne Anfangs\u00fcbernahme bestehen, dann Vergleichswert0. Bei verschiedenen Produktgruppen gesondert qualifizieren; keine pauschale Verrechnung fremder Minderbest\u00e4nde. Kein automatischer Anspruch wegen Bestandsangaben allein; Zahlungen separat."))
 ergebnis
}

werk_annahmeverzug_entschaedigungsbetrag <- function(verzugsbezogene_verguetungsbasis=NULL, ersparte_aufwendungen=NULL, anderweitiger_arbeitskraft_erwerb=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(verzugsbezogene_verguetungsbasis), .geld(ersparte_aufwendungen), .geld(anderweitiger_arbeitskraft_erwerb))
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(verzugsbezogene_verguetungsbasis=verzugsbezogene_verguetungsbasis, ersparte_aufwendungen=ersparte_aufwendungen, anderweitiger_arbeitskraft_erwerb=anderweitiger_arbeitskraft_erwerb, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(if(.vergleichen(werte[[1]],.addieren(werte[[2]],werte[[3]]))>0) .subtrahieren(.subtrahieren(werte[[1]],werte[[2]]),werte[[3]]) else .bruch(0), "BGB_WERK_ANNAHMEVERZUG_ENTSCHAEDIGUNGSBETRAG", eingaben,list(list(operation="Qualifizierte verzugsbezogene Verg\u00fctungsbasis abz\u00fcglich ersparter Aufwendungen und anderweitigen Arbeitskrafterwerbs, mindestens null.")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("\u00a7642I/II: numerischer Abrechnungsschritt aus rechtlich bestimmter Verzugsdauer-/Verg\u00fctungsbasis und zugeh\u00f6rigen Abz\u00fcgen. Basis nicht blind als gesamte Verg\u00fctung geteilt durch gesamte Vertragszeit bilden; tats\u00e4chlich betroffene Vorhaltung und rechtlich ma\u00dfgebliche Bewertungsanteile qualifizieren. Keine automatische Entsch\u00e4digung s\u00e4mtlicher Mehrkosten nach Verzugsende und keine Schadensersatzprognose. Ersparnis und anderweitiger Erwerb nur einmal, nicht bereits netto in der Basis und erneut als Abzug. Kein zus\u00e4tzliches B\u00f6swilligkeitserfordernis aus615/648 \u00fcbertragen. Negative Differenz ergibt0, keinen automatisch begr\u00fcndeten Zahlungsanspruch des Bestellers. Zahlungen separat."))
 ergebnis
}

bereicherung_entreicherungsrest <- function(qualifizierter_geldherausgabebetrag=NULL, anrechenbare_entreicherung=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(qualifizierter_geldherausgabebetrag), .geld(anrechenbare_entreicherung))
 .text(einordnungsnachweis,"einordnungsnachweis")
 if(.vergleichen(werte[[2]],werte[[1]])>0) .fehler("anrechenbare_entreicherung","Abzugsbetrag darf den verf\u00fcgbaren Zahlungsbetrag nicht \u00fcbersteigen.")
 eingaben <- list(qualifizierter_geldherausgabebetrag=qualifizierter_geldherausgabebetrag, anrechenbare_entreicherung=anrechenbare_entreicherung, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(.subtrahieren(werte[[1]],werte[[2]]), "BGB_BEREICHERUNG_ENTREICHERUNGSREST", eingaben,list(list(operation="Qualifizierten Geldherausgabebetrag um rechtlich anrechenbare Entreicherung vermindern.")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("\u00a7818III: ausschlie\u00dflich numerische Begrenzung auf Grundlage bereits rechtlich bestimmter Betr\u00e4ge. Entreicherung nicht automatisch aus vermindertem Kontostand, Konsumausgaben oder Verlusten ablesen. Anrechenbaren Wegfall auf die tats\u00e4chlich erfassten Komponenten und den ma\u00dfgeblichen Haftungszeitraum beziehen. Versch\u00e4rfte Haftung818IV/819/820, Nutzungsgrenze820II, Drittweitergabe822 und Einreden821 gesondert; ausgeschlossene Entreicherung darf nicht durch positives Eingabefeld wieder eingef\u00fchrt werden. Keine automatische Saldotheorie oder Verrechnung beider Leistungsrichtungen, keine k\u00f6rperliche Sachherausgabe als Geldrest behandeln. Zahlungen separat."))
 ergebnis
}
