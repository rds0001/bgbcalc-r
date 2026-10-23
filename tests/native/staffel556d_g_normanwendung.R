argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
f <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/staffel556d_g_normanwendung.json'),simplifyVector=FALSE)
h <- '556d–g/557a-Folge mit zunächst fehlender Auskunft; spätere Nachholung, Modernisierung im maßgeblichen Dreijahresfenster, ersteFälligkeit jeweilsStaffelbeginn; Schutzmodell ausdrücklich qualifiziert.'
warteende <- fristende(f$nachholung,2,'jahre','ereignis')$wert
stopifnot(identical(warteende,'2025-12-31'))
vormiete <- mietpreisbegrenzung_vormiete_bereinigen('850','100',list('50'),h)$wert$bereinigte_vormiete
modern <- modernisierung_regulaerer_zwischenbetrag('12000','2000','1000','0','0',TRUE)$wert$monatlicher_zwischenbetrag
kap <- modernisierung_kappungsgrenze('50','8','0','0','allgemein',TRUE)$wert$massgebliche_restgrenze
if(.vergleichen(.zahleneingabe(modern),.zahleneingabe(kap))>0) modern <- kap
staffeln <- list()
for(s in f$staffeln) {
 nutzbar <- s$beginn>warteende
 grund <- mietpreisbegrenzung_grundbetrag(s$vergleich,TRUE,FALSE,h)$wert
 vor <- mietpreisbegrenzung_vormietgrenze(grund,vormiete,nutzbar,h)$wert
 unmod <- mietpreisbegrenzung_grundbetrag(s$unmodernisiert,TRUE,FALSE,h)$wert
 grenze <- mietpreisbegrenzung_modernisierungsalternative(vor,unmod,modern,nutzbar,h)$wert$nutzbare_monatsgrenze
 staffeln[[length(staffeln)+1]] <- list(staffelbeginn_am=s$beginn,vereinbarte_monatsmiete=s$vereinbart,zulaessige_monatsmiete_ohne_vorstaffelschutz=grenze)
}
werte <- staffelmiete_flexible_betragsfolge(staffeln,'hoechste_wirksame_vorstaffel',h)$wert
for(i in seq_along(werte)) stopifnot(identical(werte[[i]]$rechnerische_monatsmiete,list(zaehler=f$staffeln[[i]]$erwartet,nenner='1')))
beschraenkt <- mietpreisbremse_ruegezeitliche_beschraenkung('2024-01-01',f$ruege_am,f$ruege_utc,NULL,h)$wert$rueckforderung_auf_spaetere_faelligkeit_beschraenkt
abschnitte <- lapply(seq_along(werte),function(i)list(abschnitt_id=as.character(i),faelligkeit_utc=paste0(f$staffeln[[i]]$beginn,'T12:00:00Z'),tatsaechlich_gezahlte_miete=f$staffeln[[i]]$vereinbart,zulaessige_miete=werte[[i]]$rechnerische_monatsmiete))
stopifnot(identical(mietpreisbremse_rueckzahlungsbetraege(f$ruege_utc,beschraenkt,abschnitte,'0',h)$wert$verbleibender_rueckzahlungsbetrag,list(zaehler=f$rueckzahlung,nenner='1')))
cat('556d–g/557a: native vollständige Staffelkette bestanden.\n')
