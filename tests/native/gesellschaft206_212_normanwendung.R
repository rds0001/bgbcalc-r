argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
d <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/gesellschaft206_212_normanwendung.json'),simplifyVector=FALSE)
h <- 'Qualifizierte728b/739-Verweise, festes206-Modell und Monatsendregel.'
grund <- gesellschaft_fuenfjahresgrundfrist('nachhaftung_728b',d$wirksam,d$kenntnis,NULL,NULL,h)$wert$rechnerisches_fuenfjahresende
stopifnot(identical(grund,d$partnergrundende))
f <- d$nachhaftung
r <- verjaehrung_hoehere_gewalt_festes_ablauffenster('2024-02-01',grund,list(list(erster_verhinderter_tag=f$hindernis_von,letzter_verhinderter_tag=f$hindernis_bis)),'fester_ablauf_ohne_206','letzter_monatstag',h)$wert
stopifnot(identical(r$rechnerischer_letzter_tag,f$ende))
for(unwirksam in c(FALSE,TRUE)) {
 s <- gesellschaft_nachhaftung_fristsicherung(r$rechnerischer_letzter_tag,f$sicherungstag,list(list(ereignis_id='V',art='vollstreckungsantrag',datum=f$sicherungstag,rueckwirkend_unwirksam_212=unwirksam)),h)$wert
 stopifnot(identical(s$zeitliche_kopplung_erfuellt,!unwirksam),identical(s$nachhaftungsfrist_letzter_tag,f$ende))
}
f <- d$gesellschaft
grund <- gesellschaft_fuenfjahresgrundfrist('erloeschen_verjaehrung_739',d$wirksam,d$kenntnis,NULL,NULL,h)$wert$rechnerisches_fuenfjahresende
kurz <- fristende(d$kenntnis,3,'jahre','ereignis')$wert
stopifnot(identical(kurz,f$kurzgrundende))
k <- verjaehrung_hoehere_gewalt_festes_ablauffenster('2024-02-01',kurz,list(list(erster_verhinderter_tag=f$hindernis_von,letzter_verhinderter_tag=f$hindernis_bis)),'fester_ablauf_ohne_206','letzter_monatstag',h)$wert
stopifnot(identical(k$rechnerischer_letzter_tag,f$kurzende))
von <- max(f$hindernis_von,k$fenster_erster_tag);bis <- min(f$hindernis_bis,k$fenster_letzter_tag)
p <- verjaehrung_gehemmte_kalendertage('2024-02-01',grund,list(list(erster_gehemmter_tag=von,letzter_gehemmter_tag=bis)),TRUE)$wert$rechnerischer_letzter_tag
stopifnot(identical(p,f$partnerende),identical(min(p,k$rechnerischer_letzter_tag),f$kurzende))
invalid <- verjaehrung_neubeginn_grundfrist('2026-01-01',5,'jahre',FALSE)
stopifnot(identical(invalid$status,'NICHT_ANWENDBAR'),is.null(invalid$wert))
cat('Native728b/739/206/212-Ketten bestanden.\n')
