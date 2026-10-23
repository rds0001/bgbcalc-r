argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
f <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/vergleichsmiete558_normanwendung.json'),simplifyVector=FALSE)
h <- '558IV/V: Bindungswegfall zu Tagesbeginn und Rückwärtsmethode qualifiziert; Auskunftszugang und alternativ wirkende Ausgleichszahlung rechtlich vorgegeben.'
grenze <- rueckwaertsfrist_kalendergrenze(f$wegfall,4,'monate','ereignistag','nur_taggleiche_monate',h)$wert$grenztag_beginn
stopifnot(identical(grenze,f$frueheste_anfrage),'2024-08-31'<grenze,grenze<='2024-09-01')
stopifnot(identical(schuldrechtliche_sondergrundfrist('miete_ausgleichszahlung_auskunft_558',grenze,h)$wert$rechnerisches_fristende,f$antwortfrist))
zins <- modernisierung_zinsermaessigung('3000','1','3',h,TRUE,FALSE)$wert
stopifnot(identical(zins,list(zaehler=f$zinsvorteil,nenner='1')))
r <- vergleichsmiete_ausgleich_und_drittmittel('500','0','500','900',FALSE,'1500',zins,'60','150','alternative_erhoehungsgrenze',h)$wert
stopifnot(identical(r$monatsmiete_nach_vorgegebenem_modell,list(zaehler=f$neue_monatsmiete,nenner='1')))
cat('558IV/V: native Vorlauf-/Antwort- und Förderkette bestanden.\n')
