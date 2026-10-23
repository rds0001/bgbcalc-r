erbteile_qualifizierte_uebertragungskette <- function(erben_ids=NULL, ursprungsanteile=NULL, uebertragungsschritte=NULL, einordnungsnachweis=NULL) {
 .text(einordnungsnachweis,'einordnungsnachweis')
 listen <- list(erben_ids,ursprungsanteile,uebertragungsschritte)
 for(i in seq_along(listen)) {
  .vorhanden(listen[[i]],c('erben_ids','ursprungsanteile','uebertragungsschritte')[[i]])
  if(!is.list(listen[[i]])||!is.null(names(listen[[i]]))||length(listen[[i]])<(if(i==3) 0 else 1)||length(listen[[i]])>1000) .fehler('listen','Begrenzte Liste erforderlich.')
 }
 personen <- vapply(erben_ids,function(x).text(x,'erbe_id'),character(1))
 if(anyDuplicated(personen)) .fehler('erben_ids','Doppelte Kennung.')
 urspruenge <- character();bestand <- list();gesamt <- .bruch(0)
 for(a in ursprungsanteile) {
  if(!is.list(a)||length(a)!=3||!setequal(names(a),c('ursprung_id','erbe_id','erbquote'))) .fehler('ursprungsanteile','Genau Ursprung, Erbe und Quote erforderlich.')
  u <- .text(a$ursprung_id,'ursprung_id');e <- .text(a$erbe_id,'erbe_id');q <- .geld(a$erbquote);j <- match(e,personen);i <- match(u,urspruenge)
  if(is.na(j)||.vergleichen(q,.bruch(0))<=0||.vergleichen(q,.bruch(1))>0) .fehler('ursprungsanteile','Bekannter Erbe und positive Quote bis1erforderlich.')
  if(is.na(i)) { urspruenge <- c(urspruenge,u);i <- length(urspruenge);bestand[[i]] <- rep(list(.bruch(0)),length(personen)) }
  if(.vergleichen(bestand[[i]][[j]],.bruch(0))>0) .fehler('ursprungsanteile','Doppeltes Ursprung-Erbe-Paar.')
  bestand[[i]][[j]] <- q;gesamt <- .addieren(gesamt,q)
 }
 if(.vergleichen(gesamt,.bruch(1))>0) .fehler('ursprungsanteile','Gesamtquote darf1nicht uebersteigen.')
 for(s in uebertragungsschritte) {
  if(!is.list(s)||length(s)!=4||!setequal(names(s),c('abgebender_erbe_id','ursprung_ids','uebertragungsquote','empfaenger'))) .fehler('uebertragungsschritte','Genau Abgebender, Urspruenge, Uebertragungsquote und Empfaenger erforderlich.')
  v <- .text(s$abgebender_erbe_id,'abgebender_erbe_id');j <- match(v,personen);us <- s$ursprung_ids;emp <- s$empfaenger;q <- .geld(s$uebertragungsquote)
  if(is.na(j)||.vergleichen(q,.bruch(0))<=0||.vergleichen(q,.bruch(1))>0||!is.list(us)||!is.null(names(us))||length(us)<1||length(us)>1000||!is.list(emp)||!is.null(names(emp))||length(emp)<1||length(emp)>1000) .fehler('uebertragungsschritte','Gueltige Person, positive Quote bis1und begrenzte nichtleere Listen erforderlich.')
  us <- vapply(us,function(u).text(u,'ursprung_id'),character(1));indices <- match(us,urspruenge)
  if(anyDuplicated(us)||anyNA(indices)||any(vapply(indices,function(i).vergleichen(bestand[[i]][[j]],.bruch(0))<=0,logical(1)))) .fehler('ursprung_ids','Eindeutige beim Abgebenden vorhandene Urspruenge erforderlich.')
  empids <- character();gewichte <- list();summe <- .bruch(0)
  for(a in emp) {
   if(!is.list(a)||length(a)!=2||!setequal(names(a),c('erbe_id','verteilungsgewicht'))) .fehler('empfaenger','Genau Erbe und Gewicht erforderlich.')
   e <- .text(a$erbe_id,'erbe_id');g <- .geld(a$verteilungsgewicht)
   if(!e %in% personen||e==v||e %in% empids||.vergleichen(g,.bruch(0))<=0) .fehler('empfaenger','Eindeutiger anderer bekannter Erbe mit positivem Gewicht erforderlich.')
   empids <- c(empids,e);gewichte[[length(empids)]] <- g;summe <- .addieren(summe,g)
  }
  for(i in indices) {
   transfer <- .multiplizieren(bestand[[i]][[j]],q);bestand[[i]][[j]] <- .subtrahieren(bestand[[i]][[j]],transfer)
   for(k in seq_along(empids)) { z <- match(empids[[k]],personen);bestand[[i]][[z]] <- .addieren(bestand[[i]][[z]],.multiplizieren(transfer,.dividieren(gewichte[[k]],summe))) }
  }
 }
 summen <- rep(list(.bruch(0)),length(personen));zeilen <- list()
 for(i in seq_along(urspruenge)) for(j in seq_along(personen)) {
  q <- bestand[[i]][[j]];summen[[j]] <- .addieren(summen[[j]],q)
  if(.vergleichen(q,.bruch(0))>0) zeilen[[length(zeilen)+1]] <- list(ursprung_id=urspruenge[[i]],erbe_id=personen[[j]],erbquote=.bruchteile(q))
 }
 wert <- list(sonderteile_nach_ursprung=zeilen,gesamtquoten=lapply(seq_along(personen),function(j)list(erbe_id=personen[[j]],erbquote=.bruchteile(summen[[j]]))),erfasste_gesamtquote=.bruchteile(gesamt))
 eingaben <- list(erben_ids=erben_ids, ursprungsanteile=ursprungsanteile, uebertragungsschritte=uebertragungsschritte, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"erbquoten","BGB_ERBTEILE_QUALIFIZIERTE_UEBERTRAGUNGSKETTE",eingaben,list(list(operation="Qualifizierte Anteilstransfers chronologisch exakt verteilen, Restanteile fortschreiben und Sonderteile nach Urspruengen erhalten.")),eingaben)
 ergebnis$hinweise <- list("\u00a7\u00a72094/2095/2098/2099: rein rechnerische Fortfuehrung rechtlich bestimmter einzelner Uebertragungsschritte. Je ausgewahltem Ursprungsanteil aktuelle Quote des Abgebenden mit Uebertragungsquote multiplizieren, danach nach qualifizierten relativen Gewichten auf Empfaenger verteilen; Rest beim Abgebenden belassen. Jede spaetere Stufe verwendet den fortgeschriebenen Bestand, jeder angewachsene Sonderteil behaelt seinen Ursprung2095. Verschachtelte Gruppenvorraenge, individuelle Sperren und Ersatzerben bestimmen den rechtlich vorgegebenen Empfaengerkreis je Stufe; sie sind keine automatisch aus Namen erschlossene Familientopologie. Relative Gewichte muessen zum jeweiligen Normfall passen, insbesondere nicht blind aktuelle durch vorherige Anwachsung vergroesserte Gesamtquoten als urspruengliche Einsetzungsgewichte verwenden. Vorhandene2094/2098Grundfunktionen koennen passende Empfaenger-/Quotenbelege liefern. Nicht zu uebertragende oder rechtlich ungekl\u00e4rte Teile bleiben getrennt; keine automatische Zuteilung an gesetzliche Erben. Gesamtquoten nur Summen, keine Aufhebung von Verm\u00e4chtnis-/Auflagen-/Ausgleichungslasten am Ursprung. Keine Aussage, dass ein konkreter Wegfallgrund oder eine konkrete Testamentseinsetzung wirksam ist.")
 ergebnis
}
