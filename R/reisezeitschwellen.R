.reise_utc_zeitpunkt <- function(wert,name) {
 .text(wert,name)
 if(!grepl('^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}Z$',wert)) .fehler(name,'Sekundengenauer UTC-Zeitpunkt YYYY-MM-DDTHH:MM:SSZ erforderlich; keine stille Zeitzonenannahme oder Rundung.')
 .datum(substr(wert,1,10),name)
 stunde <- as.integer(substr(wert,12,13));minute <- as.integer(substr(wert,15,16));sekunde <- as.integer(substr(wert,18,19))
 if(stunde>23||minute>59||sekunde>59) .fehler(name,'Ung\u00fcltiger UTC-Zeitpunkt im Kalenderbereich0001..9999.')
 zeit <- tryCatch(as.POSIXct(strptime(wert,format='%Y-%m-%dT%H:%M:%SZ',tz='UTC'),tz='UTC'),error=function(e) as.POSIXct(NA))
 if(is.na(zeit)) .fehler(name,'Ung\u00fcltiger UTC-Zeitpunkt im Kalenderbereich0001..9999.')
 zeit
}
reise_stundengrenze <- function(regelfall=NULL,zeitraum_von_utc=NULL,zeitraum_bis_utc=NULL,zeitnachweis=NULL) {
 faelle <- list(tagesreise_dauer=list(86400,'weniger_als'),onlinebuchung_verbund=list(86400,'hoechstens'),veranstalter_ruecktritt_kurzreise=list(172800,'mindestens'),beherbergungsausnahme_vorabinformation=list(172800,'mindestens'))
 .auswahl(regelfall,'regelfall',names(faelle));von <- .reise_utc_zeitpunkt(zeitraum_von_utc,'zeitraum_von_utc');bis <- .reise_utc_zeitpunkt(zeitraum_bis_utc,'zeitraum_bis_utc');.text(zeitnachweis,'zeitnachweis')
 if(bis<von) .fehler('zeitraum_bis_utc','Endzeitpunkt darf nicht vor Anfangszeitpunkt liegen.')
 sekunden <- as.numeric(difftime(bis,von,units='secs'));grenze <- faelle[[regelfall]][[1]];vergleich <- faelle[[regelfall]][[2]]
 eingehalten <- if(vergleich=='weniger_als') sekunden<grenze else if(vergleich=='hoechstens') sekunden<=grenze else sekunden>=grenze
 eingaben <- list(regelfall=regelfall,zeitraum_von_utc=zeitraum_von_utc,zeitraum_bis_utc=zeitraum_bis_utc,zeitnachweis=zeitnachweis)
 wert <- list(zeitspanne_sekunden=sekunden,grenzdauer_sekunden=grenze,vergleich=vergleich,grenze_erfuellt=eingehalten)
 ergebnis <- .ergebnis(wert,'sekunden_und_wahrheitswert','BGB_REISE_STUNDENGRENZE',eingaben,list(list(operation='Normalisierte UTC-Zeitpunkte mit Standard-Datumsbibliothek voneinander abziehen; strikte oder einschlie\u00dflich geltende Stundengrenze vergleichen.')),eingaben)
 ergebnis$hinweise <- list("tagesreise_dauer:651aV2/651cIII, vom Reisebeginn bis Reiseende strikt weniger als24Stunden; fehlende \u00dcbernachtung und gegebenenfalls500EUR-Grenze separat. onlinebuchung_verbund:651cI3, Best\u00e4tigung des ersten Vertragsschlusses bis Abschluss des weiteren Vertrags h\u00f6chstens24Stunden; Daten\u00fcbermittlung/weitere Voraussetzungen separat. veranstalter_ruecktritt_kurzreise:651hIV1c, ma\u00dfgeblicher R\u00fccktrittszugang bis Reisebeginn mindestens48Stunden, nur qualifizierte Reisedauer unter zwei Tagen; m\u00f6glicherweise fr\u00fchere Vertragsfrist zus\u00e4tzlich. beherbergungsausnahme_vorabinformation:651kV, qualifizierte Information an Veranstalter bis Reisebeginn mindestens48Stunden; pers\u00f6nliche Voraussetzungen und weitere Ausnahmen separat. Nur nachweislich auf volle Sekunden normalisierte UTC-Zeitpunkte; keine lokale Zeitzone erraten, Subsekunden nicht abschneiden. POSIX-Zeitrechnung ohne Schaltsekundendarstellung, keine Kalender-Tagesfrist in Stunden umdeuten.")
 ergebnis
}
