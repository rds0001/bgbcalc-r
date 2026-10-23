miete_erklaerungs_monatsendtermin <- function(fristfall=NULL,zugang_erklaerung_am=NULL,einordnungsnachweis=NULL) {
 faelle <- list(modernisierung_haerteeinwand_555d=1,modernisierung_kuendigungserklaerung_555e=1,modernisierung_beendigung_555e=2,mieterhoehung_kuendigungserklaerung_561=2)
 .auswahl(fristfall,'fristfall',names(faelle));tag <- .datum(zugang_erklaerung_am,'zugang_erklaerung_am');.text(einordnungsnachweis,'einordnungsnachweis')
 ende <- .frist(paste0(substr(zugang_erklaerung_am,1,8),'01'),faelle[[fristfall]]+1,'monate','tagesbeginn')
 eingaben <- list(fristfall=fristfall,zugang_erklaerung_am=zugang_erklaerung_am,einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(list(rechnerischer_monatsendtermin=.iso(ende)),'datum','BGB_MIETE_ERKLAERUNGS_MONATSENDTERMIN',eingaben,list(list(operation='Ende des ersten oder zweiten Kalendermonats nach dem Zugangsmonat bestimmen; keine tageweise Monatsaddition ab Zugangstag.')),eingaben)
 ergebnis$hinweise <- list('Gesetzliche Grundtermine:555dIII H\u00e4rteeinwand bis Ende des Folgemonats bei ordnungsgem\u00e4\u00dfer Ank\u00fcndigung und anwendbarer Frist; Hinweismangel555dV und unverschuldete Versp\u00e4tung555dIV gesondert.555eI K\u00fcndigungserkl\u00e4rung bis Folgemonatsende, Mietende zum Ende des \u00fcbern\u00e4chsten Monats bezogen auf Zugang der Modernisierungsank\u00fcndigung;555cIV-Ausnahme vorqualifizieren.561I hier ausschlie\u00dflich letzter Grundtermin der K\u00fcndigungserkl\u00e4rung nach Erh\u00f6hungserkl\u00e4rung558/559; Beendigungstermin und Wegfall der Erh\u00f6hung separat. Keine automatische193Verschiebung von Erkl\u00e4rungsfristen; erforderlichenfalls separat mit qualifiziertem Anwendungsbereich pr\u00fcfen. Mietbeendigungsdatum nicht deshalb verschieben.')
 ergebnis
}
