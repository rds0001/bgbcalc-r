argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
f <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/pflichtteil2322_raenge_normanwendung.json'),simplifyVector=FALSE)
h <- '2320/21-Zuordnungsgewichte3:2 rechtlich qualifiziert; keine automatische Rang-/Testamentsauslegung.'
for(i in seq_along(f$gewichte)) {
 anteil <- .bruchteile(.multiplizieren(.zahleneingabe(f$gesamtlast),.bruch(f$gewichte[[i]],sum(unlist(f$gewichte)))))
 r <- pflichtteil_vorteilslast('ersatzerwerb_2320',anteil,'0',f$vorteile[[i]],TRUE,h)$wert
 stopifnot(identical(r$zugeordnete_sonderlast,list(zaehler=f$sonderlasten[[i]],nenner='1')))
}
h <- '2187II/2322-Begünstigter eines ausgeschlagenen beschwerten Vermächtnisses; gemeinsam begrenzter Unterlastblock; wirksamer2189-Vorrang und proportionale Restgewichte rechtlich qualifiziert.'
gesamt <- sum(vapply(f$beschwerungen,function(p)as.numeric(p$beschwerungswert),numeric(1)))
verweigert <- untervermaechtnis_verweigerungsbetrag(f$erwerb,as.character(gesamt),TRUE,h)$wert
begrenzt <- .bruchteile(.subtrahieren(.bruch(gesamt),.zahleneingabe(verweigert)))
budget <- pflichtteil_deckung_beschwerungskuerzung(f$erwerb,begrenzt,f$last,TRUE,h)$wert$verbleibende_beschwerung
r <- vermaechtnis_rangweise_beschwerungsverteilung(budget,f$beschwerungen,h)$wert
stopifnot(identical(lapply(r$verteilung,function(p)p$zugeteilter_betrag),f$zuteilungen),identical(r$verbleibendes_budget,list(zaehler='0',nenner='1')))
cat('2320/2322/2189: native Quoten- und Rangketten bestanden.\n')
