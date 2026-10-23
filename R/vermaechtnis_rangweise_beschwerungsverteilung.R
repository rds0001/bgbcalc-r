vermaechtnis_rangweise_beschwerungsverteilung <- function(verfuegbarer_beschwerungsbetrag=NULL, beschwerungen=NULL, verteilungsnachweis=NULL) {
 rest <- .geld(verfuegbarer_beschwerungsbetrag);.text(verteilungsnachweis,'verteilungsnachweis');.vorhanden(beschwerungen,'beschwerungen')
 if(!is.list(beschwerungen)||!is.null(names(beschwerungen))||length(beschwerungen)<1||length(beschwerungen)>1000) .fehler('beschwerungen','Liste1..1000erforderlich.')
 namen <- character();raenge <- numeric();werte <- list();gewichte <- list()
 for(p in beschwerungen) {
  if(!is.list(p)||length(p)!=4||!setequal(names(p),c('beschwerung_id','rang','beschwerungswert','verteilungsgewicht'))) .fehler('beschwerungen','Genau Kennung,Rang,Wert und Gewicht erforderlich.')
  name <- .text(p$beschwerung_id,'beschwerung_id');rang <- .ganzzahl(p$rang,'rang',1,1000);wert <- .geld(p$beschwerungswert);gewicht <- .geld(p$verteilungsgewicht)
  if(name %in% namen||.vergleichen(gewicht,.bruch(0))<=0) .fehler('beschwerungen','Eindeutige Kennungen und positive Gewichte erforderlich.')
  namen <- c(namen,name);raenge <- c(raenge,rang);werte[[length(namen)]] <- wert;gewichte[[length(namen)]] <- gewicht
 }
 zuordnung <- rep(list(.bruch(0)),length(namen))
 for(rang in sort(unique(raenge))) {
  indices <- which(raenge==rang);aus <- .begrenzte_quotenverteilung(rest,gewichte[indices],werte[indices]);rest <- aus$rest
  for(j in seq_along(indices)) zuordnung[[indices[[j]]]] <- aus$zugeordnet[[j]]
 }
 wert <- list(verteilung=lapply(seq_along(namen),function(i)list(beschwerung_id=namen[[i]],zugeteilter_betrag=.bruchteile(zuordnung[[i]]),kuerzungsbetrag=.bruchteile(.subtrahieren(werte[[i]],zuordnung[[i]])))),verbleibendes_budget=.bruchteile(rest))
 eingaben <- list(verfuegbarer_beschwerungsbetrag=verfuegbarer_beschwerungsbetrag, beschwerungen=beschwerungen, verteilungsnachweis=verteilungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_VERMAECHTNIS_RANGWEISE_BESCHWERUNGSVERTEILUNG",eingaben,list(list(operation="Gemeinsames K\u00fcrzungsbudget rangweise, innerhalb eines Rangs proportional und anspruchsbegrenzt verteilen.")),eingaben)
 ergebnis$hinweise <- list("Mehrere rechtlich feststehende Beschwerungsr\u00e4nge mit bestehendem begrenztem Quotenkern bedienen. Innerhalb eines Rangs proportional zu qualifizierten Gewichten, h\u00f6chstens jeweiliger Beschwerungswert, \u00fcber Obergrenzen hinausgehende Anteile innerhalb desselben Rangs neu verteilen. Restbudget erst danach an nachrangige R\u00e4nge. Keine automatische Testamentsauslegung, automatische Gleichrangigkeit oder Erfindung von Quoten. Individuelle2318II/III-Schutzkonkurrenz muss bereits rechtlich in Budget/zul\u00e4ssiger Rangverteilung ber\u00fccksichtigt sein; dieser Kern entscheidet sie nicht. K\u00fcrzungsrecht muss ausge\u00fcbt werden, keine automatische Schuldtilgung. Keine mehrfache Verwendung desselben Budgets oder Umdeutung von Sachverm\u00e4chtnissen in Zahlungsanspr\u00fcche.")
 ergebnis
}
