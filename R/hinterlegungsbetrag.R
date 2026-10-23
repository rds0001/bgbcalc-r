hypothek_hinterlegung_forderung_und_zinsen <- function(forderungsbetrag=NULL, ausschliessungsbeschluss_rechtskraeftig_am=NULL, zinssatz_im_grundbuch_eingetragen=NULL, zinsabschnitte=NULL, einordnungsnachweis=NULL) {
 forderung <- .geld(forderungsbetrag);.wahrheitswert(zinssatz_im_grundbuch_eingetragen,'zinssatz_im_grundbuch_eingetragen');.text(einordnungsnachweis,'einordnungsnachweis')
 jahr <- as.integer(format(.datum(ausschliessungsbeschluss_rechtskraeftig_am,'ausschliessungsbeschluss_rechtskraeftig_am'),'%Y'))
 if(jahr<5) .fehler('ausschliessungsbeschluss_rechtskraeftig_am','Vier vorherige Kalenderjahre im Datumsbereich erforderlich.')
 grenze <- sprintf('%04d-01-01',jahr-4)
 grenztag <- .datum(grenze,'zinsbeginn');.vorhanden(zinsabschnitte,'zinsabschnitte')
 if(!is.list(zinsabschnitte) || !is.null(names(zinsabschnitte)) || length(zinsabschnitte)>1000) .fehler('zinsabschnitte','Liste0..1000 erforderlich.')
 intervalle <- list()
 for(z in zinsabschnitte) {
  if(!is.list(z) || !identical(sort(names(z)),sort(c('erster_zinstag','letzter_zinstag','zinsbetrag')))) .fehler('zinsabschnitte','Genau erster_zinstag, letzter_zinstag und zinsbetrag erforderlich.')
  a <- .datum(z$erster_zinstag,'erster_zinstag');b <- .datum(z$letzter_zinstag,'letzter_zinstag');betrag <- .geld(z$zinsbetrag)
  if(b<a) .fehler('zinsabschnitte','Ende vor Beginn.')
  if(a<grenztag && b>=grenztag) .fehler('zinsabschnitte','Abschnitt an Kalenderjahresgrenze zuvor rechtlich zutreffend teilen.')
  intervalle <- c(intervalle,list(list(a=a,b=b,betrag=betrag)))
 }
 vorher <- NULL;zins <- .geld('0')
 if(length(intervalle)) for(z in intervalle[order(vapply(intervalle,function(x) as.numeric(x$a),numeric(1)))]) {
  if(!is.null(vorher) && z$a<=vorher) .fehler('zinsabschnitte','\u00dcberlappende Zinsabschnitte unzul\u00e4ssig.')
  vorher <- z$b
  if(zinssatz_im_grundbuch_eingetragen && z$a>=grenztag) zins <- .addieren(zins,z$betrag)
 }
 wert <- list(fruehester_hinterlegungszinsbeginn=grenze,hinterlegungszinsbetrag=.bruchteile(zins),hinterlegungsbetrag=.bruchteile(.addieren(forderung,zins)))
 eingaben <- list(forderungsbetrag=forderungsbetrag, ausschliessungsbeschluss_rechtskraeftig_am=ausschliessungsbeschluss_rechtskraeftig_am, zinssatz_im_grundbuch_eingetragen=zinssatz_im_grundbuch_eingetragen, zinsabschnitte=zinsabschnitte, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_HYPOTHEK_HINTERLEGUNG_FORDERUNG_UND_ZINSEN",eingaben,list(list(operation="Rechtlich qualifizierte Zinsabschnitte nach1171-Kalenderjahresgrenze ausw\u00e4hlen und nur bei eingetragenem Zinssatz zum Forderungsbetrag addieren.")),eingaben)
 ergebnis$hinweise <- list("\u00a71171I: Forderungsbetrag plus erforderliche eingetragene Zinsen, deren Zinszeitraum nicht vor Beginn des vierten Kalenderjahres vor Rechtskraft liegt. Ma\u00dfgeblich ist Zinszeit, nicht F\u00e4lligkeit oder Buchungstag. Abschnittsbetr\u00e4ge nach zutreffendem Satz/Kapital/Zinszeitanteil zuvor berechnen, etwa mit gesetzliche_zinsen; keine pauschale Tageslinearit\u00e4t f\u00fcr beliebig vorgegebene Zinsbetr\u00e4ge. Abschnitt \u00fcber die Kalenderjahresgrenze muss vorher rechtlich zutreffend geteilt werden. Keine automatische Zinsentstehung, Hinterlegungswirksamkeit oder Erl\u00f6schensentscheidung1171II/III. Eingaben sind bereits rechtlich zu hinterlegende abgeschlossene Zinsabschnitte; keine Zukunftszinsen erfinden. Ohne eingetragenen Zinssatz keinen Zinsbetrag zur Hinterlegung addieren.")
 ergebnis
}
