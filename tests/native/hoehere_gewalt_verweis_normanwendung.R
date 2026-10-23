argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
faelle <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/hoehere_gewalt_verweis_normanwendung.json'),simplifyVector=FALSE)
for(f in faelle) {
 grund <- do.call(get(f$funktion),f$eingaben)$wert[[f$ergebnisschluessel]]
 stopifnot(identical(grund,f$grundende))
 r <- verjaehrung_hoehere_gewalt_festes_ablauffenster(f$erster,grund,list(list(erster_verhinderter_tag=f$hindernis_von,letzter_verhinderter_tag=f$hindernis_bis)),'fester_ablauf_ohne_206','letzter_monatstag','Festes Fenster und188III-Analogie für diesen Fall rechtlich begründet.')$wert
 stopifnot(r$beruecksichtigte_hemmungstage==f$tage,identical(r$rechnerischer_letzter_tag,f$ende))
 if(f$fall=='1762II') {
  s <- verjaehrung_ablaufhemmung_mindestablauf('vertretungsmangel',list(list(ereignis='vertretungsmangel_behoben',datum='2022-02-01')),1,'jahre',r$rechnerischer_letzter_tag,FALSE,TRUE)
  stopifnot(identical(s$wert$rechnerischer_letzter_tag,'2022-08-01'))
 }
}
alterswarteende <- fristende('2020-01-01',8,'wochen','tagesbeginn')$wert
stopifnot(identical(alterswarteende,'2020-02-25'),identical(fristende('2020-02-26',1,'jahre','tagesbeginn')$wert,'2021-02-25'))
a <- adoption_aufhebungsgrundfrist('2020-02-01',alterswarteende,'1762IId:Frist ab Ablauf der1747II-Alterswartezeit,bei relativer Ereignisberechnung deren Ablauftag verwenden.')
stopifnot(identical(a$wert$antragsgrundfristende,'2021-02-25'))
cat('Native206-Verweisketten bestanden.\n')

d <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/adoption1762_getrennte_fristlaeufe.json'),simplifyVector=FALSE)
enden <- character()
for(f in d$fristen) {
 grund <- fristende(f$ereignis,f$jahre,'jahre','ereignis')$wert
 stopifnot(identical(grund,f$grundende))
 r <- verjaehrung_hoehere_gewalt_festes_ablauffenster(f$erster,grund,list(list(erster_verhinderter_tag=d$hemmung_von,letzter_verhinderter_tag=d$hemmung_bis)),'fester_ablauf_ohne_206','letzter_monatstag','Getrennte1762-Fristläufe, festes206-Modell qualifiziert.')$wert$rechnerischer_letzter_tag
 stopifnot(identical(r,f$nach206))
 s <- verjaehrung_ablaufhemmung_mindestablauf('vertretungsmangel',list(list(ereignis='vertretungsmangel_behoben',datum=d$vertretungsmangel_behoben)),f$jahre,'jahre',r,FALSE,TRUE)$wert$rechnerischer_letzter_tag
 stopifnot(identical(s,f$nach210));enden <- c(enden,s)
}
stopifnot(identical(min(enden),d$kombiniertes_ende))
cat('Getrennte1762-Fristläufe bestanden.\n')
