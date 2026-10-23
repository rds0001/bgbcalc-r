werkwohnung_kuendigungstermin <- function(fristfall=NULL, kuendigungszugang_am=NULL, ueberlassungsbeginn_am=NULL, qualifizierte_zugangsgrenze_am=NULL, einordnungsnachweis=NULL) {
 .auswahl(fristfall,'fristfall',c('ersatzbedarf_576_1_1','arbeitsplatznaehe_576_1_2'))
 zugang <- .datum(kuendigungszugang_am,'kuendigungszugang_am');beginn <- .datum(ueberlassungsbeginn_am,'ueberlassungsbeginn_am')
 grenze <- .datum(qualifizierte_zugangsgrenze_am,'qualifizierte_zugangsgrenze_am');.text(einordnungsnachweis,'einordnungsnachweis')
 if(beginn>zugang) .fehler('ueberlassungsbeginn_am','Beginn darf nicht nach Zugang liegen.')
 if(substr(.iso(grenze),1,7)!=substr(.iso(zugang),1,7) || as.integer(format(grenze,'%d'))<3) .fehler('qualifizierte_zugangsgrenze_am','Dritte-Werktag-Grenze im Zugangsmonat erforderlich.')
 zehn <- .frist(ueberlassungsbeginn_am,10,'jahre','tagesbeginn');unter <- zugang<=zehn
 ende <- NULL
 if(fristfall=='arbeitsplatznaehe_576_1_2' || unter) {
  monate <- (if(fristfall=='arbeitsplatznaehe_576_1_2') 1 else 3)+as.integer(zugang>grenze)
  ende <- .iso(.frist(paste0(substr(.iso(zugang),1,7),'-01'),monate,'monate','tagesbeginn'))
 }
 wert <- list(zehnjahreszeitraum_letzter_tag=.iso(zehn),weniger_als_zehn_jahre_am_zugang=unter,zugangsgrenze_eingehalten=zugang<=grenze,rechnerischer_sonderbeendigungstag=ende)
 eingaben <- list(fristfall=fristfall, kuendigungszugang_am=kuendigungszugang_am, ueberlassungsbeginn_am=ueberlassungsbeginn_am, qualifizierte_zugangsgrenze_am=qualifizierte_zugangsgrenze_am, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"daten_und_wahrheitswerte","BGB_WERKWOHNUNG_KUENDIGUNGSTERMIN",eingaben,list(list(operation="Werkmietwohnungs-Sonderfrist nach qualifizierter Dritte-Werktag-Grenze und Zehnjahresvergleich zum Monatsendtermin berechnen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7576I: Nummer1 nur bei weniger als zehn Jahren \u00dcberlassung am Zugangstag; Nummer2 ohne diese Zehnjahresgrenze. Im qualifizierten Nummer1-Fall dritter Werktag zum Ende des \u00fcbern\u00e4chsten Monats, Nummer2 zum Ende des laufenden Monats. Bei Zugang nach Monatsgrenze verschiebt sich der fr\u00fcheste Termin um einen Monat. Zehnjahreszeitraum ab rechtlich qualifiziertem Tagesbeginn; intrat\u00e4gige Sonderf\u00e4lle oder Unterbrechungen extern. Ist Nummer1 zeitlich ausgeschlossen, bleibt SonderterminNULL; daraus folgt keine generelle Unk\u00fcndbarkeit und kein automatisch ersatzweise berechneter573c-Termin. Dienstverh\u00e4ltnis muss beendet und Ersatzbedarf/Arbeitsplatzbezug rechtlich festgestellt sein. Keine automatische K\u00fcndigungswirksamkeit, Widerspruchsentscheidung oder Feiertagsverschiebung des Mietendes.")
 ergebnis
}
