argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
faelle <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/besitz864_normanwendung.json'),simplifyVector=FALSE)
ende <- sachenrechtliche_grundfrist('besitzschutz_864','2024-05-10','Qualifizierte verbotene Eigenmacht, gesetzliches Grundjahr.')$wert$grundfristende
stopifnot(identical(ende,'2025-05-10'))
for(f in faelle) {
 klage_wahrt <- !is.null(f$klage_am) && f$klage_am<=ende
 jahresablauf <- f$prueftag>ende && !klage_wahrt
 urteil <- !is.null(f$rechtskraft_am) && f$rechtskraft_am<f$prueftag
 stopifnot(identical(jahresablauf||urteil,f$erloschen))
}
cat('Native864-Normanwendungen bestanden.\n')
