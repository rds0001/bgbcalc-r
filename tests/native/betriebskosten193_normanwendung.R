argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
faelle <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/betriebskosten193_normanwendung.json'),simplifyVector=FALSE)
for(f in faelle) {
 ende <- betriebskosten_grundfristende(f$fristfall,f$bezugsdatum,f$fristberechnung,f$nachweis)$wert$rechnerisches_fristende
 stopifnot(identical(ende,f$grundfrist))
 korrigiert <- werktagsverschiebung(ende,'willenserklaerung',f$feiertage,'Testort','Expliziter Kalender fuer die betroffenen Folgetage; keine weiteren einschlaegigen Feiertage.','2023-01-01','2024-01-02')$wert
 stopifnot(identical(korrigiert,f$korrigiert))
}
cat(length(faelle),'native R-Betriebskosten193-Ketten bestanden.\n')
