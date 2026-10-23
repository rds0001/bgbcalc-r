argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
options(warn=2)
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
faelle <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/zinsanspruch_normanwendung.json'),simplifyVector=FALSE)
for(f in faelle) {
 erster <- f$erster_zinstag
 if(!is.null(f$beginn_eingaben)) {
  beginn <- do.call(prozesszins_erster_zinstag,f$beginn_eingaben)
  stopifnot(identical(beginn$status,'BERECHNET'))
  erster <- beginn$wert$erster_prozesszinstag
  stopifnot(identical(erster,f$erster_zinstag))
 }
 zeiten <- zinskalendertage_nach_ausschluss(erster_betrachteter_tag=erster,letzter_betrachteter_tag=f$letzter_zinstag,ausschlusszeitraeume=list(),einordnungsnachweis=f$einordnungsnachweis)
 stopifnot(identical(zeiten$status,'BERECHNET'))
 tage <- zeiten$wert$verzinsliche_kalendertage
 stopifnot(isTRUE(all.equal(tage,f$tage)))
 eingaben <- list(kapital='3650',zeitanteil_zaehler=tage,zeitanteil_nenner=365,zeitanteil_nachweis=f$einordnungsnachweis,glaeubigerverzug=FALSE)
 if(identical(f$funktion,'verzugszinsen')) {
  eingaben <- c(eingaben,list(basiszinssatz_prozent='3',basiszinsnachweis='Synthetischer konstanter Basiszins für dieses Beispiel',entgeltforderung=TRUE,verbraucher_beteiligt=f$verbraucher_beteiligt,zinsschuld=f$zinsschuld,verzugsart='allgemein',hoeherer_zinssatz_prozent=NULL))
 } else eingaben <- c(eingaben,list(abweichender_zinssatz_prozent=NULL))
 ergebnis <- do.call(f$funktion,eingaben)
 stopifnot(identical(ergebnis$status,f$erwartung$status),isTRUE(all.equal(ergebnis$wert,f$erwartung$wert)))
}
cat(length(faelle),'R Zinsanspruchsketten PASS\n')
