nottestament_grundfrist <- function(errichtung_am=NULL,einordnungsnachweis=NULL) {
 beginn <- .datum(errichtung_am,'errichtung_am');.text(einordnungsnachweis,'einordnungsnachweis');ende <- .frist(.iso(beginn),3,'monate','ereignis')
 eingaben <- list(errichtung_am=errichtung_am,einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(.iso(ende),'datum','BGB_NOTTESTAMENT_GRUNDFRIST',eingaben,list(list(operation='Drei Kalendermonate ab Errichtung als Ereignisfrist')),eingaben)
 ergebnis$annahmen <- list("Nach2249/2250/2251 errichtetes Nottestament rechtlich qualifiziert; rohe Grundfrist nach2252I.")
 ergebnis$hinweise <- list("Beginn und Lauf sind nach2252II gehemmt, solange notarielle Testamentserrichtung unm\u00f6glich ist; dieses Grundfristende daher nicht ungepr\u00fcft als tats\u00e4chlichen Ablauf verwenden. Neue Seereise2252III kann unterbrechen. Rechtsfolge2252I setzt Fortleben nach Ablauf voraus; Todeserkl\u00e4rung/Todeszeitfeststellung2252IV gesondert pr\u00fcfen. Keine automatische Unwirksamkeitsfeststellung oder Wochenend-/Feiertagsverl\u00e4ngerung.")
 ergebnis
}
seetestament_reise_neustart <- function(bisheriges_fristende=NULL,neue_seereise_beginn=NULL,neue_seereise_ende=NULL,seetestament_nach_2251_qualifiziert=NULL,einordnungsnachweis=NULL) {
 bisher <- .datum(bisheriges_fristende,'bisheriges_fristende');beginn <- .datum(neue_seereise_beginn,'neue_seereise_beginn');ende <- .datum(neue_seereise_ende,'neue_seereise_ende')
 if(ende<beginn) .fehler('neue_seereise_ende','Reiseende darf nicht vor Reisebeginn liegen.')
 .wahrheitswert(seetestament_nach_2251_qualifiziert,'seetestament_nach_2251_qualifiziert');.text(einordnungsnachweis,'einordnungsnachweis')
 eingaben <- list(bisheriges_fristende=bisheriges_fristende,neue_seereise_beginn=neue_seereise_beginn,neue_seereise_ende=neue_seereise_ende,seetestament_nach_2251_qualifiziert=seetestament_nach_2251_qualifiziert,einordnungsnachweis=einordnungsnachweis)
 wert <- NULL
 if(seetestament_nach_2251_qualifiziert && beginn<=bisher) wert <- .iso(.frist(.iso(ende),3,'monate','ereignis'))
 ergebnis <- .ergebnis(wert,'datum','BGB_SEETESTAMENT_REISE_NEUSTART',eingaben,list(list(operation='Reiseantritt vor Ablauf des bisherigen Fristtages pr\u00fcfen; bei rechtzeitigem Antritt volle drei Monate ab Ende der neuen Reise')),eingaben)
 ergebnis$status <- if(!is.null(wert)) 'BERECHNET' else 'NICHT_ANWENDBAR'
 ergebnis$annahmen <- list("Qualifizierter2251-Fall; bisheriges Fristende einschlie\u00dflich rechtlich einschl\u00e4giger Hemmung/Unterbrechung vollst\u00e4ndig bestimmt.")
 ergebnis$hinweise <- list("Reiseantritt am bisherigen letzten Fristtag erfolgt vor dessen Tagesablauf; sp\u00e4terer Antritt belebt Frist nicht wieder. Ergebnis ist rohe volle neue Grundfrist nach Reiseende, keine blo\u00dfe Addition der Reisedauer oder Restfrist. Weitere Unm\u00f6glichkeit notarieller Errichtung2252II und erneute Reisen gesondert ber\u00fccksichtigen. Nicht2251-F\u00e4lle oder versp\u00e4teter Antritt ergeben NICHT_ANWENDBAR. Keine G\u00fcltigkeitsentscheidung bei Tod/Todeserkl\u00e4rung2252I/IV.")
 ergebnis
}
