gemeinschaftsquoten_aufloesen <- function(gemeinschaftlicher_anteil=NULL,gruppenmitglieder=NULL,regelkontext=NULL,gruppeneinsetzung_qualifiziert=NULL,einordnungsnachweis=NULL) {
 oberquote <- .zahleneingabe(gemeinschaftlicher_anteil)
 if(.vergleichen(oberquote,.bruch(0))<=0 || .vergleichen(oberquote,.bruch(1))>0) .fehler('gemeinschaftlicher_anteil','Positive bereits bestimmte Oberquote h\u00f6chstens eins erforderlich.')
 .vorhanden(gruppenmitglieder,'gruppenmitglieder');.auswahl(regelkontext,'regelkontext',c('gemeinschaftlicher_erbteil_2093','gemeinschaftliches_vermaechtnis_2157'))
 .wahrheitswert(gruppeneinsetzung_qualifiziert,'gruppeneinsetzung_qualifiziert');.text(einordnungsnachweis,'einordnungsnachweis')
 namen <- character();blaetter <- list()
 verteilen <- function(mitglieder,faktor,tiefe) {
  if(tiefe>20) .fehler('gruppenmitglieder','H\u00f6chstens20 verschachtelte Gruppenebenen.')
  if(!is.list(mitglieder)||!is.null(names(mitglieder))||length(mitglieder)<2||length(mitglieder)>1000) .fehler('gruppenmitglieder','Je Gemeinschaft2..1000 Mitglieder erforderlich.')
  einsetzungen <- list()
  for(m in mitglieder) {
   if(!is.list(m)||!identical(sort(names(m)),sort(c('knoten_id','bestimmter_anteil','untergruppe')))) .fehler('gruppenmitglieder','Genau knoten_id, bestimmter_anteil, untergruppe erforderlich.')
   name <- .text(m$knoten_id,'knoten_id')
   if(name %in% namen) .fehler('knoten_id','Alle Gruppen-/Personenkennungen global eindeutig; keine Zyklen oder Doppelpersonen.')
   namen <<- c(namen,name)
   if(length(namen)>1000) .fehler('gruppenmitglieder','Insgesamt h\u00f6chstens1000 Gruppen-/Personenknoten.')
   einsetzungen[[length(einsetzungen)+1L]] <- list(erbe_id=name,bestimmter_erbteil=m$bestimmter_anteil)
  }
  quoten <- testament_erbquoten(einsetzungen,TRUE,TRUE,einordnungsnachweis)$wert$erbquoten
  for(i in seq_along(mitglieder)) {
   m <- mitglieder[[i]];absolut <- .multiplizieren(faktor,.zahleneingabe(quoten[[i]]$erbquote))
   if(is.null(m$untergruppe)) blaetter[[length(blaetter)+1L]] <<- list(person_id=m$knoten_id,anteil=.bruchteile(absolut)) else verteilen(m$untergruppe,absolut,tiefe+1L)
  }
 }
 verteilen(gruppenmitglieder,oberquote,1)
 eingaben <- list(gemeinschaftlicher_anteil=gemeinschaftlicher_anteil,gruppenmitglieder=gruppenmitglieder,regelkontext=regelkontext,gruppeneinsetzung_qualifiziert=gruppeneinsetzung_qualifiziert,einordnungsnachweis=einordnungsnachweis)
 wert <- if(gruppeneinsetzung_qualifiziert) list(aufgeloeste_anteile=blaetter) else NULL
 ergebnis <- .ergebnis(wert,'quoten','BGB_GEMEINSCHAFTSQUOTEN_AUFLOESEN',eingaben,list(list(operation='Je Gruppe vorhandenen2089\u20132092-Quotenkern anwenden; normierte Binnenquote mit allen Oberquoten multiplizieren')),eingaben)
 ergebnis$status <- if(!is.null(wert)) 'BERECHNET' else 'NICHT_ANWENDBAR'
 ergebnis$annahmen <- list("Rechtlich qualifizierte gemeinschaftliche Einsetzung auf eine bereits bestimmte Oberquote; angegebene Mitglieder bilden jeweils die vollst\u00e4ndige Gemeinschaft.")
 ergebnis$hinweise <- list("Bestimmte Anteile sind relativ zur jeweiligen unmittelbaren Gemeinschaft, nicht bereits absolute Gesamtquoten. NULL bedeutet testamentarisch unbestimmt, nicht unklare Aktenlage. Untergruppe NULL bezeichnet eine Person, sonst deren Untergemeinschaft. Innerhalb vollst\u00e4ndiger Gruppe Unter-/\u00dcberbelegung nach2089\u20132092 normalisieren; kein zus\u00e4tzlicher gesetzlicher Rest innerhalb dieses Gruppenmodells. Oberquote nach vorgelagerter Erbeinsetzungs-/Verm\u00e4chtnispr\u00fcfung bestimmen.2157 betrifft mehrere Bedachte desselben Gegenstands; keine Pflicht zur Teilung unteilbarer Sachen oder2151-Gesamtgl\u00e4ubigerquotierung. Wegf\u00e4lle/Anwachsung/Ersatzerben und Sonderanteile vorher rechtlich gesondert behandeln; keine gleiche Person in mehreren Zweigen, daf\u00fcr rechtlich getrennte Anteilstitel separat rechnen.")
 ergebnis
}
