argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
f <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/bereicherung820_822_normanwendung.json'),simplifyVector=FALSE)
h <- '820I/II qualifiziert; Zinsbeginn lokale Mitternacht,6%undActual/365 ausdrücklich rechtlich qualifiziert.'
zeiten <- bereicherung_haftungszeitpunkte('2023-01-01T00:00:00Z',NULL,NULL,TRUE,TRUE,f$kenntnis_utc,h)$wert
start <- as.POSIXct(zeiten$zins_und_nutzungskenntnis_820_utc,format='%Y-%m-%dT%H:%M:%SZ',tz='UTC')
stopifnot(identical(format(start,'%H:%M',tz='Europe/Berlin'),'00:00'))
tage <- zinskalendertage_nach_ausschluss(format(start,'%Y-%m-%d',tz='Europe/Berlin'),f$letzter_zinstag,list(),h)$wert$verzinsliche_kalendertage
stopifnot(tage==f$zinstage,identical(gesetzliche_zinsen('1000',tage,365,h,FALSE,'6')$wert,f$zinsbetrag))
h <- '822-Tatbestand und kausal ausgeschlossene Ersthaftung; getrennte818III-Entreicherung des Dritten rechtlich qualifiziert.'
stopifnot(identical(bereicherung_entreicherungsrest(f$ursprungsbetrag,f$weitergabe,h)$wert,list(zaehler=f$rest_empfaenger,nenner='1')))
stopifnot(identical(bereicherung_entreicherungsrest(f$weitergabe,f$drittentreicherung,h)$wert,list(zaehler=f$rest_dritter,nenner='1')))
cat('820/822: native Zins- und Haftungsketten bestanden.\n')
