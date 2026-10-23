argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
d <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/mietzeit536_547_normanwendung.json'),simplifyVector=FALSE);h <- d$nachweis
summe <- .bruch(0);letzter <- NULL
for(f in d$minderung) {
 von <- as.Date(f$von);bis <- as.Date(f$bis)
 stopifnot(is.null(letzter)||von>letzter);letzter <- bis;tage <- as.numeric(bis-von)+1
 stopifnot(tage==f$tage)
 wert <- miete_zeitanteiliger_minderungsbetrag(f$monatsmiete,f$quote,list(zaehler=as.character(tage),nenner='31'),h)$wert
 stopifnot(identical(wert,f$betrag));summe <- .addieren(summe,.zahleneingabe(wert))
}
stopifnot(.vergleichen(summe,.bruch(200))==0)
ausschluss <- fristende('2024-08-17',3,'monate','tagesbeginn')$wert
stopifnot(identical(ausschluss,'2024-11-16'),identical(fristverlaengerung(ausschluss,1,'tage')$wert,'2024-11-17'))
tage <- as.numeric(as.Date('2024-02-29')-as.Date('2024-02-10'))
rueck <- mietvorauszahlung_zeitanteilige_rueckerstattung('290',list(zaehler=as.character(tage),nenner='29'),h)$wert
stopifnot(identical(rueck,list(zaehler='190',nenner='1')))
zinstage <- as.numeric(as.Date('2024-07-01')-as.Date('2024-01-01'))
stopifnot(identical(gesetzliche_zinsen(rueck,zinstage,366,paste0(h,' Empfang zu Tagesbeginn1.1.;Actual/Actual fuer diesen Abschnitt.'),FALSE,NULL)$wert,list(zaehler='3458',nenner='915')))
stopifnot(identical(bereicherung_entreicherungsrest(rueck,'40',paste0(h,' Nicht zu vertretende Beendigung und Entreicherung40 rechtlich festgestellt.'))$wert,list(zaehler='150',nenner='1')))
cat('3Minderungsabschnitte,1Dreimonatsgrenze und2Rueckerstattungsketten nativ R bestanden.\n')
