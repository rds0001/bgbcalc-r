gesellschaft_gewinn_verlust_stimmquoten <- function(gesellschafter=NULL,quotenbasis=NULL,einordnungsnachweis=NULL) {
 .auswahl(quotenbasis,'quotenbasis',c('beteiligungsverhaeltnisse','beitragswerte','gleiche_anteile'))
 .text(einordnungsnachweis,'einordnungsnachweis'); .vorhanden(gesellschafter,'gesellschafter')
 if(!is.list(gesellschafter) || !is.null(names(gesellschafter)) || length(gesellschafter)<2 || length(gesellschafter)>1000) .fehler('gesellschafter','Vollst\u00e4ndige Liste mit2bis1000 Gesellschaftern erforderlich.')
 namen <- character(); gewichte <- list(); summe <- .bruch(0)
 for(person in gesellschafter) {
  if(!is.list(person) || !identical(sort(names(person)),sort(c('gesellschafter_id','gewicht')))) .fehler('gesellschafter','Genau gesellschafter_id und gewicht erforderlich.')
  kennung <- .text(person$gesellschafter_id,'gesellschafter_id')
  if(kennung %in% namen) .fehler('gesellschafter_id','Gesellschafterkennungen m\u00fcssen eindeutig sein.')
  if(quotenbasis=='gleiche_anteile') {
   if(!is.null(person$gewicht)) .fehler('gewicht','Bei Gleichanteilen muss gewicht ausdr\u00fccklich null sein.')
   gewicht <- .bruch(1)
  } else gewicht <- .geld(person$gewicht)
  namen <- c(namen,kennung); gewichte[[length(gewichte)+1]] <- gewicht; summe <- .addieren(summe,gewicht)
 }
 if(.vergleichen(summe,.bruch(0))==0) .fehler('gewicht','Summe der vereinbarten Verh\u00e4ltnisse oder Beitragswerte muss positiv sein.')
 wert <- lapply(seq_along(namen),function(i) list(gesellschafter_id=namen[i],quote=.bruchteile(.dividieren(gewichte[[i]],summe))))
 eingaben <- list(gesellschafter=gesellschafter,quotenbasis=quotenbasis,einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,'quoten','BGB_GESELLSCHAFT_GEWINN_VERLUST_STIMMQUOTEN',eingaben,list(list(operation='Je Gesellschafter vereinbartes Gewicht durch Summe teilen; ohne Beteiligungsverh\u00e4ltnis und vereinbarten Beitragswert je1/Anzahl.')),eingaben)
 ergebnis$hinweise <- list("\u00a7709 Absatz3: vereinbarte Beteiligungsverh\u00e4ltnisse gehen vor vereinbarten Beitragswerten; nur wenn beides fehlt Gleichanteile. quotenbasis ist rechtlich qualifiziert auszuw\u00e4hlen, kein freies Wahlrecht zur g\u00fcnstigeren Quote. Beteiligungsgewichte sind relative Verh\u00e4ltnisse, Beitragswerte vertraglich vereinbarte gleichartige Werte, keine von der Bibliothek gesch\u00e4tzten tats\u00e4chlichen Leistungen. Vollst\u00e4ndiger identischer Gesellschafterkreis; individuelle Sondervereinbarungen \u00fcber Gewinn/Verlust/Stimmkraft gesondert behandeln. Bei fehlender Wertevereinbarung ausdr\u00fccklich gewicht=null, nicht unbekannte Aktenlage. Beitragsleistungspflichten nach Absatz2 und Aussch\u00fcttungsbetrag nicht berechnet.")
 ergebnis
}
