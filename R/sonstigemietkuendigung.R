sonstige_miete_kuendigungstermin <- function(zugang_kuendigung=NULL,fristfall=NULL,qualifizierte_zugangsgrenze_am=NULL,fristnachweis=NULL) {
 tag <- .datum(zugang_kuendigung,'zugang_kuendigung')
 .auswahl(fristfall,'fristfall',c('tagesmiete','grundstueck_wochen','grundstueck_monate','gewerblich_unbebaut_monate','geschaeftsraeume','beweglich_digital_laenger'))
 .text(fristnachweis,'fristnachweis');grenze <- NULL
 if(fristfall %in% c('tagesmiete','beweglich_digital_laenger')) {
  if(!is.null(qualifizierte_zugangsgrenze_am)) .fehler('qualifizierte_zugangsgrenze_am','Bei fester Tagesfrist keine ungenutzte Werktagsgrenze eingeben.')
  ende <- .tage_addieren(tag,if(fristfall=='tagesmiete') 1 else 3)
 } else {
  grenze <- .datum(qualifizierte_zugangsgrenze_am,'qualifizierte_zugangsgrenze_am')
  if(fristfall=='grundstueck_wochen') {
   montag <- .tage_addieren(tag,1-as.integer(format(tag,'%u')));samstag <- .tage_addieren(montag,5)
   if(!(montag<=grenze && grenze<=samstag)) .fehler('qualifizierte_zugangsgrenze_am','Erste Werktagsgrenze muss in der Zugangswoche Montag bis Samstag liegen.')
   ende <- .tage_addieren(samstag,if(tag>grenze) 7 else 0)
  } else if(fristfall=='geschaeftsraeume') {
   monat <- 3*((as.integer(format(tag,'%m'))-1)%/%3)+1
   if(format(grenze,'%Y')!=format(tag,'%Y')||as.integer(format(grenze,'%m'))!=monat||as.integer(format(grenze,'%d'))<3) .fehler('qualifizierte_zugangsgrenze_am','Dritte Werktagsgrenze im ersten Monat des Zugangsquartals erforderlich.')
   ende <- .frist(sprintf('%04d-%02d-01',as.integer(format(tag,'%Y')),monat),6+3*as.integer(tag>grenze),'monate','tagesbeginn')
  } else {
   if(format(grenze,'%Y-%m')!=format(tag,'%Y-%m')||as.integer(format(grenze,'%d'))<3) .fehler('qualifizierte_zugangsgrenze_am','Dritte Werktagsgrenze im Zugangsmonat erforderlich.')
   ende <- .frist(paste0(substr(zugang_kuendigung,1,8),'01'),3+as.integer(tag>grenze),'monate','tagesbeginn')
   if(fristfall=='gewerblich_unbebaut_monate') {
    monat <- 3*((as.integer(format(ende,'%m'))-1)%/%3)+1
    ende <- .frist(sprintf('%04d-%02d-01',as.integer(format(ende,'%Y')),monat),3,'monate','tagesbeginn')
   }
  }
 }
 eingaben <- list(zugang_kuendigung=zugang_kuendigung,fristfall=fristfall,qualifizierte_zugangsgrenze_am=qualifizierte_zugangsgrenze_am,fristnachweis=fristnachweis)
 wert <- list(fruehester_beendigungstag=.iso(ende),zugangsgrenze=if(is.null(grenze)) NULL else .iso(grenze),zugangsgrenze_eingehalten=if(is.null(grenze)) NULL else tag<=grenze)
 ergebnis <- .ergebnis(wert,'daten','BGB_SONSTIGE_MIETE_KUENDIGUNGSTERMIN',eingaben,list(list(operation='Normfall580a bestimmt Mindestvorlauf und Bindung an Tages-, Samstags-, Monats- oder Quartalsende; qualifizierte Zugangsschwelle entscheidet aktuellen oder n\u00e4chsten Ausgangszeitraum.')),eingaben)
 ergebnis$hinweise <- list("Nur rechtlich qualifizierte gesetzliche Grundf\u00e4lle580a, keine allgemeine Wohnraummietk\u00fcndigung. tagesmiete umfasst580aI1/III1; grundstueck_wochen und grundstueck_monate jeweilsI2/I3, gewerblich_unbebaut_monate zus\u00e4tzlich Quartalsbindung; geschaeftsraeume stetsAbsatz2; beweglich_digital_laenger Absatz3Nummer2. Bemessungszeitraum ist nicht automatisch Zahlungsrhythmus. Zugangsschwelle anhand einschl\u00e4giger \u00f6rtlicher Werktags-/Feiertags- und Zugangsregeln ausdr\u00fccklich vorgeben; kein pauschaler Montag-bis-Freitag-Kalender. Feste Tagesregeln ben\u00f6tigen keine Werktagsschwelle. Beendigungstermine nicht nach193 verschieben. Absatz4 \u00fcbertr\u00e4gt nurI3/II/III2 auf entsprechende au\u00dferordentliche K\u00fcndigung mit gesetzlicher Frist; Voraussetzungen extern qualifizieren. Befristung, abweichende Vereinbarungen und spezielle Verbrauchervertragsregeln f\u00fcr digitale Produkte gesondert.")
 ergebnis
}
