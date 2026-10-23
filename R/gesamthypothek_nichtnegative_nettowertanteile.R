gesamthypothek_nichtnegative_nettowertanteile <- function(zu_verteilender_hypothekenbetrag=NULL, grundstuecke=NULL, gewichtsmethode=NULL, verteilungsnachweis=NULL) {
 .geld(zu_verteilender_hypothekenbetrag);.text(verteilungsnachweis,'verteilungsnachweis');.auswahl(gewichtsmethode,'gewichtsmethode',c('positive_nettowerte'));.vorhanden(grundstuecke,'grundstuecke')
 if(!is.list(grundstuecke)||!is.null(names(grundstuecke))||length(grundstuecke)<1||length(grundstuecke)>1000) .fehler('grundstuecke','Liste1..1000erforderlich.')
 namen <- character();netto <- list();vorbereitet <- list();summe <- .bruch(0)
 for(p in grundstuecke) {
  if(!is.list(p)||length(p)!=3||!setequal(names(p),c('grundstueck_id','grundstueckswert','vorrangige_belastungen'))) .fehler('grundstuecke','Genau Kennung,Wert und Vorranglasten erforderlich.')
  name <- .text(p$grundstueck_id,'grundstueck_id');roh <- .subtrahieren(.geld(p$grundstueckswert),.geld(p$vorrangige_belastungen));g <- if(.vergleichen(roh,.bruch(0))<0).bruch(0) else roh
  if(name %in% namen) .fehler('grundstueck_id','JedesGrundst\u00fccknurEinmal.')
  namen <- c(namen,name);summe <- .addieren(summe,g);netto[[length(namen)]] <- list(grundstueck_id=name,roher_nettowert=.bruchteile(roh),verteilungsgewicht=.bruchteile(g));vorbereitet[[length(namen)]] <- list(grundstueck_id=name,grundstueckswert=.bruchteile(g),vorrangige_belastungen='0')
 }
 bestimmbar <- .vergleichen(summe,.bruch(0))>0
 anteile <- if(bestimmbar)gesamthypothek_wertanteile(zu_verteilender_hypothekenbetrag,vorbereitet,verteilungsnachweis)$wert else NULL
 wert <- list(nettowerte=netto,quoten_bestimmbar=bestimmbar,anteile=anteile)
 eingaben <- list(zu_verteilender_hypothekenbetrag=zu_verteilender_hypothekenbetrag, grundstuecke=grundstuecke, gewichtsmethode=gewichtsmethode, verteilungsnachweis=verteilungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR_und_Quoten","BGB_GESAMTHYPOTHEK_NICHTNEGATIVE_NETTOWERTANTEILE",eingaben,list(list(operation="Rohnettowerte und nichtnegative qualifizierte Gewichte bestimmen; vorhandenen Quotenkern nur bei positiver Gewichtssumme anwenden.")),eingaben)
 ergebnis$hinweise <- list("Bedingte Nettowertrechnung: urspr\u00fcnglichen Wert minus qualifizierte vorrangige Belastungen ausweisen; unter ausdr\u00fccklich vorgegebener Methode positive_nettowerte Verteilungsgewicht=max(Rohsaldo,0). Bestehenden1172-Quotenkern mit diesen abgeleiteten Gewichten verwenden, Vorrang nicht doppelt abziehen. Bei Gewichtssumme0keine Division/keine k\u00fcnstliche Kopfquote: quoten_bestimmbar=false, anteile=None/NULL; die Rohsalden bleiben ausgewiesen. Gesetzliche Vorschrift liefert f\u00fcr0/0keine feste Ersatzquote. Keine automatische Bewertung der Vorranglast, Verwertung oder rechtliche Freigabe des Nullgewichtsmodells in jedem Streitfall.1174-Regress und1176/1182-Rangschutz gesondert.")
 ergebnis
}
