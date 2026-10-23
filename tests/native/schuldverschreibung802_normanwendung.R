argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
options(warn=2)
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
faelle <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/schuldverschreibung802_normanwendung.json'),simplifyVector=FALSE)
for(f in faelle) {
 grund <- do.call(schuldrechtliche_sondergrundfrist,f$grund_eingaben)
 stopifnot(identical(grund$status,'BERECHNET'),identical(grund$wert$rechnerisches_fristende,f$erwartetes_grundende))
 schutz <- do.call(verjaehrung_ablaufhemmung_mindestablauf,c(f$schutz_eingaben,list(rechnerischer_letzter_tag=grund$wert$rechnerisches_fristende)))
 stopifnot(identical(schutz$status,'BERECHNET'),identical(schutz$wert$nachlauf_kuerzer_als_sechs_monate,FALSE),identical(schutz$wert$rechnerischer_letzter_tag,f$erwartetes_ende))
}
cat(length(faelle),'R Zahlungssperren-Schutzketten PASS\n')
