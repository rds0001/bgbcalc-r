betreuungen_im_qualifizierten_zweijahresfenster <- function(prueftag=NULL, rueckblick_erster_tag=NULL, betreuungszeitraeume=NULL, einordnungsnachweis=NULL) {
 tag <- .datum(prueftag,'prueftag');anfang <- .datum(rueckblick_erster_tag,'rueckblick_erster_tag');.text(einordnungsnachweis,'einordnungsnachweis')
 if(anfang>tag) .fehler('rueckblick_erster_tag','Fensterbeginn darf nicht nach Pr\u00fcftag liegen.')
 .vorhanden(betreuungszeitraeume,'betreuungszeitraeume')
 if(!is.list(betreuungszeitraeume) || !is.null(names(betreuungszeitraeume)) || length(betreuungszeitraeume)>1000) .fehler('betreuungszeitraeume','Liste0..1000 erforderlich.')
 gesehen <- character();ids <- list()
 for(z in betreuungszeitraeume) {
  if(!is.list(z) || length(z)!=3 || !setequal(names(z),c('betreuungs_id','erster_tag','letzter_tag'))) .fehler('betreuungszeitraeume','Genau betreuungs_id,erster_tag,letzter_tag erforderlich.')
  kennung <- .text(z$betreuungs_id,'betreuungs_id');a <- .datum(z$erster_tag,'erster_tag');b <- .datum(z$letzter_tag,'letzter_tag')
  schluessel <- paste(nchar(kennung),kennung,.iso(a),.iso(b),sep='|')
  if(schluessel %in% gesehen || a>b) .fehler('betreuungszeitraeume','Keine identischen doppelten Zeitr\u00e4ume; Beginn darf nicht nach Ende liegen.')
  gesehen <- c(gesehen,schluessel)
  if(a<=tag && b>=anfang && !(kennung %in% unlist(ids))) ids[[length(ids)+1]] <- kennung
 }
 wert <- list(beruecksichtigte_betreuungs_ids=ids,anzahl_betreuungen=length(ids),mehr_als_eine_betreuung=length(ids)>1)
 eingaben <- list(prueftag=prueftag, rueckblick_erster_tag=rueckblick_erster_tag, betreuungszeitraeume=betreuungszeitraeume, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"anzahl_und_wahrheitswert","BGB_BETREUUNGEN_IM_QUALIFIZIERTEN_ZWEIJAHRESFENSTER",eingaben,list(list(operation="Eindeutige Betreuungen im qualifizierten Zweijahresfenster z\u00e4hlen und strikt mit eins vergleichen.")),eingaben)
 ergebnis$hinweise <- list("\u00a71861II: Zahl unterschiedlicher Betreuungen z\u00e4hlen, die am Pr\u00fcftag gef\u00fchrt werden oder das vorqualifizierte eingeschlossene Zweijahresfenster schneiden. Mehr als eine bedeutet strikt mindestens zwei; nicht Anzahl einzelner T\u00e4tigkeitstage oder unterschiedlicher Betreuer. Keine automatische Pflichtbefreiung oder Festlegung eines ungekl\u00e4rten r\u00fcckw\u00e4rts zu berechnenden Grenztags. Nicht zusammenh\u00e4ngende Zeitr\u00e4ume derselben Betreuung werden getrennt auf Schnittmenge gepr\u00fcft; gez\u00e4hlt wird die eindeutige Betreuung, nicht ihre Zeitr\u00e4ume.")
 ergebnis
}
