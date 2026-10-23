miete_erwerber_monatsgrenze <- function(regelfall=NULL, massgebliches_ereignis_am=NULL, einordnungsnachweis=NULL) {
 .auswahl(regelfall,'regelfall',c('vorausverfuegung_566b','mietergeschaeft_566c'))
 tag <- .datum(massgebliches_ereignis_am,'massgebliches_ereignis_am');.text(einordnungsnachweis,'einordnungsnachweis')
 erweitert <- as.integer(format(tag,'%d'))>15
 ende <- .frist(paste0(substr(.iso(tag),1,7),'-01'),if(erweitert) 2 else 1,'monate','tagesbeginn')
 eingaben <- list(regelfall=regelfall, massgebliches_ereignis_am=massgebliches_ereignis_am, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(list(zeitliche_mietgrenze=.iso(ende),folgemonat_einbezogen=erweitert),"datum_und_wahrheitswert","BGB_MIETE_ERWERBER_MONATSGRENZE",eingaben,list(list(operation="Bis einschlie\u00dflich Tag15 das laufende Monatsende, ab Tag16 das Ende des Folgemonats als zeitliche Mietgrenze bestimmen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7566bI und566cSatz1/2: nur zeitliche Grundgrenze der erfassten Mietzeitr\u00e4ume. Ereignis am15. verl\u00e4ngert nicht, am16. verl\u00e4ngert um einen Kalendermonat. Bei566bII kann Kenntnis des Erwerbers weitergehende Vorausverf\u00fcgungen wirksam werden lassen; bei566cSatz3 kann ein nach Eigentums\u00fcbergang mit Kenntnis vorgenommenes Mietergeschaft trotz dieses Zeitfensters unwirksam sein. Diese Ausnahmen nicht aus dem Datumsresultat ableiten. F\u00fcr566d ist die zeitliche Grenze nur ein Bestandteil; Erwerbs-/F\u00e4lligkeitschronologie der Gegenforderung separat. Keine K\u00fcndigungsfrist, keine automatische193Verschiebung und kein Wirksamkeitsentscheid.")
 ergebnis
}
