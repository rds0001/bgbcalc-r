argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
d <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/fortsetzung1505_normanwendung.json'),simplifyVector=FALSE);h <- d$nachweis
anteil <- fortgesetzte_guetergemeinschaft_grundanteile('1000',lapply(c('A','B'),function(x)list(abkoemmling_id=x,hypothetischer_erbteil='0.5')),h)$wert$abkoemmlingsanteile[[1]]
stopifnot(identical(anteil$pflichtteilswertbasis,list(zaehler='125',nenner='1')));q <- anteil$anteil_gesamtgut
for(f in d$faelle) {
 wert <- pflichtteil_schenkungswert(f$vergleich,f$beendigungwert,FALSE,FALSE,h)$wert
 zeit <- pflichtteil_schenkungsabschmelzung(wert,'2020-01-01','2023-01-02',TRUE,FALSE,NULL,h)$wert
 stopifnot(identical(zeit$beruecksichtigter_schenkungswert,f$geschenk))
 grund <- pflichtteilsergaenzung_grundbetrag('1000',zeit$beruecksichtigter_schenkungswert,as.integer(q$zaehler),as.integer(q$nenner),TRUE,h)$wert
 stopifnot(identical(grund$ordentlicher_pflichtteilswert,anteil$pflichtteilswertbasis),identical(grund$ergaenzungsgrundbetrag,f$grund))
 ende <- pflichtteilsergaenzung_mehrhinterlassung(grund$ergaenzungsgrundbetrag,f$hinterlassen,grund$ordentlicher_pflichtteilswert,h)$wert
 stopifnot(identical(ende$verbleibende_ergaenzung,f$rest))
}
cat('3native R-1505-Ketten bestanden.\n')
