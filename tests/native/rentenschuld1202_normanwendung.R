argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
options(warn=2)
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
faelle <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/rentenschuld1202_normanwendung.json'),simplifyVector=FALSE)
for(f in faelle) {
 grenze <- fristende(f$fristbeginn_am,30,'jahre','ereignis')
 stopifnot(identical(grenze$status,'BERECHNET'),identical(grenze$wert,f$erwartete_dreissigjahresgrenze),f$kuendigungszugang_am>grenze$wert)
 ende <- fristende(f$kuendigungszugang_am,6,'monate','ereignis')
 stopifnot(identical(ende$status,'BERECHNET'),identical(ende$wert,f$erwartetes_kuendigungsfristende))
}
cat(length(faelle),'R Rentenschuld1202-Ketten PASS\n')
