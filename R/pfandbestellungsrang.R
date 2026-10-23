pfandrechte_bestellungsrang <- function(pfandrechte=NULL, einordnungsnachweis=NULL) {
 .vorhanden(pfandrechte,'pfandrechte');.text(einordnungsnachweis,'einordnungsnachweis')
 if(!is.list(pfandrechte) || !is.null(names(pfandrechte)) || length(pfandrechte)<1 || length(pfandrechte)>1000) .fehler('pfandrechte','Liste1..1000 erforderlich.')
 kennungen <- character();zeiten <- character()
 for(p in pfandrechte) {
  if(!is.list(p) || !identical(sort(names(p)),sort(c('pfandrecht_id','bestellung_am_utc')))) .fehler('pfandrechte','Genau pfandrecht_id und bestellung_am_utc erforderlich.')
  kennung <- .text(p$pfandrecht_id,'pfandrecht_id')
  if(kennung %in% kennungen) .fehler('pfandrecht_id','Doppelte Kennung unzul\u00e4ssig.')
  kennungen <- c(kennungen,kennung);.reise_utc_zeitpunkt(p$bestellung_am_utc,'bestellung_am_utc');zeiten <- c(zeiten,p$bestellung_am_utc)
 }
 gruppen <- sort(unique(zeiten));wert <- list()
 for(p in pfandrechte) wert <- c(wert,list(list(pfandrecht_id=p$pfandrecht_id,ranggruppe=match(p$bestellung_am_utc,gruppen))))
 eingaben <- list(pfandrechte=pfandrechte, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"ranggruppen","BGB_PFANDRECHTE_BESTELLUNGSRANG",eingaben,list(list(operation="Pfandrechte nach qualifizierter wirksamer Bestellungszeit in zeitlich aufsteigende Ranggruppen einordnen; Gleichzeitigkeit gleichrangig behandeln.")),eingaben)
 ergebnis$hinweise <- list("\u00a71209: fr\u00fchere rechtlich wirksame Bestellung hat niedrigere Ranggruppe, gleichzeitige Bestellung gleiche Ranggruppe. K\u00fcnftige oder bedingte Forderungen verwenden ebenfalls die Bestellungszeit des Pfandrechts. Kein automatischer Rangwechsel, keine Entscheidung \u00fcber Entstehung/Gutgl\u00e4ubigkeit oder Befriedigungsbetr\u00e4ge. Zeitpunkte m\u00fcssen rechtlich ausreichend exakt auf UTC-Sekunden normalisiert sein; unterschiedliche Subsekunden d\u00fcrfen nicht durch Abschneiden zu Gleichrang werden. Bei nicht sekundengenau abbildbarem Sachverhalt diese Funktion nicht verwenden. Ausgabe in Eingabereihenfolge; Ranggruppen sind l\u00fcckenlos numeriert, kein Grundbuchrang nach879.")
 ergebnis
}
