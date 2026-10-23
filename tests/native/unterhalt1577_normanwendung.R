argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
faelle <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/unterhalt1577_normanwendung.json'),simplifyVector=FALSE)
for(f in faelle) {
 zwischen <- unterhalt_unterschiedsbetrag(f$voller_bedarf,f$anrechenbare_vermoegensdeckung,f$nachweis)$wert
 stopifnot(identical(zwischen,f$zwischen))
 rest <- unterhalt_unterschiedsbetrag(zwischen,f$anrechenbare_einkuenfte,f$nachweis)$wert
 stopifnot(identical(rest,f$rest))
}
cat(length(faelle),'native R-Unterhaltsrestketten bestanden.\n')
