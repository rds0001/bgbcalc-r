argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
faelle <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/stiftung_vorlauf_normanwendung.json'),simplifyVector=FALSE)
for(f in faelle) {
 ablauf <- fristende(f$ausloesung_am,1,'monate','ereignis')$wert
 frueh <- fristverlaengerung(ablauf,1,'tage')$wert
 stopifnot(identical(ablauf,f$erwarteter_ablauf),identical(frueh,f$erwarteter_fruehester_zieltag),identical(f$zieltag_am>=frueh,f$erwartung))
}
cat(length(faelle),'native R-Stiftungsvorlauffaelle bestanden.\n')
