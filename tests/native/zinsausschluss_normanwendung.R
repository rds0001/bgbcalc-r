argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
stopifnot(length(argumente)>=1L)
options(warn=2)
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
faelle <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/zinsausschluss_normanwendung.json'),simplifyVector=FALSE)
for(fall in faelle) {
 zeiten <- do.call(zinskalendertage_nach_ausschluss,fall$ausschluss_eingaben)
 stopifnot(identical(zeiten$status,'BERECHNET'))
 tage <- zeiten$wert$verzinsliche_kalendertage
 stopifnot(isTRUE(all.equal(tage,fall$erwartete_zinstage)))
 zins <- gesetzliche_zinsen(kapital='3650',zeitanteil_zaehler=tage,zeitanteil_nenner=365,zeitanteil_nachweis=fall$einordnungsnachweis,glaeubigerverzug=FALSE,abweichender_zinssatz_prozent=NULL)
 stopifnot(identical(zins$status,'BERECHNET'),isTRUE(all.equal(zins$wert,fall$erwarteter_zins)))
}
cat(length(faelle),'R Zinsausschluss-Zinsketten PASS\n')
