.bankkalender <- function(kalender) {
 .vorhanden(kalender,'bankkalender')
 if(!is.list(kalender)||length(kalender)!=3||!setequal(names(kalender),c('erster_kalendertag','letzter_kalendertag','geschaeftstage'))) .fehler('bankkalender','Genau erster_kalendertag, letzter_kalendertag und geschaeftstage erforderlich.')
 erster <- .datum(kalender$erster_kalendertag,'erster_kalendertag');letzter <- .datum(kalender$letzter_kalendertag,'letzter_kalendertag')
 if(letzter<erster) .fehler('bankkalender','Kalenderende darf nicht vor Kalenderbeginn liegen.')
 tage <- kalender$geschaeftstage;.vorhanden(tage,'geschaeftstage')
 if(!is.list(tage)||!is.null(names(tage))||length(tage)<1||length(tage)>10000) .fehler('geschaeftstage','Geordnete Liste mit1bis10000 Gesch\u00e4ftstagen erforderlich.')
 tage <- vapply(tage,function(t) as.numeric(.datum(t,'geschaeftstage')),numeric(1))
 if(any(tage<as.numeric(erster)|tage>as.numeric(letzter))||any(diff(tage)<=0)) .fehler('geschaeftstage','Gesch\u00e4ftstage m\u00fcssen streng aufsteigend, eindeutig und innerhalb des belegten Kalenders liegen.')
 list(erster=as.numeric(erster),letzter=as.numeric(letzter),tage=tage)
}
.banktermin <- function(tag,kalender,richtung,anzahl=1) {
 tag <- as.numeric(tag);tage <- kalender$tage
 if(tag<kalender$erster||tag>kalender$letzter) .fehler('bankkalender','Bezugsdatum liegt au\u00dferhalb des belegten Kalenders.')
 if(richtung=='ab') {
  kandidaten <- which(tage>=tag);index <- if(length(kandidaten)) kandidaten[[1]] else length(tage)+1
 } else if(richtung=='nach') {
  kandidaten <- which(tage>tag);index <- if(length(kandidaten)) kandidaten[[1]]+anzahl-1 else length(tage)+1
 } else {
  kandidaten <- which(tage<tag);index <- if(length(kandidaten)) tail(kandidaten,1)-anzahl+1 else 0
 }
 if(index<1||index>length(tage)) .fehler('bankkalender','Kalender deckt den gesuchten Gesch\u00e4ftstag nicht ab; keine Fortschreibung aus vermuteten Wochenregeln.')
 as.Date(tage[[index]],origin='1970-01-01')
}
zahlungsauftrag_zugangstage <- function(zugang_am=NULL,nach_annahmeschluss=NULL,vereinbarter_ausfuehrungstag_am=NULL,bankkalender=NULL,kalendernachweis=NULL) {
 tag <- .datum(zugang_am,'zugang_am');.wahrheitswert(nach_annahmeschluss,'nach_annahmeschluss');.text(kalendernachweis,'kalendernachweis')
 kalender <- .bankkalender(bankkalender);wirksam <- .banktermin(tag,kalender,'ab')
 if(!is.null(vereinbarter_ausfuehrungstag_am)) {
  termin <- .datum(vereinbarter_ausfuehrungstag_am,'vereinbarter_ausfuehrungstag_am')
  if(termin<tag||nach_annahmeschluss) .fehler('vereinbarter_ausfuehrungstag_am','Termin nicht vor tats\u00e4chlichem Zugang; Terminauftrag nicht mit ungenutzter Annahmeschlussverschiebung vermischen.')
  ausfuehrung <- .banktermin(termin,kalender,'ab')
 } else if(nach_annahmeschluss) {
  if(!as.numeric(tag) %in% kalender$tage) .fehler('nach_annahmeschluss','Annahmeschlussverschiebung setzt einen tats\u00e4chlichen Gesch\u00e4ftstag voraus.')
  ausfuehrung <- .banktermin(tag,kalender,'nach')
 } else ausfuehrung <- wirksam
 eingaben <- list(zugang_am=zugang_am,nach_annahmeschluss=nach_annahmeschluss,vereinbarter_ausfuehrungstag_am=vereinbarter_ausfuehrungstag_am,bankkalender=bankkalender,kalendernachweis=kalendernachweis)
 ergebnis <- .ergebnis(list(wirksamkeitszugangstag=.iso(wirksam),zugangstag_fuer_ausfuehrungsfrist=.iso(ausfuehrung)),'daten','BGB_ZAHLUNGSAUFTRAG_ZUGANGSTAGE',eingaben,list(list(operation="Nichtgesch\u00e4ftstag auf n\u00e4chsten Gesch\u00e4ftstag abbilden; wirksamen Annahmeschluss beziehungsweise vereinbarten Termin nur f\u00fcr den Ausf\u00fchrungsfristbeginn ber\u00fccksichtigen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7675n: Gesch\u00e4ftskalender des Zahlungsdienstleisters des Zahlers f\u00fcr den konkreten Vorgang vollst\u00e4ndig im angegebenen Intervall vorgeben. Keine pauschale Werktags-/Feiertagskonvention. nach_annahmeschluss bedeutet nach einem wirksam festgelegten Zeitpunkt nahe Gesch\u00e4ftstagsende, nicht blo\u00df au\u00dferhalb beliebiger \u00d6ffnungszeiten. Diese Verschiebung gilt nur f\u00fcr675sI, nicht pauschal f\u00fcr s\u00e4mtliche Wirkungen des Zugangs. Bei vereinbartem Termin675nII diesen ma\u00dfgeblichen Tag angeben, nach_annahmeschlussFALSE; tats\u00e4chlicher Zugang bleibt getrennt. Uhrzeiten, Zeitzonen und Intraday-Reihenfolge extern qualifizieren.")
 ergebnis
}
zahlung_ausfuehrungsfristende <- function(zugangstag_fuer_ausfuehrungsfrist=NULL,fristfall=NULL,vereinbarte_geschaeftstage=NULL,bankkalender=NULL,kalendernachweis=NULL) {
 tag <- .datum(zugangstag_fuer_ausfuehrungsfrist,'zugangstag_fuer_ausfuehrungsfrist')
 .auswahl(fristfall,'fristfall',c('standard','papier_verlaengerung','ewr_nichteuro_vereinbart'));.text(kalendernachweis,'kalendernachweis')
 if(fristfall=='ewr_nichteuro_vereinbart') anzahl <- .ganzzahl(vereinbarte_geschaeftstage,'vereinbarte_geschaeftstage',1,4) else {
  if(!is.null(vereinbarte_geschaeftstage)) .fehler('vereinbarte_geschaeftstage','Im gesetzlichen Standard-/Papierfall keine ungenutzte vereinbarte Tageszahl eingeben.')
  anzahl <- if(fristfall=='papier_verlaengerung') 2 else 1
 }
 kalender <- .bankkalender(bankkalender)
 if(!as.numeric(tag) %in% kalender$tage) .fehler('zugangstag_fuer_ausfuehrungsfrist','Bereits nach675n qualifizierter Zugangsgesch\u00e4ftstag erforderlich.')
 ende <- .banktermin(tag,kalender,'nach',anzahl)
 eingaben <- list(zugangstag_fuer_ausfuehrungsfrist=zugangstag_fuer_ausfuehrungsfrist,fristfall=fristfall,vereinbarte_geschaeftstage=vereinbarte_geschaeftstage,bankkalender=bankkalender,kalendernachweis=kalendernachweis)
 ergebnis <- .ergebnis(list(anzahl_geschaeftstage=anzahl,spaetester_eingangstag=.iso(ende)),'datum_und_anzahl','BGB_ZAHLUNG_AUSFUEHRUNGSFRISTENDE',eingaben,list(list(operation="Nach dem qualifizierten Zugangsgesch\u00e4ftstag die gesetzliche oder wirksam vereinbarte Zahl von Gesch\u00e4ftstagen z\u00e4hlen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7675sI: sp\u00e4tester Eingang beim Zahlungsdienstleister des Empf\u00e4ngers. standard=ein Gesch\u00e4ftstag; papier_verlaengerung=nur wirksam genutzte Verl\u00e4ngerung der Standardfrist um einen Gesch\u00e4ftstag. ewr_nichteuro_vereinbart=nur wirksame Vereinbarung von1bis4Gesch\u00e4ftstagen im einschl\u00e4gigen EWR-Nicht-Euro-Fall; kein zus\u00e4tzlicher Papiertag auf diese Vier-Tages-Frist. Qualifizierter Gesch\u00e4ftskalender und675n-Zugangstag vorgeben.675sII-Empf\u00e4ngerausl\u00f6sung und Ausnahmen675sIII/675dVI separat; keine automatische Gutschrift-/Wertstellungsentscheidung.")
 ergebnis
}
zahlung_geschaeftstags_grenztermin <- function(fristfall=NULL,bezugstag_am=NULL,bankkalender=NULL,kalendernachweis=NULL) {
 .auswahl(fristfall,'fristfall',c('lastschrift_widerruf_675p','terminauftrag_widerruf_675p','nichtautorisiert_erstattung_675u','erstattung_entscheidung_675x','bareinzahlung_nichtverbraucher_675t'))
 tag <- .datum(bezugstag_am,'bezugstag_am');.text(kalendernachweis,'kalendernachweis');kalender <- .bankkalender(bankkalender)
 vorher <- fristfall %in% c('lastschrift_widerruf_675p','terminauftrag_widerruf_675p')
 ende <- .banktermin(tag,kalender,if(vorher) 'vor' else 'nach',if(fristfall=='erstattung_entscheidung_675x') 10 else 1)
 eingaben <- list(fristfall=fristfall,bezugstag_am=bezugstag_am,bankkalender=bankkalender,kalendernachweis=kalendernachweis)
 ergebnis <- .ergebnis(list(rechnerischer_grenztermin=.iso(ende)),'datum','BGB_ZAHLUNG_GESCHAEFTSTAGS_GRENZTERMIN',eingaben,list(list(operation="Streng vor beziehungsweise nach dem qualifizierten Bezugstag im belegten Gesch\u00e4ftskalender suchen; kein zus\u00e4tzlicher Zwischenschritt bei Nichtgesch\u00e4ftstag.")),eingaben)
 ergebnis$hinweise <- list("675pII/III: letzter Gesch\u00e4ftstag vor vereinbarter F\u00e4lligkeit beziehungsweise vereinbartem Ausf\u00fchrungstag, nicht vor einem eigenst\u00e4ndig verschobenen Termin; sp\u00e4tere Widerrufsvereinbarungen gesondert.675u: Bezugstag ist fr\u00fcheste ma\u00dfgebliche Anzeige oder anderweitige Kenntnis, \u00e4u\u00dferste Erstattungs-/Kontokorrekturfrist, unverz\u00fcglich bleibt zus\u00e4tzlich; qualifizierte Betrugsverdachtsausnahme au\u00dferhalb.675xV: zehn Gesch\u00e4ftstage nach Zugang des Erstattungsverlangens, Anspruch und Vier-/Achtwochenregeln getrennt.675tII: Nichtverbraucher-Bareinzahlung in Kontow\u00e4hrung, sp\u00e4testens folgender Gesch\u00e4ftstag; Verbraucherregel unverz\u00fcglich nicht \u00fcbertragen.675dVI-/Spezialausnahmen vorqualifizieren. Jeweils Kalender des verpflichteten Zahlungsdienstleisters f\u00fcr diesen Vorgang vollst\u00e4ndig angeben. Ergebnis bezeichnet Tagesablauf; Uhrzeiten/Zeitzonen extern normalisieren.")
 ergebnis
}
