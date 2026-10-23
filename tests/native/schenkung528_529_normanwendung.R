argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
faelle <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/schenkung528_529_normanwendung.json'),simplifyVector=FALSE)
for(f in faelle) {
 a <- schenkung_verarmungsrueckforderung_ausschluss(f$geschenk_am,'2024-01-31',FALSE,FALSE,'Qualifizierte Leistung und Bedürftigkeit.')$wert$rueckforderung_nach_529_absatz_eins_oder_534_ausgeschlossen
 stopifnot(identical(a,f$ausgeschlossen))
 p <- list(list(beschenkten_id='alt',schenkungsrang=1,bereicherungsgrenze=if(a)'0' else '200',leistungsfaehigkeitsgrenze='200'),list(beschenkten_id='jung',schenkungsrang=2,bereicherungsgrenze='100',leistungsfaehigkeitsgrenze='40'))
 r <- schenkung_unterhaltsrueckforderung('200','50',p,'Geldrückforderung, gleicher Zeitraum, qualifizierte Rangfolge und529II-Grenzen.')$wert
 stopifnot(identical(lapply(r$verteilung,function(x)x$rueckforderungsbetrag),list(list(zaehler='40',nenner='1'),list(zaehler=f$altbetrag,nenner='1'))),identical(r$ungedeckter_fehlbetrag,list(zaehler=f$rest,nenner='1')))
}
cat('Native528/529-Ketten bestanden.\n')
