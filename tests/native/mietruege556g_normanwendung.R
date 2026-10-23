argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
faelle <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/mietruege556g_normanwendung.json'),simplifyVector=FALSE)
h <- 'Qualifizierter556gII3-Fall, beide Fälligkeiten dem betrachteten Mietverhältnis zugehörig; nach Vertragsende qualifizierte Abrechnung.'
for(f in faelle) {
 zeit <- mietpreisbremse_ruegezeitliche_beschraenkung('2024-01-01',f$ruegetag,f$zugang,f$mietende,h)$wert
 abschnitte <- list(list(abschnitt_id='vorher',faelligkeit_utc='2026-06-01T00:00:00Z',tatsaechlich_gezahlte_miete='1000',zulaessige_miete='940'),list(abschnitt_id='nachher',faelligkeit_utc='2026-08-01T00:00:00Z',tatsaechlich_gezahlte_miete='1000',zulaessige_miete='940'))
 r <- mietpreisbremse_rueckzahlungsbetraege(f$zugang,zeit$rueckforderung_auf_spaetere_faelligkeit_beschraenkt,abschnitte,'0',h)
 stopifnot(identical(r$wert$verbleibender_rueckzahlungsbetrag,list(zaehler=f$erwartet,nenner='1')))
}
cat('Native556g-Zeit-/Betragsketten bestanden.\n')
