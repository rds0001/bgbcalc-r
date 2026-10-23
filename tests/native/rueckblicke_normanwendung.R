argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
d <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/rueckblicke_normanwendung.json'),simplifyVector=FALSE)
h <- 'Rechtlich qualifizierte normbezogene Rückwärtsanalogie, Tagesgrenzen und taggleiche Zielmonate.'
f <- d$mietpfand
start <- rueckwaertsfrist_kalendergrenze(f$pfaendung_am,1,'jahre','ereignistag','nur_taggleiche_monate',h)$wert$grenztag_beginn
stopifnot(identical(start,f$erwarteter_fensterbeginn))
for(a in f$abschnitte) stopifnot(identical(start<=a$von && a$von<=a$bis && a$bis<f$pfaendung_am,a$innerhalb))
f <- d$privatglaeubiger
start <- rueckwaertsfrist_kalendergrenze(f$pfaendung_am,6,'monate','ereignistag','nur_taggleiche_monate',h)$wert$grenztag_beginn
stopifnot(identical(start,f$erwarteter_fensterbeginn))
for(a in f$vollstreckungen) stopifnot(identical(start<=a$am && a$am<f$pfaendung_am,a$innerhalb))
stopifnot(identical(gesellschaft_jahresendkuendigung(f$kuendigung,'privatglaeubiger_726',h)$wert$beendigungsgrundtermin,f$beendigung))
f <- d$zeitmiete
start <- rueckwaertsfrist_kalendergrenze(f$mietende_am,4,'monate','tagesende','nur_taggleiche_monate',h)$wert$grenztag_beginn
stopifnot(identical(start,f$fruehester_auskunftstag))
for(a in f$anfragen) stopifnot(identical(a$am>=start,a$zulaessiger_zeitpunkt))
cat('Native562d/575/726-Rückwärtsanwendungen bestanden.\n')
