betriebskosten_grundfristende <- function(fristfall=NULL, bezugsdatum=NULL, fristberechnung=NULL, einordnungsnachweis=NULL) {
 .auswahl(fristfall,'fristfall',c('abrechnung','einwendungen'))
 tag <- .datum(bezugsdatum,'bezugsdatum')
 .auswahl(fristberechnung,'fristberechnung',c('taggenau_zwoelf_monate','ende_zwoelfter_kalendermonat'))
 .text(einordnungsnachweis,'einordnungsnachweis')
 ende <- .frist(.iso(tag),12,'monate','ereignis')
 if(fristberechnung=='ende_zwoelfter_kalendermonat') ende <- .frist(paste0(substr(.iso(ende),1,8),'01'),1,'monate','tagesbeginn')
 wert <- list(rechnerisches_fristende=.iso(ende))
 eingaben <- list(fristfall=fristfall, bezugsdatum=bezugsdatum, fristberechnung=fristberechnung, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"datum","BGB_BETRIEBSKOSTEN_GRUNDFRISTENDE",eingaben,list(list(operation="Zw\u00f6lfmonatige Ereignisfrist nach187/188 berechnen; nur bei ausdr\u00fccklich ausgew\u00e4hlter Monatsendevariante auf den letzten Kalendertag dieses Zielmonats setzen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7556III: zwei explizite Berechnungsweisen ohne automatische Auslegungsentscheidung. LGFrankfurt(Oder)20.11.2012,16S47/12 bef\u00fcrwortet Monatsende192 und dokumentiert die gegenteilige taggenaue Berechnung der Vorinstanz. Hieraus folgt keine Behauptung einer heute universell verbindlichen Auslegung; Auswahl rechtlich belegen. Grundfrist ohne193-Wochenend-/Feiertagskorrektur; diese bei feststehender Anwendbarkeit mit vorhandenem Kalenderkern nachf\u00fchren. Kein automatischer Ausschluss von Nachforderung oder Einwendung: ordnungsgem\u00e4\u00dfe Abrechnung, Zugang, Vertretenm\u00fcssen und Sonderf\u00e4lle gesondert. J\u00e4hrliche Abrechnungspflicht ist nicht identisch mit dem anschlie\u00dfenden Mitteilungszeitraum.")
 ergebnis
}
