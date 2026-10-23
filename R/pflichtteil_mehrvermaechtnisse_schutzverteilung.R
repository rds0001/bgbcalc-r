pflichtteil_mehrvermaechtnisse_schutzverteilung <- function(erwerbswert_vor_vermaechtnissen=NULL, gesamte_pflichtteilslast=NULL, anderweitig_getragene_last_2323=NULL, vermaechtnisse=NULL, erbenschutz_anwendbar=NULL, eigener_pflichtteilswert=NULL, konkurrenzmodell=NULL, methodennachweis=NULL) {
 n <- .geld(erwerbswert_vor_vermaechtnissen);gesamt <- .geld(gesamte_pflichtteilslast);fremd <- .geld(anderweitig_getragene_last_2323);eigen <- .geld(eigener_pflichtteilswert);schutz_erbe <- .wahrheitswert(erbenschutz_anwendbar,'erbenschutz_anwendbar');.text(methodennachweis,'methodennachweis');.auswahl(konkurrenzmodell,'konkurrenzmodell',c('erbe_vorrangig','bedachte_vorrangig'));.vorhanden(vermaechtnisse,'vermaechtnisse')
 kleiner <- function(a,b)if(.vergleichen(a,b)<0)a else b
 groesser <- function(a,b)if(.vergleichen(a,b)>0)a else b
 if(.vergleichen(gesamt,n)>0||.vergleichen(fremd,gesamt)>0||(!schutz_erbe&&.vergleichen(eigen,.bruch(0))!=0)) .fehler('last_und_schutz','Last h\u00f6chstens Erwerb,anderweitigeLast h\u00f6chstens Gesamtlast; ohneErbenschutz Wert0.')
 if(!is.list(vermaechtnisse)||!is.null(names(vermaechtnisse))||length(vermaechtnisse)<1||length(vermaechtnisse)>1000) .fehler('vermaechtnisse','Liste1..1000erforderlich.')
 namen <- character();werte <- list();schutz <- list();raenge <- numeric();summe <- .bruch(0)
 for(p in vermaechtnisse) {
  if(!is.list(p)||length(p)!=4||!setequal(names(p),c('beschwerung_id','vermaechtniswert','pflichtteilsschutzwert','rang'))) .fehler('vermaechtnisse','Genau Kennung,Wert,Schutzwert und Rang erforderlich.')
  name <- .text(p$beschwerung_id,'beschwerung_id');v <- .geld(p$vermaechtniswert);s <- .geld(p$pflichtteilsschutzwert);r <- .ganzzahl(p$rang,'rang',1,1000)
  if(name %in% namen) .fehler('beschwerung_id','JedeBeschwerungnurEinmal.')
  namen <- c(namen,name);werte[[length(namen)]] <- v;schutz[[length(namen)]] <- kleiner(v,s);raenge <- c(raenge,r);summe <- .addieren(summe,v)
 }
 if(.vergleichen(summe,n)>0) .fehler('vermaechtnisse','Beschwerungssumme h\u00f6chstens Erwerb; vorgelagerte Haftungsbegrenzung gesondert.')
 last <- .subtrahieren(gesamt,fremd);kuerzungen <- rep(list(.bruch(0)),length(werte));grund <- .bruch(0)
 for(i in seq_along(werte)) grund <- .addieren(grund,kleiner(if(.vergleichen(n,.bruch(0))==0).bruch(0) else .multiplizieren(last,.dividieren(werte[[i]],n)),.subtrahieren(werte[[i]],schutz[[i]])))
 verteilen <- function(betrag,grenzen) {
  rest <- betrag
  for(rang in sort(unique(raenge),decreasing=TRUE)) {
   indices <- which(raenge==rang);aus <- .begrenzte_quotenverteilung(rest,werte[indices],grenzen[indices]);rest <- aus$rest
   for(j in seq_along(indices))kuerzungen[[indices[[j]]]] <<- .addieren(kuerzungen[[indices[[j]]]],aus$zugeordnet[[j]])
  }
  rest
 }
 verteilen(grund,lapply(seq_along(werte),function(i).subtrahieren(werte[[i]],schutz[[i]])))
 erbenrest <- function() {s <- .subtrahieren(.subtrahieren(n,summe),last);for(k in kuerzungen)s <- .addieren(s,k);s}
 ziel <- if(schutz_erbe)kleiner(eigen,.subtrahieren(n,summe)) else .bruch(0)
 if(schutz_erbe) {
  bedarf <- groesser(.subtrahieren(ziel,erbenrest()),.bruch(0));rest <- verteilen(bedarf,lapply(seq_along(werte),function(i)groesser(.subtrahieren(.subtrahieren(werte[[i]],kuerzungen[[i]]),schutz[[i]]),.bruch(0))))
  if(konkurrenzmodell=='erbe_vorrangig'&&.vergleichen(rest,.bruch(0))>0)verteilen(rest,lapply(seq_along(werte),function(i).subtrahieren(werte[[i]],kuerzungen[[i]])))
 }
 erbe <- erbenrest();fehl <- if(schutz_erbe)groesser(.subtrahieren(ziel,erbe),.bruch(0)) else .bruch(0)
 wert <- list(verteilung=lapply(seq_along(namen),function(i)list(beschwerung_id=namen[[i]],kuerzungsbetrag=.bruchteile(kuerzungen[[i]]),verbleibender_vermaechtniswert=.bruchteile(.subtrahieren(werte[[i]],kuerzungen[[i]])))),verbleibender_erbenwert=.bruchteile(erbe),ungedeckter_erbenschutz=.bruchteile(fehl))
 eingaben <- list(erwerbswert_vor_vermaechtnissen=erwerbswert_vor_vermaechtnissen, gesamte_pflichtteilslast=gesamte_pflichtteilslast, anderweitig_getragene_last_2323=anderweitig_getragene_last_2323, vermaechtnisse=vermaechtnisse, erbenschutz_anwendbar=erbenschutz_anwendbar, eigener_pflichtteilswert=eigener_pflichtteilswert, konkurrenzmodell=konkurrenzmodell, methodennachweis=methodennachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_PFLICHTTEIL_MEHRVERMAECHTNISSE_SCHUTZVERTEILUNG",eingaben,list(list(operation="Gemeinsame Pflichtteilsk\u00fcrzung und zus\u00e4tzlichen Erbenschutz in getrennten Rangstufen unter individuellen Schutzgrenzen verteilen.")),eingaben)
 ergebnis$hinweise <- list("Bedingtes Mehrbeschwerungsmodell2318/2189/2323: anderweitigeLast zuerst abziehen. Grundk\u00fcrzung je Beschwerung anteiligLast*V_i/Erwerb, h\u00f6chstens positiver \u00dcberschuss \u00fcber individuellen Schutzwert; gemeinsame Grundk\u00fcrzung rangweise auf nachrangige Beschwerungen zuerst verteilen, innerhalb eines Rangs wertproportional mit Obergrenzen. Zus\u00e4tzlichen Erbenschutzbedarf zun\u00e4chst vollst\u00e4ndig aus noch ungesch\u00fctzten Beschwerungsanteilen decken. Nur bei ausdr\u00fccklich qualifiziertem Erbenvorrang darf danach verbleibender Bedarf in gesch\u00fctzte Anteile eingreifen; Bedachtenvorrang l\u00e4sst diesen Fehlbetrag offen. Keine vorbestehende Unterdeckung auf eigenen Pflichtteil auff\u00fcllen: SchutzErbe h\u00f6chstens Erwerb-SummeV, SchutzBedachter h\u00f6chstensV_i. Rang-/Schutzhierarchie ist eine zwingende rechtliche Modellvoraussetzung, keine allgemeine L\u00f6sung aller Auslegungsstreitigkeiten. Negative rechnerische Erbenreste sind offen ausgewiesene Belastung, kein automatisch neuer Anspruch. Keine automatischeGeldforderung beiSachverm\u00e4chtnissen, keine doppelte Gesamtlastaus\u00fcbung pro Verm\u00e4chtnis.")
 ergebnis
}
