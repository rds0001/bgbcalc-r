pflichtteilsergaenzung_ranggruppen_mit_personenrahmen <- function(fehlbetrag=NULL, schenkungsgruppen=NULL, personenrahmen=NULL, kuerzungsmethode=NULL, methodennachweis=NULL) {
 rest <- .geld(fehlbetrag);.text(methodennachweis,'methodennachweis');.auswahl(kuerzungsmethode,'kuerzungsmethode',c('anteilige_kuerzung_ohne_umverteilung','begrenzte_umverteilung'))
 for(name in c('schenkungsgruppen','personenrahmen')) {
  liste <- get(name);.vorhanden(liste,name)
  if(!is.list(liste)||!is.null(names(liste))||length(liste)<1||length(liste)>1000) .fehler(name,'Liste1..1000erforderlich.')
 }
 rahmen <- list()
 for(p in personenrahmen) {
  if(!is.list(p)||length(p)!=2||!setequal(names(p),c('beschenkter_id','gemeinsame_haftungsgrenze'))) .fehler('personenrahmen','Kennung und Grenze erforderlich.')
  name <- .text(p$beschenkter_id,'beschenkter_id')
  if(name %in% names(rahmen)) .fehler('personenrahmen','Personenrahmen nur einmal.')
  rahmen[[name]] <- .geld(p$gemeinsame_haftungsgrenze)
 }
 gruppen <- list()
 for(p in schenkungsgruppen) {
  if(!is.list(p)||length(p)!=4||!setequal(names(p),c('beschenkter_id','schenkungsrang','schenkungswert','einzelhaftungsgrenze'))) .fehler('schenkungsgruppen','Vier Gruppenfelder erforderlich.')
  name <- .text(p$beschenkter_id,'beschenkter_id');rang <- .ganzzahl(p$schenkungsrang,'schenkungsrang',1,1000);gewicht <- .geld(p$schenkungswert);grenze <- .geld(p$einzelhaftungsgrenze)
  if(any(vapply(gruppen,function(g)g$name==name&&g$rang==rang,logical(1)))) .fehler('schenkungsgruppen','Genau eine Gruppe je Person und Rang.')
  gruppen[[length(gruppen)+1]] <- list(name=name,rang=rang,gewicht=gewicht,grenze=grenze)
 }
 if(!setequal(vapply(gruppen,function(g)g$name,character(1)),names(rahmen))) .fehler('personenrahmen','Genau alle Gruppenempf\u00e4nger erforderlich.')
 kleiner <- function(a,b) if(.vergleichen(a,b)<0)a else b
 zugeordnet <- lapply(gruppen,function(g).bruch(0));raenge <- vapply(gruppen,function(g)g$rang,numeric(1))
 for(rang in sort(unique(raenge),decreasing=TRUE)) {
  ind <- which(raenge==rang);gewichte <- lapply(ind,function(i)gruppen[[i]]$gewicht);grenzen <- lapply(ind,function(i)kleiner(kleiner(gruppen[[i]]$grenze,gruppen[[i]]$gewicht),rahmen[[gruppen[[i]]$name]]))
  if(kuerzungsmethode=='begrenzte_umverteilung') anteile <- .begrenzte_quotenverteilung(rest,gewichte,grenzen)$zugeordnet else {
   basis <- .begrenzte_quotenverteilung(rest,gewichte,gewichte)$zugeordnet;anteile <- lapply(seq_along(basis),function(i)kleiner(basis[[i]],grenzen[[i]]))
  }
  for(j in seq_along(ind)) {i <- ind[[j]];x <- anteile[[j]];zugeordnet[[i]] <- x;rest <- .subtrahieren(rest,x);rahmen[[gruppen[[i]]$name]] <- .subtrahieren(rahmen[[gruppen[[i]]$name]],x)}
 }
 wert <- list(gruppenanteile=lapply(seq_along(gruppen),function(i)list(beschenkter_id=gruppen[[i]]$name,schenkungsrang=gruppen[[i]]$rang,rechnerischer_haftungsanteil=.bruchteile(zugeordnet[[i]]))),personenrahmen_rest=lapply(personenrahmen,function(p)list(beschenkter_id=p$beschenkter_id,verbleibender_rahmen=.bruchteile(rahmen[[p$beschenkter_id]]))),nicht_gedeckter_fehlbetrag=.bruchteile(rest))
 eingaben <- list(fehlbetrag=fehlbetrag, schenkungsgruppen=schenkungsgruppen, personenrahmen=personenrahmen, kuerzungsmethode=kuerzungsmethode, methodennachweis=methodennachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_PFLICHTTEILSERGAENZUNG_RANGGRUPPEN_MIT_PERSONENRAHMEN",eingaben,list(list(operation="Chronologische Gruppen mit gleichzeitig wertproportionaler Verteilung und ausdr\u00fccklich qualifizierter Kappungsmethode unter einmaligen Personenrahmen abarbeiten.")),eingaben)
 ergebnis$hinweise <- list("Bedingte arithmetische2329III-Komposition: sp\u00e4tere Gruppen zuerst; gleichzeitig nach Schenkungswerten. Individuelle Kapazit\u00e4t=min(Gruppengrenze,Schenkungswert,noch unverbrauchter Personenrahmen). Bei anteilige_kuerzung_ohne_umverteilung erst Wertquote am kleineren Betrag aus Restfehlbetrag/Gesamtgruppenwert und danach pers\u00f6nliche Kappung; bei begrenzte_umverteilung proportional mit Kappung und Neuverteilung auf \u00fcbrige Gruppenmitglieder. Nur tats\u00e4chlich zugeordnete Betr\u00e4ge verbrauchen den gemeinsamen Personenrahmen; rechtlich nicht gedeckter Rest geht zum fr\u00fcheren Rang. Kein doppelter Personenrahmen \u00fcber mehrere R\u00e4nge. Die beiden Methoden sind ausdr\u00fccklich bedingte Rechenmodelle, keine Behauptung, dass beide gesetzlich zul\u00e4ssig sind. Rechtsfrage zus\u00e4tzlicher K\u00fcrzungen bei Gleichzeitigkeit bleibt vom Anwender anhand seines Falls zu entscheiden; blo\u00dfe Insolvenz macht sp\u00e4tere Verpflichtung nicht automatisch unwirksam. Keine gew\u00f6hnliche Geldhaftung statt qualifizierter Sachherausgabe unterstellen.")
 ergebnis
}
