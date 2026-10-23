ersitzung_anrechenbare_zeitkette <- function(fristfall=NULL, besitzabschnitte=NULL, hemmungszeitraeume=NULL, unterbrechungszeitraeume=NULL, einordnungsnachweis=NULL) {
 .auswahl(fristfall,'fristfall',c('bewegliche_sache_937','buchersitzung_900','grundstuecksaufgebot_927','drittrecht_945'))
 .text(einordnungsnachweis,'einordnungsnachweis');daten <- list()
 for(name in c('besitzabschnitte','hemmungszeitraeume','unterbrechungszeitraeume')) {
  liste <- get(name);.vorhanden(liste,name)
  minimum <- if(name=='besitzabschnitte') 1L else 0L;maximum <- if(name=='unterbrechungszeitraeume') 100L else 1000L
  if(!is.list(liste)||!is.null(names(liste))||length(liste)<minimum||length(liste)>maximum) .fehler(name,'Unbenannte Intervallliste innerhalb des dokumentierten Umfangs erforderlich.')
  paare <- list()
  for(abschnitt in liste) {
   if(!is.list(abschnitt)||is.null(names(abschnitt))||length(abschnitt)!=2L||!setequal(names(abschnitt),c('erster_tag','letzter_tag'))) .fehler(name,'Genau erster_tag und letzter_tag erforderlich.')
   von <- .datum(abschnitt$erster_tag,'erster_tag');bis <- .datum(abschnitt$letzter_tag,'letzter_tag')
   if(von>bis) .fehler(name,'Letzter Tag nicht vor erstem Tag.')
   if(length(paare)>0L&&name=='besitzabschnitte'&&von!=.tage_addieren(paare[[length(paare)]][[2L]],1)) .fehler(name,'Rechtlich anrechenbare Besitzkette muss geordnet, l\u00fcckenlos und ohne doppelte Tage sein.')
   if(length(paare)>0L&&name=='unterbrechungszeitraeume'&&von<=paare[[length(paare)]][[2L]]) .fehler(name,'Unterbrechungen geordnet und \u00fcberschneidungsfrei eingeben.')
   paare[[length(paare)+1L]] <- list(von,bis)
  }
  daten[[name]] <- paare
 }
 erster <- daten$besitzabschnitte[[1L]][[1L]];letzter <- daten$besitzabschnitte[[length(daten$besitzabschnitte)]][[2L]]
 for(name in c('hemmungszeitraeume','unterbrechungszeitraeume')) for(paar in daten[[name]]) if(paar[[1L]]<erster||paar[[2L]]>letzter) .fehler(name,'Nur abgeschlossene Intervalle innerhalb der belegten Besitzzeit.')
 hemmung <- lapply(daten$hemmungszeitraeume,function(paar) list(erster_gehemmter_tag=.iso(paar[[1L]]),letzter_gehemmter_tag=.iso(paar[[2L]])))
 jahre <- if(fristfall %in% c('buchersitzung_900','grundstuecksaufgebot_927')) 30 else 10
 beginn <- erster
 for(paar in daten$unterbrechungszeitraeume) {
  von <- paar[[1L]];bis <- paar[[2L]]
  vorende <- verjaehrung_gehemmte_kalendertage(.iso(beginn),.iso(.frist(.iso(beginn),jahre,'jahre','tagesbeginn')),hemmung,TRUE)$wert$rechnerischer_letzter_tag
  if(von>.datum(vorende,'vorende')) .fehler('unterbrechungszeitraeume','Unterbrechung liegt nach bereits rechnerisch vollendetem Lauf.')
  if(bis==letzter) .vorhanden(NULL,'belegter_neuer_besitzlauf_nach_unterbrechung')
  beginn <- .tage_addieren(bis,1)
 }
 rechnung <- verjaehrung_gehemmte_kalendertage(.iso(beginn),.iso(.frist(.iso(beginn),jahre,'jahre','tagesbeginn')),hemmung,TRUE)$wert
 wert <- list(erster_tag_des_massgeblichen_laufs=.iso(beginn),rechnerisches_fristende=rechnung$rechnerischer_letzter_tag,hemmungstage_im_massgeblichen_lauf=rechnung$beruecksichtigte_hemmungstage,frist_am_letzten_belegten_tag_vollendet=letzter>=.datum(rechnung$rechnerischer_letzter_tag,'fristende'))
 eingaben <- list(fristfall=fristfall, besitzabschnitte=besitzabschnitte, hemmungszeitraeume=hemmungszeitraeume, unterbrechungszeitraeume=unterbrechungszeitraeume, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"daten_und_tage","BGB_ERSITZUNG_ANRECHENBARE_ZEITKETTE",eingaben,list(list(operation="L\u00fcckenlose anrechenbare Besitzabschnitte verbinden; wirksame Unterbrechungen verwerfen Vorlauf und starten volle10/30Jahre neu; je Lauf vorhandenen Hemmungskern anwenden.")),eingaben)
 ergebnis$hinweise <- list("\u00a7\u00a7939bis944, bei900/927 entsprechend und945 f\u00fcr gesonderten drittrechtbezogenen Lauf: zehn beziehungsweise drei\u00dfig Kalenderjahre ab erstem vollst\u00e4ndig anrechenbarem Tag, Vorg\u00e4ngerzeiten ohne Doppelz\u00e4hlung verbinden. Alle Besitzabschnitte m\u00fcssen rechtlich eine l\u00fcckenlose anrechenbare Kette bilden;940II-Nichtunterbrechung und Nachfolge943/944 vorqualifizieren. Wirksame Unterbrechung verwirft Vorzeit; neuer voller Lauf erst nach Ende der Unterbrechung und belegtem erneuten anrechenbarem Besitz. Unterbrechung nach bereits rechnerisch vollendetem Lauf wird als widerspr\u00fcchliche Eingabe abgelehnt. Hemmungen werden vom vorhandenen209-Kern je neuem Lauf verarbeitet; vor dessen Beginn liegende Hemmung wirkt nicht nochmals.939II-Hemmung w\u00e4hrend210/211-Schutz muss als rechtlich bestimmtes Intervall vorliegen, nicht unbesehen als blo\u00dfes Maximaldatum. Nur abgeschlossene Intervalle bis zum letzten belegten Besitztag; Ergebnis danach ist rechnerische Prognose unter Fortdauer der Voraussetzungen. Keine automatische Personen-/Rechtsnachfolge, Wirkung gegen\u00fcber Dritten, Ausschlie\u00dfungsentscheidung oder Eigentumsfeststellung;900-Registergleichlauf,927-Zustimmungseintragungsgrenze und945-B\u00f6sglauben gesondert.")
 ergebnis
}
