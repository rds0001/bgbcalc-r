argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
faelle <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/alkohol_liefergrenze_normanwendung.json'),simplifyVector=FALSE)
for(f in faelle) {
 grenze <- fristende(f$vertragsschluss_am,30,'tage','ereignis')$wert
 stopifnot(identical(grenze,f$erwartete_grenze),identical(f$fruehestmoegliche_lieferung_am>=grenze,f$erwartung))
}
cat(length(faelle),'native R-Liefergrenzfaelle bestanden.\n')
