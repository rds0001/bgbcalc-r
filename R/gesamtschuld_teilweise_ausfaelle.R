gesamtschuld_quoten_mit_teilausfaellen <- function(gesamtbetrag=NULL, gesamtschuldner=NULL, einordnungsnachweis=NULL) {
 betrag <- .geld(gesamtbetrag);.text(einordnungsnachweis,'einordnungsnachweis');.vorhanden(gesamtschuldner,'gesamtschuldner')
 if(!is.list(gesamtschuldner)||!is.null(names(gesamtschuldner))||length(gesamtschuldner)<2L||length(gesamtschuldner)>1000L) .fehler('gesamtschuldner','Liste2..1000 vollst\u00e4ndiger Schuldnereintr\u00e4ge erforderlich.')
 namen <- character();quoten <- list();grenzen <- list();gewichte <- list();zahlungen <- list();summe <- .bruch(0)
 for(person in gesamtschuldner) {
  if(!is.list(person)||is.null(names(person))||length(person)!=5L||!setequal(names(person),c('schuldner_id','innenquote','einbringlicher_gesamtbeitrag','ausfallgewicht','geleisteter_beitrag'))) .fehler('gesamtschuldner','Genau schuldner_id, innenquote, einbringlicher_gesamtbeitrag, ausfallgewicht und geleisteter_beitrag erforderlich.')
  name <- .text(person$schuldner_id,'schuldner_id');quote <- .geld(person$innenquote)
  if(name %in% namen||.vergleichen(quote,.bruch(1))>0) .fehler('gesamtschuldner','Eindeutige Kennungen und Quoten0..1 erforderlich.')
  namen <- c(namen,name);quoten[[length(quoten)+1L]] <- quote;grenzen[[length(grenzen)+1L]] <- .geld(person$einbringlicher_gesamtbeitrag);gewichte[[length(gewichte)+1L]] <- .geld(person$ausfallgewicht);zahlungen[[length(zahlungen)+1L]] <- .geld(person$geleisteter_beitrag);summe <- .addieren(summe,quote)
 }
 if(.vergleichen(summe,.bruch(1))!=0) .fehler('innenquote','Vollst\u00e4ndige Innenquoten m\u00fcssen eins ergeben.')
 bezahlt <- .bruch(0)
 for(zahlung in zahlungen) bezahlt <- .addieren(bezahlt,zahlung)
 if(.vergleichen(bezahlt,betrag)>0) .fehler('geleisteter_beitrag','Summe zugeordneter Beitr\u00e4ge darf den Gesamtbetrag nicht \u00fcberschreiten.')
 grund <- lapply(quoten,function(q) .multiplizieren(betrag,q))
 erlangbar <- lapply(seq_along(namen),function(i) if(.vergleichen(grund[[i]],grenzen[[i]])<=0) grund[[i]] else grenzen[[i]])
 deckung <- .bruch(0)
 for(g in erlangbar) deckung <- .addieren(deckung,g)
 ausfall <- .subtrahieren(betrag,deckung)
 zuordnung <- .begrenzte_quotenverteilung(ausfall,gewichte,lapply(seq_along(namen),function(i) .subtrahieren(grenzen[[i]],erlangbar[[i]])))
 wert <- list(verteilung=lapply(seq_along(namen),function(i) { gesamter <- .addieren(erlangbar[[i]],zuordnung$zugeordnet[[i]]);saldo <- .subtrahieren(gesamter,zahlungen[[i]]);list(schuldner_id=namen[i],urspruenglicher_beitrag=.bruchteile(grund[[i]]),beibringbarer_grundbeitrag=.bruchteile(erlangbar[[i]]),zusaetzliche_ausfalllast=.bruchteile(zuordnung$zugeordnet[[i]]),gesamt_beibringbar=.bruchteile(gesamter),rechnerischer_beitragsrest=.bruchteile(if(.vergleichen(saldo,.bruch(0))>0) saldo else .bruch(0)),rechnerischer_ueberbeitrag=.bruchteile(if(.vergleichen(saldo,.bruch(0))<0) .subtrahieren(.bruch(0),saldo) else .bruch(0)))}),urspruenglicher_ausfall=.bruchteile(ausfall),ungedeckter_ausfall=.bruchteile(zuordnung$rest),gesamt_gezahlter_beitrag=.bruchteile(bezahlt),gegenueber_glaeubiger_noch_offen=.bruchteile(.subtrahieren(betrag,bezahlt)))
 eingaben <- list(gesamtbetrag=gesamtbetrag, gesamtschuldner=gesamtschuldner, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_GESAMTSCHULD_QUOTEN_MIT_TEILAUSFAELLEN",eingaben,list(list(operation="Grundanteile mit vollst\u00e4ndigen Innenquoten berechnen; Teilausfall nach qualifizierten Gewichten unter verbleibenden Gesamtgrenzen wiederholt nachverteilen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7426I: zun\u00e4chst Gesamtbetrag nach rechtlich bestimmten Innenquoten, daraus nur erlangbare Grundbeitr\u00e4ge. Nicht erlangbaren Rest nach ausdr\u00fccklich qualifizierten Ausfallgewichten auf \u00fcbrige noch verf\u00fcgbare Beitr\u00e4ge verteilen, bei weiterer Begrenzung wiederholt proportional nachverteilen. Vorhandener begrenzter Quotenkern wird wiederverwendet. Gesetzlicher Gleichanteilsfall mit gleichen Quoten/Gewichten; abweichende Bestimmung muss rechtlich belegt sein. Keine automatische Annahme, dass beliebige Innenquote stets dieselbe Ausfallquote vorgibt. Grenzen sind tats\u00e4chlich/rechtlich erlangbare Gesamtbeitr\u00e4ge und keine blo\u00dfen Zahlungsangebote. Urspr\u00fcngliche Beitragspflicht ausgefallener Schuldner wird nicht erlassen. Keine Begrenzung der Au\u00dfenhaftung, kein automatischer Forderungs\u00fcbergang426II oder individueller Anspruchszuordnung zwischen bereits leistenden Schuldnern. Kein Gesamtverm\u00f6gens- oder Insolvenzmodell und keine Cent-Rundung. Bereits erbrachte, auf diese Abrechnung zugeordnete Beitr\u00e4ge werden mit der rechnerischen Gesamtlast verglichen. \u00dcber-/Restbeitrag sind Rechensalden, keine automatisch f\u00e4lligen Einzelanspr\u00fcche gegen bestimmte Mitschuldner. Teilbefriedigung l\u00e4sst einen gesondert ausgewiesenen Gl\u00e4ubigerrest; Gesamt\u00fcberzahlung an den Gl\u00e4ubiger au\u00dferhalb.")
 ergebnis
}
