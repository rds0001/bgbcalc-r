wohnraummiete_kuendigungstermin <- function(zugang_kuendigung=NULL,fristfall=NULL,qualifizierte_zugangsgrenze_am=NULL,ueberlassungsbeginn_am=NULL,kuendigung_nach_573a=NULL,fristnachweis=NULL) {
 zugang <- .datum(zugang_kuendigung,'zugang_kuendigung')
 .auswahl(fristfall,'fristfall',c('mieter_standard','vermieter_standard','nebenraum_573b','moebliert_549_2_2','ausserordentlich_gesetzlich','ausserordentlich_moebliert'))
 .wahrheitswert(kuendigung_nach_573a,'kuendigung_nach_573a');.text(fristnachweis,'fristnachweis')
 if(kuendigung_nach_573a && fristfall!='vermieter_standard') .fehler('kuendigung_nach_573a','Dreimonatsverl\u00e4ngerung nur im qualifizierten Vermieterfall.')
 jahre <- NULL;zuschlag <- 0
 if(fristfall=='vermieter_standard') {
  beginn <- .datum(ueberlassungsbeginn_am,'ueberlassungsbeginn_am')
  if(beginn>zugang) .fehler('ueberlassungsbeginn_am','\u00dcberlassung darf nicht nach K\u00fcndigungszugang beginnen.')
  jahre <- as.integer(format(zugang,'%Y'))-as.integer(format(beginn,'%Y'))-as.integer(format(zugang,'%m-%d')<format(beginn,'%m-%d'))
  zuschlag <- 3*as.integer(jahre>=5)+3*as.integer(jahre>=8)+3*as.integer(kuendigung_nach_573a)
 } else if(!is.null(ueberlassungsbeginn_am)) .fehler('ueberlassungsbeginn_am','\u00dcberlassungsdauer nur im Vermieter-Standardfall angeben.')
 if(fristfall %in% c('moebliert_549_2_2','ausserordentlich_moebliert')) {
  if(!is.null(qualifizierte_zugangsgrenze_am)) .fehler('qualifizierte_zugangsgrenze_am','Im m\u00f6blierten Sonderfall gilt die feste Grenze15, kein dritter Werktag.')
  grenze <- .datum(paste0(substr(zugang_kuendigung,1,8),'15'),'grenze');monate <- 1+as.integer(zugang>grenze)
 } else {
  grenze <- .datum(qualifizierte_zugangsgrenze_am,'qualifizierte_zugangsgrenze_am')
  if(format(grenze,'%Y-%m')!=format(zugang,'%Y-%m')||as.integer(format(grenze,'%d'))<3) .fehler('qualifizierte_zugangsgrenze_am','Rechtlich ma\u00dfgebliche dritte Werktagsgrenze im Zugangsmonat, fr\u00fchestens am3.Tag, erforderlich.')
  monate <- 3+zuschlag+as.integer(zugang>grenze)
 }
 ende <- .frist(paste0(substr(zugang_kuendigung,1,8),'01'),monate,'monate','tagesbeginn')
 eingaben <- list(zugang_kuendigung=zugang_kuendigung,fristfall=fristfall,qualifizierte_zugangsgrenze_am=qualifizierte_zugangsgrenze_am,ueberlassungsbeginn_am=ueberlassungsbeginn_am,kuendigung_nach_573a=kuendigung_nach_573a,fristnachweis=fristnachweis)
 wert <- list(zugangsgrenze_im_monat=.iso(grenze),zugangsgrenze_eingehalten=zugang<=grenze,vollendete_ueberlassungsjahre=jahre,verlaengerungsmonate=zuschlag,fruehester_beendigungstag=.iso(ende))
 ergebnis <- .ergebnis(wert,'datum_und_monate','BGB_WOHNRAUMMIETE_KUENDIGUNGSTERMIN',eingaben,list(list(operation='Zugangsgrenze3.Werktag oder15.pr\u00fcfen; Monatsendtermin und gesetzliche Vermieterzuschl\u00e4ge5/8Jahre sowie573a berechnen.')),eingaben)
 ergebnis$hinweise <- list("Nur gesetzliche Standardf\u00e4lle nach573bII/573cI,III und qualifizierter573a-Verl\u00e4ngerung. Rechtliche Voraussetzungen, Wirksamkeit, Sperrfristen, abweichende Vereinbarungen und574ff-Fortsetzung getrennt. qualifizierte_zugangsgrenze_am bezeichnet den rechtlich bestimmten letzten Zugangstag der Dritte-Werktag-Regel nach einschl\u00e4giger \u00f6rtlicher Werktags-/Feiertagskonvention; ausdr\u00fccklich vorgeben, keine Annahme Montag bis Freitag. Fristnachweis muss diese Grenze belegen; keine automatische193Verschiebung. \u00dcberlassungsbeginn bildet einen rechtlich anrechenbaren zusammenh\u00e4ngenden Zeitraum ab Tagesbeginn ab; intrat\u00e4gige Grenzf\u00e4lle/abweichender Anrechnungsbeginn gesondert qualifizieren. Vermieterzuschl\u00e4ge nach5/8vollendeten Jahren jeweils3Monate,573a zus\u00e4tzlich3Monate. Keine Staffelverl\u00e4ngerung des gesonderten573bII-Teilk\u00fcndigungstermins; Bauverz\u00f6gerung nach573bIII separat. M\u00f6blierter549II2-Fall: Zugang bis15.einschlie\u00dflich zum selben Monatsende, sp\u00e4ter zum n\u00e4chsten. Beendigungstermin nicht wegen Wochenende/Feiertag verschieben. \u00a7573dII: ausserordentlich_gesetzlich verwendet unabh\u00e4ngig von der \u00dcberlassungsdauer die Dreimonatsgrundregel; ausserordentlich_moebliert verwendet die feste15-Tage-Zugangsschwelle. Keine Vermieterverl\u00e4ngerung nach5/8Jahren und keine zus\u00e4tzliche573a-Dreimonatsfrist. Ein Grund f\u00fcr die au\u00dferordentliche K\u00fcndigung mit gesetzlicher Frist muss bereits vorliegen, etwa nach544 erst nach Ablauf der Drei\u00dfigjahreswartefrist. Beide Parteien k\u00f6nnen diese qualifizierten573d-F\u00e4lle verwenden; Voraussetzungen und573dI bleiben gesondert.")
 ergebnis
}
