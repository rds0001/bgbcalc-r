vermaechtnis_anwachsungsanteile <- function(bedachte=NULL,weggefallener_bedachter_id=NULL,anwachsung_testamentarisch_ausgeschlossen=NULL,vorrangiges_ersatzvermaechtnis=NULL,einordnungsnachweis=NULL) {
 .vorhanden(bedachte,'bedachte')
 if(!is.list(bedachte)||!is.null(names(bedachte))||length(bedachte)<2||length(bedachte)>1000) .fehler('bedachte','Liste2..1000 Bedachter desselben Gegenstands erforderlich.')
 einsetzungen <- list()
 for(p in bedachte) {
  if(!is.list(p)||!identical(sort(names(p)),sort(c('bedachter_id','vermaechtnisanteil','gemeinschaft_id')))) .fehler('bedachte','Genau bedachter_id, vermaechtnisanteil und gemeinschaft_id erforderlich.')
  einsetzungen[[length(einsetzungen)+1L]] <- list(erbe_id=p$bedachter_id,erbquote=p$vermaechtnisanteil,gemeinschaft_id=p$gemeinschaft_id)
 }
 teilung <- erbteil_anwachsungsquoten(einsetzungen,weggefallener_bedachter_id,TRUE,anwachsung_testamentarisch_ausgeschlossen,vorrangiges_ersatzvermaechtnis,einordnungsnachweis)$wert
 wert <- list(anwachsung_erfolgt=teilung$anwachsung_erfolgt,vermaechtnisanteile=lapply(teilung$erbteile,function(p) list(bedachter_id=p$erbe_id,urspruenglicher_vermaechtnisanteil=p$urspruenglicher_erbteil,angewachsener_vermaechtnisanteil=p$angewachsener_erbteil,gesamter_vermaechtnisanteil=p$gesamter_erbteil)),nicht_angewachsener_wegfallender_anteil=teilung$nicht_angewachsener_wegfallender_erbteil)
 eingaben <- list(bedachte=bedachte,weggefallener_bedachter_id=weggefallener_bedachter_id,anwachsung_testamentarisch_ausgeschlossen=anwachsung_testamentarisch_ausgeschlossen,vorrangiges_ersatzvermaechtnis=vorrangiges_ersatzvermaechtnis,einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,'vermaechtnisquoten','BGB_VERMAECHTNIS_ANWACHSUNGSANTEILE',eingaben,list(list(operation='Vorhandenen proportionalen Einzelwegfallkern mit Gruppenvorrang f\u00fcr vollst\u00e4ndige Verm\u00e4chtnisanteile anwenden; angewachsenen Anteil getrennt erhalten')),eingaben)
 ergebnis$annahmen <- list("Ein rechtlich qualifizierter Wegfall vor oder nach Erbfall; Bedachte desselben Gegenstands mit positiven vollst\u00e4ndigen Originalanteilen und einfacher Gemeinschaftszuordnung.")
 ergebnis$hinweise <- list("Quotensumme eins bezieht sich ausschlie\u00dflich auf den vermachten Gegenstand, nicht gesamte Erbschaft. Keine Voraussetzung ausgeschlossener gesetzlicher Erbfolge: der interne Wiederverwendungsschalter des Teilungskerns stellt lediglich allgemeine Anwachsung unter verbleibenden Bedachten sicher. Vorrangig verbleibende Mitglieder derselben gemeinschaftlichen Teilquote; sonst alle \u00fcbrigen. Testamentarischer Ausschluss2158II oder rechtlich vorrangiges Ersatzverm\u00e4chtnis2190/2099 sperren diese Anwachsung. Angewachsener Teil bleibt nach2159 hinsichtlich Beschwerungen besonderes Verm\u00e4chtnis. Mehrere Wegf\u00e4lle, verschachtelte Gruppen, bereits angewachsene Sonderanteile oder individuelle Teilausschl\u00fcsse separat; keinen blo\u00dfen Tod nach Erwerb automatisch als Wegfall einordnen. Nicht angewachsenen Anteil keinem anderen Bedachten oder Erben automatisch zuordnen.")
 ergebnis
}
