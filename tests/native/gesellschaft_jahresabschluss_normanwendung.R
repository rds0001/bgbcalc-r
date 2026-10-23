argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
options(warn=2)
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
faelle <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/gesellschaft_jahresabschluss_normanwendung.json'),simplifyVector=FALSE)
for(f in faelle) {
 datum <- do.call(fristende,f$kalender_eingaben)
 stopifnot(identical(datum$status,'BERECHNET'),identical(datum$wert,f$erwarteter_abschluss))
 betraege <- do.call(gesellschaft_gewinn_verlust_betraege,f$betrag_eingaben)
 stopifnot(identical(betraege$status,'BERECHNET'),isTRUE(all.equal(lapply(betraege$wert,function(p) p$ergebnisanteil),f$erwartete_betraege)))
}
cat(length(faelle),'R Jahresabschlussketten PASS\n')
