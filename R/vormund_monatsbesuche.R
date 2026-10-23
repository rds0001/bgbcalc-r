vormund_monatliche_besuchszahlen <- function(pruefmonate=NULL, besuche=NULL, einordnungsnachweis=NULL) {
 .vorhanden(pruefmonate,'pruefmonate');.vorhanden(besuche,'besuche');.text(einordnungsnachweis,'einordnungsnachweis')
 if(!is.list(pruefmonate) || !is.null(names(pruefmonate)) || length(pruefmonate)<1 || length(pruefmonate)>1000) .fehler('pruefmonate','Liste1..1000 erforderlich.')
 if(!is.list(besuche) || !is.null(names(besuche)) || length(besuche)>10000) .fehler('besuche','Liste0..10000 erforderlich.')
 monatsnamen <- character()
 for(monat in pruefmonate) {
  .text(monat,'pruefmonate')
  if(!grepl('^[0-9]{4}-[0-9]{2}$',monat) || monat %in% monatsnamen) .fehler('pruefmonate','Eindeutige MonateYYYY-MM erforderlich.')
  .datum(paste0(monat,'-01'),'pruefmonate');monatsnamen <- c(monatsnamen,monat)
 }
 monatsnamen <- sort(monatsnamen);zahlen <- rep(0,length(monatsnamen));namen <- character();ausserhalb <- 0
 for(besuch in besuche) {
  if(!is.list(besuch) || length(besuch)!=2 || !setequal(names(besuch),c('besuch_id','besuch_am'))) .fehler('besuche','Genau Besuchskennung und Datum erforderlich.')
  name <- .text(besuch$besuch_id,'besuch_id');.datum(besuch$besuch_am,'besuch_am')
  if(name %in% namen) .fehler('besuch_id','Eindeutige Besuche erforderlich.')
  namen <- c(namen,name);index <- match(substr(besuch$besuch_am,1,7),monatsnamen)
  if(is.na(index)) ausserhalb <- ausserhalb+1 else zahlen[index] <- zahlen[index]+1
 }
 wert <- list(monate=lapply(seq_along(monatsnamen),function(i) list(monat=monatsnamen[i],besuchszahl=zahlen[i],regelmaessiger_mindestbesuch_erreicht=zahlen[i]>=1)),alle_monate_mit_mindestbesuch=all(zahlen>=1),besuche_ausserhalb_pruefmonate=ausserhalb)
 eingaben <- list(pruefmonate=pruefmonate, besuche=besuche, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"anzahlen_und_wahrheitswerte","BGB_VORMUND_MONATLICHE_BESUCHSZAHLEN",eingaben,list(list(operation="Tats\u00e4chliche Besuchszahlen je ausgew\u00e4hltem Kalendermonat z\u00e4hlen und mit mindestens einem Besuch vergleichen.")),eingaben)
 ergebnis$hinweise <- list("\u00a71790III nennt in der Regel einmal im Monat. Die Funktion z\u00e4hlt tats\u00e4chliche Besuche je qualifiziertem Kalendermonat und vergleicht mit mindestens1; sie ersetzt dies nicht durch starre30-Tage-Abst\u00e4nde. Alle ausgew\u00e4hlten Monate werden ausgewiesen, auch ohne Besuch. Besuche au\u00dferhalb der Pr\u00fcfmonate werden gesondert gez\u00e4hlt. K\u00fcrzere/l\u00e4ngere gebotene Besuchsabst\u00e4nde, ein anderer Ort, Beginn/Ende der Vormundschaft und qualitative Kontaktpflichten sind rechtlich zu bestimmen; keine automatische Pflichtverletzungs- oder Haftungsentscheidung. Mehrere M\u00fcndel getrennt auswerten.")
 ergebnis
}
