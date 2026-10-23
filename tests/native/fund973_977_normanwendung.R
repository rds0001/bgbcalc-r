argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
d <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/fund973_977_normanwendung.json'),simplifyVector=FALSE);h <- d$nachweis
for(f in d$faelle) {
 gross <- fund_anzeigewertgrenze(f$sachenwert)$wert$wertgrenze_ueberschritten
 ende <- sachenrechtliche_grundfrist(if(gross) 'fundanzeige_973' else 'geringwertiger_fund_973',if(gross) f$anzeige else f$fund,h)$wert$grundfristende
 stopifnot(identical(ende,f$sechsmonatsende))
 erwerb <- format(as.Date(ende)+1,'%Y-%m-%d');stopifnot(identical(erwerb,f$erwerb))
 ende977 <- fristende(erwerb,3,'jahre','tagesbeginn')$wert
 stopifnot(identical(ende977,f$dreijahresende))
 for(geltendmachung in f$geltendmachungen) stopifnot(identical(geltendmachung$am<=ende977,geltendmachung$rechtzeitig))
}
for(f in d$gesetzte_fristen) {
 erwerb <- format(as.Date(f$ende)+1,'%Y-%m-%d')
 stopifnot(identical(erwerb,f$erwerb),identical(fristende(erwerb,3,'jahre','tagesbeginn')$wert,f$dreijahresende))
}
cat('4native R-Fundfristketten bestanden.\n')
