landpacht_anfrage_im_drittletzten_pachtjahr <- function(anfrage_am=NULL, pachtjahre=NULL, einordnungsnachweis=NULL) {
 anfrage <- .datum(anfrage_am,'anfrage_am');.text(einordnungsnachweis,'einordnungsnachweis');.vorhanden(pachtjahre,'pachtjahre')
 if(!is.list(pachtjahre) || !is.null(names(pachtjahre)) || length(pachtjahre)<3 || length(pachtjahre)>1000) .fehler('pachtjahre','Liste3..1000 erforderlich.')
 namen <- character();abschnitte <- list()
 for(p in pachtjahre) {
  if(!is.list(p) || length(p)!=3 || !setequal(names(p),c('pachtjahr_id','erster_tag','letzter_tag'))) .fehler('pachtjahre','Genau Kennung und beide Tagesgrenzen erforderlich.')
  name <- .text(p$pachtjahr_id,'pachtjahr_id');a <- .datum(p$erster_tag,'erster_tag');b <- .datum(p$letzter_tag,'letzter_tag')
  if(name %in% namen || a>b || (length(abschnitte)>0 && a!=.tage_addieren(abschnitte[[length(abschnitte)]]$b,1))) .fehler('pachtjahre','Eindeutige l\u00fcckenlose geordnete Pachtjahrsfolge erforderlich.')
  namen <- c(namen,name);abschnitte[[length(abschnitte)+1]] <- list(a=a,b=b)
 }
 if(abschnitte[[length(abschnitte)]]$b < .frist(.iso(abschnitte[[1]]$a),3,'jahre','tagesbeginn')) .fehler('pachtjahre','Mindestens dreij\u00e4hrige Vertragsdauer erforderlich.')
 a <- abschnitte[[length(abschnitte)-2]]$a;b <- abschnitte[[length(abschnitte)-2]]$b
 wert <- list(drittletztes_pachtjahr_erster_tag=.iso(a),drittletztes_pachtjahr_letzter_tag=.iso(b),anfrage_im_drittletzten_pachtjahr=a<=anfrage && anfrage<=b)
 eingaben <- list(anfrage_am=anfrage_am, pachtjahre=pachtjahre, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"daten_und_wahrheitswert","BGB_LANDPACHT_ANFRAGE_IM_DRITTLETZTEN_PACHTJAHR",eingaben,list(list(operation="Drittletztes qualifiziertes Pachtjahr ausw\u00e4hlen und Anfragezeitpunkt vergleichen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7594: dritten Pachtjahresabschnitt von hinten aus der vollst\u00e4ndigen rechtlich qualifizierten Vertragsfolge ausw\u00e4hlen und Anfragezugang mit seinen eingeschlossenen Kalendertagen vergleichen. Zus\u00e4tzlich mindestens dreij\u00e4hrige Vertragsdauer ab erstem eingeschlossenem Kalendertag pr\u00fcfen. Pachtjahre sind keine automatisch gleichgesetzten Kalenderjahre; rechtliche Pachtjahrsfolge ausdr\u00fccklich Eingabe. Kein automatischer Fortsetzungsentscheid oder \u00dcbergehen fehlender Vertragsjahre.")
 ergebnis
}
