pflichtteilsergaenzung_schenkungsvorgaenge <- function(fehlbetrag=NULL,schenkungen=NULL,vorgangsgrenzen_qualifiziert=NULL,einordnungsnachweis=NULL) {
 .vorhanden(schenkungen,'schenkungen')
 if(!is.list(schenkungen)||!is.null(names(schenkungen))||length(schenkungen)<1||length(schenkungen)>1000) .fehler('schenkungen','Liste1..1000 zeitlich eindeutig geordneter Schenkungsvorg\u00e4nge erforderlich.')
 kernliste <- list();empfaenger <- character()
 for(p in schenkungen) {
  if(!is.list(p)||!identical(sort(names(p)),sort(c('schenkung_id','beschenkter_id','schenkungsrang','haftungsgrenze')))) .fehler('schenkungen','Genau schenkung_id, beschenkter_id, schenkungsrang und haftungsgrenze erforderlich.')
  empfaenger <- c(empfaenger,.text(p$beschenkter_id,'beschenkter_id'))
  kernliste[[length(kernliste)+1L]] <- list(beschenkter_id=p$schenkung_id,schenkungsrang=p$schenkungsrang,haftungsgrenze=p$haftungsgrenze)
 }
 kern <- pflichtteilsergaenzung_beschenktenrang(fehlbetrag,kernliste,vorgangsgrenzen_qualifiziert,einordnungsnachweis)
 wert <- NULL
 if(!is.null(kern$wert)) {
  namen <- unique(empfaenger);summen <- lapply(namen,function(x) .bruch(0));vorgaenge <- list()
  for(i in seq_along(schenkungen)) {
   p <- schenkungen[[i]];name <- empfaenger[[i]];q <- kern$wert$zugeordnete_haftung[[i]];betrag <- .zahleneingabe(q$haftungsbetrag);j <- match(name,namen)
   summen[[j]] <- .addieren(summen[[j]],betrag)
   vorgaenge[[i]] <- list(schenkung_id=p$schenkung_id,beschenkter_id=name,haftungsbetrag=q$haftungsbetrag)
  }
  wert <- list(haftung_je_schenkung=vorgaenge,haftung_je_beschenktem=lapply(seq_along(namen),function(i) list(beschenkter_id=namen[[i]],haftungsbetrag=.bruchteile(summen[[i]]))),nicht_gedeckter_fehlbetrag=kern$wert$nicht_gedeckter_fehlbetrag)
 }
 eingaben <- list(fehlbetrag=fehlbetrag,schenkungen=schenkungen,vorgangsgrenzen_qualifiziert=vorgangsgrenzen_qualifiziert,einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,'EUR','BGB_PFLICHTTEILSERGAENZUNG_SCHENKUNGSVORGAENGE',eingaben,list(list(operation='Zeitlich eindeutige Schenkungsvorg\u00e4nge sp\u00e4tere zuerst mit vorhandenem Haftungsgrenzenkern verteilen; Vorgangsanteile je wiederholt Beschenktem summieren')),eingaben)
 ergebnis$status <- if(!is.null(wert)) 'BERECHNET' else 'NICHT_ANWENDBAR'
 ergebnis$annahmen <- list("Jede Schenkung mit eindeutiger zeitlicher Rangposition und rechtlich vorqualifizierter eigener \u00fcberschneidungsfreier Haftungsgrenze; Empf\u00e4nger d\u00fcrfen mehrfach vorkommen.")
 ergebnis$hinweise <- list("schenkung_id und Rang m\u00fcssen eindeutig sein, beschenkter_id darf wiederholt werden. H\u00f6herer Rang bedeutet sp\u00e4terer Vorgang; nicht pauschal alle Geschenke eines Empf\u00e4ngers auf dessen letzten Zeitpunkt zusammenziehen. Grenzen je Vorgang bereits nach Bereicherungsrecht,2319/2328-Schutz soweit einschl\u00e4gig und sonstigen Einwendungen qualifizieren; eine gemeinsame personenbezogene Haftungsgrenze nicht mehrfach als selbst\u00e4ndige Vorgangsgrenze verwenden. Keine blo\u00df tats\u00e4chliche Zahlungsunf\u00e4higkeit anstelle rechtlicher Nichtverpflichtung. Gleichzeitige Schenkungen und ungekl\u00e4rte Rangfolge bleiben au\u00dferhalb, keine erfundene Gleichquote oder Gesamtschuldregel. Geldwerte nur numerische Haftungs-/Befriedigungsgrenzen, keine automatische Geldschuld aus Sachherausgabe.")
 ergebnis
}
