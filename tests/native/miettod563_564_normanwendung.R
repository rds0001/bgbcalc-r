argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
options(warn=2)
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
faelle <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/miettod563_564_normanwendung.json'),simplifyVector=FALSE)
for(f in faelle) {
 warte <- do.call(schuldrechtliche_sondergrundfrist,f$warte_eingaben)
 stopifnot(identical(warte$status,'BERECHNET'),identical(warte$wert$rechnerisches_fristende,f$erwartetes_warteende))
 stopifnot(f$zugang_am>='2024-01-31',f$zugang_am<=warte$wert$rechnerisches_fristende)
 ende <- do.call(f$funktion,f$kuendigungs_eingaben)
 stopifnot(identical(ende$status,'BERECHNET'),identical(ende$wert[[f$ergebnisfeld]],f$erwartetes_ende))
 if(identical(f$funktion,'wohnraummiete_kuendigungstermin')) stopifnot(ende$wert$verlaengerungsmonate==0)
}
cat(length(faelle),'R Todesfall563bis564-Kündigungsketten PASS\n')
