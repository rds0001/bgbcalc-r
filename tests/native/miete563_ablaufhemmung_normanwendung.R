argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
d <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/miete563_ablaufhemmung_normanwendung.json'),simplifyVector=FALSE)
for(f in d$faelle) {
 grund <- schuldrechtliche_sondergrundfrist('miete_eintrittsablehnung_563',f$kenntnis,d$nachweis)$wert$rechnerisches_fristende
 ende <- verjaehrung_ablaufhemmung_mindestablauf('vertretungsmangel',f$ereignisse,1,'monate',grund,FALSE,TRUE)$wert
 stopifnot(isTRUE(ende$nachlauf_kuerzer_als_sechs_monate),identical(ende$rechnerischer_letzter_tag,f$ende))
}
cat('3native R-563-Ablaufhemmungsketten bestanden.\n')
