vaterschaftsanfechtung_vertretergrundfrist <- function(vertreterkenntnis_am=NULL, kind_geboren_am=NULL, berechtigter_geboren_am=NULL, anerkennung_wirksam_am=NULL, einordnungsnachweis=NULL) {
 .text(einordnungsnachweis,'einordnungsnachweis');.datum(berechtigter_geboren_am,'berechtigter_geboren_am')
 ereignis <- max(.datum(vertreterkenntnis_am,'vertreterkenntnis_am'),.datum(kind_geboren_am,'kind_geboren_am'))
 if(!is.null(anerkennung_wirksam_am)) ereignis <- max(ereignis,.datum(anerkennung_wirksam_am,'anerkennung_wirksam_am'))
 z <- .frist(format(ereignis,'%Y-%m-%d'),2,'jahre','ereignis');m <- .frist(berechtigter_geboren_am,21,'jahre','tagesbeginn')
 wert <- list(zweijahresgrundfristende=format(z,'%Y-%m-%d'),mindestablauf_vollendung_21=format(m,'%Y-%m-%d'),anfechtungsgrundfristende=format(max(z,m),'%Y-%m-%d'))
 eingaben <- list(vertreterkenntnis_am=vertreterkenntnis_am, kind_geboren_am=kind_geboren_am, berechtigter_geboren_am=berechtigter_geboren_am, anerkennung_wirksam_am=anerkennung_wirksam_am, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"daten","BGB_VATERSCHAFTSANFECHTUNG_VERTRETERGRUNDFRIST",eingaben,list(list(operation="Vorhandene allgemeine Zweijahresgrundfrist mit Mindestablauf Vollendung21 kombinieren; kein Vollj\u00e4hrigkeitsaufschub bei Vertreteranfechtung.")),eingaben)
 ergebnis$hinweise <- list("1600bII4 nimmt f\u00fcr Vertreteranfechtung nur Satz2 aus, nicht Satz3. Deshalb Zweijahresgrundfrist aus Vertreterkenntnis/Geburt/Anerkennung ohne Vollj\u00e4hrigkeitsaufschub, aber Mindestablauf Vollendung21 des Berechtigten. Rechtliche Vertretungsbefugnis und zeitlich anwendbare Fassung sind vorqualifiziert. Keine automatische Hemmung1600bIV,193-Korrektur oder Zul\u00e4ssigkeitspr\u00fcfung. Bestehenden Kalenderkern verwenden. Vollendung21 bedeutet Ablauf des nach187II berechneten Vortags, nicht einen zus\u00e4tzlichen Tag.")
 ergebnis
}
