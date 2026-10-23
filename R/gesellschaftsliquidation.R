gesellschaft_liquidationsgrundbetraege <- function(gesellschaftsvermoegen=NULL,zu_berichtigende_verbindlichkeiten=NULL,erforderliche_rueckbehalte=NULL,rueckzuerstattende_beitraege=NULL,einordnungsnachweis=NULL) {
 verm <- .geld(gesellschaftsvermoegen); schulden <- .geld(zu_berichtigende_verbindlichkeiten); reserve <- .geld(erforderliche_rueckbehalte); beitraege <- .geld(rueckzuerstattende_beitraege)
 .text(einordnungsnachweis,'einordnungsnachweis'); glaeubiger <- .addieren(schulden,reserve); bedarf <- .addieren(glaeubiger,beitraege)
 positiv <- function(x) if(.vergleichen(x,.bruch(0))>0) x else .bruch(0)
 wert <- list(glaeubiger_und_reservebedarf=.bruchteile(glaeubiger),nach_glaeubigern_verbleibend=.bruchteile(positiv(.subtrahieren(verm,glaeubiger))),beitragsrueckerstattungsbedarf=.bruchteile(beitraege),verteilbarer_ueberschuss=.bruchteile(positiv(.subtrahieren(verm,bedarf))),von_gesellschaftern_zu_deckender_fehlbetrag=.bruchteile(positiv(.subtrahieren(bedarf,verm))))
 eingaben <- list(gesellschaftsvermoegen=gesellschaftsvermoegen,zu_berichtigende_verbindlichkeiten=zu_berichtigende_verbindlichkeiten,erforderliche_rueckbehalte=erforderliche_rueckbehalte,rueckzuerstattende_beitraege=rueckzuerstattende_beitraege,einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,'EUR','BGB_GESELLSCHAFT_LIQUIDATIONSGRUNDBETRAEGE',eingaben,list(list(operation='Gl\u00e4ubiger und gesonderte Reserven vor Beitragsr\u00fcckerstattung; Verm\u00f6gen minus Gesamtbedarf als positiver \u00dcberschuss oder umgekehrt als Fehlbetrag.')),eingaben)
 ergebnis$hinweise <- list("\u00a7736d Absatz4\u20136/\u00a7737: tats\u00e4chlich verf\u00fcgbares Liquidationsverm\u00f6gen; f\u00e4llige zu berichtigende Verbindlichkeiten und erforderliche R\u00fcckbehalte f\u00fcr nicht f\u00e4llige/streitige Verbindlichkeiten \u00fcberschneidungsfrei. R\u00fcckzuerstattende Beitr\u00e4ge sind rechtlich qualifiziert: Sachbeitr\u00e4ge zum Einbringungswert, Dienste/Nutzungs\u00fcberlassung im Zweifel kein Ersatz. \u00dcberschuss nach Gewinn-/Verlustquoten verteilen; Fehlbetrag nach \u00a7737 decken. Reicht Verm\u00f6gen nicht, wird keine freie Quote f\u00fcr teilweise Beitragsr\u00fcckerstattung oder Rangfolge unter Gl\u00e4ubigern erfunden. Kein Ersatz f\u00fcr Insolvenzpr\u00fcfung, Bewertung von Sachbeitr\u00e4gen oder Abrechnung bereits erfolgter Liquidationszahlungen.")
 ergebnis
}

gesellschaft_liquidationsfehlbetrag_verteilen <- function(fehlbetrag=NULL,gesellschafter=NULL,einordnungsnachweis=NULL) {
 fehl <- .geld(fehlbetrag); .text(einordnungsnachweis,'einordnungsnachweis'); .vorhanden(gesellschafter,'gesellschafter')
 if(!is.list(gesellschafter) || !is.null(names(gesellschafter)) || length(gesellschafter)<2 || length(gesellschafter)>1000) .fehler('gesellschafter','Vollst\u00e4ndige Liste mit2bis1000 Gesellschaftern erforderlich.')
 namen <- character(); quoten <- list(); grenzen <- list(); summe <- .bruch(0)
 for(person in gesellschafter) {
  if(!is.list(person) || !identical(sort(names(person)),sort(c('gesellschafter_id','gewinn_verlust_anteil','einbringlicher_hoechstbetrag')))) .fehler('gesellschafter','Kennung, Gewinn-/Verlustanteil und einbringlicher H\u00f6chstbetrag erforderlich.')
  kennung <- .text(person$gesellschafter_id,'gesellschafter_id'); quote <- .geld(person$gewinn_verlust_anteil); grenze <- .geld(person$einbringlicher_hoechstbetrag)
  if(kennung %in% namen || .vergleichen(quote,.bruch(1))>0) .fehler('gesellschafter','Eindeutige Kennungen und Quoten h\u00f6chstens eins erforderlich.')
  namen <- c(namen,kennung); quoten[[length(quoten)+1]] <- quote; grenzen[[length(grenzen)+1]] <- grenze; summe <- .addieren(summe,quote)
 }
 if(.vergleichen(summe,.bruch(1))!=0) .fehler('gewinn_verlust_anteil','Vollst\u00e4ndige Gewinn-/Verlustquoten m\u00fcssen eins ergeben.')
 zuordnung <- .begrenzte_quotenverteilung(fehl,quoten,grenzen)
 zugeordnet <- zuordnung$zugeordnet;rest <- zuordnung$rest
 verteilung <- lapply(seq_along(namen),function(i) {
  regel <- .multiplizieren(fehl,quoten[[i]]); extra <- .subtrahieren(zugeordnet[[i]],regel)
  if(.vergleichen(extra,.bruch(0))<0) extra <- .bruch(0)
  list(gesellschafter_id=namen[i],regelanteil=.bruchteile(regel),beibringbarer_betrag=.bruchteile(zugeordnet[[i]]),zusaetzliche_ausfalllast=.bruchteile(extra))
 })
 wert <- list(verteilung=verteilung,gesamt_beibringbar=.bruchteile(.subtrahieren(fehl,rest)),ungedeckter_fehlbetrag=.bruchteile(rest))
 eingaben <- list(fehlbetrag=fehlbetrag,gesellschafter=gesellschafter,einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,'EUR','BGB_GESELLSCHAFT_LIQUIDATIONSFEHLBETRAG_VERTEILEN',eingaben,list(list(operation='Fehlbetrag nach vollst\u00e4ndigen Gewinn-/Verlustquoten; nicht erlangbare Teile wiederholt nach relativen Quoten der \u00fcbrigen einbringlichen Gesellschafter verteilen.')),eingaben)
 ergebnis$hinweise <- list("Nur \u00a7737 bei qualifiziertem Liquidationsfehlbetrag einschlie\u00dflich Beitragsr\u00fcckerstattungsbedarf. Einbringlicher H\u00f6chstbetrag bezeichnet rechtlich/tats\u00e4chlich festgestellten insgesamt noch erlangbaren Betrag f\u00fcr diesen Fehlbetrag, keine beliebige vertragliche Haftungsbegrenzung und keine bereits gezahlte Summe. Betr\u00e4ge auf gemeinsame Abrechnungsbasis bringen; Ausf\u00e4lle bis zur Aussch\u00f6pfung der \u00fcbrigen Grenzen proportional nachverteilen. Nullquote tr\u00e4gt keine rechnerische Ausfalllast. Uneinbringlicher Rest bleibt offen; kein Erlass und keine freie Beitragsr\u00fcckzahlungsquote. Keine Feststellung der Insolvenz oder automatischer Vollstreckungsprognosen.")
 ergebnis
}
