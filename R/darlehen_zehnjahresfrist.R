darlehen_zehnjahresfrist_nach_vereinbarungen <- function(vollstaendiger_empfang_am=NULL, neue_vereinbarungen_am=NULL, einordnungsnachweis=NULL) {
 empfang <- .datum(vollstaendiger_empfang_am,'vollstaendiger_empfang_am');.text(einordnungsnachweis,'einordnungsnachweis')
 .vorhanden(neue_vereinbarungen_am,'neue_vereinbarungen_am')
 if(!is.list(neue_vereinbarungen_am) || !is.null(names(neue_vereinbarungen_am)) || length(neue_vereinbarungen_am)>1000) .fehler('neue_vereinbarungen_am','Liste0..1000 erforderlich.')
 bezug <- empfang
 for(datum in neue_vereinbarungen_am) {
  tag <- .datum(datum,'vereinbarung_am')
  if(tag<empfang) .fehler('neue_vereinbarungen_am','Neue Vereinbarung darf nicht vor vollst\u00e4ndigem Empfang liegen.')
  bezug <- max(bezug,tag)
 }
 ende <- .frist(.iso(bezug),10,'jahre','ereignis')
 wert <- list(massgeblicher_bezugstag=.iso(bezug),zehnjahresfrist_letzter_tag=.iso(ende))
 eingaben <- list(vollstaendiger_empfang_am=vollstaendiger_empfang_am, neue_vereinbarungen_am=neue_vereinbarungen_am, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"daten","BGB_DARLEHEN_ZEHNJAHRESFRIST_NACH_VEREINBARUNGEN",eingaben,list(list(operation="J\u00fcngsten qualifizierten Bezugsakt ausw\u00e4hlen und zehn Kalenderjahre berechnen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7489I2: Vollst\u00e4ndiger Empfang als Ausgangspunkt, bei sp\u00e4teren qualifizierten Vereinbarungen j\u00fcngstes Vereinbarungsdatum; ab diesem Ereignistag zehn Kalenderjahre berechnen. Gleichdatierte Vereinbarungen ver\u00e4ndern den Ausgangspunkt nicht mehrfach. Sechsmonatige K\u00fcndigungsfrist und Zweiwochenr\u00fcckzahlung489III separat ab ihren jeweils tats\u00e4chlichen Ausl\u00f6sern. Keine automatische F\u00e4lligkeit, K\u00fcndigungserkl\u00e4rung oder Einstufung beliebiger Vertrags\u00e4nderungen als Fristneustart.")
 ergebnis
}
