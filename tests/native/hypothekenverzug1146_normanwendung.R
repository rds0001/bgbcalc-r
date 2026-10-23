argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
options(warn=2)
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
faelle <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/hypothekenverzug1146_normanwendung.json'),simplifyVector=FALSE)
for(f in faelle) {
 r <- do.call(get(f$funktion),f$eingaben)
 stopifnot(identical(r$status,'BERECHNET'),isTRUE(all.equal(r$wert,f$erwarteter_wert)))
}
cat(length(faelle),'R Hypothekenverzug1146-Normanwendungen PASS\n')
