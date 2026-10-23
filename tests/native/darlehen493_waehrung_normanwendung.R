argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
faelle <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/darlehen493_waehrung_normanwendung.json'),simplifyVector=FALSE)
for(f in faelle) {
 bedingungen <- logical(0)
 for(i in 1:2) {
  werte <- immobiliardarlehen_wechselkursrechnung(c('1000','100')[[i]],'1',f$kurs,f$kurs,f$nachweis)$wert
  stopifnot(identical(werte$wert_zum_vergleichskurs,f$vergleichswerte[[i]]))
  warnung <- immobiliardarlehen_wechselkurswarnschwelle(werte$wert_zum_vertragskurs,werte$wert_zum_vergleichskurs,f$vorher,f$nachweis)$wert
  bedingungen <- c(bedingungen,warnung$numerische_warnbedingung)
 }
 stopifnot(identical(any(bedingungen),f$erwartung))
}
cat(length(faelle),'native R-Waehrungswarnketten bestanden.\n')
