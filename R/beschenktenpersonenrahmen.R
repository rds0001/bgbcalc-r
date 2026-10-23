pflichtteilsergaenzung_personenbegrenzte_schenkungen <- function(fehlbetrag=NULL, schenkungen=NULL, personenrahmen=NULL, einordnungsnachweis=NULL) {
 .text(einordnungsnachweis,'einordnungsnachweis');.vorhanden(schenkungen,'schenkungen');.vorhanden(personenrahmen,'personenrahmen')
 if(!is.list(schenkungen)||!is.null(names(schenkungen))||length(schenkungen)<1L||length(schenkungen)>1000L||!is.list(personenrahmen)||!is.null(names(personenrahmen))||length(personenrahmen)<1L||length(personenrahmen)>1000L) .fehler('schenkungen_und_personenrahmen','Beide Listen m\u00fcssen1..1000 Eintr\u00e4ge enthalten.')
 rahmen <- list();rahmennamen <- character()
 for(person in personenrahmen) {
  if(!is.list(person)||is.null(names(person))||length(person)!=2L||!setequal(names(person),c('beschenkter_id','gemeinsame_haftungsgrenze'))) .fehler('personenrahmen','Genau beschenkter_id und gemeinsame_haftungsgrenze erforderlich.')
  name <- .text(person$beschenkter_id,'beschenkter_id')
  if(name %in% rahmennamen) .fehler('personenrahmen','Jede Person genau einmal.')
  rahmennamen <- c(rahmennamen,name);rahmen[[length(rahmen)+1L]] <- .geld(person$gemeinsame_haftungsgrenze)
 }
 vorbereitet <- list();namen <- character();raenge <- numeric()
 for(geschenk in schenkungen) {
  if(!is.list(geschenk)||is.null(names(geschenk))||length(geschenk)!=4L||!setequal(names(geschenk),c('schenkung_id','beschenkter_id','schenkungsrang','haftungsgrenze'))) .fehler('schenkungen','Genau schenkung_id, beschenkter_id, schenkungsrang und haftungsgrenze erforderlich.')
  name <- .text(geschenk$beschenkter_id,'beschenkter_id');namen <- c(namen,name)
  raenge <- c(raenge,.ganzzahl(geschenk$schenkungsrang,'schenkungsrang',1,1000));.geld(geschenk$haftungsgrenze)
  vorbereitet[[length(vorbereitet)+1L]] <- geschenk
 }
 if(!setequal(namen,rahmennamen)) .fehler('personenrahmen','Rahmen m\u00fcssen genau die vorkommenden Beschenkten abdecken.')
 for(index in order(raenge,decreasing=TRUE)) {
  p <- vorbereitet[[index]];j <- match(p$beschenkter_id,rahmennamen);einzel <- .geld(p$haftungsgrenze)
  grenze <- if(.vergleichen(einzel,rahmen[[j]])<=0) einzel else rahmen[[j]]
  rahmen[[j]] <- .subtrahieren(rahmen[[j]],grenze);p$haftungsgrenze <- .bruchteile(grenze);vorbereitet[[index]] <- p
 }
 wert <- pflichtteilsergaenzung_schenkungsvorgaenge(fehlbetrag,vorbereitet,TRUE,einordnungsnachweis)$wert
 eingaben <- list(fehlbetrag=fehlbetrag, schenkungen=schenkungen, personenrahmen=personenrahmen, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_PFLICHTTEILSERGAENZUNG_PERSONENBEGRENZTE_SCHENKUNGEN",eingaben,list(list(operation="Gemeinsamen Personenrahmen einmalig in absteigender Schenkungsrangfolge auf Vorgangsgrenzen verteilen und vorhandenen2329-Rangkern auf begrenzte Vorg\u00e4nge anwenden.")),eingaben)
 ergebnis$hinweise <- list("\u00a72329III: zeitlich eindeutig geordnete Schenkungen, gegebenenfalls mehrfach an dieselbe Person. Gemeinsamen rechtlich bestimmten Personenrahmen nur einmal verwenden und sp\u00e4teren Schenkungen vorrangig zuordnen; anschlie\u00dfend vorhandenen Schenkungsrang-/Empf\u00e4ngersummenkern anwenden. Rahmen m\u00fcssen f\u00fcr diesen Erg\u00e4nzungsanspruch tats\u00e4chlich rechtlich gelten, etwa nach vorqualifizierter Bereicherungs-/Einwendungsbewertung; keine automatisch erfundene Gesamtverm\u00f6gens-, Selbstbehalts- oder Zahlungsf\u00e4higkeitsgrenze. Einzelgrenzen und gemeinsamer Rahmen d\u00fcrfen nicht dieselbe K\u00fcrzung doppelt enthalten. Bereits geleistete Erf\u00fcllung und weitere konkurrierende Berechtigte gesondert. Gleichzeitige Schenkungen weiterhin au\u00dferhalb, keine erfundene Gleichquote oder Gesamtschuld. Ausgabe numerische Haftungs-/Befriedigungsgrenzen, kein automatischer gew\u00f6hnlicher Geldanspruch aus Sachherausgabe.")
 ergebnis
}
