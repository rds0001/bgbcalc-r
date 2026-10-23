argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
d <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/baunachtrag650c_normanwendung.json'),simplifyVector=FALSE);h <- d$nachweis
stopifnot(identical(bau_nachtragsverguetung_differenz('0','0','100','50',h)$wert,list(zaehler='-150',nenner='1')))
for(f in d$ketten) {
 endgueltig <- bau_nachtragsverguetung_differenz('1000','200','300','50',h)$wert
 stopifnot(identical(endgueltig,list(zaehler='850',nenner='1')))
 abschlag <- bau_nachtrag_vorlaeufiger_abschlagsansatz('2000',h)$wert
 stopifnot(identical(abschlag,list(zaehler='1600',nenner='1')))
 rueck <- bau_nachtrag_ueberzahlungsbetrag(abschlag,endgueltig,h)$wert
 stopifnot(identical(rueck,list(zaehler='750',nenner='1')))
 z <- verzugszinsen(kapital=rueck,basiszinssatz_prozent='3',zeitanteil_zaehler=1,zeitanteil_nenner=2,zeitanteil_nachweis=h,entgeltforderung=TRUE,verbraucher_beteiligt=f$verbraucher,zinsschuld=FALSE,glaeubigerverzug=FALSE,verzugsart='allgemein',hoeherer_zinssatz_prozent=NULL,basiszinsnachweis='Expliziter Testzinssatz, keine Behauptung eines aktuellen Basiszinssatzes.')
 stopifnot(identical(z$wert,f$zinsen))
}
cat('2native R-Nachtragsketten und1Minderungsfall bestanden.\n')
