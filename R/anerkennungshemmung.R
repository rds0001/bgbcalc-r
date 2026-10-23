anerkennung_fuenfjahresfrist_mit_hemmung <- function(fristausloesung_am=NULL, ruecknahmezeitraeume=NULL, aufschiebende_wirkung_zeitraeume=NULL, einordnungsnachweis=NULL) {
 beginn <- .datum(fristausloesung_am,'fristausloesung_am')
 .text(einordnungsnachweis,'einordnungsnachweis')
 intervalle <- function(eingabe,parameter) {
  .vorhanden(eingabe,parameter)
  if(!is.list(eingabe) || !is.null(names(eingabe)) || length(eingabe)>1000) .fehler(parameter,'Liste mit h\u00f6chstens1000Intervallen erforderlich.')
  ergebnis <- list()
  for(z in eingabe) {
   if(!is.list(z) || !identical(sort(names(z)),sort(c('erster_tag','letzter_tag')))) .fehler(parameter,'Genau erster_tag und letzter_tag erforderlich.')
   a <- as.numeric(.datum(z$erster_tag,'erster_tag'));b <- as.numeric(.datum(z$letzter_tag,'letzter_tag'))
   if(a>b) .fehler(parameter,'Intervallende liegt vor Beginn.')
   ergebnis <- c(ergebnis,list(c(a,b)))
  }
  vereinigt <- list()
  if(length(ergebnis)) for(ab in ergebnis[order(vapply(ergebnis,function(z) z[1],numeric(1)))]) {
   k <- length(vereinigt)
   if(k>0 && ab[1]<=vereinigt[[k]][2]+1) vereinigt[[k]][2] <- max(vereinigt[[k]][2],ab[2]) else vereinigt <- c(vereinigt,list(ab))
  }
  vereinigt
 }
 ruecknahmen <- intervalle(ruecknahmezeitraeume,'ruecknahmezeitraeume')
 ausnahmen <- intervalle(aufschiebende_wirkung_zeitraeume,'aufschiebende_wirkung_zeitraeume')
 wirksam <- list()
 for(ab in ruecknahmen) {
  teile <- list(ab)
  for(cd in ausnahmen) {
   neu <- list()
   for(xy in teile) {
    if(cd[2]<xy[1] || cd[1]>xy[2]) neu <- c(neu,list(xy)) else {
     if(xy[1]<cd[1]) neu <- c(neu,list(c(xy[1],cd[1]-1)))
     if(xy[2]>cd[2]) neu <- c(neu,list(c(cd[2]+1,xy[2])))
    }
   }
   teile <- neu
  }
  for(xy in teile) wirksam <- c(wirksam,list(list(erster_gehemmter_tag=.iso(as.Date(xy[1],origin='1970-01-01')),letzter_gehemmter_tag=.iso(as.Date(xy[2],origin='1970-01-01')))))
 }
 grundende <- .frist(fristausloesung_am,5,'jahre','ereignis')
 kern <- verjaehrung_gehemmte_kalendertage(.iso(.tage_addieren(beginn,1)),.iso(grundende),wirksam,TRUE)
 wert <- c(list(grundfrist_letzter_tag=.iso(grundende)),kern$wert)
 eingaben <- list(fristausloesung_am=fristausloesung_am, ruecknahmezeitraeume=ruecknahmezeitraeume, aufschiebende_wirkung_zeitraeume=aufschiebende_wirkung_zeitraeume, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"daten_und_tage","BGB_ANERKENNUNG_FUENFJAHRESFRIST_MIT_HEMMUNG",eingaben,list(list(operation="F\u00fcnfjahresfrist berechnen; gerichtlich angeordnete aufschiebende Wirkungszeiten aus R\u00fccknahmehemmung ausschneiden und verbleibende Hemmungstage vereinigt ber\u00fccksichtigen.")),eingaben)
 ergebnis$hinweise <- list("\u00a71598II: F\u00fcnfjahresgrundlauf ab qualifiziertem Register-/Beurkundungsereignis. Von den abgeschlossenen qualifizierten R\u00fccknahmeintervallen die Intervalle angeordneter aufschiebender Wirkung abziehen; verbleibende Tage vereinigen und nicht mitz\u00e4hlen. Blo\u00dfe Rechtsbehelfseinlegung ist keine automatische aufschiebende Wirkung. Alle Intervalle m\u00fcssen rechtlich taggenau normalisiert sein; offene oder unbekannte Enden nicht durch erfundene Daten ersetzen. Eine nach bereits abgeschlossenem Fristlauf eintretende R\u00fccknahme setzt keine neue Frist in Gang. Keine automatische Anerkennungswirksamkeit, Ausl\u00e4nderbeh\u00f6rdenentscheidung oder Feiertagsverschiebung.")
 ergebnis
}
