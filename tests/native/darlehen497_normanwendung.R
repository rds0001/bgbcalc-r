argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
d <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/darlehen497_normanwendung.json'),simplifyVector=FALSE)
for(f in d$faelle) {
 intervall <- darlehen_verzugshemmungszeitraum('2020-01-01','2021-01-01',f$feststellung,f$betrachtung,d$nachweis)$wert
 stopifnot(identical(intervall$zehnjahresgrenze,'2030-01-01'))
 ende <- verjaehrung_gehemmte_kalendertage('2021-01-01','2023-12-31',intervall$hemmungszeitraeume,TRUE)$wert
 stopifnot(identical(ende$rechnerischer_letzter_tag,'2024-01-10'),ende$beruecksichtigte_hemmungstage==10)
}
cat('2native R-497-Hemmungsketten bestanden.\n')
