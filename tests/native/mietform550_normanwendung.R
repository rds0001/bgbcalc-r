argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
d <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/mietform550_normanwendung.json'),simplifyVector=FALSE)
for(f in d$faelle) {
 normal <- wohnraummiete_kuendigungstermin(f$zugang,'mieter_standard',f$grenze,NULL,FALSE,d$nachweis)$wert$fruehester_beendigungstag
 stopifnot(identical(normal,f$regulaer))
 ende <- miete_formmangel_beendigungsgrenze('2024-02-15',normal,d$nachweis)$wert
 stopifnot(identical(ende,list(jahresmindestgrenze='2025-02-15',fruehester_monatsendtermin='2025-02-28')))
}
cat('2native R-550-Ketten bestanden.\n')
