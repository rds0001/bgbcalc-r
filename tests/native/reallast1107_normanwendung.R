argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
faelle <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/reallast1107_normanwendung.json'),simplifyVector=FALSE)
for(f in faelle) {
 r <- hypothek_folgequartalsgrenze(f$kenntnis,f$faelligkeit,'uebertragungskenntnis_1158',TRUE,'1107 entsprechend anwendbare1158-Regel für einzelne Reallastleistung; Kenntnis und Fälligkeit qualifiziert.')
 stopifnot(identical(r$status,'BERECHNET'),identical(r$wert,list(folgequartalsende=f$grenze,faelligkeit_nach_folgequartal=!f$erfuellt,zeitmerkmal_erfuellt=f$erfuellt)))
}
cat('1107/1158: drei native Grenzfälle bestanden.\n')
