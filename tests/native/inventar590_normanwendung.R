argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
options(warn=2)
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
faelle <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/inventar590_normanwendung.json'),simplifyVector=FALSE)
for(f in faelle) {
 r <- do.call(pacht_inventar_ausgleichsdifferenz,f$eingaben)
 stopifnot(identical(r$status,'BERECHNET'),isTRUE(all.equal(r$wert,f$erwarteter_wert)))
}
cat(length(faelle),'R Inventar590-Ketten PASS\n')
