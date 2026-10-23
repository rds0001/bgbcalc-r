zinskalendertage_nach_ausschluss <- function(erster_betrachteter_tag=NULL,letzter_betrachteter_tag=NULL,ausschlusszeitraeume=NULL,einordnungsnachweis=NULL) {
 erster <- .datum(erster_betrachteter_tag,'erster_betrachteter_tag');letzter <- .datum(letzter_betrachteter_tag,'letzter_betrachteter_tag')
 if(erster>letzter) .fehler('letzter_betrachteter_tag','Letzter Tag darf nicht vor erstem Tag liegen.')
 .vorhanden(ausschlusszeitraeume,'ausschlusszeitraeume')
 if(!is.list(ausschlusszeitraeume)||!is.null(names(ausschlusszeitraeume))||length(ausschlusszeitraeume)>10000) .fehler('ausschlusszeitraeume','Unbenannte Liste0bis10000 Ausschlussintervalle erforderlich.')
 .text(einordnungsnachweis,'einordnungsnachweis');intervalle <- list()
 for(zeitraum in ausschlusszeitraeume) {
  if(!is.list(zeitraum)||length(zeitraum)!=4||!setequal(names(zeitraum),c('erster_zinsfreier_tag','letzter_zinsfreier_tag','ausschlussgrund','hinterlegung_zurueckgenommen'))) .fehler('ausschlusszeitraeume','Genau beide Tagesgrenzen, ausschlussgrund und hinterlegung_zurueckgenommen erforderlich.')
  von <- .datum(zeitraum$erster_zinsfreier_tag,'erster_zinsfreier_tag');bis <- .datum(zeitraum$letzter_zinsfreier_tag,'letzter_zinsfreier_tag')
  if(von>bis) .fehler('ausschlusszeitraeume','Ausschlussende darf nicht vor Ausschlussbeginn liegen.')
  grund <- zeitraum$ausschlussgrund;.auswahl(grund,'ausschlussgrund',c('nutzungen_ohne_verguetung_256','glaeubigerverzug_301','hinterlegung_379'))
  if(grund=='hinterlegung_379') {
   .wahrheitswert(zeitraum$hinterlegung_zurueckgenommen,'hinterlegung_zurueckgenommen')
   if(zeitraum$hinterlegung_zurueckgenommen) next
  } else if(!is.null(zeitraum$hinterlegung_zurueckgenommen)) .fehler('hinterlegung_zurueckgenommen','Bei anderem Ausschlussgrund zwingendNone/NULL.')
  if(bis>=erster && von<=letzter) intervalle[[length(intervalle)+1]] <- list(von=max(von,erster),bis=min(bis,letzter))
 }
 if(length(intervalle)) intervalle <- intervalle[order(vapply(intervalle,function(x) as.numeric(x$von),0),vapply(intervalle,function(x) as.numeric(x$bis),0))]
 vereinigt <- list()
 for(zeitraum in intervalle) {
  anzahl <- length(vereinigt)
  if(anzahl>0 && as.numeric(zeitraum$von-vereinigt[[anzahl]]$bis)<=1) vereinigt[[anzahl]]$bis <- max(zeitraum$bis,vereinigt[[anzahl]]$bis) else vereinigt[[anzahl+1]] <- zeitraum
 }
 gesamt <- as.numeric(letzter-erster)+1
 ausgeschlossen <- sum(vapply(vereinigt,function(x) as.numeric(x$bis-x$von)+1,0))
 wert <- list(kalendertage_gesamt=gesamt,zinsfreie_kalendertage=ausgeschlossen,verzinsliche_kalendertage=gesamt-ausgeschlossen,vereinigte_ausschlusszeitraeume=lapply(vereinigt,function(x) list(erster_zinsfreier_tag=.iso(x$von),letzter_zinsfreier_tag=.iso(x$bis))))
 eingaben <- list(erster_betrachteter_tag=erster_betrachteter_tag,letzter_betrachteter_tag=letzter_betrachteter_tag,ausschlusszeitraeume=ausschlusszeitraeume,einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,'kalendertage_und_intervalle','BGB_ZINSKALENDERTAGE_NACH_AUSSCHLUSS',eingaben,list(list(operation='Zinsfreie Kalenderintervalle begrenzen und vereinigen; deren Tage nur einmal vom betrachteten Zeitraum abziehen.')),eingaben)
 ergebnis$hinweise <- list("\u00a7256Satz2: nur Zeitr\u00e4ume, in denen dem Aufwendungsersatzberechtigten Nutzungen/Fr\u00fcchte des herauszugebenden Gegenstands ohne Verg\u00fctung verbleiben.301: qualifizierter Gl\u00e4ubigerverzug hinsichtlich der verzinslichen Geldschuld.379II/III: wirksame Hinterlegung; bei R\u00fccknahme gilt diese als nicht erfolgt, deshalb wird ihr gesamtes eingegebenes Intervall nicht als zinsfrei abgezogen. Andere wirksame Ausschlussgr\u00fcnde desselben Tages bleiben bestehen. Tagesgrenzen einschlie\u00dflich und rechtlich auf ganze Kalendertage normalisiert; untert\u00e4gige Bruchteile nicht pauschal runden. Zeitr\u00e4ume werden auf den betrachteten Zinsabschnitt begrenzt, \u00dcberschneidungen/gleiche Tage nur einmal gez\u00e4hlt. Keine Verl\u00e4ngerung des Abschnitts wie bei Verj\u00e4hrungshemmung. Ergebnis ist tats\u00e4chliche Kalendertageszahl, noch kein universeller Jahresbruch oder Zinsbetrag; rechtlich geltende Zinstageskonvention, wechselnde Kapital-/Zinssatzwerte und Jahresgrenzen gesondert behandeln und vorhandene Zinsfunktionen verwenden. Erster/letzter Zinstag und rechtliche Ausschlussgr\u00fcnde m\u00fcssen vorqualifiziert sein.")
 ergebnis
}
