argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
faelle <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/hypothek1123_normanwendung.json'),simplifyVector=FALSE)
for(f in faelle) {
 jahr <- sachenrechtliche_grundfrist('hypothekenmiete_faelligkeitsjahr_1123',f$faellig,'1123II1-Jahresablauf ab qualifizierter Fälligkeit.')$wert$grundfristende
 frei <- jahr<f$beobachtung && (is.null(f$beschlagnahme)||f$beschlagnahme>jahr)
 if(f$vorauszahlung && !is.null(f$beschlagnahme)) {
  grenze <- hypothek_beschlagnahme_monatsgrenze(f$beschlagnahme,'1123II2-vorqualifizierte Vorausmiete; eigener zeitlich getrennter Mietabschnitt.')$wert$letzter_erfasster_monat_endet_am
  frei <- frei && f$mietende<=grenze
 }
 stopifnot(identical(frei,f$befreit))
}
cat('1123: acht native Normanwendungen bestanden.\n')
