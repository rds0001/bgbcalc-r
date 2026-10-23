argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
faelle <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/fortsetzung1490_1491_normanwendung.json'),simplifyVector=FALSE)
for(f in faelle) {
 wert <- fortgesetzte_guetergemeinschaft_grundanteile('1200',f$abkoemmlinge,f$nachweis)$wert
 stopifnot(identical(wert$ehegattenhaelfte,list(zaehler='600',nenner='1')),identical(wert$abkoemmlingshaelfte,list(zaehler='600',nenner='1')),identical(wert$abkoemmlingsanteile,f$erwartete_anteile))
}
cat(length(faelle),'native R-Gesamtgut-Normanwendungen bestanden.\n')
