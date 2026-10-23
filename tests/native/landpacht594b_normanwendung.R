argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
options(warn=2)
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
faelle <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/landpacht594b_normanwendung.json'),simplifyVector=FALSE)
for(f in faelle) {
 grund <- do.call(fristende,f$grund_eingaben)
 stopifnot(identical(grund$status,'BERECHNET'),identical(grund$wert,f$erwartetes_warteende),f$kuendigung_eingaben$kuendigungszugang_am>grund$wert)
 r <- do.call(pacht_kuendigungstermin,f$kuendigung_eingaben)
 stopifnot(identical(r$status,'BERECHNET'),identical(r$wert$rechnerischer_pachtendtermin,f$erwarteter_endtermin))
}
cat(length(faelle),'R Landpacht594b-Ketten PASS\n')
